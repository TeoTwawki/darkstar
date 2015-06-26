---------------------------------------------------------------------------------------------------
-- func: Wall mapper interface
-- auth: Vivitaru
-- desc: Map corners of bounding boxed based on mapped positions and adds them to the database.
--       New mapped coordinates can be reloaded in-game using: @wmap reload
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 4,
    parameters = "ssss"
};

function split(str, sep)
	if (sep==nil) then
		sep = "%s"
	end
	local t={} ; i=1
	for str in string.gmatch(str, "([^"..sep.."]+)") do
		t[i] = str
		i = i + 1
	end
	return t
end


function round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end



function onTrigger(player, command, arg2, arg3, arg4)
	if (command==nil) then
		player:PrintToPlayer("*** Usage: @wmap [mark set add update reload enable disable]");
		return;
	end

	local cmd = string.lower(command);
	
	if (cmd=="mark") then
		if (arg2==nil) then
			player:PrintToPlayer("*** Usage: @wmap mark [1 or 2] // mark bounding box corners");
			return;
		end
		if (arg2=="1" or arg2=="2") then
			local x=round(tonumber(player:getXPos()),2,"");
			local y=round(tonumber(player:getYPos()),2,"");
			local z=round(tonumber(player:getZPos()),2,"");
		
			player:setVarEx(player:getName(),"map_corner_"..arg2, tostring(x).." "..tostring(y).." "..tostring(z));
			player:PrintToPlayer("* CORNER "..arg2.." => "..tostring(x).."  "..tostring(y).."  "..tostring(z));
		else
			player:PrintToPlayer("*** Usage: @wmap mark");
		end
	elseif(cmd=="set") then
		if (arg2==nil or arg3==nil) then
			player:PrintToPlayer("*** Usage: @wmap set [corner 1 or 2] [x y z] new_value");
		else
			local coords
			if (arg2=="1") then
				coords=player:getVarEx(player:getName(), "map_corner_1");
			elseif(arg2=="2") then
				coords=player:getVarEx(player:getName(), "map_corner_2");
			else
				player:PrintToPlayer("*** Usage: @wmap set [1 or 2] (corner number)");
				return;
			end
			if (coords~=nil) then
				local c = split(coords," ");
				
				local new_coords;
				if(arg3=="x") then
					local x = tonumber(arg4);
					new_coords=x.." "..c[2].." "..c[3];
				elseif(arg3=="y") then
					local y = tonumber(arg4);
					new_coords=c[1].." "..y.." "..c[3];
				elseif(arg3=="z") then
					local z = tonumber(arg4);
					new_coords=c[1].." "..c[2].." "..z;
				end
				if (new_coords~=nil) then
					player:setVarEx(player:getName(),"map_corner_"..arg2,new_coords);
					player:PrintToPlayer("* new coordinates for corner #"..arg2..": "..new_coords);
				end
			end
		end
	elseif(cmd=="add" or cmd=="save" or cmd=="update") then
		if (arg2==nil) then
			player:PrintToPlayer("*** Usage: @wmap "..cmd.." <wall_number>");
			return;
		end

		local wall_number = tonumber(arg2);
		if (wall_number>0 and wall_number<256) then
			local c1 = split(player:getVarEx(player:getName(), "map_corner_1")," ");
			local c2 = split(player:getVarEx(player:getName(), "map_corner_2")," ");
			
			if (c1~=nil and c2~=nil) then
				local msg;
				local res;
				if (cmd=="update") then
					res=player:updateWall(wall_number,c1[1],c1[2],c1[3],c2[1],c2[2],c2[3]);
					msg="updated";
				else
					res=player:mapWall(wall_number,c1[1],c1[2],c1[3],c2[1],c2[2],c2[3]);
					msg="added";
				end
				if (res==-1) then
					player:PrintToPlayer("*** Wall number "..wall_number.." already exists.");
					return;
				elseif(res==-2) then
					player:PrintToPlayer("*** SQL error");
				elseif(res==-3) then
					player:PrintToPlayer("** Wall number "..wall_number.." doesn't exist.");
				elseif(res==1) then
					player:PrintToPlayer("* Wall #"..wall_number.." "..msg.." successfully.");
				end
			else
				player:PrintToPlayer("*** One of the corners has not been mapped.");
			end
		end
	elseif(cmd=="disable") then
		if (arg2==nil) then
			player:PrintToPlayer("*** Usage: @wmap disable [wall number]");
			return;
		end
		local wall_number = tonumber(arg2);
		if (wall_number>0 and wall_number<256) then
			local res=player:disableWall(wall_number,1);
			if (res==-3) then
				player:PrintToPlayer("** Wall number "..wall_number.." doesn't exist.");
			elseif(res==-2) then
				player:PrintToPlayer("*** SQL error");
			elseif(res==1) then
				player:PrintToPlayer("* Wall number "..wall_number.." disabled.");
			end
		else
			player:PrintToPlayer("*** Invalid wall number. [1-255]");
		end
	elseif(cmd=="enable") then
		if (arg2==nil) then
			player:PrintToPlayer("*** Usage: @wmap enable [wall number]");
			return;
		end
		local wall_number = tonumber(arg2);
		if (wall_number>0 and wall_number<256) then
			local res=player:disableWall(wall_number,0);
			if (res==-3) then
				player:PrintToPlayer("** Wall number "..wall_number.." doesn't exist.");
			elseif(res==-2) then
				player:PrintToPlayer("*** SQL error");
			elseif(res==1) then
				player:PrintToPlayer("* Wall number "..wall_number.." enabled.");
			end
		else
			player:PrintToPlayer("*** Invalid wall number. [1-255]");
		end
	elseif(cmd=="reload") then
		local total = player:reloadWalls();
		if (total~=nil) then
			player:PrintToPlayer("* Total boxes reloaded: "..total);
		end
	end


end



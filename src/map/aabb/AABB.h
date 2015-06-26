/*
Bounding box & region compartmentalization classes
Author: Vivitaru
*/

#ifndef _BOX_H_
#define _BOX_H_
#define MAX_BOUNDINGBOXES 255

#include "vector3.h"

class Bounding_Box
{
public:
	Vector3 corners[2];  // 2 extreme corners of a bounding box.
	int wall_number; // used for debugging only

	Bounding_Box()
	{
		for (int b = 0; b < 2; b++)
		{
			corners[b] = Vector3(0, 0, 0);
		}

		wall_number = 0;
	}

};


#endif
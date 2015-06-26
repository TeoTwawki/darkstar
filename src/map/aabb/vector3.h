/*
A simple 3 dimentional vector class
*/

#ifndef _VECTOR3_H_
#define _VECTOR3_H_

#include <math.h>

class Vector3
{
private:
	float d[3];


public:

	Vector3()
	{
		d[0] = 0;
		d[1] = 0;
		d[2] = 0;
	};
	Vector3(float x, float y, float z)
	{
		d[0] = x; d[1] = y; d[2] = z;
	}

	float x() const
	{
		return d[0];
	}
	float y() const
	{
		return d[1];
	}
	float z() const
	{
		return d[2];
	}

	Vector3 operator-(const Vector3 &op2) const
	{
		return Vector3(d[0] - op2.d[0], d[1] - op2.d[1], d[2] - op2.d[2]);
	}


};

#endif // _VECTOR3_H_

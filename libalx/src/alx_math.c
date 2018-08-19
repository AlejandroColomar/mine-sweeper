/******************************************************************************
 *	Copyright (C) 2017	Alejandro Colomar Andrés		      *
 ******************************************************************************/

	#include <stdint.h>

	#include "alx_math.h"

	/*
	 * Factorial
	 */
double	alx_fact	(int64_t n)
{
	if (n < 1) {
		return	1;
	} else {
		return	n * alx_fact(n - 1);
	}
}

	/*
	 * Binomial coefficient (a b):				--!!!  a > b  !!!--
	 * - Bugs: If !(a > b), returns 1.
	 */
double	alx_bin_coef	(int64_t a, int64_t b)
{
	int64_t	i = 1;
	double	c = 1;

	while (a > b) {
		c = c * a-- / i++;
	}

	return	c;
}

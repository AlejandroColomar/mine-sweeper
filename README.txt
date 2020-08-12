/******************************************************************************
 * Based on the game 'Mine', written in 1990 by				      *
 * Robert Donner & Curt Johnson at Duff Software.			      *
 *									      *
 * Check this: https://tcrf.net/Proto:Minesweeper_(Windows,_1990)	      *
 ******************************************************************************
 * mine-sweeper	Copyright (C) 2015	Alejandro Colomar Andrés	      *
 *									      *
 * This program is free software; you can redistribute it and/or modify	      *
 * it under the terms of the GNU General Public License as published by	      *
 * the Free Software Foundation, version 2.				      *
 *									      *
 * This program is distributed in the hope that it will be useful,	      *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of	      *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the	      *
 * GNU General Public License for more details.				      *
 *									      *
 * You should have received a copy of the GNU General Public License	      *
 * along with this program; if not, see the file COPYING, or write	      *
 * to the Free Software Foundation, Inc.				      *
 ******************************************************************************
 *	Disclaimer of Warranty.						      *
 *									      *
 * THERE IS NO WARRANTY FOR THE PROGRAM, TO THE EXTENT PERMITTED BY	      *
 * APPLICABLE LAW.							      *
 *									      *
 * EXCEPT WHEN OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER *
 * PARTIES PROVIDE THE PROGRAM "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER   *
 * EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED	      *
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.	      *
 *									      *
 * THE ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE PROGRAM IS WITH   *
 * YOU.									      *
 *									      *
 * SHOULD THE PROGRAM PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL NECESSARY   *
 * SERVICING, REPAIR OR CORRECTION.					      *
 ******************************************************************************/

site:
	https://github.com/alejandro-colomar/mine-sweeper


COMPILE:
	$ make

INSTALL:
	$ sudo make install

RUN:
	$ mine-sweeper
			if it doesn't work:
	$ /usr/local/games/mine-sweeper

UNINSTALL:
	$ sudo make uninstall


The program creates a folder '.mine-sweeper/' at $HOME.  It
is used by the program to store saved games.  If you remove the game, you
should delete that folder manually.


THE PROGRAM DOES:
	The typical minesweeper game.


MENU:
	When you run the program, it starts in a menu that has these branches:

	/*
	 * + Menu:
	 *	+ Continue:
	 *		- Start
	 *		+ Select map:
	 *			- New map
	 *			- Load map(File: "<file>")
	 *			- ..
	 *		+ Change difficulty:
	 *			- Beginner
	 *			- Intermediate
	 *			- Expert
	 *			+ Custom:
	 *				- Change rows: rows		(X)
	 *				- Change columns: cols		(X)
	 *				- Change proportion of mines: p	(0.XXXXXX)
	 *				- ..
	 *			- ..
	 *		- Change file name (File: "<file_name>")
	 *		- Hi scores
	 * N/A		x DEVEL:
	 * N/A			- Change seed (srand)
	 * N/A			- ..
	 *		- ..
	 *	- Disclaimer of warranty
	 *	- Terms and conditions
	 *	- Exit program
	 */


SYSTEM REQUIREMENTS:

	 * A terminal ¿?

To be continued...

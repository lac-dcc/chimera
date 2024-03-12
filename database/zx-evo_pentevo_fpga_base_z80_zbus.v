// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
//
// manages ZX-bus IORQ-IORQGE stuff and free bus content

/*
    This file is part of ZX-Evo Base Configuration firmware.

    ZX-Evo Base Configuration firmware is free software:
    you can redistribute it and/or modify it under the terms of
    the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    ZX-Evo Base Configuration firmware is distributed in the hope that
    it will be useful, but WITHOUT ANY WARRANTY; without even
    the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
    See the GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with ZX-Evo Base Configuration firmware.
    If not, see <http://www.gnu.org/licenses/>.
*/

`include "tune.v"

module zbus(

	input iorq_n,
	input rd_n,
	input wr_n,
	input m1_n,

	output iorq1_n,
	output iorq2_n,

	input iorqge1,
	input iorqge2,

	input porthit,

	output drive_ff
);



	assign iorq1_n = iorq_n | porthit;

	assign iorq2_n = iorq1_n | iorqge1;

	assign drive_ff = ( (~(iorq2_n|iorqge2)) & (~rd_n) ) | (~(m1_n|iorq_n));





endmodule

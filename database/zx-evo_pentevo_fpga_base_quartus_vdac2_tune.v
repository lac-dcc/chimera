// ZX-Evo Base Configuration (c) NedoPC 2008,2009,2010,2011,2012,2013,2014
// Modified by (c) TS-Labs ... (add years here)
//
// Some defines for simulation or build varieties

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

`timescale 1ns/100ps

`ifdef MODEL_TECH
`define SIMULATE
`endif


//`define DRAMMEM_VERBOSE
//`define FETCH_VERBOSE

// `define FREE_IORQ       // for non-blocked by internal ports !IORQ

// `define IDE_HDD         // for IDE HDD
`define IDE_VIDEO       // for IDE VideoDAC (any revision)
// `define IDE_VDAC        // for VideoDAC instead of IDE
`define IDE_VDAC2       // for VideoDAC2 instead of IDE

`define KEMPSTON_8BIT       //8-bit enhanced Kempston Joystick interface
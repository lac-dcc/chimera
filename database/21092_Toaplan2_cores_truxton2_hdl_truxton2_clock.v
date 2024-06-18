// This program was cloned from: https://github.com/atrac17/Toaplan2
// License: GNU General Public License v3.0

/*
* <-- pr4m0d -->
* https://pram0d.com
* https://twitter.com/pr4m0d
* https://github.com/psomashekar
*
* Copyright (c) 2022 Pramod Somashekar
*
* <-- atrac17 -->
* https://coinopcollection.org
* https://twitter.com/_atrac17
* https://github.com/atrac17
*
* Copyright (c) 2022 atrac17
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/
module truxton2_clock (
    input CLK,         //47.25 mhz
    input CLK96,       //94.5 mhz
    input CLK24,       //27 mhz
    input CLK6,        //6.75 mhz
    output CEN675,     //6.75 mhz
    output CEN675B,    //6.75 mhz
    output CEN4,       //4 mhz
    output CEN4B,      //4 mhz
    output CEN3p375,   //3.375 mhz
    output CEN3p375B,  //3.375 mhz
    output CEN1p6875,  //1.6875 mhz
    output CEN1p6875B, //1.6875 mhz
    output CEN1350,    //13.5 mhz
    output CEN1350B    //13.5 mhz
);

// 94.5/7  = 13.5
// 94.5/14 = 6.75
// 94.5/28 = 3.375
// 94.5/56 = 1.6875

jtframe_frac_cen #(.W(4)) u_frac_cen_1350(
    .clk(CLK96),
    .n(1),
    .m(7),
    .cen({CEN1p6875, CEN3p375, CEN675, CEN1350}),
    .cenb()
);

// 94.5*(8/189) = 4

jtframe_frac_cen u_frac_cen_4(
    .clk(CLK96),
    .n(8),
    .m(189),
    .cen(CEN4),
    .cenb(CEN4B)
);

endmodule

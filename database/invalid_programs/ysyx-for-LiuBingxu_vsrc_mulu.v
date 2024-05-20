// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// Multiplier
// Copyright (C) 2024  LiuBingxu

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

// Please contact me through the following email: <qwe15889844242@163.com>

`include "./define.v"
module mulu (
    input               clk,
    input               rst_n,
    input               mul_flush,
    input               mul_valid,
    // output              mul_ready,
    input   [1:0]       mul_signed,
    input   [63:0]      mul_a,
    input   [63:0]      mul_b,
    output  [63:0]      mul_result_hi,
    output  [63:0]      mul_result_lo,
    // output              mul_busy,
    input               mul_o_ready,
    output              mul_o_valid
);

`ifdef use_booth_mul

booth_mul u_booth_mul(
    .clk         	( clk          ),
    .rst_n       	( rst_n        ),
    .mul_flush      ( mul_flush    ),
    .mul_valid   	( mul_valid    ),
    // .mul_ready   	( mul_ready    ),
    .mul_signed     ( mul_signed   ),
    .mul_a       	( mul_a        ),
    .mul_b       	( mul_b        ),
    .mul_result_hi  ( mul_result_hi),
    .mul_result_lo  ( mul_result_lo),
    // .mul_busy       ( mul_busy     ),
    .mul_o_ready    ( mul_o_ready  ),
    .mul_o_valid 	( mul_o_valid  )
);

`else

shift_mul u_shift_mul(
    .clk         	( clk          ),
    .rst_n       	( rst_n        ),
    .mul_flush      ( mul_flush    ),
    .mul_valid   	( mul_valid    ),
    // .mul_ready   	( mul_ready    ),
    .mul_signed     ( mul_signed   ),
    .mul_a       	( mul_a        ),
    .mul_b       	( mul_b        ),
    .mul_result_hi  ( mul_result_hi),
    .mul_result_lo  ( mul_result_lo),
    // .mul_busy       ( mul_busy     ),
    .mul_o_ready    ( mul_o_ready  ),
    .mul_o_valid 	( mul_o_valid  )
);

`endif 

endmodule //mulu

// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// Multiplier using Booth algorithm
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

module booth_mul(
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

//!
//todo

endmodule //booth_mul

// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// the adder with Cin
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

module add_with_Cin#(parameter DATA_LEN = 32) (
    input   [DATA_LEN-1:0]  a,
    input   [DATA_LEN-1:0]  b,
    input                   sub,
    output  [DATA_LEN-1:0]  sum
);

wire   [DATA_LEN-1:0]  b_true;

assign b_true = b ^ {DATA_LEN{sub}};

assign sum = a + b_true + {{(DATA_LEN-1){1'b0}},sub};

endmodule //add_with_Cin

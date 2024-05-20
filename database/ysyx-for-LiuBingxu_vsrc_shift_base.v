// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// base shift module
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

module shift_base #(parameter DATA_LEN = 32, SHIFT_NUM = 1)(
    input                       LR,
    input                       AL,
    input                       shift_en,
    input  [DATA_LEN-1:0]       data_in,
    output [DATA_LEN-1:0]       data_out
);

localparam OVER_LEN = DATA_LEN - SHIFT_NUM;

reg [DATA_LEN-1:0] data_out_reg;

always @(*) begin
    if(!LR)begin
        if(AL)begin
            if(shift_en)data_out_reg={{SHIFT_NUM{data_in[DATA_LEN-1]}},data_in[DATA_LEN-1:SHIFT_NUM]};
            else data_out_reg=data_in;
        end
        else begin
            if(shift_en)data_out_reg={{SHIFT_NUM{1'b0}},data_in[DATA_LEN-1:SHIFT_NUM]};
            else data_out_reg=data_in;
        end
    end
    else begin
        if(shift_en)data_out_reg={data_in[OVER_LEN-1:0],{SHIFT_NUM{1'b0}}};
        else data_out_reg=data_in;
    end
end

assign data_out = data_out_reg;

endmodule //shift_base

// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// Signal synchronizer
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

module sync#(parameter DATA_LEN=1)(
    input                   clk,
    input                   rst_n,
    input  [DATA_LEN-1:0]   in_asyn,
    output [DATA_LEN-1:0]   out_syn
);

reg [DATA_LEN-1:0]  data_r;
reg [DATA_LEN-1:0]  data_rr;

always @(posedge clk or negedge rst_n) begin
    if(!rst_n)begin
        data_r  <= {DATA_LEN{1'b0}};
        data_rr <= {DATA_LEN{1'b0}};
    end
    else begin
        data_r  <= in_asyn;
        data_rr <= data_r;
    end
end

assign out_syn = data_rr;


endmodule //sync

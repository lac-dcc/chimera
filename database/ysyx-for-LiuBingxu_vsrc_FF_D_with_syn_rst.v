// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// the DFF module with syn_rst and with asyn_rst
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

module FF_D_with_syn_rst#(parameter DATA_LEN=1,RST_DATA=0)(
    input 			        clk,
	input 			        rst_n,
    input                   syn_rst,
	input 			        wen,
	input  [DATA_LEN-1:0]	data_in,
	output [DATA_LEN-1:0]	data_out
);

reg [DATA_LEN-1:0] data_out_reg;

always @(posedge clk or negedge rst_n)begin
	if(!rst_n)begin
		data_out_reg <= RST_DATA;
	end
    else if(syn_rst)begin
        data_out_reg <= RST_DATA;
    end
	else if(wen)begin
		data_out_reg <= data_in ;
	end
end

assign data_out=data_out_reg;

endmodule //FF_D_with_syn_rst

// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// The module that will correctly shift the storeed data when storeing data
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

module memory_store_move(
    input   [63:0]          pre_data,
    input   [2:0]           data_offset,
    output  [63:0]          data
);

wire [63:0] pre_move_data_0;
wire [63:0] pre_move_data_1;
wire [63:0] pre_move_data_2;
wire [63:0] pre_move_data_3;
wire [63:0] pre_move_data_4;
wire [63:0] pre_move_data_5;
wire [63:0] pre_move_data_6;
wire [63:0] pre_move_data_7;
reg  [63:0] pre_data_reg;

assign pre_move_data_0 = pre_data;
assign pre_move_data_1 = {pre_move_data_0[55:0],8'h0 };
assign pre_move_data_2 = {pre_move_data_0[47:0],16'h0};
assign pre_move_data_3 = {pre_move_data_0[39:0],24'h0};
assign pre_move_data_4 = {pre_move_data_0[31:0],32'h0};
assign pre_move_data_5 = {pre_move_data_0[23:0],40'h0};
assign pre_move_data_6 = {pre_move_data_0[15:0],48'h0};
assign pre_move_data_7 = {pre_move_data_0[7:0], 56'h0};
always @(*) begin
    if(data_offset==3'b000)begin
        pre_data_reg=pre_move_data_0;
    end
    else if(data_offset==3'b001)begin
        pre_data_reg=pre_move_data_1;
    end
    else if(data_offset==3'b010)begin
        pre_data_reg=pre_move_data_2;
    end
    else if(data_offset==3'b011)begin
        pre_data_reg=pre_move_data_3;
    end
    else if(data_offset==3'b100)begin
        pre_data_reg=pre_move_data_4;
    end
    else if(data_offset==3'b101)begin
        pre_data_reg=pre_move_data_5;
    end
    else if(data_offset==3'b110)begin
        pre_data_reg=pre_move_data_6;
    end
    else begin
        pre_data_reg=pre_move_data_7;
    end
end

assign data = pre_data_reg;

endmodule //memory_store_move

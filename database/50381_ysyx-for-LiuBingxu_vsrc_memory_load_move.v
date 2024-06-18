// This program was cloned from: https://github.com/Liu-Bingxu/ysyx-for-LiuBingxu
// License: GNU General Public License v3.0

// The module that will correctly shift the loaded data when loading data
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

module memory_load_move(
    input   [63:0]          pre_data,
    input   [2:0]           data_offset,
    input                   is_byte,
    input                   is_half,
    input                   is_word,
    input                   is_double,
    input                   is_sign,
    output  [63:0]          data
);

localparam FILLER_LEN_BYTE      = 56;
localparam FILLER_LEN_HALF      = 48;
localparam FILLER_LEN_DOUBLE    = 32;

wire [63:0] data_byte;
wire [63:0] data_half;
wire [63:0] data_word;
wire [63:0] data_double;
wire [63:0] data_signed_byte;
wire [63:0] data_signed_half;
wire [63:0] data_signed_word;
wire [63:0] data_unsigned_byte;
wire [63:0] data_unsigned_half;
wire [63:0] data_unsigned_word;

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
assign pre_move_data_1 = { 8'h0,pre_move_data_0[63:8] };
assign pre_move_data_2 = {16'h0,pre_move_data_0[63:16]};
assign pre_move_data_3 = {24'h0,pre_move_data_0[63:24]};
assign pre_move_data_4 = {32'h0,pre_move_data_0[63:32]};
assign pre_move_data_5 = {40'h0,pre_move_data_0[63:40]};
assign pre_move_data_6 = {48'h0,pre_move_data_0[63:48]};
assign pre_move_data_7 = {56'h0,pre_move_data_0[63:56]};
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

assign data_signed_byte = {{FILLER_LEN_BYTE{pre_data_reg[7]} },pre_data_reg[7:0] };
assign data_signed_half = {{FILLER_LEN_HALF{pre_data_reg[15]}},pre_data_reg[15:0]};

assign data_unsigned_byte = {{FILLER_LEN_BYTE{1'b0}},pre_data_reg[7:0] };
assign data_unsigned_half = {{FILLER_LEN_HALF{1'b0}},pre_data_reg[15:0]};

assign data_signed_word   = {{FILLER_LEN_DOUBLE{pre_data_reg[31]}},pre_data_reg[31:0] };
assign data_unsigned_word = {{FILLER_LEN_DOUBLE{1'b0}},pre_data_reg[31:0]};

assign data_byte    = (is_sign)?data_signed_byte:data_unsigned_byte;
assign data_half    = (is_sign)?data_signed_half:data_unsigned_half;
assign data_word    = (is_sign)?data_signed_word:data_unsigned_word;
assign data_double  = pre_data_reg;

assign data = (is_byte)?data_byte:((is_half)?data_half:((is_word)?data_word:((is_double)?data_double:{64{1'b0}})));

endmodule //memory_load_move

// ********************************************************
// Copyright(c)  2018
// Project name  :  HWPE
// Author        :  chenhaoc
// File    name  :  booth.v
// Module  name  :  booth
// Created Time  :  2018/5/15 15:30:20
// Last Modified :  2018/5/15 15:35:36
// Abstract:

// ========================================================
// Revision     Date     Author      Comment
// --------  ---------  ---------    ---------
//   1.0    2018/05/15  chenhaoc
//
// ********************************************************

`define DLY 1
`timescale 1ns/10ps

module booth(
    input      [2:0] code,
    input      [8:0] src_data,
    output reg [9:0] out_data, //comb
    output reg       out_inv   //comb
);

always @( * ) begin
    case( code )
        ///////// for 8bit /////////
        // +/- 0*src_data
        3'b000,
        3'b111:
        begin
            out_data = 10'h200;
            out_inv = 1'b0;
        end

        // + 1*src_data
        3'b001,
        3'b010:
        begin
            out_data = {~src_data[8], src_data};
            out_inv = 1'b0;
        end

        // - 1*src_data
        3'b101,
        3'b110:
        begin
            out_data = {src_data[8], ~src_data};
            out_inv = 1'b1;
        end

        // + 2*src_data
        3'b011:
        begin
            out_data = {~src_data[8], src_data[7:0], 1'b0};
            out_inv = 1'b0;
        end

        // - 2*src_data
        3'b100:
        begin
            out_data = {src_data[8], ~src_data[7:0], 1'b1};
            out_inv = 1'b1;
        end

        default:
        begin
            out_data = 10'h200;
            out_inv = 1'b0;
        end
    endcase
end

endmodule

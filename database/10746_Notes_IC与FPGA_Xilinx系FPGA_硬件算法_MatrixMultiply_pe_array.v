// This program was cloned from: https://github.com/redlightASl/Notes
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// `include "pe_row.v"

module pe_array#(
           parameter BITWIDTH = 8,
           parameter IS_BITWIDTH_DOUBLE_SCALE = 1,
           parameter X_ROW = 3,
           parameter Y_COL = 3
       )(
           input clk,
           input rst_n,
           input en,
           input wire signed [X_ROW * BITWIDTH - 1: 0] in_row, //row data input "-"
           input wire signed [Y_COL * BITWIDTH - 1: 0] in_col, //column data input "|"
           output wire signed [X_ROW * Y_COL * BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] result //every calculated data "\"
       );
wire signed [Y_COL * BITWIDTH - 1: 0] PulsedArray_COL [0: X_ROW - 1]; //column interconnection

genvar i;
generate
    for (i = 0;i < X_ROW;i = i + 1) begin
        if (i == 0) begin //first column receive matrix X input
            pe_row #(
                       .BITWIDTH ( BITWIDTH ),
                       .IS_BITWIDTH_DOUBLE_SCALE(IS_BITWIDTH_DOUBLE_SCALE),
                       .Y_COL ( Y_COL ))
                   u_pe_row(
                       //ports
                       .clk ( clk ),
                       .rst_n ( rst_n ),
                       .en ( en ),
                       .in_row ( in_row[(X_ROW * BITWIDTH - 1) -: BITWIDTH] ),
                       .in_col ( in_col ),
                       .out_col ( PulsedArray_COL[i] ),
                       .row_result ( result[((X_ROW * Y_COL * BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1)) - 1) -: (Y_COL * BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1))] ) //result_buffer
                   );
        end
        else begin //interconnection
            pe_row #(
                       .BITWIDTH ( BITWIDTH ),
                       .IS_BITWIDTH_DOUBLE_SCALE(IS_BITWIDTH_DOUBLE_SCALE),
                       .Y_COL ( Y_COL ))
                   u_pe_row(
                       //ports
                       .clk ( clk ),
                       .rst_n ( rst_n ),
                       .en ( en ),
                       .in_row ( in_row[((X_ROW * BITWIDTH - 1) - (i * BITWIDTH)) -: BITWIDTH] ),
                       .in_col ( PulsedArray_COL[i - 1] ),
                       .out_col ( PulsedArray_COL[i] ),
                       .row_result ( result[(((X_ROW * Y_COL * BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1)) - 1) - (i * Y_COL * BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1))) -: (Y_COL * BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1))] )
                   );
        end
    end
endgenerate

endmodule
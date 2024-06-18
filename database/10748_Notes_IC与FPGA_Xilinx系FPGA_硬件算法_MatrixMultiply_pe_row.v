// This program was cloned from: https://github.com/redlightASl/Notes
// License: GNU General Public License v3.0

`timescale 1ns / 1ps 
// `include "pe_bit.v"

module pe_row#(
           parameter BITWIDTH = 8,
           parameter IS_BITWIDTH_DOUBLE_SCALE = 1,
           parameter Y_COL = 3
       )(
           input wire clk,
           input wire rst_n,
           input wire en,
           input wire signed [BITWIDTH - 1: 0] in_row, //row data input "-"
           input wire signed [Y_COL * BITWIDTH - 1: 0] in_col, //column data input "|"
           output wire signed [Y_COL * BITWIDTH - 1: 0] out_col, //column data send to next row "|"
           output wire signed [Y_COL * BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] row_result //every calculated data "\"
       );
wire signed [BITWIDTH - 1: 0] PulsedArray_ROW [0: Y_COL - 1]; //行互联

genvar i;
generate
    for (i = 0;i < Y_COL;i = i + 1) begin
        if (i == 0) begin //first row receive matrix Y input
            pe_bit #(
                       .BITWIDTH ( BITWIDTH ),
                       .IS_BITWIDTH_DOUBLE_SCALE(IS_BITWIDTH_DOUBLE_SCALE)
                       )
                   u_PE_top(
                       //ports
                       .clk ( clk ),
                       .rst_n ( rst_n ),
                       .en ( en ),
                       .in_a ( in_row ),  //first row-data
                       .in_b ( in_col[Y_COL * BITWIDTH - 1 -: BITWIDTH] ),  //column connect in
                       .out_a_delay ( PulsedArray_ROW[i] ),  //send to next bit
                       .out_b_delay ( out_col[(Y_COL * BITWIDTH - 1) -: BITWIDTH] ),  //column connect out
                       .result ( row_result[Y_COL * BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1 -: BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1)] ) //result_buffer
                   );
        end
        else begin //interconnection
            pe_bit #(
                       .BITWIDTH ( BITWIDTH ),
                       .IS_BITWIDTH_DOUBLE_SCALE(IS_BITWIDTH_DOUBLE_SCALE)
                       )
                   u_PE_top(
                       //ports
                       .clk ( clk ),
                       .rst_n ( rst_n ),
                       .en ( en ),
                       .in_a ( PulsedArray_ROW[i - 1] ),
                       .in_b ( in_col[((Y_COL * BITWIDTH - 1) - (i * BITWIDTH)) -: BITWIDTH] ),
                       .out_a_delay ( PulsedArray_ROW[i] ),
                       .out_b_delay ( out_col[(Y_COL * BITWIDTH - 1) - (i * BITWIDTH) -: BITWIDTH] ),
                       .result ( row_result[(Y_COL * BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1)) - 1 - (i * BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1)) -: BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1)] )
                   );
        end
    end
endgenerate

endmodule

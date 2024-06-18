// This program was cloned from: https://github.com/redlightASl/Notes
// License: GNU General Public License v3.0

`timescale  1ns / 1ps
`include "pe_row.v"

// module tb_pe_row();
// parameter BITWIDTH = 8;
// parameter X_ROW = 3;

// // pe_row Inputs
// reg clk = 0;
// reg rst_n = 0;
// reg en = 0;
// reg [BITWIDTH - 1: 0] in_row = 0;
// reg [X_ROW * BITWIDTH - 1: 0] in_col = 0;

// // pe_row Outputs
// wire [X_ROW * BITWIDTH - 1: 0] out_col;
// wire [X_ROW * BITWIDTH * 2 - 1: 0] row_result;

// wire [BITWIDTH - 1: 0] col_out_1;
// wire [BITWIDTH - 1: 0] col_out_2;
// wire [BITWIDTH - 1: 0] col_out_3;

// wire [BITWIDTH * 2 - 1: 0] res_1;
// wire [BITWIDTH * 2 - 1: 0] res_2;
// wire [BITWIDTH * 2 - 1: 0] res_3;

// assign {res_1, res_2, res_3} = row_result;
// assign {col_out_1, col_out_2, col_out_3} = out_col;

// initial begin
//     forever
//         #2 clk = ~clk;
// end

// // initial begin
// //     #5;
// //     rst_n = 1;
// //     en = 1;
// //     #4;
// //     in_row = 3;
// //     in_col = 24'b00000011_00000010_00000001;
// //     #4;
// //     in_row=2;
// //     in_col = 24'b00000011_00000010_00000001;
// //     #4;
// //     in_row=1;
// //     in_col = 24'b00000011_00000010_00000001;
// //     #4;
// //     in_row = 0;
// //     in_col = 0;
// // end

// initial begin
//     #5;
//     rst_n = 1;
//     en = 1;
//     #4;
//     in_row = 1;
//     in_col = 24'h03_02_01;
//     #4;
//     in_row = 2;
//     in_col = 24'h03_01_02;
//     #4;
//     in_row = 3;
//     in_col = 24'h00_00_01;
//     #4;
//     in_row = 0;
//     in_col = 24'h00_00_00;
// end

// initial begin
//     $dumpfile("pe_row_tb.vcd");
//     $dumpvars();
//     #1000;
//     $finish;
// end

// pe_row #(
//            .BITWIDTH ( BITWIDTH ),
//            .X_ROW ( X_ROW ))
//        u_pe_row (
//            .clk ( clk ),
//            .rst_n ( rst_n ),
//            .en ( en ),
//            .in_row ( in_row [BITWIDTH - 1: 0] ),
//            .in_col ( in_col [X_ROW * BITWIDTH - 1: 0] ),

//            .out_col ( out_col [X_ROW * BITWIDTH - 1: 0] ),
//            .row_result ( row_result [X_ROW * BITWIDTH * 2 - 1: 0] )
//        );

// endmodule


module pe_row_tb();
parameter BITWIDTH = 8;
parameter IS_BITWIDTH_DOUBLE_SCALE = 0;
parameter Y_COL = 2;

// pe_row Inputs
reg clk = 0;
reg rst_n = 0;
reg en = 0;
reg [BITWIDTH - 1: 0] in_row = 0;
reg [Y_COL * BITWIDTH - 1: 0] in_col = 0;

// pe_row Outputs
wire [Y_COL * BITWIDTH - 1: 0] out_col;
wire [Y_COL * BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] row_result;

wire [BITWIDTH - 1: 0] col_out_1;
wire [BITWIDTH - 1: 0] col_out_2;
wire [BITWIDTH - 1: 0] col_out_3;

wire [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] res_1;
wire [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] res_2;
wire [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] res_3;

assign {res_1, res_2} = row_result;
assign {col_out_1, col_out_2} = out_col;

initial begin
    forever
        #2 clk = ~clk;
end

initial begin
    #5;
    rst_n = 1;
    en = 1;
    #4;
    in_row = 1;
    in_col = 16'h03_02;
    #4;
    in_row = 2;
    in_col = 16'h03_01;
    #4;
    in_row = 3;
    in_col = 16'h00_08;
    #4;
    in_row = 0;
    in_col = 16'h00_00;
end

initial begin
    $dumpfile("pe_row_tb.vcd");
    $dumpvars();
    #1000;
    $finish;
end

pe_row #(
           .BITWIDTH ( BITWIDTH ),
           .IS_BITWIDTH_DOUBLE_SCALE ( IS_BITWIDTH_DOUBLE_SCALE ),
           .Y_COL ( Y_COL ))
       u_pe_row(
           .clk ( clk ),
           .rst_n ( rst_n ),
           .en ( en ),
           .in_row ( in_row ),
           .in_col ( in_col ),
           .out_col ( out_col ),
           .row_result ( row_result )
       );

endmodule

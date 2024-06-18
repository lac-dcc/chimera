// This program was cloned from: https://github.com/redlightASl/Notes
// License: GNU General Public License v3.0

`timescale  1ns / 1ps
`include "pe_array.v"

// module systolic_array_tb();

// parameter BITWIDTH = 8;
// parameter X_ROW = 3;
// parameter Y_COL = 3;

// // systolic_array Inputs
// reg clk = 0;
// reg rst_n = 0;
// reg en = 0;
// reg [X_ROW * BITWIDTH - 1: 0] in_row = 0;
// reg [Y_COL * BITWIDTH - 1: 0] in_col = 0;

// // systolic_array Outputs
// wire [X_ROW * Y_COL * BITWIDTH * 2 - 1: 0] result;

// wire [BITWIDTH * 2 - 1: 0] res1;
// wire [BITWIDTH * 2 - 1: 0] res2;
// wire [BITWIDTH * 2 - 1: 0] res3;
// wire [BITWIDTH * 2 - 1: 0] res4;
// wire [BITWIDTH * 2 - 1: 0] res5;
// wire [BITWIDTH * 2 - 1: 0] res6;
// wire [BITWIDTH * 2 - 1: 0] res7;
// wire [BITWIDTH * 2 - 1: 0] res8;
// wire [BITWIDTH * 2 - 1: 0] res9;


// assign {res1, res2, res3, res4, res5, res6, res7, res8, res9} = result;

// initial begin
//     forever
//         #2 clk = ~clk;
// end

// /*
// 1 2 3       3 2 1
// 4 5 6   x   6 5 4
// 7 8 9       9 8 7
// 00000001_00000010_00000011_00000100_00000101_00000110_00000111_00001000_00001001
//     3 2 1
//   6 5 4
// 9 8 7

// 3 2 1
// 6 5 4
// 9 8 7
// 00000011_00000010_00000001_00000110_00000101_00000100_00001001_00001000_00000111
//     7
//   8 4
// 9 5 1
// 6 2
// 3

//                 7
//               8 4
//             9 5 1
//             6 2
//             3
//     3 2 1
//   6 5 4
// 9 8 7


// 42 36 30
// 96 81 66
// 150 126 102
// 00101010_00100100_00011110_01100000_01010001_01000010_10010110_01111110_01100110

// 12 18 1E
// 0C 45 2A
// 5A 72 8A
// */

// integer count = 0;
// always @(posedge clk) begin
//     case (count)
//         0: begin
//             rst_n = 1;
//             en = 1;
//             in_col = 24'h00_00_00;
//             in_row = 24'h00_00_00;
//             count = 1;
//         end
//         1: begin
//             in_col = 24'h03_00_00;
//             in_row = 24'h01_00_00;
//             count = 2;
//         end
//         2: begin
//             in_col = 24'h06_02_00;
//             in_row = 24'h02_04_00;
//             count = 3;
//         end
//         3: begin
//             in_col = 24'h09_05_01;
//             in_row = 24'h03_05_07;
//             count = 4;
//         end
//         4: begin
//             in_col = 24'h00_08_04;
//             in_row = 24'h00_06_08;
//             count = 5;
//         end
//         5: begin
//             in_col = 24'h00_00_07;
//             in_row = 24'h00_00_09;
//             count = 6;
//         end
//         6: begin
//             in_col = 24'h00_00_00;
//             in_row = 24'h00_00_00;
//             count = 7;
//         end
//         7: begin
//             in_col = 24'h00_00_00;
//             in_row = 24'h00_00_00;
//             count = 8;
//         end
//         8: begin
//             in_col = 24'h00_00_00;
//             in_row = 24'h00_00_00;
//             // rst_n = 0;
//             count = 9;
//         end
//         default: begin
//         end
//     endcase
// end

// // integer count = 0;
// // always @(posedge clk) begin
// //     case (count)
// //         0: begin
// //             in_col = 24'h01_00_00;
// //             in_row = 24'h03_00_00;
// //             count = 1;
// //         end
// //         1: begin
// //             in_col = 24'h02_04_00;
// //             in_row = 24'h06_02_00;
// //             count = 2;
// //         end
// //         2: begin
// //             in_col = 24'h03_05_07;
// //             in_row = 24'h09_05_01;
// //             count = 3;
// //         end
// //         3: begin
// //             in_col = 24'h00_06_08;
// //             in_row = 24'h00_08_04;
// //             count = 4;
// //         end
// //         4: begin
// //             in_col = 24'h00_00_09;
// //             in_row = 24'h00_00_07;
// //             count = 5;
// //         end
// //         5: begin
// //             in_col = 24'h00_00_00;
// //             in_row = 24'h00_00_00;
// //             count = 6;
// //         end
// //         6: begin
// //             in_col = 24'h00_00_00;
// //             in_row = 24'h00_00_00;
// //             rst_n = 0;
// //             count = 7;
// //         end
// //         7: begin
// //             in_col = 24'h00_00_00;
// //             in_row = 24'h00_00_00;
// //             rst_n = 0;
// //             count = 8;
// //         end
// //         default: begin
// //         end
// //     endcase
// // end

// initial begin
//     $dumpfile("sa_tb.vcd");
//     $dumpvars();
//     #1000;
//     $finish;
// end

// systolic_array #(
//                    .BITWIDTH ( BITWIDTH ),
//                    .X_ROW ( X_ROW ),
//                    .Y_COL ( Y_COL ))
//                u_systolic_array (
//                    .clk ( clk ),
//                    .rst_n ( rst_n ),
//                    .en ( en ),
//                    .in_row ( in_row [X_ROW * BITWIDTH - 1: 0] ),
//                    .in_col ( in_col [Y_COL * BITWIDTH - 1: 0] ),

//                    .result ( result[X_ROW * Y_COL * BITWIDTH * 2 - 1: 0] )
//                );

// endmodule


// module systolic_array_tb();

// parameter BITWIDTH = 8;
// parameter X_ROW = 2;
// parameter Y_COL = 4;

// // systolic_array Inputs
// reg clk = 0;
// reg rst_n = 0;
// reg en = 0;
// reg [X_ROW * BITWIDTH - 1: 0] in_row = 0;
// reg [Y_COL * BITWIDTH - 1: 0] in_col = 0;

// // systolic_array Outputs
// wire [X_ROW * Y_COL * BITWIDTH * 2 - 1: 0] result;

// wire [BITWIDTH * 2 - 1: 0] res1;
// wire [BITWIDTH * 2 - 1: 0] res2;
// wire [BITWIDTH * 2 - 1: 0] res3;
// wire [BITWIDTH * 2 - 1: 0] res4;
// wire [BITWIDTH * 2 - 1: 0] res5;
// wire [BITWIDTH * 2 - 1: 0] res6;
// wire [BITWIDTH * 2 - 1: 0] res7;
// wire [BITWIDTH * 2 - 1: 0] res8;


// assign {res1, res2, res3, res4, res5, res6, res7, res8} = result;

// initial begin
//     forever
//         #2 clk = ~clk;
// end

// /*
// 1 2 3       1 2 3 4
// 4 5 6   x   5 5 6 6
//             7 8 9 0

//   3 2 1
// 6 5 4

//       0
//     9 6
//   8 6 4
// 7 5 3
// 5 2
// 1

// 0020 0024 002A 0010
// 0047 0051 0060 002E

// 32 36 42 16
// 71 81 96 46
// */

// integer count = 0;
// always @(posedge clk) begin
//     case (count)
//         0: begin
//             rst_n = 1;
//             en = 1;
//             in_col = 32'h01_00_00_00;
//             in_row = 16'h01_00;
//             count = 1;
//         end
//         1: begin
//             in_col = 32'h05_02_00_00;
//             in_row = 16'h02_04;
//             count = 2;
//         end
//         2: begin
//             in_col = 32'h07_05_03_00;
//             in_row = 16'h03_05;
//             count = 3;
//         end
//         3: begin
//             in_col = 32'h00_08_06_04;
//             in_row = 16'h00_06;
//             count = 4;
//         end
//         4: begin
//             in_col = 32'h00_00_09_06;
//             in_row = 16'h00_00;
//             count = 5;
//         end
//         5: begin
//             in_col = 32'h00_00_00_00;
//             in_row = 16'h00_00;
//             count = 6;
//         end
//         6: begin
//             in_col = 32'h00_00_00_00;
//             in_row = 16'h00_00;
//             count = 7;
//         end
//         7: begin
//             in_col = 32'h00_00_00_00;
//             in_row = 16'h00_00;
//             count = 8;
//         end
//         8: begin

//             count = 9;
//         end
//         default: begin
//         end
//     endcase
// end

// initial begin
//     $dumpfile("sa_tb.vcd");
//     $dumpvars();
//     #1000;
//     $finish;
// end

// systolic_array #(
//                    .BITWIDTH ( BITWIDTH ),
//                    .X_ROW ( X_ROW ),
//                    .Y_COL ( Y_COL ))
//                u_systolic_array (
//                    .clk ( clk ),
//                    .rst_n ( rst_n ),
//                    .en ( en ),
//                    .in_row ( in_row [X_ROW * BITWIDTH - 1: 0] ),
//                    .in_col ( in_col [Y_COL * BITWIDTH - 1: 0] ),

//                    .result ( result[X_ROW * Y_COL * BITWIDTH * 2 - 1: 0] )
//                );

// endmodule


module pe_array_tb();

parameter BITWIDTH = 8;
parameter IS_BITWIDTH_DOUBLE_SCALE = 0;
parameter X_ROW = 3;
parameter Y_COL = 1;

// systolic_array Inputs
reg clk = 0;
reg rst_n = 0;
reg en = 0;
reg [X_ROW * BITWIDTH - 1: 0] in_row = 0;
reg [Y_COL * BITWIDTH - 1: 0] in_col = 0;

// systolic_array Outputs
wire [X_ROW * Y_COL * BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] result;

wire [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] res1;
wire [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] res2;
wire [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] res3;

assign {res1, res2, res3} = result;

initial begin
    forever
        #2 clk = ~clk;
end

/*
1 2 3       1
4 5 6   x   2
7 8 9       3
 
    3 2 1
  6 5 4
9 8 7
 
3
2
1
 
14
32
50
 
000E
0020
0032
*/

integer count = 0;
always @(posedge clk) begin
    case (count)
        0: begin
            rst_n = 1;
            en = 1;
            in_col = 8'h01;
            in_row = 24'h01_00_00;
            count = 1;
        end
        1: begin
            in_col = 8'h02;
            in_row = 24'h02_04_00;
            count = 2;
        end
        2: begin
            in_col = 8'h03;
            in_row = 24'h03_05_07;
            count = 3;
        end
        3: begin
            in_col = 8'h00;
            in_row = 24'h00_06_08;
            count = 4;
        end
        4: begin
            in_col = 8'h00;
            in_row = 24'h00_00_09;
            count = 5;
        end
        5: begin
            in_col = 8'h00;
            in_row = 24'h00_00_00;
            count = 6;
        end
        6: begin
            in_col = 8'h00;
            in_row = 24'h00_00_00;
            count = 7;
        end
        7: begin
            in_col = 8'h00;
            in_row = 24'h00_00_00;
            count = 8;
        end
        8: begin

            count = 9;
        end
        default: begin
        end
    endcase
end

initial begin
    $dumpfile("sa_tb.vcd");
    $dumpvars();
    #1000;
    $finish;
end

pe_array #(
             .BITWIDTH ( BITWIDTH ),
             .IS_BITWIDTH_DOUBLE_SCALE ( IS_BITWIDTH_DOUBLE_SCALE ),
             .X_ROW ( X_ROW ),
             .Y_COL ( Y_COL ))
         u_pe_array (
             .clk ( clk ),
             .rst_n ( rst_n ),
             .en ( en ),
             .in_row ( in_row [X_ROW * BITWIDTH - 1: 0] ),
             .in_col ( in_col [Y_COL * BITWIDTH - 1: 0] ),

             .result ( result[X_ROW * Y_COL * BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) - 1: 0] )
         );

endmodule

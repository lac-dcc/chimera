// This program was cloned from: https://github.com/redlightASl/Notes
// License: GNU General Public License v3.0

`timescale  1ns / 1ps
// `include "systolic_array_top.v"

module systolic_array_top_tb();
parameter BITWIDTH = 8;
parameter IS_BITWIDTH_DOUBLE_SCALE = 0;
parameter X_ROW = 3;
parameter XCOL_YROW = 3;
parameter Y_COL = 3;

// systolic_array_top Inputs
reg sys_clk = 0;
reg sys_rst_n = 0;
reg start = 0;
reg [BITWIDTH * X_ROW * XCOL_YROW - 1: 0] X = 0;
reg [BITWIDTH * XCOL_YROW * Y_COL - 1: 0] Y = 0;

// systolic_array_top Outputs
wire done;
wire [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) * X_ROW * Y_COL - 1: 0] Z;

/*
002A 0024 001E
0060 0051 0042
0096 007E 0066

42 36 30
96 81 66
150 126 102
*/
initial begin
    forever
        #2 sys_clk = ~sys_clk;
end

integer stage=0;
always @(posedge sys_clk) begin
    case (stage)
        0: begin
            sys_rst_n = 1'b1;
            start = 1'b0;
            stage = 1;
        end
        1: begin
            X = 72'h010203040506070809;
            Y = 72'h030201060504090807;
            start = 1'b1;
            stage = 2;
        end
        2: begin
            stage = 3;
        end
        3: begin
            stage = 4;
        end
        4: begin
            if(done) begin
                X <= 72'h0;
                Y <= 72'h0;
                start = 1'b0;
                stage = 4;
            end
        end
        default: begin

        end
    endcase
end

initial begin
    $dumpfile("sa_top_tb.vcd");
    $dumpvars();
    #1000;
    $finish;
end

systolic_array_top #(
                     .BITWIDTH ( BITWIDTH ),
                     .X_ROW ( X_ROW ),
                     .IS_BITWIDTH_DOUBLE_SCALE ( IS_BITWIDTH_DOUBLE_SCALE ),
                     .XCOL_YROW ( XCOL_YROW ),
                     .Y_COL ( Y_COL ))
                 u_systolic_array_top (
                     .sys_clk ( sys_clk ),
                     .sys_rst_n ( sys_rst_n ),
                     .start ( start ),
                     .done ( done ),
                     .X ( X [BITWIDTH * X_ROW * XCOL_YROW - 1: 0] ),
                     .Y ( Y [BITWIDTH * XCOL_YROW * Y_COL - 1: 0] ),

                     .Z ( Z [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) * X_ROW * Y_COL - 1: 0] )
                 );

endmodule

// module systolic_array_top_tb();
// parameter BITWIDTH = 8;
// parameter X_ROW = 2;
// parameter XCOL_YROW = 3;
// parameter Y_COL = 4;

// // systolic_array_top Inputs
// reg sys_clk = 0;
// reg sys_rst_n = 0;
// reg start = 0;
// reg [BITWIDTH * X_ROW * XCOL_YROW - 1: 0] X = 0;
// reg [BITWIDTH * XCOL_YROW * Y_COL - 1: 0] Y = 0;

// // systolic_array_top Outputs
// wire done;
// wire [BITWIDTH * 2 * X_ROW * Y_COL - 1: 0] Z;

// /*
// 0020 0024 002A 0010
// 0047 0051 0060 002E

// 32 36 42 16
// 71 81 96 46
// */
// initial begin
//     forever
//         #2 sys_clk = ~sys_clk;
// end

// integer stage=0;
// always @(posedge sys_clk) begin
//     case (stage)
//         0: begin
//             sys_rst_n = 1'b1;
//             start = 1'b0;
//             stage = 1;
//         end
//         1: begin
//             X = 48'h010203_040506;
//             Y = 96'h01020304_05050606_07080900;
//             start = 1'b1;
//             stage = 2;
//         end
//         2: begin
//             stage = 3;
//         end
//         3: begin
//             stage = 4;
//         end
//         4: begin
//             if(done) begin
//                 X <= 48'h0;
//                 Y <= 96'h0;
//                 start = 1'b0;
//                 stage = 4;
//             end
//         end
//         default: begin

//         end
//     endcase
// end

// initial begin
//     $dumpfile("sa_top_tb.vcd");
//     $dumpvars();
//     #1000;
//     $finish;
// end

// systolic_array_top #(
//                      .BITWIDTH ( BITWIDTH ),
//                      .X_ROW ( X_ROW ),
//                      .XCOL_YROW ( XCOL_YROW ),
//                      .Y_COL ( Y_COL ))
//                  u_systolic_array_top (
//                      .sys_clk ( sys_clk ),
//                      .sys_rst_n ( sys_rst_n ),
//                      .start ( start ),
//                      .done ( done ),
//                      .X ( X [BITWIDTH * X_ROW * XCOL_YROW - 1: 0] ),
//                      .Y ( Y [BITWIDTH * XCOL_YROW * Y_COL - 1: 0] ),

//                      .Z ( Z [BITWIDTH * 2 * X_ROW * Y_COL - 1: 0] )
//                  );

// endmodule

// module systolic_array_top_tb();
// parameter BITWIDTH = 8;
// parameter X_ROW = 3;
// parameter XCOL_YROW = 3;
// parameter Y_COL = 1;

// // systolic_array_top Inputs
// reg sys_clk = 0;
// reg sys_rst_n = 0;
// reg start = 0;
// reg [BITWIDTH * X_ROW * XCOL_YROW - 1: 0] X = 0;
// reg [BITWIDTH * XCOL_YROW * Y_COL - 1: 0] Y = 0;

// // systolic_array_top Outputs
// wire done;
// wire [BITWIDTH * 2 * X_ROW * Y_COL - 1: 0] Z;

// /*
// 1 2 3
// 4 5 6
// 7 8 9

// 1
// 2
// 3

// 14
// 32
// 50

// 000E
// 0020
// 0032
// */
// initial begin
//     forever
//         #2 sys_clk = ~sys_clk;
// end

// integer stage=0;
// always @(posedge sys_clk) begin
//     case (stage)
//         0: begin
//             sys_rst_n = 1'b1;
//             start = 1'b0;
//             stage = 1;
//         end
//         1: begin
//             X = 72'h010203040506070809;
//             Y = 24'h01_02_03;
//             start = 1'b1;
//             stage = 2;
//         end
//         2: begin
//             stage = 3;
//         end
//         3: begin
//             stage = 4;
//         end
//         4: begin
//             if(done) begin
//                 X <= 72'h0;
//                 Y <= 24'h0;
//                 start = 1'b0;
//                 stage = 4;
//             end
//         end
//         default: begin

//         end
//     endcase
// end

// initial begin
//     $dumpfile("sa_top_tb.vcd");
//     $dumpvars();
//     #1000;
//     $finish;
// end

// systolic_array_top #(
//                      .BITWIDTH ( BITWIDTH ),
//                      .X_ROW ( X_ROW ),
//                      .XCOL_YROW ( XCOL_YROW ),
//                      .Y_COL ( Y_COL ))
//                  u_systolic_array_top (
//                      .sys_clk ( sys_clk ),
//                      .sys_rst_n ( sys_rst_n ),
//                      .start ( start ),
//                      .done ( done ),
//                      .X ( X [BITWIDTH * X_ROW * XCOL_YROW - 1: 0] ),
//                      .Y ( Y [BITWIDTH * XCOL_YROW * Y_COL - 1: 0] ),

//                      .Z ( Z [BITWIDTH * 2 * X_ROW * Y_COL - 1: 0] )
//                  );
// endmodule


// module systolic_array_top_tb();
// parameter BITWIDTH = 8;
// parameter IS_BITWIDTH_DOUBLE_SCALE = 0;
// parameter X_ROW = 3;
// parameter XCOL_YROW = 3;
// parameter Y_COL = 1;

// // systolic_array_top Inputs
// reg sys_clk = 0;
// reg sys_rst_n = 0;
// reg start = 0;
// reg [BITWIDTH * X_ROW * XCOL_YROW - 1: 0] X = 0;
// reg [BITWIDTH * XCOL_YROW * Y_COL - 1: 0] Y = 0;

// // systolic_array_top Outputs
// wire done;
// wire [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) * X_ROW * Y_COL - 1: 0] Z;

// /*
// [0,1,2],[1,2,3],[2,3,4],[3,4,5],[4,5,6],[5,6,7],[6,7,8],[7,8,9],[8,9,10],[9,10,11],[10,11,12]
// 10x3

// [1],[2],[3]
// 3x1

// 8
// 14
// 20
// 26
// 32
// 38
// 44
// 50
// 56
// 62
// 68

// 结果
// 0E
// 20
// 32
// */
// initial begin
//     forever
//         #2 sys_clk = ~sys_clk;
// end

// integer stage=0;
// always @(posedge sys_clk) begin
//     case (stage)
//         0: begin
//             sys_rst_n = 1'b1;
//             start = 1'b0;
//             stage = 1;
//         end
//         1: begin
//             X = 72'h010203040506070809;
//             Y = 24'h01_02_03;
//             start = 1'b1;
//             stage = 2;
//         end
//         2: begin
//             stage = 3;
//         end
//         3: begin
//             stage = 4;
//         end
//         4: begin
//             if(done) begin
//                 X <= 72'h0;
//                 Y <= 24'h0;
//                 start = 1'b0;
//                 stage = 5;
//             end
//         end
//         default: begin

//         end
//     endcase
// end

// initial begin
//     $dumpfile("sa_top_tb.vcd");
//     $dumpvars();
//     #1000;
//     $finish;
// end

// systolic_array_top #(
//                      .BITWIDTH ( BITWIDTH ),
//                      .IS_BITWIDTH_DOUBLE_SCALE(IS_BITWIDTH_DOUBLE_SCALE),
//                      .X_ROW ( X_ROW ),
//                      .XCOL_YROW ( XCOL_YROW ),
//                      .Y_COL ( Y_COL ))
//                  u_systolic_array_top (
//                      .sys_clk ( sys_clk ),
//                      .sys_rst_n ( sys_rst_n ),
//                      .start ( start ),
//                      .done ( done ),
//                      .X ( X [BITWIDTH * X_ROW * XCOL_YROW - 1: 0] ),
//                      .Y ( Y [BITWIDTH * XCOL_YROW * Y_COL - 1: 0] ),

//                      .Z ( Z [BITWIDTH * (IS_BITWIDTH_DOUBLE_SCALE + 1) * X_ROW * Y_COL - 1: 0] )
//                  );

// endmodule
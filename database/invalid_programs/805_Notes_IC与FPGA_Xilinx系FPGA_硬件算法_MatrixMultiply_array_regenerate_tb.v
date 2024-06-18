// This program was cloned from: https://github.com/redlightASl/Notes
// License: GNU General Public License v3.0

`timescale  1ns / 1ps
`include "array_regenerate.v"

// module array_regenerate_tb();

// parameter BITWIDTH = 8;
// parameter X_ROW = 3;
// parameter XCOL_YROW = 3;
// parameter Y_COL = 3;

// // array_regenerate Inputs
// reg sys_clk = 0;
// reg sys_rst_n = 0;
// reg calculate_flag = 0;
// reg [BITWIDTH * X_ROW * XCOL_YROW - 1: 0] X = 0;
// reg [BITWIDTH * XCOL_YROW * Y_COL - 1: 0] Y = 0;

// // array_regenerate Outputs
// wire [X_ROW * BITWIDTH - 1: 0] in_col;
// wire [Y_COL * BITWIDTH - 1: 0] in_row;


// initial begin
//     forever
//         #2 sys_clk = ~sys_clk;
// end

// /*
// 1 2 3       3 2 1
// 4 5 6   x   6 5 4
// 7 8 9       9 8 7


// 4 5 6       1 4 7
// 9 8 7   x   2 5 8
// 3 2 1       3 6 9
// */



// integer stage = 0;
// integer cnt=0;
// always @(posedge sys_clk) begin
//     case (stage)
//         0: begin
//             sys_rst_n = 1;
//             stage=1;
//             calculate_flag = 1'b0;
//         end
//         1: begin //加载数据
//             X = 72'h010203040506070809;
//             Y = 72'h030201060504090807;
//             stage=2;
//         end
//         2: begin //开始计算
//             calculate_flag = 1'b1;
//             stage=3;
//         end
//         3: begin
//             cnt = cnt + 1;
//             if(cnt == 3) begin
//                 cnt = 0;
//                 stage = 4;
//             end
//         end
//         4: begin //重置数据
//             X = 72'h040506090807030201;
//             Y = 72'h010407020508030609;
//             calculate_flag = 1'b0;
//             stage = 5;
//         end
//         5: begin //开始新一轮计算
//             // calculate_flag = 1'b0;
//             calculate_flag = 1'b1;
//             stage=6;
//         end
//         6: begin
//             cnt = cnt + 1;
//             if(cnt == 3) begin
//                 cnt = 0;
//                 stage = 7;
//             end
//         end
//         7: begin
//             X = 72'h0;
//             Y = 72'h0;
//             calculate_flag = 1'b0;
//             stage = 8;
//         end
//         8: begin //开始新一轮计算
//             calculate_flag = 1'b1;
//             stage = 9;
//         end
//         9: begin
//             cnt = cnt + 1;
//             if(cnt == 3) begin
//                 cnt = 0;
//                 stage = 7;
//             end
//         end
//         default: begin
            
//         end
//     endcase
// end


// initial begin
//     $dumpfile("ar_tb.vcd");
//     $dumpvars();
//     #1000;
//     $finish;
// end

// array_regenerate #(
//                      .BITWIDTH ( BITWIDTH ),
//                      .X_ROW ( X_ROW ),
//                      .XCOL_YROW ( XCOL_YROW ),
//                      .Y_COL ( Y_COL ))
//                  u_array_regenerate (
//                      .sys_clk ( sys_clk ),
//                      .sys_rst_n ( sys_rst_n ),
//                      .calculate_flag ( calculate_flag ),
//                      .X ( X [BITWIDTH * X_ROW * XCOL_YROW - 1: 0] ),
//                      .Y ( Y [BITWIDTH * XCOL_YROW * Y_COL - 1: 0] ),

//                      .in_col ( in_col [X_ROW * BITWIDTH - 1: 0] ),
//                      .in_row ( in_row [Y_COL * BITWIDTH - 1: 0] )
//                  );

// endmodule

// module array_regenerate_tb();

// parameter BITWIDTH = 8;
// parameter X_ROW = 2;
// parameter XCOL_YROW = 3;
// parameter Y_COL = 4;

// // array_regenerate Inputs
// reg sys_clk = 0;
// reg sys_rst_n = 0;
// reg calculate_flag = 0;
// reg [BITWIDTH * X_ROW * XCOL_YROW - 1: 0] X = 0;
// reg [BITWIDTH * XCOL_YROW * Y_COL - 1: 0] Y = 0;

// // array_regenerate Outputs
// wire [Y_COL * BITWIDTH - 1: 0] in_col;
// wire [X_ROW * BITWIDTH - 1: 0] in_row;


// initial begin
//     forever
//         #2 sys_clk = ~sys_clk;
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

// integer stage = 0;
// integer cnt=0;
// always @(posedge sys_clk) begin
//     case (stage)
//         0: begin
//             sys_rst_n = 1;
//             stage=1;
//             calculate_flag = 1'b0;
//         end
//         1: begin //加载数据
//             X = 48'h010203_040506;
//             Y = 96'h01020304_05050606_07080900;
//             stage=2;
//         end
//         2: begin //开始计算
//             calculate_flag = 1'b1;
//             stage=3;
//         end
//         3: begin
//             cnt = cnt + 1;
//             if(cnt == 3) begin
//                 cnt = 0;
//                 stage = 4;
//             end
//         end
//         4: begin //重置数据
//             X = 48'h0;
//             Y = 96'h0;
//             calculate_flag = 1'b0;
//             stage = 5;
//         end
//         5: begin //开始新一轮计算
//             // calculate_flag = 1'b0;
//             calculate_flag = 1'b1;
//             stage=6;
//         end
//         6: begin
//             cnt = cnt + 1;
//             if(cnt == 3) begin
//                 cnt = 0;
//                 stage = 7;
//             end
//         end
//         // 7: begin
//         //     X = 48'h0;
//         //     Y = 96'h0;
//         //     calculate_flag = 1'b0;
//         //     stage = 8;
//         // end
//         // 8: begin //开始新一轮计算
//         //     calculate_flag = 1'b1;
//         //     stage = 9;
//         // end
//         // 9: begin
//         //     cnt = cnt + 1;
//         //     if(cnt == 3) begin
//         //         cnt = 0;
//         //         stage = 10;
//         //     end
//         // end
//         default: begin
            
//         end
//     endcase
// end


// initial begin
//     $dumpfile("ar_tb.vcd");
//     $dumpvars();
//     #1000;
//     $finish;
// end

// array_regenerate #(
//                      .BITWIDTH ( BITWIDTH ),
//                      .X_ROW ( X_ROW ),
//                      .XCOL_YROW ( XCOL_YROW ),
//                      .Y_COL ( Y_COL ))
//                  u_array_regenerate (
//                      .sys_clk ( sys_clk ),
//                      .sys_rst_n ( sys_rst_n ),
//                      .calculate_flag ( calculate_flag ),
//                      .X ( X [BITWIDTH * X_ROW * XCOL_YROW - 1: 0] ),
//                      .Y ( Y [BITWIDTH * XCOL_YROW * Y_COL - 1: 0] ),

//                      .in_col ( in_col [Y_COL * BITWIDTH - 1: 0] ),
//                      .in_row ( in_row [X_ROW * BITWIDTH - 1: 0] )
//                  );

// endmodule

module array_regenerate_tb();

parameter BITWIDTH = 8;
parameter X_ROW = 3;
parameter XCOL_YROW = 3;
parameter Y_COL = 1;

// array_regenerate Inputs
reg sys_clk = 0;
reg sys_rst_n = 0;
reg calculate_flag = 0;
reg [BITWIDTH * X_ROW * XCOL_YROW - 1: 0] X = 0;
reg [BITWIDTH * XCOL_YROW * Y_COL - 1: 0] Y = 0;

// array_regenerate Outputs
wire [Y_COL * BITWIDTH - 1: 0] in_col;
wire [X_ROW * BITWIDTH - 1: 0] in_row;


initial begin
    forever
        #2 sys_clk = ~sys_clk;
end

/*
1 2 3       1
4 5 6   x   2
7 8 9       3

1 0 0
2 4 0
3 5 7
0 6 8
0 0 9

1
2
3
*/

integer DELAY=3;

integer stage = 0;
integer cnt=0;
always @(posedge sys_clk) begin
    case (stage)
        0: begin
            sys_rst_n = 1;
            stage=1;
        end
        1: begin //加载数据
            X = 72'h010203040506070809;
            Y = 24'h010203;
            calculate_flag = 1'b0;
            stage=2;
        end
        2: begin //开始计算
            calculate_flag = 1'b1;
            stage=3;
        end
        3: begin
            cnt = cnt + 1;
            if(cnt == DELAY) begin
                cnt = 0;
                stage = 4;
            end
        end
        4: begin //重置数据
            X = 72'h010203040506070809;
            Y = 24'h020507;
            calculate_flag = 1'b0;
            stage = 5;
        end
        5: begin //开始新一轮计算
            calculate_flag = 1'b1;
            stage=6;
        end
        6: begin
            cnt = cnt + 1;
            if(cnt == DELAY) begin
                cnt = 0;
                stage = 7;
            end
        end
        7: begin
            X = 72'h010203040506070809;
            Y = 24'h010304;
            calculate_flag = 1'b0;
            stage = 8;
        end
        8: begin //开始新一轮计算
            calculate_flag = 1'b1;
            stage = 9;
        end
        9: begin
            cnt = cnt + 1;
            if(cnt == DELAY) begin
                cnt = 0;
                stage = 1;
            end
        end
        default: begin
            
        end
    endcase
end


initial begin
    $dumpfile("ar_tb.vcd");
    $dumpvars();
    #1000;
    $finish;
end

array_regenerate #(
                     .BITWIDTH ( BITWIDTH ),
                     .X_ROW ( X_ROW ),
                     .XCOL_YROW ( XCOL_YROW ),
                     .Y_COL ( Y_COL ))
                 u_array_regenerate (
                     .sys_clk ( sys_clk ),
                     .sys_rst_n ( sys_rst_n ),
                     .calculate_flag ( calculate_flag ),
                     .X ( X [BITWIDTH * X_ROW * XCOL_YROW - 1: 0] ),
                     .Y ( Y [BITWIDTH * XCOL_YROW * Y_COL - 1: 0] ),

                     .in_col ( in_col [Y_COL * BITWIDTH - 1: 0] ),
                     .in_row ( in_row [X_ROW * BITWIDTH - 1: 0] )
                 );

endmodule

// This program was cloned from: https://github.com/YutongChenVictor/Fpga-accelerator-demos
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/11/01 08:49:25
// Design Name: 
// Module Name: layer_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module layer_1(
    input                 sys_clk     ,
    input                 sys_rst_n   ,
    input                 start_flag  ,

    output    [32:0]      data_out    ,
    output                out_valid
    );

    wire        [15:0]      data_pic        ;
    wire                    pic_valid       ;

pic_input   pic_generate(
    .clk            (sys_clk        ),
    .rst_n          (sys_rst_n      ),
    .pic_start      (start_flag     ),

    .pic_out_valid  (pic_valid      ),
    .data_pic       (data_pic       )
);
conv    conv_1_1(
    .clk            (sys_clk        ),
    .rst_n          (sys_rst_n      ),
    .data_pic       (data_pic       ),
    .pic_valid      (pic_valid      ),

    .data_out       (data_out       ),
    .out_valid      (out_valid      )
);
endmodule

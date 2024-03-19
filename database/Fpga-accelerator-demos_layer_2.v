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


module layer_2(
    input                 sys_clk     ,
    input                 sys_rst_n   ,
    input                 start_flag  ,

    output    [32:0]      data_out    ,
    output                out_valid
    );

    wire        [32:0]      data_max_out        ;
    wire                    data_max_valid      ;

max_data_generate   max_data_generate(
    .clk            (sys_clk        ),
    .rst_n          (sys_rst_n      ),
    .data_start     (start_flag     ),

    .data_out_valid (data_max_valid ),
    .data_out       (data_max_out   )
);
maxpooling    maxpooling_inst(
    .clk            (sys_clk        ),
    .rst_n          (sys_rst_n      ),
    .input_data     (data_max_out   ),
    .valid_input    (data_max_valid ),

    .out_data       (data_out       ),
    .out_valid      (out_valid      )
);
endmodule


// This program was cloned from: https://github.com/iCAS-Lab/APTPU
// License: MIT License

// MIT License
// 
// Copyright (c) 2021-2024 iCAS Lab
// 
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// Company: iCAS Lab, University of South Carolina
// Engineer: Mohammed E. Elbtity
// Create Date: 02/26/2021 04:14:48 PM
// Design Name: 
// Module Name: matrix
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



`timescale 1ns / 1ps


`include "options_definitions.vh"

module matrix#(

    parameter DW = 8,                                       // Datawidth = 1 Pixel data width 
    parameter WW = 8,                                       // Wights width = 1 parameter or 1 factor width
    parameter ACCURATE_DW = 4,                              // Accurate multiplier core size 
    parameter N  = 3,                                       // Number of Units in each row
    parameter M  = 3,                                       // Number of Units in each column
    parameter OUTWIDTH= (DW+WW)+(N-1),                      // Output width  
    parameter NIBBLE_WIDTH = 4,                             // ASM Multiplier Nibbles 
    parameter ADDER_PARAM = 6,                              // Internal Adder inside the multiplication unit 
    parameter ROUN_WIDTH = 1,                               // Rounding width of RoBA multiplier's parameter 
    parameter LOG2_NIBBLE_WIDTH = $clog2(NIBBLE_WIDTH), 
    parameter IMPRECISE_PART = DW/2,                        // Imprecise part of the adder 
    parameter max_bw = (DW>WW)? DW:WW,
    parameter bw_lg = $clog2(max_bw),
    parameter truncation_width = ACCURATE_DW+1,
    parameter VBL= 1,
    parameter NIBBLES = DW/4

    )                 (
    input  [N*M-1:0]            clear,                      //Clears the accumulators data
    input                       clk,rst_n,
    output [OUTWIDTH*N*M-1:0]   acc_result,                 // Result register
`ifdef DRUM_APTPU    
    input   [ACCURATE_DW*M-1:0]  pic_data_in,
    input   [ACCURATE_DW*N-1:0]  filter_weight,
    input   [$clog2(DW)*M-1:0]   d_shamt_in,
    input   [$clog2(WW)*N-1:0]   w_shamt_in,

    input   [M-1:0]              i_sign,
    input   [N-1:0]              w_sign,
    

    //input  [N*M-1:0]          refresh_sig_bus,
    output [ACCURATE_DW*M-1:0]  pypass_pic,
    output [ACCURATE_DW*N-1:0]  pypass_filter,
    output [$clog2(DW)*M-1:0]   pypass_d_shamt,
    output [$clog2(WW)*M-1:0]   pypass_w_shamt,
    output [M-1:0]              pypass_i_sign,
    output [N-1:0]              pypass_w_sign

`elsif BAM
    input  [DW*M-1:0]         pic_data_in,
    input  [WW*N-1:0]         filter_weight,
    output [DW*M-1:0]         pypas_pic,
    output [WW*N-1:0]         pypas_filter
`elsif UDM
    input  [DW*M-1:0]         pic_data_in,
    input  [WW*N-1:0]         filter_weight,
    output [DW*M-1:0]         pypas_pic,
    output [WW*N-1:0]         pypas_filter

`elsif EIM
    input  [DW*M-1:0]         pic_data_in,
    input  [WW*N-1:0]         filter_weight,
    output [DW*M-1:0]         pypas_pic,
    output [WW*N-1:0]         pypas_filter
`elsif NORMAL_TPU
    input  [DW*M-1:0]         pic_data_in,
    input  [WW*N-1:0]         filter_weight,
    output [DW*M-1:0]         pypas_pic,
    output [WW*N-1:0]         pypas_filter
    
`elsif ALM
    input   [($clog2(DW)+DW-1)*M-1:0]	pixel_log_format, 
    input   [M-1:0]                     pixel_zero_flag,
    input   [($clog2(WW)+WW-1)*N-1:0]   weight_log_format,
    input   [N-1:0]                     weight_zero_flag,
    
    output  [($clog2(DW)+DW-1)*M-1:0]   pypass_pixel_log_format, 
    output  [M-1:0]                     pypass_pixel_zero_flag,
    output  [($clog2(WW)+WW-1)*N-1:0]   pypass_weight_log_format,
    output  [N-1:0]                     pypass_weight_zero_flag
    
`elsif MITCHELL

    input [$clog2(DW)*M-1:0]            pixel_k,
    input [$clog2(WW)*N-1:0]            weight_k,
    input [DW*M-1:0]                    pixel_x,
    input [WW*N-1:0]                    weight_x,
    input [M-1:0]                       pixel_zero_flag,
    input [N-1:0]                       weight_zero_flag,
    
    output [$clog2(DW)*M-1:0]           pypass_pixel_k,
    output [$clog2(WW)*N-1:0]           pypass_weight_k,
    output [DW*M-1:0]                   pypass_pixel_x,
    output [WW*N-1:0]                   pypass_weight_x,
    output [M-1:0]                      pypass_pixel_zero_flag,
    output [N-1:0]                      pypass_weight_zero_flag
    
`elsif ROBA
    input  [DW*M-1:0]	                pixel,
    input  [($clog2(DW))*M-1:0]         pixek_K,
    input  [$clog2(WW)*N-1:0]           weight_K,
    input  [(DW+1)*M-1:0]               pixel_rounded,          // Coming from the Rounding Unit that rounds operand A 
    input  [WW*N-1:0]                   weight,
            
    output [DW*M-1:0]                   pypass_pixel,
    output [($clog2(DW))*M-1:0]         pypass_pixek_K,
    output [$clog2(WW)*N-1:0]           pypass_weight_K,
    output [(DW+1)*M-1:0]               pypass_pixel_rounded,          // Coming from the Rounding Unit that rounds operand A 
    output [WW*N-1:0]                   pypass_weight

`elsif DRALM
    input   [(bw_lg+truncation_width+1)*M-1:0]	        pixel_LC_OP,
    input   [(bw_lg+truncation_width+1)*N-1:0]          weight_LC_OP,
    
    output  [(bw_lg+truncation_width+1)*M-1:0]          pypass_pixel_LC_OP,
    output  [(bw_lg+truncation_width+1)*N-1:0]          pypass_weight_LC_OP

`elsif ASM
    `ifdef HIGH_REG
        input   [WW*N-1:0]                          weight,
        input   [(WW+3)*N-1:0]                      weight_I1, weight_I3, weight_I5, weight_I7,
        input   [(LOG2_NIBBLE_WIDTH*NIBBLES)*M-1:0] pixel_SL_in, 
        input   [(LOG2_NIBBLE_WIDTH*NIBBLES)*M-1:0] pixel_SEL_in,
                        
        output  [WW*N-1:0]                          pypass_weight,
        output  [(WW+3)*N-1:0]                      pypass_weight_I1, pypass_weight_I3, pypass_weight_I5, pypass_weight_I7,
        output  [(LOG2_NIBBLE_WIDTH*NIBBLES)*M-1:0] pypass_pixel_SL_in, 
        output  [(LOG2_NIBBLE_WIDTH*NIBBLES)*M-1:0] pypass_pixel_SEL_in
    
    `else
        input   [WW*N-1:0]                          weight,
        input   [DW*M-1:0]                          pixel,
        input   [(LOG2_NIBBLE_WIDTH*NIBBLES)*M-1:0] pixel_SL_in, 
        input   [(LOG2_NIBBLE_WIDTH*NIBBLES)*M-1:0] pixel_SEL_in,
                        
        output  [WW*N-1:0]                          pypass_weight,
        output  [DW*M-1:0]                          pypass_pixel,
        output  [(LOG2_NIBBLE_WIDTH*NIBBLES)*M-1:0] pypass_pixel_SL_in, 
        output  [(LOG2_NIBBLE_WIDTH*NIBBLES)*M-1:0] pypass_pixel_SEL_in
    
    `endif
    
`else
    input   [ACCURATE_DW*M-1:0]  pic_data_in,
    input   [ACCURATE_DW*N-1:0]  filter_weight,
    input   [$clog2(DW)*M-1:0]   d_shamt_in,
    input   [$clog2(WW)*N-1:0]   w_shamt_in,
    input   [M-1:0]              i_sign,
    input   [N-1:0]              w_sign,
    //input  [N*M-1:0]          refresh_sig_bus,
    output [ACCURATE_DW*M-1:0]  pypass_pic,
    output [ACCURATE_DW*N-1:0]  pypass_filter,
    output [$clog2(DW)*M-1:0]   pypass_d_shamt,
    output [$clog2(WW)*M-1:0]   pypass_w_shamt,
    output [M-1:0]              pypass_i_sign,
    output [N-1:0]              pypass_w_sign
`endif  
    );
    
`ifdef DRUM_APTPU
    
    wire [ACCURATE_DW*N-1:0] filter_weight_out [0:M];
    wire [$clog2(WW)*N-1:0]  w_shamt_out       [0:M];
    wire [N-1:0]             w_sign_out        [0:M];

`elsif BAM
    wire [WW*N-1:0] filter_weight_out [0:M];

`elsif UDM
    wire [WW*N-1:0] filter_weight_out [0:M];

`elsif EIM
    wire [WW*N-1:0] filter_weight_out [0:M];

`elsif NORMAL_TPU
    wire [WW*N-1:0] filter_weight_out [0:M];

`elsif ALM
    wire   [($clog2(WW)+WW-1)*N-1:0]   weight_log_format_reg [0:M];
    wire   [N-1:0]                     weight_zero_flag_reg  [0:M];

`elsif MITCHELL
    wire [$clog2(WW)*N-1:0]            weight_k_reg         [0:M];
    wire [WW*N-1:0]                    weight_x_reg         [0:M];
    wire [N-1:0]                       weight_zero_flag_reg [0:M];

`elsif ROBA
    wire  [$clog2(WW)*N-1:0]           weight_K_reg [0:M];
    wire  [WW*N-1:0]                   weight_reg   [0:M];

`elsif DRALM
    wire  [(bw_lg+truncation_width+1)*N-1:0]  weight_LC_OP_reg  [0:M];

`elsif ASM
    `ifdef HIGH_REG
        wire   [WW*N-1:0]               weight_reg      [0:M];
        wire   [(WW+3)*N-1:0]           weight_I1_reg   [0:M];
        wire   [(WW+3)*N-1:0]           weight_I3_reg   [0:M]; 
        wire   [(WW+3)*N-1:0]           weight_I5_reg   [0:M];
        wire   [(WW+3)*N-1:0]           weight_I7_reg   [0:M];
    
    
    `else
        wire   [WW*N-1:0]               weight_reg      [0:M];
    
    `endif 
`else 
    wire [ACCURATE_DW*N-1:0] filter_weight_out [0:M];
    wire [$clog2(WW)*N-1:0]  w_shamt_out       [0:M];
    wire [N-1:0]             w_sign_out        [0:M];

`endif     
    genvar m; 
        
    generate 
        for (m=0; m<M; m=m+1) begin 
            row#(.DW(DW),.WW(WW),.ACCURATE_DW(ACCURATE_DW),.N(N),.M(M),.OUTWIDTH(OUTWIDTH),
                .NIBBLE_WIDTH(NIBBLE_WIDTH),.ADDER_PARAM(ADDER_PARAM),.ROUN_WIDTH(ROUN_WIDTH),
                .IMPRECISE_PART(IMPRECISE_PART),.VBL(VBL),.NIBBLES(NIBBLES) ) row (
                .clk(clk),
                .rst_n(rst_n), 
                .clear_bus(clear[(N*(m+1))-1:N*m]),
                .acc_result(acc_result[(OUTWIDTH*N*(m+1))-1:OUTWIDTH*N*m]),
            `ifdef DRUM_APTPU
            
                .pic_data_in(pic_data_in[(ACCURATE_DW*(m+1))-1:ACCURATE_DW*m]),
                .d_shamt_in(d_shamt_in[($clog2(DW)*(m+1))-1:$clog2(DW)*m]),
                .i_sign(i_sign[m]),
                .w_sign(w_sign_out[m]),
                .filter_weight(filter_weight_out[m]),
                .w_shamt_in(w_shamt_out[m]),
                //.refresh_sig_bus(),
                .pypass_d_shamt(pypass_d_shamt[($clog2(DW)*(m+1))-1:$clog2(DW)*m]),
                .pypass_i_sign(pypass_i_sign[m]),
                .pypass_w_sign(w_sign_out[m+1]),
                .pypass_pic(pypass_pic[(ACCURATE_DW*(m+1))-1:ACCURATE_DW*m]),
                .pypass_weight(filter_weight_out[m+1]),
                .w_shamt_reg(w_shamt_out[m+1])
            
            `elsif BAM
                .pic_data_in(pic_data_in[(DW*(m+1))-1:DW*m]), 
                .filter_weight(filter_weight_out[m]),
                .pypas_pic(pypas_pic[(DW*(m+1))-1:DW*m]), 
                .pypas_filter(filter_weight_out[m+1])
            `elsif UDM
                .pic_data_in(pic_data_in[(DW*(m+1))-1:DW*m]), 
                .filter_weight(filter_weight_out[m]),
                .pypas_pic(pypas_pic[(DW*(m+1))-1:DW*m]), 
                .pypas_filter(filter_weight_out[m+1])
            
            `elsif EIM
                .pic_data_in(pic_data_in[(DW*(m+1))-1:DW*m]), 
                .filter_weight(filter_weight_out[m]),
                .pypas_pic(pypas_pic[(DW*(m+1))-1:DW*m]), 
                .pypas_filter(filter_weight_out[m+1])
            
            `elsif NORMAL_TPU
                .pic_data_in(pic_data_in[(DW*(m+1))-1:DW*m]), 
                .filter_weight(filter_weight_out[m]),
                .pypas_pic(pypas_pic[(DW*(m+1))-1:DW*m]), 
                .pypas_filter(filter_weight_out[m+1])
            
            `elsif ALM
                .pixel_log_format(pixel_log_format[($clog2(DW)+DW-1)*(m+1)-1:($clog2(DW)+DW-1)*m]), 
                .pixel_zero_flag(pixel_zero_flag[m]),
                .weight_log_format(weight_log_format_reg[m]),
                .weight_zero_flag(weight_zero_flag_reg[m]),
                .pypass_pixel_log_format(pypass_pixel_log_format[($clog2(DW)+DW-1)*(m+1)-1:($clog2(DW)+DW-1)*m]), 
                .pypass_pixel_zero_flag(pypass_pixel_zero_flag[m]),
                .pypass_weight_log_format(weight_log_format_reg[m+1]),
                .pypass_weight_zero_flag(weight_zero_flag_reg[m+1])
            
            `elsif MITCHELL
                .pixel_k(pixel_k[$clog2(DW)*(m+1)-1:$clog2(DW)*m]),
                .weight_k(weight_k_reg[m]),
                .pixel_x(pixel_x[DW*(m+1)-1:DW*m]),
                .weight_x(weight_x_reg[m]),
                .pixel_zero_flag(pixel_zero_flag[m]),
                .weight_zero_flag(weight_zero_flag_reg[m]),
                .pypass_pixel_k(pypass_pixel_k[$clog2(DW)*(m+1)-1:$clog2(DW)*m]),
                .pypass_weight_k(weight_k_reg[m+1]),
                .pypass_pixel_x(pypass_pixel_x[DW*(m+1)-1:DW*m]),
                .pypass_weight_x(weight_x_reg[m+1]),
                .pypass_pixel_zero_flag(pypass_pixel_zero_flag[m]),
                .pypass_weight_zero_flag(weight_zero_flag_reg[m+1])
                
            `elsif ROBA
                .pixel(pixel[DW*(m+1)-1:DW*m]),
                .pixek_K(pixek_K[($clog2(DW))*(m+1)-1:($clog2(DW))*m]),
                .weight_K(weight_K_reg[m]),
                .pixel_rounded(pixel_rounded[(DW+1)*(m+1)-1:(DW+1)*m]),          // Coming from the Rounding Unit that rounds operand A 
                .weight(weight_reg[m]),
                .pypass_pixel(pypass_pixel[DW*(m+1)-1:DW*m]),
                .pypass_pixek_K(pypass_pixek_K[($clog2(DW))*(m+1)-1:($clog2(DW))*m]),
                .pypass_weight_K(weight_K_reg[m+1]),
                .pypass_pixel_rounded(pypass_pixel_rounded[(DW+1)*(m+1)-1:(DW+1)*m]),          // Coming from the Rounding Unit that rounds operand A 
                .pypass_weight(weight_reg[m+1])
                
            `elsif DRALM
                .pixel_LC_OP(pixel_LC_OP[(bw_lg+truncation_width+1)*(m+1)-1:(bw_lg+truncation_width+1)*m]),
                .weight_LC_OP(weight_LC_OP_reg[m]),
                .pypass_pixel_LC_OP(pypass_pixel_LC_OP[(bw_lg+truncation_width+1)*(m+1)-1:(bw_lg+truncation_width+1)*m]),
                .pypass_weight_LC_OP(weight_LC_OP_reg[m+1])
            `elsif ASM
                `ifdef HIGH_REG
                    .weight(weight_reg[m]),
                    .weight_I1(weight_I1_reg[m]),
                    .weight_I3(weight_I3_reg[m]),
                    .weight_I5(weight_I5_reg[m]),
                    .weight_I7(weight_I7_reg[m]),
                    .pixel_SL_in(pixel_SL_in[(LOG2_NIBBLE_WIDTH*NIBBLES)*(m+1)-1:(LOG2_NIBBLE_WIDTH*NIBBLES)*m]), 
                    .pixel_SEL_in(pixel_SEL_in[(LOG2_NIBBLE_WIDTH*NIBBLES)*(m+1)-1:(LOG2_NIBBLE_WIDTH*NIBBLES)*m]),
                    .pypass_weight(weight_reg[m+1]),
                    .pypass_weight_I1(weight_I1_reg[m+1]),
                    .pypass_weight_I3(weight_I3_reg[m+1]),
                    .pypass_weight_I5(weight_I5_reg[m+1]),
                    .pypass_weight_I7(weight_I7_reg[m+1]),
                    .pypass_pixel_SL_in(pypass_pixel_SL_in[(LOG2_NIBBLE_WIDTH*NIBBLES)*(m+1)-1:(LOG2_NIBBLE_WIDTH*NIBBLES)*m]), 
                    .pypass_pixel_SEL_in(pypass_pixel_SEL_in[(LOG2_NIBBLE_WIDTH*NIBBLES)*(m+1)-1:(LOG2_NIBBLE_WIDTH*NIBBLES)*m])
                
                `else
                    .weight(weight_reg[m]),
                    .pixel(pixel[DW*(m+1)-1:DW*m]),
                    .pixel_SL_in(pixel_SL_in[(LOG2_NIBBLE_WIDTH*NIBBLES)*(m+1)-1:(LOG2_NIBBLE_WIDTH*NIBBLES)*m]), 
                    .pixel_SEL_in(pixel_SEL_in[(LOG2_NIBBLE_WIDTH*NIBBLES)*(m+1)-1:(LOG2_NIBBLE_WIDTH*NIBBLES)*m]),
                                    
                    .pypass_weight(weight_reg[m+1]),
                    .pypass_pixel(pypass_pixel[DW*(m+1)-1:DW*m]),
                    .pypass_pixel_SL_in(pypass_pixel_SL_in[(LOG2_NIBBLE_WIDTH*NIBBLES)*(m+1)-1:(LOG2_NIBBLE_WIDTH*NIBBLES)*m]), 
                    .pypass_pixel_SEL_in(pypass_pixel_SEL_in[(LOG2_NIBBLE_WIDTH*NIBBLES)*(m+1)-1:(LOG2_NIBBLE_WIDTH*NIBBLES)*m])
                    
                `endif 
            `else
                .pic_data_in(pic_data_in[(ACCURATE_DW*(m+1))-1:ACCURATE_DW*m]),
                .d_shamt_in(d_shamt_in[($clog2(DW)*(m+1))-1:$clog2(DW)*m]),
                .i_sign(i_sign[m]),
                .w_sign(w_sign_out[m]),
                .filter_weight(filter_weight_out[m]),
                .w_shamt_in(w_shamt_out[m]),
                //.refresh_sig_bus(),
                .pypass_d_shamt(pypass_d_shamt[($clog2(DW)*(m+1))-1:$clog2(DW)*m]),
                .pypass_i_sign(pypass_i_sign[m]),
                .pypass_w_sign(w_sign_out[m+1]),
                .pypass_pic(pypass_pic[(ACCURATE_DW*(m+1))-1:ACCURATE_DW*m]),
                .pypass_weight(filter_weight_out[m+1]),
                .w_shamt_reg(w_shamt_out[m+1])
                 
            `endif 
            );
            end
            
     endgenerate 
`ifdef DRUM_APTPU
    assign filter_weight_out[0] = filter_weight;
    assign pypass_filter = filter_weight_out[M];
    assign w_sign_out[0] = w_sign;
    assign pypass_w_sign = w_sign_out[M];
    assign w_shamt_out[0] = w_shamt_in;
     //assign pypass_w_shamt[0] = w_shamt_in;
    assign pypass_w_shamt = w_shamt_out[M];

`elsif BAM
    assign filter_weight_out[0] = filter_weight;
    assign pypas_filter = filter_weight_out[M];
    
`elsif UDM
    assign filter_weight_out[0] = filter_weight;
    assign pypas_filter = filter_weight_out[M];
    
`elsif EIM
    assign filter_weight_out[0] = filter_weight;
    assign pypas_filter = filter_weight_out[M];
    
`elsif NORMAL_TPU
    assign filter_weight_out[0] = filter_weight;
    assign pypas_filter = filter_weight_out[M];

`elsif ALM
    assign weight_log_format_reg[0] = weight_log_format;
    assign pypass_weight_log_format = weight_log_format_reg[M];
    assign weight_zero_flag_reg[0] = weight_zero_flag;
    assign pypass_weight_zero_flag = weight_zero_flag_reg[M];

`elsif MITCHELL
    assign weight_k_reg[0] = weight_k;
    assign pypass_weight_k = weight_k_reg[M];         
    assign weight_x_reg[0] = weight_x;
    assign pypass_weight_x = weight_x_reg[M];
    assign weight_zero_flag_reg[0] = weight_zero_flag;
    assign pypass_weight_zero_flag = weight_zero_flag_reg[M];

`elsif ROBA
    assign weight_K_reg[0] = weight_K; 
    assign pypass_weight_K = weight_K_reg[M];
    assign weight_reg[0] = weight;
    assign pypass_weight = weight_reg[M]; 
   // assign weight_zero_flag_reg[0] = weight_zero_flag;
    //assign pypass_weight_zero_flag = weight_zero_flag_reg[M];
    
`elsif DRALM
    assign weight_LC_OP_reg[0] = weight_LC_OP;
    assign pypass_weight_LC_OP = weight_LC_OP_reg[M];
`elsif ASM
    `ifdef HIGH_REG
        assign weight_reg[0] = weight;
        assign pypass_weight = weight_reg[M];
        assign weight_I1_reg[0] = weight_I1;
        assign pypass_weight_I1 = weight_I1_reg[M];
        assign weight_I3_reg[0] = weight_I3;
        assign pypass_weight_I3 = weight_I3_reg[M];
        assign weight_I5_reg[0] = weight_I5;
        assign pypass_weight_I5 = weight_I5_reg[M];
        assign weight_I7_reg[0] = weight_I7;
        assign pypass_weight_I7 = weight_I7_reg[M];
           
    `else
        assign weight_reg[0] = weight;
        assign pypass_weight = weight_reg[M]; 
    
    `endif 
`else
    assign filter_weight_out[0] = filter_weight;
    assign pypass_filter = filter_weight_out[M];
    assign w_sign_out[0] = w_sign;
    assign pypass_w_sign = w_sign_out[M];
    assign w_shamt_out[0] = w_shamt_in;
    assign pypass_w_shamt = w_shamt_out[M];

`endif 
           
endmodule

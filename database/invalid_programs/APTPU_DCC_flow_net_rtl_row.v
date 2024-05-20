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
// Create Date: 02/26/2021 04:03:54 PM
// Design Name: 
// Module Name: row
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

//`define DRUM_APTPU
//`define MITCHELL
//`include "options_definitions.vh" 

`include "options_definitions.vh"

module row#(
       parameter NIBBLE_WIDTH = 4,                             // ASM Multiplier Nibbles 
       parameter ADDER_PARAM = 6,                              // Internal Adder inside the multiplication unit 
       parameter ROUN_WIDTH = 1,                               // Rounding width of RoBA multiplier's parameter 
       parameter LOG2_NIBBLE_WIDTH = $clog2(NIBBLE_WIDTH), 
       parameter DW = 8,                   // Datawidth = 1 Pixel data width 
       parameter WW = 8,                   // Wights width = 1 parameter or 1 factor width
       parameter ACCURATE_DW = 4,                              // Accurate multiplier core size 
       parameter IMPRECISE_PART = DW/2,                        // Imprecise part of the adder 
       parameter max_bw = (DW>WW)? DW:WW,
       parameter bw_lg = $clog2(max_bw),
       parameter NIBBLES = DW/4,
       parameter truncation_width = ACCURATE_DW+1,
       parameter N  = 3,                   // Number of Units in each row
       parameter M  = 3,                   // Number of Units in each column
       parameter VBL= 1,                    // For BAM Multiplier 
       parameter OUTWIDTH = (DW+WW)+ $clog2(M)                 // Output width        || Result's Nof bits always equals Nof bits in the bigger operand + Nof the iterations
)          (
       input                       clk,rst_n,
       input  [N-1:0]              clear_bus,                                   // Clears the accumulators data
       output [OUTWIDTH*N-1:0]     acc_result,                                  // Result register
    `ifdef DRUM_APTPU       
       input  [ACCURATE_DW-1:0]    pic_data_in,
       input  [$clog2(DW)-1:0]     d_shamt_in,
       input                       i_sign,
       input  [N-1:0]              w_sign,
       input  [ACCURATE_DW*N-1:0]  filter_weight,
       input  [($clog2(WW)*N)-1:0] w_shamt_in,
      
       output [$clog2(DW)-1:0]     pypass_d_shamt,
       output                      pypass_i_sign,
       output [N-1:0]              pypass_w_sign,
       output [ACCURATE_DW-1:0]    pypass_pic,
       output [ACCURATE_DW*N-1:0]  pypass_weight,
       output [$clog2(WW)*N-1:0]   w_shamt_reg
        //  );
    `elsif BAM
        input  [DW-1:0]   pic_data_in,
        input  [WW*N-1:0] filter_weight,
        output [DW-1:0]   pypas_pic,
        output [WW*N-1:0] pypas_filter
    
    `elsif UDM
        input  [DW-1:0]   pic_data_in,
        input  [WW*N-1:0] filter_weight,
        output [DW-1:0]   pypas_pic,
        output [WW*N-1:0] pypas_filter
    
    `elsif EIM
        input  [DW-1:0]   pic_data_in,
        input  [WW*N-1:0] filter_weight,
        output [DW-1:0]   pypas_pic,
        output [WW*N-1:0] pypas_filter
    
    `elsif NORMAL_TPU
        input  [DW-1:0]   pic_data_in,
        input  [WW*N-1:0] filter_weight,
        output [DW-1:0]   pypas_pic,
        output [WW*N-1:0] pypas_filter
        
    `elsif ALM
        input   [$clog2(DW)+DW-2:0]	        pixel_log_format, 
        input                               pixel_zero_flag,
        input   [($clog2(WW)+WW-1)*N-1:0]   weight_log_format,
        input   [N-1:0]                     weight_zero_flag,
    
        output  [$clog2(DW)+DW-2:0]         pypass_pixel_log_format, 
        output                              pypass_pixel_zero_flag,
        output  [($clog2(WW)+WW-1)*N-1:0]   pypass_weight_log_format,
        output  [N-1:0]                     pypass_weight_zero_flag
          //  );
    `elsif MITCHELL
        input [$clog2(DW)-1:0]              pixel_k,
        input [$clog2(WW)*N-1:0]            weight_k,
        input [DW-1:0]                      pixel_x,
        input [WW*N-1:0]                    weight_x,
        input                               pixel_zero_flag,
        input [N-1:0]                       weight_zero_flag,
    
        output [$clog2(DW)-1:0]             pypass_pixel_k,
        output [$clog2(WW)*N-1:0]           pypass_weight_k,
        output [DW-1:0]                     pypass_pixel_x,
        output [WW*N-1:0]                   pypass_weight_x,
        output                              pypass_pixel_zero_flag,
        output [N-1:0]                      pypass_weight_zero_flag
           // );
                
    `elsif ROBA
        input  [DW-1:0]	           pixel,
        input  [$clog2(DW)-1:0]    pixek_K,
        input  [$clog2(WW)*N-1:0]  weight_K,
        input  [DW:0]              pixel_rounded,          // Coming from the Rounding Unit that rounds operand A 
        input  [WW*N-1:0]          weight,
            
        output [DW-1:0]            pypass_pixel,
        output [$clog2(DW)-1:0]    pypass_pixek_K,
        output [$clog2(WW)*N-1:0]  pypass_weight_K,
        output [DW:0]              pypass_pixel_rounded,          // Coming from the Rounding Unit that rounds operand A 
        output [WW*N-1:0]          pypass_weight
           // );
    `elsif DRALM
        input   [bw_lg+truncation_width:0]	        pixel_LC_OP,
        input   [(bw_lg+truncation_width+1)*N-1:0]  weight_LC_OP,
    
        output  [bw_lg+truncation_width:0]          pypass_pixel_LC_OP,
        output  [(bw_lg+truncation_width+1)*N-1:0]  pypass_weight_LC_OP
          //  );
    `elsif ASM
        `ifdef HIGH_REG
            input   [WW*N-1:0]                        weight,
            input   [(WW+3)*N-1:0]                    weight_I1, weight_I3, weight_I5, weight_I7,
            input   [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] pixel_SL_in, 
            input   [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] pixel_SEL_in,
                    
            output  [WW*N-1:0]                        pypass_weight,
            output  [(WW+3)*N-1:0]                    pypass_weight_I1, pypass_weight_I3, pypass_weight_I5, pypass_weight_I7,
            output  [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] pypass_pixel_SL_in, 
            output  [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] pypass_pixel_SEL_in
           // );
        
        `else
            input   [WW*N-1:0]                        weight,
            input   [DW-1:0]                          pixel,
            input   [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] pixel_SL_in, 
            input   [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] pixel_SEL_in,
                    
            output  [WW*N-1:0]                        pypass_weight,
            output  [DW-1:0]                          pypass_pixel,
            output  [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] pypass_pixel_SL_in, 
            output  [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] pypass_pixel_SEL_in
          //  );
        
        `endif   
    `else 
        input  [ACCURATE_DW-1:0]    pic_data_in,
        input  [$clog2(DW)-1:0]     d_shamt_in,
        input                       i_sign,
        input  [N-1:0]              w_sign,
        input  [ACCURATE_DW*N-1:0]  filter_weight,
        input  [($clog2(WW)*N)-1:0] w_shamt_in,
           
           //input  [N-1:0]    refresh_sig_bus,
        output [$clog2(DW)-1:0]     pypass_d_shamt,
        output                      pypass_i_sign,
        output [N-1:0]              pypass_w_sign,
        output [ACCURATE_DW-1:0]    pypass_pic,
        output [ACCURATE_DW*N-1:0]  pypass_weight,
           //output [ACCURATE_DW*N-1:0] filter_reg,
        output [$clog2(WW)*N-1:0]   w_shamt_reg
              
    `endif 
    );
          
    `ifdef DRUM_APTPU
    // pic_data_out
       wire [ACCURATE_DW-1:0] pic_data_reg [0:N];
       wire [$clog2(DW)-1:0]  d_shamt_reg  [0:N];
       wire i_sign_reg                     [0:N];
    
    `elsif BAM
        wire [DW-1:0] pic_data_out[0:N];
        
    `elsif UDM
        wire [DW-1:0] pic_data_out[0:N];
    
    `elsif EIM
        wire [DW-1:0] pic_data_out[0:N];
    
    `elsif NORMAL_TPU
        wire [DW-1:0] pic_data_out[0:N];
    
    `elsif ALM
       wire [$clog2(DW)+DW-2:0] pic_log_format_reg  [0:N];
       wire                     pixel_zero_flag_reg [0:N];
    
    `elsif MITCHELL
       wire [$clog2(DW)-1:0]    pixel_k_reg         [0:N];
       wire [DW-1:0]            pixel_x_reg         [0:N];
       wire                     pixel_zero_flag_reg [0:N];
    
    `elsif ROBA
       wire [DW-1:0]	        pixel_reg           [0:N];
       wire [$clog2(DW)-1:0]    pixek_K_reg         [0:N];
       wire [DW:0]              pixel_rounded_reg   [0:N];
    
    `elsif DRALM
       wire [bw_lg+truncation_width:0] pixel_LC_OP_reg  [0:N];
    
    `elsif ASM
        `ifdef HIGH_REG
            wire [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] pixel_SL_in_reg  [0:N];
            wire [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] pixel_SEL_in_reg [0:N];
        `else
            wire [DW-1:0]                          pixel_reg        [0:N];
            wire [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] pixel_SL_in_reg  [0:N];
            wire [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] pixel_SEL_in_reg [0:N];
        `endif 
    `else
        wire [ACCURATE_DW-1:0] pic_data_reg [0:N];
        wire [$clog2(DW)-1:0]  d_shamt_reg  [0:N];
        wire                   i_sign_reg   [0:N];
    `endif 
    
    
    
       genvar n; 
       generate
         for (n=0; n<N; n=n+1) begin
             /*
             pe #(.DW(DW),.WW(WW),.ACCURATE_DW(ACCURATE_DW),.M(M),.OUTWIDTH(OUTWIDTH)) PE  (
             .pixel_data(pic_data_reg[n]),
             .weight(filter_weight[(ACCURATE_DW*(n+1))-1:ACCURATE_DW*n]),
             .clk(clk),
             .rst_n(rst_n),
             .d_shamt(d_shamt_reg[n]),
             .clear(clear_bus[n]),
             .w_shamt(w_shamt_in[($clog2(WW)*(n+1))-1:$clog2(WW)*n]),//refresh,   
             .w_sign(w_sign[n]),
             .i_sign(i_sign_reg[n]),
             .w_sign_reg(pypass_w_sign[n]),
             .i_sign_reg(i_sign_reg[n+1]),
             .d_shamt_reg(d_shamt_reg[n+1]),
             .w_shamt_reg(w_shamt_reg[($clog2(WW)*(n+1))-1:$clog2(WW)*n]),
             .pypass_data(pic_data_reg[n+1]),
             .pypass_weight(pypass_weight[(ACCURATE_DW*(n+1))-1:ACCURATE_DW*n]),
             .acc_result(acc_result[(OUTWIDTH*(n+1))-1:OUTWIDTH*n]));
             */
             
             pe #(.NIBBLE_WIDTH(NIBBLE_WIDTH),.ADDER_PARAM(ADDER_PARAM),.ROUN_WIDTH(ROUN_WIDTH),.DW(DW),.IMPRECISE_PART(IMPRECISE_PART),
             .WW(WW),.ACCURATE_DW(ACCURATE_DW),.M(M),.max_bw(max_bw),.bw_lg(bw_lg),.LOG2_NIBBLE_WIDTH(LOG2_NIBBLE_WIDTH),.NIBBLES(NIBBLES),
             .VBL(VBL),.OUTWIDTH(OUTWIDTH)) PE (
             .clk(clk),
             .rst_n(rst_n),
             .clear(clear_bus[n]),                     // Clear the Accumulators registers
             .acc_result(acc_result[(OUTWIDTH*(n+1))-1:OUTWIDTH*n]),                 // Result register (Accumulation Results) 
             `ifdef DRUM_APTPU
                .pixel_data(pic_data_reg[n]),                //input data (pixels) 
                .weight(filter_weight[(ACCURATE_DW*(n+1))-1:ACCURATE_DW*n]),                    // Weight (filter data OR kernels)
                .d_shamt(d_shamt_reg[n]),                     // Shift amount of the 
                .w_shamt(w_shamt_in[($clog2(WW)*(n+1))-1:$clog2(WW)*n]),
                .w_sign(w_sign[n]),
                .i_sign(i_sign_reg[n]),             // Sign bits of the weight and the input data (pixel data)
                .w_sign_reg(pypass_w_sign[n]), 
                .i_sign_reg(i_sign_reg[n+1]),    // The sign of weight and input_data registered 
                .d_shamt_reg(d_shamt_reg[n+1]),
                .w_shamt_reg(w_shamt_reg[($clog2(WW)*(n+1))-1:$clog2(WW)*n]),
                .pypass_data(pic_data_reg[n+1]),               // Data pypassing register
                .pypass_weight(pypass_weight[(ACCURATE_DW*(n+1))-1:ACCURATE_DW*n])             // Weight Pypassing register
                //);            
             
             `elsif BAM
                .pixel(pic_data_out[n]),                                    // Data 
                .weight(filter_weight[(WW*(n+1))-1:WW*n]),                  // Weight
                .pypass_pixel(pic_data_out[n+1]),                             // Data pypassing register**
                .pypass_weight(pypas_filter[(WW*(n+1))-1:WW*n])              // Weight Pypassing register
             
             `elsif UDM
                .pixel(pic_data_out[n]),                                    // Data 
                .weight(filter_weight[(WW*(n+1))-1:WW*n]),                  // Weight
                .pypass_pixel(pic_data_out[n+1]),                             // Data pypassing register**
                .pypass_weight(pypas_filter[(WW*(n+1))-1:WW*n])              // Weight Pypassing register
             
             `elsif EIM
                .pixel(pic_data_out[n]),                                    // Data 
                .weight(filter_weight[(WW*(n+1))-1:WW*n]),                  // Weight
                .pypass_pixel(pic_data_out[n+1]),                             // Data pypassing register**
                .pypass_weight(pypas_filter[(WW*(n+1))-1:WW*n])              // Weight Pypassing register
             
             `elsif NORMAL_TPU
                .pixel(pic_data_out[n]),                                    // Data 
                .weight(filter_weight[(WW*(n+1))-1:WW*n]),                  // Weight
                .pypass_pixel(pic_data_out[n+1]),                             // Data pypassing register**
                .pypass_weight(pypas_filter[(WW*(n+1))-1:WW*n])              // Weight Pypassing register
                      
             `elsif ALM
                .pixel_log_format(pic_log_format_reg[n]), 
                .pixel_zero_flag(pixel_zero_flag_reg[n]),
                .weight_log_format(weight_log_format[(($clog2(WW)+WW-1)*(n+1))-1:($clog2(WW)+WW-1)*n]),
                .weight_zero_flag(weight_zero_flag[n]),
                     
                .reg_pixel_log_format(pic_log_format_reg[n+1]), 
                .reg_pixel_zero_flag(pixel_zero_flag_reg[n+1]),
                .reg_weight_log_format(pypass_weight_log_format[(($clog2(WW)+WW-1)*(n+1))-1:($clog2(WW)+WW-1)*n]),
                .reg_weight_zero_flag(pypass_weight_zero_flag[n])//);
                 
             `elsif MITCHELL
                .pixel_k(pixel_k_reg[n]),
                .weight_k(weight_k[$clog2(WW)*(n+1)-1:$clog2(WW)*n]),
                .pixel_x(pixel_x_reg[n]),
                .weight_x(weight_x[WW*(n+1)-1:WW*n]),
                .pixel_zero_flag(pixel_zero_flag_reg[n]),
                .weight_zero_flag(weight_zero_flag[n]),
                     
                .reg_pixel_k(pixel_k_reg[n+1]),
                .reg_weight_k(pypass_weight_k[$clog2(WW)*(n+1)-1:$clog2(WW)*n]),
                .reg_pixel_x(pixel_x_reg[n+1]),
                .reg_weight_x(pypass_weight_x[WW*(n+1)-1:WW*n]),
                .reg_pixel_zero_flag(pixel_zero_flag_reg[n+1]),
                .reg_weight_zero_flag(pypass_weight_zero_flag[n])//);
                 
                 
             `elsif ROBA
                .pixel(pixel_reg[n]),
                .pixek_K(pixek_K_reg[n]),
                .weight_K(weight_K[$clog2(WW)*(n+1)-1:$clog2(WW)*n]),
                .pixel_rounded(pixel_rounded_reg[n]),          // Coming from the Rounding Unit that rounds operand A 
                .weight(weight[WW*(n+1)-1:WW*n]),
                     
                .reg_pixel(pixel_reg[n+1]),
                .reg_pixek_K(pixek_K_reg[n+1]),
                .reg_weight_K(pypass_weight_K[$clog2(WW)*(n+1)-1:$clog2(WW)*n]),
                .reg_pixel_rounded(pixel_rounded_reg[n+1]),          // Coming from the Rounding Unit that rounds operand A 
                .reg_weight(pypass_weight[WW*(n+1)-1:WW*n])//);
              
             `elsif DRALM
                .pixel_LC_OP(pixel_LC_OP_reg[n]),
                .weight_LC_OP(weight_LC_OP[(bw_lg+truncation_width+1)*(n+1)-1:(bw_lg+truncation_width+1)*n]),
                     
                .reg_pixel_LC_OP(pixel_LC_OP_reg[n+1]),
                .reg_weight_LC_OP(pypass_weight_LC_OP[(bw_lg+truncation_width+1)*(n+1)-1:(bw_lg+truncation_width+1)*n])//);
             
                 
             `elsif ASM
                `ifdef HIGH_REG
                    .weight(weight[WW*(n+1)-1:WW*n]),
                    .weight_I1(weight_I1[(WW+3)*(n+1)-1:(WW+3)*n]), 
                    .weight_I3(weight_I3[(WW+3)*(n+1)-1:(WW+3)*n]),
                    .weight_I5(weight_I5[(WW+3)*(n+1)-1:(WW+3)*n]),
                    .weight_I7(weight_I7[(WW+3)*(n+1)-1:(WW+3)*n]),
                    .pixel_SL_in(pixel_SL_in_reg[n]), 
                    .pixel_SEL_in(pixel_SEL_in_reg[n]),
                         
                    .reg_weight(pypass_weight[WW*(n+1)-1:WW*n]),
                    .reg_weight_I1(pypass_weight_I1[(WW+3)*(n+1)-1:(WW+3)*n]), 
                    .reg_weight_I3(pypass_weight_I3[(WW+3)*(n+1)-1:(WW+3)*n]), 
                    .reg_weight_I5(pypass_weight_I5[(WW+3)*(n+1)-1:(WW+3)*n]), 
                    .reg_weight_I7(pypass_weight_I7[(WW+3)*(n+1)-1:(WW+3)*n]),
                    .reg_pixel_SL_in(pixel_SL_in_reg[n+1]), 
                    .reg_pixel_SEL_in(pixel_SEL_in_reg[n+1])//);
                         
                `else
                    .weight(weight[WW*(n+1)-1:WW*n]),
                    .pixel(pixel_reg[n]),
                    .pixel_SL_in(pixel_SL_in_reg[n]), 
                    .pixel_SEL_in(pixel_SEL_in_reg[n]),
                         
                    .reg_weight(pypass_weight[WW*(n+1)-1:WW*n]),
                    .reg_pixel(pixel_reg[n+1]),
                    .reg_pixel_SL_in(pixel_SL_in_reg[n+1]), 
                    .reg_pixel_SEL_in(pixel_SEL_in_reg[n+1])//);
                         
                `endif 
             `else
                .pixel_data(pic_data_reg[n]),                //input data (pixels) 
                .weight(filter_weight[(ACCURATE_DW*(n+1))-1:ACCURATE_DW*n]),                    // Weight (filter data OR kernels)
                .d_shamt(d_shamt_reg[n]),                     // Shift amount of the 
                .w_shamt(w_shamt_in[($clog2(WW)*(n+1))-1:$clog2(WW)*n]),
                .w_sign(w_sign[n]),
                .i_sign(i_sign_reg[n]),             // Sign bits of the weight and the input data (pixel data)
                .w_sign_reg(pypass_w_sign[n]), 
                .i_sign_reg(i_sign_reg[n+1]),    // The sign of weight and input_data registered 
                .d_shamt_reg(d_shamt_reg[n+1]),
                .w_shamt_reg(w_shamt_reg[($clog2(WW)*(n+1))-1:$clog2(WW)*n]),
                .pypass_data(pic_data_reg[n+1]),               // Data pypassing register
                .pypass_weight(pypass_weight[(ACCURATE_DW*(n+1))-1:ACCURATE_DW*n])             // Weight Pypassing register
                    //); 
                 
             `endif
                 );
             
             
             
             
         end 
       endgenerate
    `ifdef DRUM_APTPU      
        assign pic_data_reg[0] = pic_data_in;
        assign pypass_pic = pic_data_reg[N];
        assign d_shamt_reg[0] = d_shamt_in;
        assign pypass_d_shamt = d_shamt_reg[N]; 
        assign i_sign_reg[0] = i_sign;
        assign pypass_i_sign = i_sign_reg[N];
    
    `elsif BAM
        assign pic_data_out[0] = pic_data_in;
        assign pypas_pic = pic_data_out[N];
    
    `elsif UDM
        assign pic_data_out[0] = pic_data_in;
        assign pypas_pic = pic_data_out[N];
    
    `elsif EIM
        assign pic_data_out[0] = pic_data_in;
        assign pypas_pic = pic_data_out[N];
    
    `elsif NORMAL_TPU
        assign pic_data_out[0] = pic_data_in;
        assign pypas_pic = pic_data_out[N];
        
    `elsif ALM
        assign pic_log_format_reg[0] = pixel_log_format;
        assign pypass_pixel_log_format = pic_log_format_reg[N];
        assign pixel_zero_flag_reg[0] = pixel_zero_flag;
        assign pypass_pixel_zero_flag = pixel_zero_flag_reg[N];
    
    `elsif MITCHELL
        assign pixel_k_reg[0] = pixel_k;
        assign pypass_pixel_k = pixel_k_reg[N];
        assign pixel_x_reg[0] = pixel_x;
        assign pypass_pixel_x = pixel_x_reg[N];
        assign pixel_zero_flag_reg[0] = pixel_zero_flag;
        assign pypass_pixel_zero_flag = pixel_zero_flag_reg[N];
       
    `elsif ROBA
        assign pixel_reg[0] = pixel;
        assign pypass_pixel = pixel_reg[N];
        assign pixek_K_reg[0] = pixek_K;
        assign pypass_pixek_K = pixek_K_reg[N];
        assign pixel_rounded_reg[0] = pixel_rounded;
        assign pypass_pixel_rounded = pixel_rounded_reg[N];
    
    `elsif DRALM
        assign pixel_LC_OP_reg[0] = pixel_LC_OP;
        assign pypass_pixel_LC_OP = pixel_LC_OP_reg[N];
    
    `elsif ASM
        `ifdef HIGH_REG
            assign pixel_SL_in_reg[0] = pixel_SL_in;
            assign pypass_pixel_SL_in = pixel_SL_in_reg[N];
            assign pixel_SEL_in_reg[0] = pypass_pixel_SEL_in;
            assign pypass_pixel_SEL_in = pixel_SEL_in_reg[N];
        `else
            assign pixel_SL_in_reg[0] = pixel_SL_in;
            assign pypass_pixel_SL_in = pixel_SL_in_reg[N];
            assign pixel_SEL_in_reg[0] = pypass_pixel_SEL_in;
            assign pypass_pixel_SEL_in = pixel_SEL_in_reg[N];
            assign pixel_reg[0] = pixel;
            assign pypass_pixel = pixel_reg[N];
        
        `endif
    `endif 
       

endmodule

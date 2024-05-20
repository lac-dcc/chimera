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
// Create Date: 02/26/2021 03:56:14 PM
// Design Name: 
// Module Name: pe
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

// Define the adder type 
//`define SA_ADDER
//`define OLD
//`define ACCURATE_ACCUMULATE

//`define SA_ADDER
//`define MITCHELL
//`define MITCHELL
//`define HIGH_REG

`include "options_definitions.vh"


module pe #(
    parameter NIBBLE_WIDTH = 4,                             // ASM Multiplier Nibbles 
    parameter ADDER_PARAM = 6,                              // Internal Adder inside the multiplication unit 
    parameter ROUN_WIDTH = 1,                               // Rounding width of RoBA multiplier's parameter 
    parameter DW = 8,                                       // Datawidth = Pixels (Input) data width 
    parameter IMPRECISE_PART = DW/2,                        // Imprecise part of the adder 
    parameter WW = 8,                                       // Wights width = number of bits in each weight (kernel) 
    parameter ACCURATE_DW = 4,                              // Accurate multiplier core size 
    parameter M  = 3,                                       // Number of the PEs in each column
    parameter max_bw = (DW>WW)? DW:WW, 
    parameter bw_lg = $clog2(max_bw),
    parameter LOG2_NIBBLE_WIDTH = $clog2(NIBBLE_WIDTH), 
    parameter truncation_width = ACCURATE_DW+1,
    parameter NIBBLES = DW/4,
    parameter VBL= 1,
    parameter OUTWIDTH = (DW+WW)+ $clog2(M)                 // Output width        || Result's Nof bits always equals Nof bits in the bigger operand + Nof the iterations
    )      (
    input                          clk,rst_n,
    input                          clear,                     // Clear the Accumulators registers
    output      [OUTWIDTH-1:0]     acc_result,                 // Result register (Accumulation Results) 
    
    `ifdef DRUM_APTPU
        input       [ACCURATE_DW-1:0]  pixel_data,                //input data (pixels) 
        input       [ACCURATE_DW-1:0]  weight,                    // Weight (filter data OR kernels)
        input       [$clog2(DW)-1:0]   d_shamt,                     // Shift amount of the 
        input       [$clog2(WW)-1:0]   w_shamt,
        // input                              refresh,           // Refresh signal to start accumulating from the begining            ||||| Not used here in this version of the code    
        input                          w_sign,i_sign,             // Sign bits of the weight and the input data (pixel data)
        output reg                     w_sign_reg, i_sign_reg,    // The sign of weight and input_data registered 
        output reg  [$clog2(DW)-1:0]   d_shamt_reg,
        output reg  [$clog2(WW)-1:0]   w_shamt_reg,
        output reg  [ACCURATE_DW-1:0]  pypass_data,               // Data pypassing register
        output reg  [ACCURATE_DW-1:0]  pypass_weight             // Weight Pypassing register
        
    `elsif BAM
        input       [DW-1:0] 	 pixel,
        input       [WW-1:0]     weight, 
        output reg  [DW-1:0] 	 pypass_pixel,
        output reg  [WW-1:0]     pypass_weight
    
    `elsif UDM
        input       [DW-1:0] 	 pixel,
        input       [WW-1:0]     weight, 
        output reg  [DW-1:0]     pypass_pixel,
        output reg  [WW-1:0]     pypass_weight
    
    `elsif EIM
        input       [DW-1:0] 	 pixel,
        input       [WW-1:0]     weight, 
        output reg  [DW-1:0]     pypass_pixel,
        output reg  [WW-1:0]     pypass_weight
    
    `elsif NORMAL_TPU
        input  signed   [DW-1:0] 	pixel,
        input  signed   [WW-1:0]    weight, 
        output reg      [DW-1:0]    pypass_pixel,
        output reg      [WW-1:0]    pypass_weight
    
    `elsif ALM
        input [$clog2(DW)+DW-2:0]	pixel_log_format, 
        input                       pixel_zero_flag,
        input [$clog2(WW)+WW-2:0]   weight_log_format,
        input                       weight_zero_flag,
        
        output reg [$clog2(DW)+DW-2:0]	reg_pixel_log_format, 
        output reg                      reg_pixel_zero_flag,
        output reg [$clog2(WW)+WW-2:0]  reg_weight_log_format,
        output reg                      reg_weight_zero_flag
    
    `elsif MITCHELL
        input [$clog2(DW)-1:0] pixel_k,
        input [$clog2(WW)-1:0] weight_k,
        input [DW-1:0]         pixel_x,
        input [WW-1:0]         weight_x,
        input                    pixel_zero_flag,
        input                    weight_zero_flag,
        
        output reg [$clog2(DW)-1:0] reg_pixel_k,
        output reg [$clog2(WW)-1:0] reg_weight_k,
        output reg [DW-1:0]         reg_pixel_x,
        output reg [WW-1:0]         reg_weight_x,
        output reg                    reg_pixel_zero_flag,
        output reg                    reg_weight_zero_flag
    
    
    `elsif ROBA
        input  [DW-1:0]	           pixel,
        input  [$clog2(DW)-1:0]    pixek_K,
        input  [$clog2(WW)-1:0]    weight_K,
        input  [DW:0]              pixel_rounded,          // Coming from the Rounding Unit that rounds operand A 
        input  [WW-1:0]            weight,
        
        output reg  [DW-1:0]	        reg_pixel,
        output reg  [$clog2(DW)-1:0]    reg_pixek_K,
        output reg  [$clog2(WW)-1:0]    reg_weight_K,
        output reg  [DW:0]              reg_pixel_rounded,          // Coming from the Rounding Unit that rounds operand A 
        output reg  [WW-1:0]            reg_weight
 
    `elsif DRALM
        input	[bw_lg+truncation_width:0]	pixel_LC_OP,
        input   [bw_lg+truncation_width:0]  weight_LC_OP,
        
        output reg	[bw_lg+truncation_width:0]	reg_pixel_LC_OP,
        output reg  [bw_lg+truncation_width:0]  reg_weight_LC_OP

    
    `elsif ASM
        `ifdef HIGH_REG
            input [WW-1:0]                          weight,
            input [WW+2:0]                          weight_I1, weight_I3, weight_I5, weight_I7,
            input [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] pixel_SL_in, 
            input [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] pixel_SEL_in,
            
            output reg [WW-1:0]                          reg_weight,
            output reg [WW+2:0]                          reg_weight_I1, reg_weight_I3, reg_weight_I5, reg_weight_I7,
            output reg [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] reg_pixel_SL_in, 
            output reg [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] reg_pixel_SEL_in
            
        `else
            input [WW-1:0]                          weight,
            input [DW-1:0]                          pixel,
            input [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] pixel_SL_in, 
            input [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] pixel_SEL_in,
            
            output reg [WW-1:0]                          reg_weight,
            output reg [DW-1:0]                          reg_pixel,
            output reg [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] reg_pixel_SL_in, 
            output reg [(LOG2_NIBBLE_WIDTH*NIBBLES)-1:0] reg_pixel_SEL_in
            
        `endif 
    `else
        input       [ACCURATE_DW-1:0]  pixel_data,                //input data (pixels) 
        input       [ACCURATE_DW-1:0]  weight,                    // Weight (filter data OR kernels)
        input       [$clog2(DW)-1:0]   d_shamt,                     // Shift amount of the 
        input       [$clog2(WW)-1:0]   w_shamt,
        // input                              refresh,           // Refresh signal to start accumulating from the begining            ||||| Not used here in this version of the code    
        input                          w_sign,i_sign,             // Sign bits of the weight and the input data (pixel data)
        output reg                     w_sign_reg, i_sign_reg,    // The sign of weight and input_data registered 
        output reg  [$clog2(DW)-1:0]   d_shamt_reg,
        output reg  [$clog2(WW)-1:0]   w_shamt_reg,
        output reg  [ACCURATE_DW-1:0]  pypass_data,               // Data pypassing register
        output reg  [ACCURATE_DW-1:0]  pypass_weight             // Weight Pypassing register
    
    `endif
    );
    
    wire [(DW+WW)-1:0]  mult_product;                    //Multiplication result 
    reg  [OUTWIDTH-1:0] pe_result;                 // Result register (Accumulation Results)
    wire [OUTWIDTH-1:0] pe_accum ;                 // Result register (Accumulation Results)
    wire signed [DW+WW-1:0] mult;                  // Only used when we have normal TPU because we can keep the signed operation 
    
    /* Transfering data between the PEs logic */ 
    
    //always @(posedge clk or negedge rst_n) begin 
    always @(posedge clk or negedge rst_n) begin 
        if (!rst_n) begin 
            `ifdef DRUM_APTPU
                pypass_data <= 'd0; 
                pypass_weight <= 'd0; 
                w_sign_reg <= 1'b0; 
                i_sign_reg <= 1'b0;
                d_shamt_reg <= 'd0;
                w_shamt_reg <= 'd0;
                
            `elsif BAM
                pypass_pixel <= 'd0; 
                pypass_weight <= 'd0;
            
            `elsif UDM
                pypass_pixel <= 'd0; 
                pypass_weight <= 'd0;
            
            `elsif EIM
                pypass_pixel <= 'd0; 
                pypass_weight <= 'd0;
                
            `elsif NORMAL_TPU
                pypass_pixel <= 'sd0; 
                pypass_weight <= 'sd0;
                
            `elsif ALM
                reg_pixel_log_format <= 'd0;
                reg_pixel_zero_flag <= 1'b0;
                reg_weight_log_format <= 'd0;
                reg_weight_zero_flag <= 1'b0; 

            `elsif MITCHELL
                reg_pixel_k <= 'd0;
                reg_weight_k <= 'd0;
                reg_pixel_x <= 'd0;
                reg_weight_x <= 'd0;
                reg_pixel_zero_flag <= 1'b0;
                reg_weight_zero_flag <= 1'b0;
                        
            `elsif ROBA
                reg_pixel <= 'd0;
                reg_pixek_K <= 'd0;
                reg_weight_K <= 'd0;
                reg_pixel_rounded <= 'd0;          // Coming from the Rounding Unit that rounds operand A 
                reg_weight <= 'd0;
            
            `elsif DRALM
                reg_pixel_LC_OP <= 'd0;
                reg_weight_LC_OP <= 'd0;
                
            
            
            `elsif ASM
                `ifdef HIGH_REG
                    reg_weight <= 'd0;
                    reg_weight_I1 <= 'd0;
                    reg_weight_I3 <= 'd0;
                    reg_weight_I5 <= 'd0;
                    reg_weight_I7 <= 'd0;
                    reg_pixel_SL_in <= 'd0;
                    reg_pixel_SEL_in <= 'd0;
                `else
                    reg_weight <= 'd0;
                    reg_pixel <= 'd0;
                    reg_pixel_SL_in <= 'd0;
                    reg_pixel_SEL_in <= 'd0;
                `endif 
            `else
                pypass_data <= 'd0; 
                pypass_weight <= 'd0; 
                w_sign_reg <= 1'b0; 
                i_sign_reg <= 1'b0;
                d_shamt_reg <= 'd0;
                w_shamt_reg <= 'd0;            
            `endif 
                
        end else begin
            `ifdef DRUM_APTPU 
                pypass_data <= pixel_data;
                pypass_weight <= weight; 
                i_sign_reg <= i_sign;
                w_sign_reg <= w_sign;
                d_shamt_reg <= d_shamt;
                w_shamt_reg <= w_shamt;
                
            `elsif BAM
                pypass_pixel <= pixel;
                pypass_weight <= weight;
            
            `elsif UDM
                pypass_pixel <= pixel;
                pypass_weight <= weight;
            
            `elsif EIM
                pypass_pixel <= pixel;
                pypass_weight <= weight; 
                
            `elsif NORMAL_TPU
                pypass_pixel <= pixel;
                pypass_weight <= weight;
            
            `elsif ALM 
                reg_pixel_log_format <= pixel_log_format;
                reg_pixel_zero_flag <= pixel_zero_flag;
                reg_weight_log_format <= weight_log_format;
                reg_weight_zero_flag <= weight_zero_flag;
            
            `elsif MITCHELL
                reg_pixel_k <= pixel_k;
                reg_weight_k <= weight_k;
                reg_pixel_x <= pixel_x;
                reg_weight_x <= weight_x;
                reg_pixel_zero_flag <= pixel_zero_flag;
                reg_weight_zero_flag <= weight_zero_flag;
                        
            `elsif ROBA
                reg_pixel <= pixel;
                reg_pixek_K <= pixek_K;
                reg_weight_K <= weight_K;
                reg_pixel_rounded <= pixel_rounded;          // Coming from the Rounding Unit that rounds operand A 
                reg_weight <= weight;
            `elsif DRALM
                reg_pixel_LC_OP <= pixel_LC_OP;
                reg_weight_LC_OP <= weight_LC_OP;
            
            `elsif ASM
                `ifdef HIGH_REG
                    reg_weight <= weight;
                    reg_weight_I1 <= weight_I1;
                    reg_weight_I3 <= weight_I3;
                    reg_weight_I5 <= weight_I5;
                    reg_weight_I7 <= weight_I7;
                    reg_pixel_SL_in <= pixel_SL_in;
                    reg_pixel_SEL_in <= pixel_SEL_in;
                `else
                    reg_weight <= weight;
                    reg_pixel <= pixel;
                    reg_pixel_SL_in <= pixel_SL_in;
                    reg_pixel_SEL_in <= pixel_SEL_in;
                `endif 
            `else
                pypass_data <= pixel_data;
                pypass_weight <= weight; 
                i_sign_reg <= i_sign;
                w_sign_reg <= w_sign;
                d_shamt_reg <= d_shamt;
                w_shamt_reg <= w_shamt;            
            `endif 
        end
    end
        
   
    /* MAC processing logic */
    
    `ifdef DRUM_APTPU
        multiplication_unit #(.A_BW(DW),.B_BW(WW),.ACCURATE_DW(ACCURATE_DW)) multiplier (
        .mult_a_in(pixel_data),
        .mult_b_in(weight),
        .w_sign(w_sign),
        .i_sign(i_sign),
        .a_shamt(d_shamt),
        .b_shamt(w_shamt),
        .mult_product(mult_product));
        
    `elsif BAM
        BAM_top #(.DW(DW),.WW(WW),.VBL(VBL)) BAM_multiplier  (.A(pixel),.B(weight),.R(mult_product)) ;
    
    `elsif UDM
        UDM #(.DW(DW),.WW(WW)) UDM_multiplier (.A(pixel),.B(weight),.R(mult_product)) ;
        
    
    `elsif EIM
        EIM #(.DW(DW),.WW(WW)) EIM_multiplier (.A(pixel),.B(weight),.R(mult_product)) ;
    
    `elsif NORMAL_TPU
        assign mult = pixel*weight;             // mult is a signed datatype 
        assign mult_product = mult;
    
    `elsif ALM 
        ALM_Gen_multiplication_unit #(.A_BW(DW),.B_BW(WW),.M(ADDER_PARAM)) ALM_Gen_multiplication_unit (
        .log_concat_format_A(pixel_log_format),
        .A_zero_flag(pixel_zero_flag),
        .log_concat_format_B(weight_log_format),
        .B_zero_flag(weight_zero_flag),
        .mult_product(mult_product));    
    
    `elsif MITCHELL
        mitchell_multiplication_unit #(.A_BW(DW),.B_BW(WW)) mitchell_multiplication_unit (
        .k_1(pixel_k),
        .k_2(weight_k),
        .x_1(pixel_x),
        .x_2(weight_x),
        .A_zero_flag(pixel_zero_flag),
        .B_zero_flag(weight_zero_flag),
        .C(mult_product));
    
    `elsif ROBA
        RoBA_multiplication_unit #(.A_BW(DW),.B_BW(WW),.ROUN_WIDTH(ROUN_WIDTH)) ROBA (
        .A(pixel),
        .K_wireA(pixek_K),
        .K_wireB(weight_K),
        .Ar_wire(pixel_rounded),          // Coming from the Rounding Unit that rounds operand A 
        .B(weight),
        .R(mult_product));
    
    
    `elsif DRALM
        DR_ALM_multiplication_unit #(.A_BW(DW),.B_BW(WW),.MULT_DW(ACCURATE_DW)) DRALM (
        .LC_OP_A_wire(pixel_LC_OP),
        .LC_OP_B_wire(weight_LC_OP),
        .AP(mult_product));
    
    `elsif ASM
        `ifdef HIGH_REG
            ASM_multiplication_unit #(.WIDTH(DW),.NIBBLE_WIDTH(NIBBLE_WIDTH)) ASM_multiplication_unit (
            .A(weight),
            .I1_wire(weight_I1),
            .I3_wire(weight_I3),
            .I5_wire(weight_I5),
            .I7_wire(weight_I7),
            .SL_in(pixel_SL_in), 
            .SEL_in(pixel_SEL_in),
            .R(mult_product));
        
        `else begin
                           // We compute the shifted versions locally insidet the PE 
            wire     [DW+2:0]      I1_wire, I3_wire, I5_wire, I7_wire;
            ASM_B_pre_approximate #(.WIDTH(DW),.NIBBLE_WIDTH(NIBBLE_WIDTH)) pre_compute_unit (
            .B(pixel),
            .I1_wire(I1_wire),
            .I3_wire(I3_wire),
            .I5_wire(I5_wire),
            .I7_wire(I7_wire));
            
            ASM_multiplication_unit #(.WIDTH(WW),.NIBBLE_WIDTH(NIBBLE_WIDTH)) ASM_multiplication_unit (
                .A(weight),
                .I1_wire(I1_wire),
                .I3_wire(I3_wire),
                .I5_wire(I5_wire),
                .I7_wire(I7_wire),
                .SL_in(pixel_SL_in), 
                .SEL_in(pixel_SEL_in),
                .R(mult_product));
            end
        
        `endif 
    `else
        multiplication_unit #(.A_BW(DW),.B_BW(WW),.ACCURATE_DW(ACCURATE_DW)) multiplier (
        .mult_a_in(pixel_data),
        .mult_b_in(weight),
        .w_sign(w_sign),
        .i_sign(i_sign),
        .a_shamt(d_shamt),
        .b_shamt(w_shamt),
        .mult_product(mult_product));
    `endif 
    
    /* Choose your accumulation core */ 
    `ifdef OLD                          //Using the old design of the Approximate Adder
        //approx_adder#(.DW(OUTWIDTH-1),.percentage(4)) adder (.a(mult_product),.b(pe_result),.c(pe_accum));
        approximate_adder_SA #(.DW_a(DW+WW),.DW_b(OUTWIDTH),.percentage(4)) adder  (.a(mult_product),.b(pe_result),.c(pe_accum));
    
    `elsif HERLOA
        herloa_adder #(.ADDER_LENGTH(OUTWIDTH),.IMPRECISE_PART(IMPRECISE_PART)) approximate_adder_SA  (.a(mult_product),.b(pe_result),.sum(pe_accum));

    `elsif OLOCA
        oloca_adder #(.ADDER_LENGTH(OUTWIDTH),.IMPRECISE_PART(IMPRECISE_PART)) oloca_adder  (.a(mult_product),.b(pe_result),.sum(pe_accum));
            
    `elsif SETA
        seta_adder #(.ADDER_LENGTH(OUTWIDTH),.IMPRECISE_PART(IMPRECISE_PART)) seta_adder  (.a(mult_product),.b(pe_result),.sum(pe_accum));
            
    `elsif MHERLOA
        mherloa_adder #(.ADDER_LENGTH(OUTWIDTH),.IMPRECISE_PART(IMPRECISE_PART)) mherloa_adder  (.a(mult_product),.b(pe_result),.sum(pe_accum));
            
    `elsif MHEAA
        mheaa_adder #(.ADDER_LENGTH(OUTWIDTH),.IMPRECISE_PART(IMPRECISE_PART)) mheaa_adder  (.a(mult_product),.b(pe_result),.sum(pe_accum));
            
    `elsif LZTA
        lzta_adder #(.ADDER_LENGTH(OUTWIDTH),.IMPRECISE_PART(IMPRECISE_PART)) lzta_adder  (.a(mult_product),.b(pe_result),.sum(pe_accum));

    `elsif LOAWA
        loawa_adder #(.ADDER_LENGTH(OUTWIDTH),.IMPRECISE_PART(IMPRECISE_PART)) loawa_adder  (.a(mult_product),.b(pe_result),.sum(pe_accum));
            
    `elsif LOA
        loa_adder #(.ADDER_LENGTH(OUTWIDTH),.IMPRECISE_PART(IMPRECISE_PART)) loa_adder  (.a(mult_product),.b(pe_result),.sum(pe_accum));

    `elsif LDCA
        ldca_adder #(.ADDER_LENGTH(OUTWIDTH),.IMPRECISE_PART(IMPRECISE_PART)) ldca_adder  (.a(mult_product),.b(pe_result),.sum(pe_accum));
            
    `elsif HOERAA
        hoeraa_adder #(.ADDER_LENGTH(OUTWIDTH),.IMPRECISE_PART(IMPRECISE_PART)) hoeraa_adder  (.a(mult_product),.b(pe_result),.sum(pe_accum));
                    
    `elsif HOAANED
        hoaaned_adder #(.ADDER_LENGTH(OUTWIDTH),.IMPRECISE_PART(IMPRECISE_PART)) hoaaned_adder  (.a(mult_product),.b(pe_result),.sum(pe_accum));
             
    `elsif HEAA
        heaa_adder #(.ADDER_LENGTH(OUTWIDTH),.IMPRECISE_PART(IMPRECISE_PART)) heaa_adder  (.a(mult_product),.b(pe_result),.sum(pe_accum));
                   
    `elsif APPROX5
        approx5_adder #(.ADDER_LENGTH(OUTWIDTH),.IMPRECISE_PART(IMPRECISE_PART)) approx5_adder  (.a(mult_product),.b(pe_result),.sum(pe_accum));
     
    `elsif SA_ADDER                             //Using the Approximate Adder that has been designed specifically for Systolic Array
        approximate_adder_SA#(.DW_a(DW+WW),.DW_b(OUTWIDTH),.percentage(4)) adder  (.a(mult_product),.b(pe_result),.c(pe_accum));
    
    `elsif ACCURATE_ACCUMULATE                                          //Using the accurate adder here (No Approximation!) 
        assign pe_accum = mult_product + pe_result;
     `endif
     /*///////////////////////////////////////////////////////////////////////////////*/ 
    
    // Registering the results of the adder (To create an accumulator)
    always @(posedge clk or negedge rst_n) begin 
        if(!rst_n) begin 
            pe_result <= 'd0; 
        end else if (clear) begin 
            pe_result <= 'd0;
        end else begin
            pe_result <= pe_accum;
        end  
    end
            
    assign acc_result = pe_result;
    
    
endmodule

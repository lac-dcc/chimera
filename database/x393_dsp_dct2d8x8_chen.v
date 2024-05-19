// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>dct2d8x8_chen
 * @file dct2d8x8_chen.v
 * @date 2016-06-10  
 * @author  Andrey Filippov
 *     
 * @brief 2-d DCT implementation of Chen algorithm
 *
 * @copyright Copyright (c) 2016 Elphel, Inc.
 *
 * <b>License:</b>
 *
 *dct2d8x8_chen.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  dct2d8x8_chen.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */
`timescale 1ns/1ps

module  dct2d8x8_chen#(
    parameter INPUT_WIDTH =     10,
    parameter OUTPUT_WIDTH =    13,
    parameter STAGE1_SAFE_BITS = 3, // leave this number of extra bits on DCT1D input to prevent output saturation
    parameter STAGE2_SAFE_BITS = 3, // leave this number of extra bits on DCT1D input to prevent output saturation
    parameter TRANSPOSE_WIDTH = 16, // transpose memory width
    parameter TRIM_STAGE_1 =     1, // Trim these MSBs from the stage1 results (1 - matches old DCT)
    parameter TRIM_STAGE_2 =     0, // Trim these MSBs from the stage2 results
    parameter DSP_WIDTH =       24,
//    parameter DSP_OUT_WIDTH =   24,
    parameter DSP_B_WIDTH =     18,
    parameter DSP_A_WIDTH =     25,
    parameter DSP_P_WIDTH =     48
//    parameter DSP_M_WIDTH =     43  // actual multiplier width (== (A_WIDTH +B_WIDTH)
    ) (
    input                            clk,           /// system clock, posedge
    input                            rst,           // sync reset
//    input                            en,            //! if zero will reset transpose memory page njumbers
    input                            start,         //@ single-cycle start pulse that goes with the first pixel data. Other 63 should follow
    input signed   [INPUT_WIDTH-1:0] xin,           //! [9:0] - input data
    output reg                       last_in,       //! output high during input of the last of 64 pixels in a 8x8 block
    output                           pre_first_out, //! 1 cycle ahead of the first output in a 64 block
    output                           dv,            //! data output valid. WAS: Will go high on the 94-th cycle after the start
    output signed [OUTPUT_WIDTH-1:0] d_out);        //! [12:0]output data

    localparam REPLICATE_IN_STAGE1 = STAGE1_SAFE_BITS;
    localparam PAD_IN_STAGE1 =       DSP_WIDTH - INPUT_WIDTH - STAGE1_SAFE_BITS ;

    localparam REPLICATE_IN_STAGE2 = STAGE2_SAFE_BITS;
    localparam PAD_IN_STAGE2 =       DSP_WIDTH - TRANSPOSE_WIDTH - STAGE2_SAFE_BITS ;
    localparam ROUND_STAGE1 =        DSP_WIDTH - TRANSPOSE_WIDTH - TRIM_STAGE_1;  
    localparam ROUND_STAGE2 =        DSP_WIDTH - OUTPUT_WIDTH -    TRIM_STAGE_2;  
    
    
    reg signed      [INPUT_WIDTH-1:0] xin_r;
    reg                               start_in_r;
    reg                         [5:0] cntr_in = ~0;
    reg                               en_in_r;
    
    wire signed     [INPUT_WIDTH-1:0] dct1in_h;                  
    wire signed     [INPUT_WIDTH-1:0] dct1in_l;
    wire                              dct1_start;                  
    wire                              dct1_en;
    
    wire signed       [DSP_WIDTH-1:0] dct1in_pad_h;                  
    wire signed       [DSP_WIDTH-1:0] dct1in_pad_l;
    wire signed [TRANSPOSE_WIDTH-1:0] dct1_out;
    wire                              stage1_pre2_start_out; 
//    wire                              stage1_pre2_en_out; 
    
    wire signed [TRANSPOSE_WIDTH-1:0] transpose_din;
    wire signed [TRANSPOSE_WIDTH-1:0] transpose_douth;
    wire signed [TRANSPOSE_WIDTH-1:0] transpose_doutl;
    wire                              transpose_start_out; 
    wire                              transpose_en_out; 
    
    wire signed       [DSP_WIDTH-1:0] dct2in_pad_h;                  
    wire signed       [DSP_WIDTH-1:0] dct2in_pad_l;
    wire signed    [OUTPUT_WIDTH-1:0] dct2_out;
    wire                              stage2_pre2_start_out; 
    wire                              stage2_pre2_en_out; 
    
//    wire signed    [OUTPUT_WIDTH-1:0] dct2_trimmed;
                      
    assign dct1in_pad_h = {{REPLICATE_IN_STAGE1{dct1in_h[INPUT_WIDTH-1]}}, dct1in_h, {PAD_IN_STAGE1{1'b0}}};                  
    assign dct1in_pad_l = {{REPLICATE_IN_STAGE1{dct1in_l[INPUT_WIDTH-1]}}, dct1in_l, {PAD_IN_STAGE1{1'b0}}};                  
    assign transpose_din = dct1_out;
    
    /*
    generate
        if (TRIM_STAGE_1 == 0) begin
            assign transpose_din = dct1_out[DSP_OUT_WIDTH-1 -:TRANSPOSE_WIDTH];
        end else begin //! saturate. TODO: Maybe (and also symmetric rounding) can be done in DSP itself using masks?
            assign transpose_din = (dct1_out[DSP_OUT_WIDTH-1 -: TRIM_STAGE_1] == {TRIM_STAGE_1{dct1_out[DSP_OUT_WIDTH-1]}})?
                                   dct1_out[DSP_OUT_WIDTH-1-TRIM_STAGE_1 -: TRANSPOSE_WIDTH]:
                                   {dct1_out[DSP_OUT_WIDTH-1], {TRANSPOSE_WIDTH-1{~dct1_out[DSP_OUT_WIDTH-1]}}};
        end                   
    endgenerate                       
    */
    
    assign dct2in_pad_h = {{REPLICATE_IN_STAGE2{transpose_douth[TRANSPOSE_WIDTH-1]}}, transpose_douth, {PAD_IN_STAGE2{1'b0}}};                  
    assign dct2in_pad_l = {{REPLICATE_IN_STAGE2{transpose_doutl[TRANSPOSE_WIDTH-1]}}, transpose_doutl, {PAD_IN_STAGE2{1'b0}}};                  
    
//    assign dct2_trimmed = dct2_out;
    /*
    generate
        if (TRIM_STAGE_2 == 0) begin
            assign dct2_trimmed = dct2_out[DSP_OUT_WIDTH-1 -: OUTPUT_WIDTH];
        end else begin //! saturate. Maybe (and also symmetric rounding) can be done in DSP itself using masks?
            assign dct2_trimmed = (dct2_out[DSP_OUT_WIDTH-1 -: TRIM_STAGE_2] == {TRIM_STAGE_2{dct2_out[DSP_OUT_WIDTH-1]}})?
                                  dct2_out[DSP_OUT_WIDTH-1-TRIM_STAGE_2 -:OUTPUT_WIDTH]:
                                  {dct2_out[DSP_OUT_WIDTH-1], {OUTPUT_WIDTH-1{~dct2_out[DSP_OUT_WIDTH-1]}}};
        end
    endgenerate
    */

    always @(posedge clk) begin
        start_in_r <= start;
        
        if      (rst)         cntr_in <= ~0;
        else if (start)       cntr_in <= 0;
        else if (!(&cntr_in)) cntr_in <= cntr_in + 1;
        
        last_in <= (cntr_in == 61);
        
        if      (rst)      en_in_r <= 0;
        else if (start)    en_in_r <= 1;
        else if (&cntr_in) en_in_r <= 0;
        
        if (start || en_in_r) xin_r <=xin; 
    
    end

    dct1d_chen_reorder_in #(
        .WIDTH(INPUT_WIDTH)
    ) dct1d_chen_reorder_in_i (
        .clk              (clk),                 // input
        .rst              (rst),                 // input
        .en               (en_in_r),             // input
        .din              (xin_r),               // input[23:0] 
        .start            (start_in_r),          // input
        .dout_10_32_76_54 ({dct1in_h,dct1in_l}), // output[47:0] 
        .start_out        (dct1_start),          // output reg 
        .en_out           (dct1_en)              // output
    );
    wire dbg_stage1_pre2_en_out;
    dct1d_chen #(
        .WIDTH           (DSP_WIDTH),
        .OUT_WIDTH       (TRANSPOSE_WIDTH), // DSP_OUT_WIDTH),
        .B_WIDTH         (DSP_B_WIDTH),
        .A_WIDTH         (DSP_A_WIDTH),
        .P_WIDTH         (DSP_P_WIDTH),
        .ROUND_OUT       (ROUND_STAGE1) // cut these number of LSBs on the output, round result (in addition to COSINE_SHIFT) 
    ) dct1d_chen_stage1_i (
        .clk             (clk),                         // input
        .rst             (rst),                         // input
        .en              (dct1_en),                     // input
        .d10_32_76_54    ({dct1in_pad_h,dct1in_pad_l}), // input[47:0] 
        .start           (dct1_start),                  // input
        .dout            (dct1_out),                    // output[23:0] 
        .pre2_start_out  (stage1_pre2_start_out),       // output reg 
        .en_out          (dbg_stage1_pre2_en_out)       // output reg 
    );

    dct_chen_transpose #(
        .WIDTH(TRANSPOSE_WIDTH)
    ) dct_chen_transpose_i (
        .clk              (clk),                               // input
        .rst              (rst),                               // input
        .din              (transpose_din),                     // input[23:0] 
        .pre2_start       (stage1_pre2_start_out),             // input
        .dout_10_32_76_54 ({transpose_douth,transpose_doutl}), // output[47:0] 
        .start_out        (transpose_start_out),               // output reg 
        .en_out           (transpose_en_out)                   // output reg 
    );

    dct1d_chen #(
        .WIDTH           (DSP_WIDTH),
        .OUT_WIDTH       (OUTPUT_WIDTH),
        .B_WIDTH         (DSP_B_WIDTH),
        .A_WIDTH         (DSP_A_WIDTH),
        .P_WIDTH         (DSP_P_WIDTH),
        .ROUND_OUT       (ROUND_STAGE2) // cut these number of LSBs on the output, round result (in addition to COSINE_SHIFT) 
    ) dct1d_chen_stage2_i (
        .clk             (clk),                         // input
        .rst             (rst),                         // input
        .en              (transpose_en_out),            // input
        .d10_32_76_54    ({dct2in_pad_h,dct2in_pad_l}), // input[47:0] 
        .start           (transpose_start_out),         // input
        .dout            (dct2_out),                    // output[23:0] 
        .pre2_start_out  (stage2_pre2_start_out),       // output reg 
        .en_out          (stage2_pre2_en_out)           // output reg 
    );

    dct1d_chen_reorder_out #(
        .WIDTH       (OUTPUT_WIDTH)
    ) dct1d_chen_reorder_out_i (
        .clk         (clk),                   // input
        .rst         (rst),                   // input
        .en          (stage2_pre2_en_out),    // input
        .din         (dct2_out),              // input[23:0] 
        .pre2_start  (stage2_pre2_start_out), // input
        .dout        (d_out),                 // output[23:0] 
        .start_out   (pre_first_out),         // output reg 
        .dv          (dv),                    // output reg 
        .en_out      ()                       // output reg 
    );

// Just for debugging/comparing with old 1-d DCT:
`ifdef SIMULATION // no sense to synthesize it
    `ifdef DEBUG_DCT1D
        wire [TRANSPOSE_WIDTH-1:0] dbg_d_out;
    //wire        [15:0]   dbg_d_out13=dbg_d_out[7 +: 16] ;
        wire                 dbg_dv;
        wire                 dbg_en_out;
        wire                 dbg_pre_first_out;
        dct1d_chen_reorder_out #(
            .WIDTH       (TRANSPOSE_WIDTH)
        ) dct1d_chen_reorder_out_dbg_i (
            .clk         (clk),                    // input
            .rst         (rst),                    // input
            .en          (dbg_stage1_pre2_en_out), // input
            .din         (dct1_out),               // input[23:0] 
            .pre2_start  (stage1_pre2_start_out),  // input
            .dout        (dbg_d_out),              // output[23:0] 
            .start_out   (dbg_pre_first_out),      // output reg 
            .dv          (dbg_dv),                 // output reg 
            .en_out      (dbg_en_out)              // output reg 
        );
    `endif
`endif    
endmodule


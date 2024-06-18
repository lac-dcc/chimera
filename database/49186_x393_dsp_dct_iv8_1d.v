// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>dct_iv8_1d
 * @file dct_iv8_1d.v
 * @date 2016-12-02  
 * @author  Andrey Filippov
 *     
 * @brief 1d 8-point DCT type IV for lapped mdct 16->8, operates in 16 clock cycles
 * Uses 2 DSP blocks 
 *
 * @copyright Copyright (c) 2016 Elphel, Inc.
 *
 * <b>License:</b>
 *
 *dct_iv8_1d.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  dct_iv8_1d.v is distributed in the hope that it will be useful,
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
// No saturation here, and no rounding as we do not need to match decoder (be bit-precise), skipping rounding adder
// will reduce needed resources

module  dct_iv8_1d#(
    parameter WIDTH =        24, // input data width
    parameter OUT_WIDTH =    24, // 16, // output deata width
    parameter OUT_RSHIFT =   3,  // overall right shift of the result from input, aligned by MSB (>=3 will never cause saturation)
    parameter B_WIDTH =      18,
    parameter A_WIDTH =      25,
    parameter P_WIDTH =      48,
    parameter COSINE_SHIFT=  17,
    parameter COS_01_32 =    130441, // int(round((1<<17) * cos( 1*pi/32)))
    parameter COS_03_32 =    125428, // int(round((1<<17) * cos( 3*pi/32)))
    parameter COS_04_32 =    121095, // int(round((1<<17) * cos( 4*pi/32)))
    parameter COS_05_32 =    115595, // int(round((1<<17) * cos( 5*pi/32)))
    parameter COS_07_32 =    101320, // int(round((1<<17) * cos( 7*pi/32)))
    parameter COS_08_32 =    92682,  // int(round((1<<17) * cos( 8*pi/32)))
    parameter COS_09_32 =    83151,  // int(round((1<<17) * cos( 9*pi/32)))
    parameter COS_11_32 =    61787,  // int(round((1<<17) * cos(11*pi/32)))
    parameter COS_12_32 =    50159,  // int(round((1<<17) * cos(12*pi/32)))
    parameter COS_13_32 =    38048,  // int(round((1<<17) * cos(13*pi/32)))
    parameter COS_15_32 =    12847   // int(round((1<<17) * cos(15*pi/32)))


)(
    input                          clk,
    input                          rst,
    input                          en,
    input  [WIDTH -1:0]            d_in,  // X2-X7-X3-X4-X5-X6-X0-X1-*-X3-X5-X4-*-X6-X7-*
    input                          start, // one cycle before first X6 input 
    output [OUT_WIDTH -1:0]        dout,
    output reg                     pre2_start_out, // 2 clock cycle before Y0 output, full dout sequence
                                             // start_out-x-Y0-x-Y7-x-Y4-x-Y3-x-Y1-x-Y6-x-Y2-x-Y5
    output                         en_out,   // valid at the same time slot as pre2_start_out (goes active with pre2_start_out), 2 ahead of data
    output reg               [2:0] y_index   // for simulation - valid with dout - index of the data output
                                          
);

    localparam RSHIFT1 = 2; // safe right shift for stage 1
    localparam STAGE1_RSHIFT = COSINE_SHIFT + (WIDTH - A_WIDTH) + RSHIFT1; // divide by 4 in stage 1 - never saturates
    localparam STAGE2_RSHIFT = COSINE_SHIFT + (A_WIDTH - OUT_WIDTH) +(OUT_RSHIFT-RSHIFT1); // divide by 4 in stage 1 - never saturates
    // STAGE2_RSHIFT should be >0 ( >=1 ) for rounding    
    
// register files on the D-inputs of DSPs
    reg    signed [A_WIDTH-1:0] dsp_din_1_ram[0:1] ; // just two registers
    reg    signed [A_WIDTH-1:0] dsp_din_2_ram[0:3] ; // 4 registers registers

    reg                         dsp_din_1_wa;
    reg                         dsp_din_1_ra;
    reg                         dsp_din_1_we;
    reg                         dsp_din_2_we;
    reg                   [1:0] dsp_din_2_wa;
    reg                   [1:0] dsp_din_2_ra;
    
    reg    signed [B_WIDTH-1:0] dsp_bin;
    reg                         dsp_ceb1_1;     // load b1 register
    reg                         dsp_ceb2_1;     // load b2 register
    reg                         dsp_selb_1;     // 0 - select b1, 1 - select b2
    wire   signed [A_WIDTH-1:0] dsp_ain_1;
    reg                         dsp_cea1_1;
    reg                         dsp_cea2_1;
    wire   signed [A_WIDTH-1:0] dsp_din_1;
    reg                         dsp_ced_1;
    reg                         dsp_sela_1;
//  reg                         dsp_en_a_1;      // Not used here 0: +/- D, 1: A or A +/- D 
//  reg                         dsp_en_d_1;      // Not used here 0: A, 1: D  or A +/- D 
    reg                         dsp_sub_a_1;     //
    reg                         dsp_neg_m_1;     // 1 - negate multiplier result
    reg                         dsp_accum_1;     // 0 - use multiplier result, 1 add to accumulator
    wire   signed [P_WIDTH-1:0] dsp_cin_1;
    reg                         dsp_cec_1;
    reg                         dsp_post_add_1;  // 0 - use multiplier or add to accumulator, 1 - add C and multiplier
    wire   signed [P_WIDTH-1:0] dsp_p_1;

    reg                         dsp_ceb1_2;     // load b1 register
    reg                         dsp_ceb2_2;     // load b2 register
    reg                         dsp_selb_2;     // 0 - select b1, 1 - select b2
    wire   signed [A_WIDTH-1:0] dsp_ain_2;
    reg                         dsp_cea1_2;
    reg                         dsp_cea2_2;
    wire   signed [A_WIDTH-1:0] dsp_din_2;
    reg                         dsp_sela_2;     // 0 - select a1, 1 - select a2
    reg                         dsp_sub_a_2;     //
    reg                         dsp_neg_m_2;    // 1 - negate multiplier result
    reg                         dsp_accum_2;    // 0 - use multiplier result, 1 add to accumulator
    wire   signed [P_WIDTH-1:0] dsp_p_2;

    reg                   [3:0] phase_cnt;

    
    reg                         run_in;  // receiving input data
    reg                         restart; // restarting next block if en was active at phase=14;
    reg                         run_out; // running output data
    reg                         en_out_r;
    reg                         en_out_r2;
    
    
    assign en_out = en_out_r;
    
    assign dsp_ain_2 = dsp_p_1 [STAGE1_RSHIFT +: A_WIDTH];
    
    assign dout = dsp_p_2 [STAGE2_RSHIFT +: OUT_WIDTH]; // dout_r;

    generate
        if (A_WIDTH > WIDTH)  assign dsp_ain_1 = {{A_WIDTH-WIDTH{d_in[WIDTH-1]}},d_in};   
        else                  assign dsp_ain_1 = d_in; // SuppressThisWarning VEditor (not implemented)  
    endgenerate                       
//    assign dsp_cin_1 = {{P_WIDTH-WIDTH{d_in[WIDTH-1]}},d_in};

// symmetrically lshift by COSINE_SHIFT (match multiplication by 1.0), add 0.5LSB for positive, subtract 0.5LSB for negative
    wire din_zero = ~(|d_in);
    assign dsp_cin_1 = {{P_WIDTH-WIDTH-COSINE_SHIFT{d_in[WIDTH-1]}},d_in,~d_in[WIDTH-1]^din_zero,{COSINE_SHIFT-1{d_in[WIDTH-1]}}};

    always @ (posedge clk) begin
        en_out_r2 <= en_out_r;
        if (en_out_r2) begin
            case (phase_cnt[3:1])
                3'h0: y_index <= 0;
                3'h1: y_index <= 7;
                3'h2: y_index <= 4;
                3'h3: y_index <= 3;
                3'h4: y_index <= 1;
                3'h5: y_index <= 6;
                3'h6: y_index <= 2;
                3'h7: y_index <= 5;
            endcase
        end else begin
            y_index <= 'bx;
        end 
    end

    //register files
    assign dsp_din_1 = dsp_din_1_ram[dsp_din_1_ra];
    assign dsp_din_2 = dsp_din_2_ram[dsp_din_2_ra];

    always @ (posedge clk) begin
        if (dsp_din_1_we) dsp_din_1_ram[dsp_din_1_wa] <= dsp_ain_1;
        if (dsp_din_2_we) dsp_din_2_ram[dsp_din_2_wa] <= dsp_ain_2;
    end

    always @ (posedge clk) begin
        if (rst)  restart <= 0;
        else      restart <= (phase_cnt == 14) && en;
    
        if      (rst)              run_in <= 0;
        else if (start || restart) run_in <= 1;
        else if (phase_cnt==15)    run_in <= 0;

        if      (rst)              run_out <= 0;
        else if (phase_cnt == 13)  run_out <= run_in;

        if (rst || (!run_in && !run_out)) phase_cnt <= 0;
        else                              phase_cnt <= phase_cnt + 1;
    
        pre2_start_out <= run_out && (phase_cnt == 14);
        
        en_out_r <= run_out && !phase_cnt[0];
        
        // Cosine table, defined to fit into 17 bits for 18-bit signed DSP B-operand
        case (phase_cnt)
            4'h0: dsp_bin <= COS_09_32;
            4'h1: dsp_bin <= COS_04_32;
            4'h2: dsp_bin <= COS_08_32;
            4'h3: dsp_bin <= COS_03_32;
            4'h4: dsp_bin <= COS_13_32;
            4'h5: dsp_bin <= COS_12_32;
            4'h6: dsp_bin <= 'bx;
            4'h7: dsp_bin <= COS_05_32;
            4'h8: dsp_bin <= COS_11_32;
            4'h9: dsp_bin <= 'bx;
            4'ha: dsp_bin <= COS_08_32;
            4'hb: dsp_bin <= COS_15_32;
            4'hc: dsp_bin <= COS_01_32;
            4'hd: dsp_bin <= COS_12_32;
            4'he: dsp_bin <= 'bx;
            4'hf: dsp_bin <= COS_07_32;
        endcase
    end

    // Control signals for each phase
    wire p00 = (phase_cnt[3:0] ==  0) && (run_in || run_out);
    wire p01 = phase_cnt[3:0] ==  1;
    wire p02 = phase_cnt[3:0] ==  2;
    wire p03 = phase_cnt[3:0] ==  3;
    wire p04 = phase_cnt[3:0] ==  4;
    wire p05 = phase_cnt[3:0] ==  5;
    wire p06 = phase_cnt[3:0] ==  6;
    wire p07 = phase_cnt[3:0] ==  7;
    wire p08 = phase_cnt[3:0] ==  8;
    wire p09 = phase_cnt[3:0] ==  9;
    wire p10 = phase_cnt[3:0] == 10;
    wire p11 = phase_cnt[3:0] == 11;
    wire p12 = phase_cnt[3:0] == 12;
    wire p13 = phase_cnt[3:0] == 13;
    wire p14 = phase_cnt[3:0] == 14;
    wire p15 = phase_cnt[3:0] == 15;
    always @ (posedge clk) begin
    //                   p00 | p01 | p02 | p03 | p04 | p05 | p06 | p07 | p08 | p09 | p10 | p11 | p12 | p13 | p14 | p15 ;
        dsp_din_1_we <=          p01       | p03                         | p08 | p09                               | p15 | start;
        dsp_din_1_wa <=                                                                                              p15 | start;
        dsp_din_1_ra <=                                        p06                                           | p14       ;
        dsp_cea1_1 <=                                          p06                                                       ;
        dsp_cea2_1 <=                  p02       | p04                               | p10       | p12                   ;
        dsp_ced_1 <=       p00       | p02             | p05 | p06       | p08 | p09                   | p13 | p14       ;
        dsp_sela_1 <=      p00 | p01 | p02 | p03 | p04 | p05             | p08       | p10 | p11       | p13             ;
        dsp_sub_a_1 <=     p00 | p01 | p02       | p04 | p05 | p06                         | p11                   | p15 ;
        dsp_ceb1_1 <=            p01                                                                                     ;
        dsp_ceb2_1 <=                  p02             | p05                         | p10             | p13             ;
        dsp_selb_1 <=            p01 | p02 | p03 | p04             | p07       | p09 | p10 | p11 | p12             | p15 ;
        dsp_cec_1 <=       p00                         | p05                                           | p13             ;
        dsp_neg_m_1 <=     p00 | p01 | p02                               | p08             | p11 | p12 | p13             ;
        dsp_accum_1 <=     p00       | p02                               | p08       | p10                               ;
        dsp_post_add_1 <=                          p04 | p05                                     | p12 | p13             ;
        dsp_din_2_we <=                                      | p06 | p07                                     | p14 | p15 ;
        dsp_din_2_wa[0] <=                                     p06                                                 | p15 ;
        dsp_din_2_wa[1] <=                                                                                     p14 | p15 ;
        dsp_din_2_ra[0] <=       p01             | p04       | p06       | p08       | p10 | p11       | p13       | p15 ;
        dsp_din_2_ra[1] <=                   p03 | p04 | p05 | p06 | p07 | p08 | p09 | p10                               ;
        dsp_cea1_2 <=                  p02                                           | p10                               ;
        dsp_cea2_2 <=                              p04                                           | p12                   ;
        dsp_sela_2 <=      p00       | p02       | p04       | p06       | p08       | p10       | p12       | p14       ; //~phase[0]
        dsp_sub_a_2 <=     p00 | p01 | p02 | p03 | p04 | p05 | p06                                                 | p15 ;
        dsp_ceb1_2 <=      p00             | p03                         | p08             | p11                         ;
        dsp_ceb2_2 <=                              p04             | p07                         | p12             | p15 ;
        dsp_selb_2 <=      p00             | p03       | p05 | p06       | p08             | p11       | p13 | p14       ;
        dsp_neg_m_2 <=                       p03             | p06                               | p12             | p15 ; //~phase[0]
        dsp_accum_2 <=     p00       | p02       | p04       | p06       | p08       | p10       | p12       | p14       ;
    end
    

    dsp_ma_preadd_c #(
        .B_WIDTH     (B_WIDTH),
        .A_WIDTH     (A_WIDTH),
        .P_WIDTH     (P_WIDTH)
    ) dsp_ma_preadd_c_1_i (
        .clk         (clk),            // input
        .rst         (rst),            // input
        .bin         (dsp_bin),        // input[17:0] signed 
        .ceb1        (dsp_ceb1_1),     // input
        .ceb2        (dsp_ceb2_1),     // input
        .selb        (dsp_selb_1),     // input
        .ain         (dsp_ain_1),      // input[24:0] signed 
        .cea1        (dsp_cea1_1),     // input
        .cea2        (dsp_cea2_1),     // input
        .din         (dsp_din_1),      // input[24:0] signed 
        .ced         (dsp_ced_1),      // input
        .cin         (dsp_cin_1),      // input[47:0] signed 
        .cec         (dsp_cec_1),      // input
        .cead        (1'b1),           // input
        .sela        (dsp_sela_1),     // input
        .en_a        (1'b1),           // input
        .en_d        (1'b1),           // input
        .sub_a       (dsp_sub_a_1),    // input
        .neg_m       (dsp_neg_m_1),    // input
        .accum       (dsp_accum_1),    // input
        .post_add    (dsp_post_add_1), // input
        .pout        (dsp_p_1)         // output[47:0] signed 
    );
    dsp_ma_preadd_c #(
        .B_WIDTH     (B_WIDTH),
        .A_WIDTH     (A_WIDTH),
        .P_WIDTH     (P_WIDTH)
    ) dsp_ma_preadd_c_2_i (
        .clk         (clk),            // input
        .rst         (rst),            // input
        .bin         (dsp_bin),        // input[17:0] signed 
        .ceb1        (dsp_ceb1_2),     // input
        .ceb2        (dsp_ceb2_2),     // input
        .selb        (dsp_selb_2),     // input
        .ain         (dsp_ain_2),      // input[24:0] signed 
        .cea1        (dsp_cea1_2),     // input
        .cea2        (dsp_cea2_2),     // input
        .din         (dsp_din_2),      // input[24:0] signed 
        .ced         (1'b1),           // input
        .cin         ({P_WIDTH{1'b1}}),// input[47:0] signed 
        .cec         (1'b0),           // input
        .cead        (1'b1),           // input
        .sela        (dsp_sela_2),     // input
        .en_a        (1'b1),           // input
        .en_d        (1'b1),           // input
        .sub_a       (dsp_sub_a_2),    // input
        .neg_m       (dsp_neg_m_2),    // input
        .accum       (dsp_accum_2),    // input
        .post_add    (1'b0),           // input
        .pout        (dsp_p_2)         // output[47:0] signed 
    );
endmodule

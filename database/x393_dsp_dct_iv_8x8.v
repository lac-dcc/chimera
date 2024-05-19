// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>dct_iv_8x8
 * @file dct_iv_8x8.v
 * @date 2016-12-08  
 * @author  Andrey Filippov
 *     
 * @brief 2-d DCT-IV implementation, 1 clock/data word. Input in scanline order, output - transposed
 *
 * @copyright Copyright (c) 2016 Elphel, Inc.
 *
 * <b>License:</b>
 *
 *dct_iv_8x8.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  dct_iv_8x8.v is distributed in the hope that it will be useful,
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

module  dct_iv_8x8#(
    parameter INPUT_WIDTH =     25,
    parameter OUT_WIDTH =       25,
    parameter OUT_RSHIFT1 =      1,  // overall right shift of the result from input, aligned by MSB for pass1 (>=3 will never cause saturation)
    parameter OUT_RSHIFT2 =      1, //  if sum OUT_RSHIFT1+OUT_RSHIFT2 == 2, direct*reverse == ident (may use 3, -1) or 3,0 with wider output and saturate
    parameter TRANSPOSE_WIDTH = 25, // transpose memory width
    parameter DSP_B_WIDTH =     18,
    parameter DSP_A_WIDTH =     25,
    parameter DSP_P_WIDTH =     48,
    parameter COSINE_SHIFT=     17,
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
    ) (
    input                            clk,           //!< system clock, posedge
    input                            rst,           //!< sync reset
    input                            start,         //!< single-cycle start pulse that goes with the first pixel data.
                                                    // Next data should be sent in bursts of 8, pause of 8 - total 128 cycles
    input  signed  [INPUT_WIDTH-1:0] xin,           //!< input data
    output                           pre_last_in,   //!< output high during input of the pre-last of 64 pixels in a 8x8 block (next can be start
    output reg                       pre_first_out, //!< 1 cycle ahead of the first output in a 64 block
    output reg                       dv,            //!< data output valid. WAS: Will go high on the 94-th cycle after the start
    output signed    [OUT_WIDTH-1:0] d_out,         //!< output data
    output reg                       pre_busy);     //!< start should come each 64-th cycle (next after pre_last_in), and not after pre_busy) 

// 1. Two 16xINPUT_WIDTH memories to feed two of the 'horizontal' 1-dct - they should provide outputs shifted by 1 clock
// 2. of the horizontal DCTs
// 3. common transpose memory plus 2 input reorder memory for each of the vertical DCT
// 4. 2 of the vertical DCTs
// 5. small memory to combine/reorder outputs (2 stages as 1 x16 memory is not enough)
// TODO make a version that uses common transpose memory (twice width) and simultaneously calculates dst-iv (invert time sequence, alternate sign)
// That can be used for lateral chromatic aberration (shift in time domain). Reverse transform does not need it - will always be just dct-iv

    reg                               x_run;
    reg                        [5:0]  x_wa;
    wire                              dcth_phin_start = x_run && (x_wa[5:0] == 6); 
    reg                               dcth_phin_run;
    reg                               dcth_en0;
    reg                               dcth_en1;
    reg                        [6:0]  dcth_phin;
    reg                        [2:0]  x_ra0;
    reg                        [2:0]  x_ra1;
    reg signed      [INPUT_WIDTH-1:0] x_ram0[0:7];
    reg signed      [INPUT_WIDTH-1:0] x_ram1[0:7];
    reg signed      [INPUT_WIDTH-1:0] dcth_xin0;
    reg signed      [INPUT_WIDTH-1:0] dcth_xin1;

    wire signed [TRANSPOSE_WIDTH-1:0] dcth_dout0; 
    wire signed [TRANSPOSE_WIDTH-1:0] dcth_dout1; 
//    wire                              dcth_pre2_start_out0; 
//    wire                              dcth_pre2_start_out1; 
    wire                              dcth_en_out0; 
    wire                              dcth_en_out1; 
    
    wire                              dcth_start_0_w =  dcth_phin_run && (dcth_phin [6:0] ==0);
    wire                              dcth_start_1_w =  dcth_phin_run && (dcth_phin [6:0] ==9);
    
    reg                               dcth_start_0_r;
    reg                               dcth_start_1_r;
    
    reg                         [1:0] transpose_w_page;
    reg                         [6:0] transpose_cntr; // transpose memory counter, [6] == 1 when the last page is being finished
    reg                               transpose_in_run; 
//    wire                              transpose_start = dcth_phin_run && (dcth_phin [6:0] == 7'h10);
    wire                              transpose_start = dcth_phin_run && (dcth_phin [6:0] == 7'h11);
//    wire                              transpose_start = dcth_phin_run && (dcth_phin [6:0] == 7'h12);
    reg                         [2:0] transpose_wa_low; // [2:0] transpose memory low address bits, [3] - other group (of 16)
    reg                         [4:0] transpose_wa_high; // high bits of transpose memory write address
    wire                        [7:0] transpose_wa = {transpose_wa_high,transpose_wa_low};
    wire                              transpose_wa_decr = (transpose_cntr[0] & ~transpose_cntr[3]);
    reg                         [1:0] transpose_we; // [1]
    wire        [TRANSPOSE_WIDTH-1:0] transpose_di = transpose_cntr[0]? dcth_dout0: dcth_dout1;
    
    reg         [TRANSPOSE_WIDTH-1:0] transpose_ram[0:255];
    wire                        [2:0] dcth_yindex0;
    wire                        [2:0] dcth_yindex1;
    wire                        [7:0] transpose_debug_di= {transpose_wa_high, transpose_cntr[0]? dcth_yindex0: dcth_yindex1};   
    reg                         [7:0] transpose_debug_ram[0:255];   

    reg                         [6:0] transpose_rcntr; // transpose read memory counter, [6] == 1 when the last page is being finished
    reg                         [2:0] transpose_out_run; 
    wire                              transpose_out_start = transpose_in_run && (transpose_cntr[6:0] == 7'h34); // 7'h33 is actual minimum
    reg                         [1:0] transpose_r_page;

    reg signed  [TRANSPOSE_WIDTH-1:0] transpose_reg; // internal BRAM register
    reg signed  [TRANSPOSE_WIDTH-1:0] transpose_out; // output BRAM register

    reg                         [7:0] transpose_debug_reg; // internal BRAM register
    reg                         [7:0] transpose_debug_out; // output BRAM register
    wire                       [7:0] transpose_ra = {transpose_r_page, transpose_rcntr[2:0], transpose_rcntr[5:3]};
    reg                        [3:0] t_wa;
    wire                             t_we0 = transpose_out_run[2] && !t_wa[3];
    wire                             t_we1 = transpose_out_run[2] &&  t_wa[3];
    reg signed [TRANSPOSE_WIDTH-1:0] t_ram0[0:7];
    reg signed [TRANSPOSE_WIDTH-1:0] t_ram1[0:7];
    reg signed [TRANSPOSE_WIDTH-1:0] dctv_xin0;
    reg signed [TRANSPOSE_WIDTH-1:0] dctv_xin1;

    reg signed [7:0] t_debug_ram0[0:7];
    reg signed [7:0] t_debug_ram1[0:7];
    reg signed [7:0] dctv_debug_xin0; // SuppressThisWarning VEditor - simulation only
    reg signed [7:0] dctv_debug_xin1; // SuppressThisWarning VEditor - simulation only
    
    wire signed      [OUT_WIDTH-1:0] dctv_dout0; 
    wire signed      [OUT_WIDTH-1:0] dctv_dout1; 
    wire                             dctv_en_out0; 
    wire                             dctv_en_out1; 
    wire                       [2:0] dctv_yindex0;
    wire                       [2:0] dctv_yindex1;

    wire                             dctv_phin_start = transpose_out_run && (transpose_rcntr[5:0] == 8); 
    reg                              dctv_phin_run;
    
    reg                              dctv_en0;
    reg                              dctv_en1;
    reg                        [6:0] dctv_phin;
    reg                        [2:0] t_ra0;
    reg                        [2:0] t_ra1;
    wire                             dctv_start_0_w =  dctv_phin_run && (dctv_phin [6:0] ==0);
    wire                             dctv_start_1_w =  dctv_phin_run && (dctv_phin [6:0] ==9);
    reg                              dctv_start_0_r;
    reg                              dctv_start_1_r;
    
    reg                              pre_last_in_r;
    
    reg                        [6:0] dctv_out_cntr; // count output data from second (vertical) pass (bit 6 - stopping)
    reg                              dctv_out_run;  // 
//    wire                             dctv_out_start = dctv_phin [6:0] == 'h10; 
    wire                             dctv_out_start = dctv_phin [6:0] == 'h11; 
    
    reg                        [3:0] dctv_out_wa_1;
    reg                        [1:0] dctv_out_we_1;
    reg                              dctv_out_sel; // select DCTv channel output;
    reg signed       [OUT_WIDTH-1:0] dctv_out_ram_1[0:15];
    reg                        [2:0] dctv_out_debug_ram_1[0:15];

    reg                        [6:0] dctv_out_ra_1;
    wire                       [3:0] dctv_out_ra_1_w = {dctv_out_ra_1[3:1], ~dctv_out_ra_1[0]};
    wire                             dctv_out_start_1 = dctv_out_cntr[6:0] == 'h0c; // 'h0b;
    reg                              dctv_out_run_1;
    reg signed       [OUT_WIDTH-1:0] dctv_out_reg_1;
    reg                        [2:0] dctv_out_debug_reg_1;
    
    reg signed       [OUT_WIDTH-1:0] dctv_out_ram_2[0:3];
    reg                        [2:0] dctv_out_debug_ram_2[0:3];
    reg                              dctv_out_we_2;
    reg                        [1:0] dctv_out_wa_2;
    reg                        [6:0] dctv_out_ra_2;
    wire                             dctv_out_start_2 = dctv_out_ra_1[6:0] == 2;
    reg                              dctv_out_run_2;
    reg signed       [OUT_WIDTH-1:0] dctv_out_reg_2;
    reg                        [2:0] dctv_out_debug_reg_2; // SuppressThisWarning VEditor - simulation only

    assign d_out = dctv_out_reg_2;
    
    assign pre_last_in = pre_last_in_r;

    always @ (posedge clk) begin
        if      (rst)        x_run <= 0;
        else if (start)      x_run <= 1;
        else if (&x_wa[5:0]) x_run <= 0;
        
        if (!x_run) x_wa <= 0;
        else        x_wa <= x_wa + 1;
        
        pre_last_in_r <= x_run && (x_wa[5:0] == 'h3d); 

        if      (rst)                      pre_busy <= 0;
        else if (pre_last_in_r)            pre_busy <= 1;
        else if (dcth_phin [5:0] == 5)     pre_busy <= 0; // check actual?

        if      (rst)                      dcth_phin_run <= 0;
        else if          (dcth_phin_start) dcth_phin_run <= 1;
        else if (dcth_phin [6:0] == 7'h48) dcth_phin_run <= 0; // check actual?
        
        if (!dcth_phin_run || dcth_phin_start) dcth_phin <= 0;
        else                                   dcth_phin <= dcth_phin + 1;
        
        if      (rst)                          dcth_en0 <= 0;
        else if (dcth_start_0_w)               dcth_en0 <= 1;
        else if (!x_run)                       dcth_en0 <= 0; // maybe get rid of this signal and send start for each 8? 
        
        if      (rst)                          dcth_en1 <= 0;
        else if (dcth_start_1_w)               dcth_en1 <= 1;
        else if (dcth_phin [6])                dcth_en1 <= 0; // maybe get rid of this signal and send start for each 8? 

        //write input reorder memory
        if (x_run && !x_wa[3]) x_ram0[x_wa[2:0]] <= xin;
        if (x_run &&  x_wa[3]) x_ram1[x_wa[2:0]] <= xin;
        
        //read input reorder memory
        dcth_xin0 <= x_ram0[x_ra0[2:0]];
        dcth_xin1 <= x_ram1[x_ra1[2:0]];
        
        dcth_start_0_r <= dcth_start_0_w;
        dcth_start_1_r <= dcth_start_1_w;
        
        if      (rst)                           transpose_in_run <= 0;
        else if               (transpose_start) transpose_in_run <= 1;
        else if (transpose_cntr [6:0] == 7'h46) transpose_in_run <= 0; // check actual?
        
        if (!transpose_in_run || transpose_start) transpose_cntr <= 0;
        else                                      transpose_cntr <= transpose_cntr + 1;
        
        if      (rst)                                        transpose_w_page <= 0;
        else if (transpose_in_run && (&transpose_cntr[5:0])) transpose_w_page <=  transpose_w_page + 1;

        case (transpose_cntr[3:0])
            4'h0: transpose_wa_low <= 0;
            4'h1: transpose_wa_low <= 1;
            4'h2: transpose_wa_low <= 7;
            4'h3: transpose_wa_low <= 6;
            4'h4: transpose_wa_low <= 4;
            4'h5: transpose_wa_low <= 2;
            4'h6: transpose_wa_low <= 3;
            4'h7: transpose_wa_low <= 5;
            4'h8: transpose_wa_low <= 1;
            4'h9: transpose_wa_low <= 0;
            4'ha: transpose_wa_low <= 6;
            4'hb: transpose_wa_low <= 7;
            4'hc: transpose_wa_low <= 2;
            4'hd: transpose_wa_low <= 4;
            4'he: transpose_wa_low <= 5;
            4'hf: transpose_wa_low <= 3;
        endcase  
        transpose_wa_high <= {transpose_w_page, transpose_cntr[5:4], transpose_cntr[0]} - {transpose_wa_decr,1'b0};
        transpose_we <=  {transpose_we[0],dcth_en_out0 | dcth_en_out1};
        // Write transpose memory)
        if (transpose_we[1])       transpose_ram[transpose_wa] <= transpose_di;
        if (transpose_we[1]) transpose_debug_ram[transpose_wa] <= transpose_debug_di;
//        if (transpose_we[1]) $display("%d %d @%t",transpose_cntr, transpose_wa, $time) ;
        
        if      (rst)                           transpose_out_run[0] <= 0;
        else if           (transpose_out_start) transpose_out_run[0] <= 1;
        else if (&transpose_rcntr[5:0])         transpose_out_run[0] <= 0; // check actual?
        
        transpose_out_run[2:1] <= transpose_out_run[1:0];
        
        if (!transpose_out_run[0] || transpose_out_start) transpose_rcntr <= 0;
        else                                              transpose_rcntr <= transpose_rcntr + 1;
        
        if      (transpose_out_start)                     transpose_r_page <= transpose_w_page;
        
        // Read transpose memory to 2 small reorder memories, use BRAM register
        if (transpose_out_run[0]) transpose_reg <= transpose_ram[transpose_ra];
        if (transpose_out_run[1]) transpose_out <= transpose_reg;
        if (transpose_out_run[0]) transpose_debug_reg <= transpose_debug_ram[transpose_ra];
        if (transpose_out_run[1]) transpose_debug_out <= transpose_debug_reg;

        if (!transpose_out_run[2]) t_wa <= 0;
        else                       t_wa <= t_wa+1;

        if      (rst)                          dctv_phin_run <= 0;
        else if          (dctv_phin_start)     dctv_phin_run <= 1;
        else if (dctv_phin [6:0] == 7'h48)     dctv_phin_run <= 0; // check actual?


        if (!dctv_phin_run || dctv_phin_start) dctv_phin <= 0;
        else                                   dctv_phin <= dctv_phin + 1;
        
        if      (rst)                          dctv_en0 <= 0;
        else if (dctv_start_0_w)               dctv_en0 <= 1;
        else if (!transpose_out_run[2])        dctv_en0 <= 0; // maybe get rid of this signal and send satrt for each 8? 
        
        if      (rst)                          dctv_en1 <= 0;
        else if (dctv_start_1_w)               dctv_en1 <= 1;
        else if (dctv_phin[6])                 dctv_en1 <= 0; // maybe get rid of this signal and send satrt for each 8? 
        
        if (t_we0 || t_we1) $display("%d %d",transpose_rcntr-2, transpose_out) ;
        
        //write vertical dct input reorder memory
        if (t_we0) t_ram0[t_wa[2:0]] <= transpose_out;
        if (t_we1) t_ram1[t_wa[2:0]] <= transpose_out;

        if (t_we0) t_debug_ram0[t_wa[2:0]] <= transpose_debug_out;
        if (t_we1) t_debug_ram1[t_wa[2:0]] <= transpose_debug_out;
        
        //read vertical dct input reorder memory
        dctv_xin0 <= t_ram0[t_ra0[2:0]];
        dctv_xin1 <= t_ram1[t_ra1[2:0]];

        dctv_start_0_r <= dctv_start_0_w;
        dctv_start_1_r <= dctv_start_1_w;

        dctv_debug_xin0 <= t_debug_ram0[t_ra0[2:0]];
        dctv_debug_xin1 <= t_debug_ram1[t_ra1[2:0]];
        
        // Reordering data from a pair of vertical DCTs - 2 steps, 1 is not enough
        if      (rst)                        dctv_out_run <= 0;
        else if (dctv_out_start)             dctv_out_run <= 1;
        else if (dctv_out_cntr[6:0] == 'h47) dctv_out_run <= 0;
        
        if (!dctv_out_run || dctv_out_start) dctv_out_cntr <= 0;
        else                                 dctv_out_cntr <= dctv_out_cntr + 1;
        
        dctv_out_we_1 <= {dctv_out_we_1[0], dctv_en_out0 | dctv_en_out1};
        
        dctv_out_sel <= dctv_out_cntr[0];

        case (dctv_out_cntr[3:0])
            4'h0: dctv_out_wa_1 <= 0;
            4'h1: dctv_out_wa_1 <= 9;
            4'h2: dctv_out_wa_1 <= 7;
            4'h3: dctv_out_wa_1 <= 14;
            4'h4: dctv_out_wa_1 <= 4;
            4'h5: dctv_out_wa_1 <= 10;
            4'h6: dctv_out_wa_1 <= 3;
            4'h7: dctv_out_wa_1 <= 13;
            4'h8: dctv_out_wa_1 <= 1;
            4'h9: dctv_out_wa_1 <= 8;
            4'ha: dctv_out_wa_1 <= 6;
            4'hb: dctv_out_wa_1 <= 15;
            4'hc: dctv_out_wa_1 <= 2;
            4'hd: dctv_out_wa_1 <= 12;
            4'he: dctv_out_wa_1 <= 5;
            4'hf: dctv_out_wa_1 <= 11;
        endcase  
        
        // write first stage of output reordering
        if (dctv_out_we_1[1]) dctv_out_ram_1[dctv_out_wa_1] <=       dctv_out_sel? dctv_dout1: dctv_dout0;
        if (dctv_out_we_1[1]) dctv_out_debug_ram_1[dctv_out_wa_1] <= dctv_out_sel? dctv_yindex1: dctv_yindex0;
        
        if      (rst)                 dctv_out_run_1 <= 0;
        else if (dctv_out_start_1)    dctv_out_run_1 <= 1;
        else if (&dctv_out_ra_1[5:0]) dctv_out_run_1 <= 0;
        
        if (!dctv_out_run_1 || dctv_out_start_1) dctv_out_ra_1 <= 0;
        else                                     dctv_out_ra_1 <= dctv_out_ra_1 + 1;
        // reading first stage of output reorder RAM
        if (dctv_out_run_1) dctv_out_reg_1 <=       dctv_out_ram_1[dctv_out_ra_1_w];
        if (dctv_out_run_1) dctv_out_debug_reg_1 <= dctv_out_debug_ram_1[dctv_out_ra_1_w];
        
        // last stage of the output reordering - 4 register memory
        
        dctv_out_we_2 <= dctv_out_run_1;
        dctv_out_wa_2 <= dctv_out_ra_1_w[1:0];

        // write first stage of output reordering
        if (dctv_out_we_2) dctv_out_ram_2[dctv_out_wa_2] <=       dctv_out_reg_1;
        if (dctv_out_we_2) dctv_out_debug_ram_2[dctv_out_wa_2] <= dctv_out_debug_reg_1;

        if      (rst)                 dctv_out_run_2 <= 0;
        else if (dctv_out_start_2)    dctv_out_run_2 <= 1;
        else if (&dctv_out_ra_2[5:0]) dctv_out_run_2 <= 0;
        
        if (!dctv_out_run_2 || dctv_out_start_2) dctv_out_ra_2 <= 0;
        else                                     dctv_out_ra_2 <= dctv_out_ra_2 + 1;

        // reading first stage of output reorder RAM
        if (dctv_out_run_2) dctv_out_reg_2 <=       dctv_out_ram_2[dctv_out_ra_2[1:0]];
        if (dctv_out_run_2) dctv_out_debug_reg_2 <= dctv_out_debug_ram_2[dctv_out_ra_2[1:0]];
        
        pre_first_out <= dctv_out_ra_1[6:0] == 2;
        
        dv <= dctv_out_run_2;
    end

    always @ (posedge clk) begin
    //X2-X7-X3-X4-X5-X6-X0-X1-*-X3-X5-X4-*-X1-X7-*        
        case (dcth_phin[3:0])
            4'h0: x_ra0 <= 2;
            4'h1: x_ra0 <= 7;
            4'h2: x_ra0 <= 3;
            4'h3: x_ra0 <= 4;
            4'h4: x_ra0 <= 5;
            4'h5: x_ra0 <= 6;
            4'h6: x_ra0 <= 0;
            4'h7: x_ra0 <= 1;
            4'h8: x_ra0 <= 'bx;
            4'h9: x_ra0 <= 3;
            4'ha: x_ra0 <= 5;
            4'hb: x_ra0 <= 4;
            4'hc: x_ra0 <= 'bx;
            4'hd: x_ra0 <= 6;
            4'he: x_ra0 <= 7;
            4'hf: x_ra0 <= 'bx;
        endcase
        case (dcth_phin[3:0])
            4'h0: x_ra1 <= 1;
            4'h1: x_ra1 <= 'bx;
            4'h2: x_ra1 <= 3;
            4'h3: x_ra1 <= 5;
            4'h4: x_ra1 <= 4;
            4'h5: x_ra1 <= 'bx;
            4'h6: x_ra1 <= 6;
            4'h7: x_ra1 <= 7;
            4'h8: x_ra1 <= 'bx;
            4'h9: x_ra1 <= 2;
            4'ha: x_ra1 <= 7;
            4'hb: x_ra1 <= 3;
            4'hc: x_ra1 <= 4;
            4'hd: x_ra1 <= 5;
            4'he: x_ra1 <= 6;
            4'hf: x_ra1 <= 0;
        endcase
    end
 
    always @ (posedge clk) begin
    //X2-X7-X3-X4-X5-X6-X0-X1-*-X3-X5-X4-*-X1-X7-*        
        case (dctv_phin[3:0])
            4'h0: t_ra0 <= 2;
            4'h1: t_ra0 <= 7;
            4'h2: t_ra0 <= 3;
            4'h3: t_ra0 <= 4;
            4'h4: t_ra0 <= 5;
            4'h5: t_ra0 <= 6;
            4'h6: t_ra0 <= 0;
            4'h7: t_ra0 <= 1;
            4'h8: t_ra0 <= 'bx;
            4'h9: t_ra0 <= 3;
            4'ha: t_ra0 <= 5;
            4'hb: t_ra0 <= 4;
            4'hc: t_ra0 <= 'bx;
            4'hd: t_ra0 <= 6;
            4'he: t_ra0 <= 7;
            4'hf: t_ra0 <= 'bx;
        endcase
        case (dctv_phin[3:0])
            4'h0: t_ra1 <= 1;
            4'h1: t_ra1 <= 'bx;
            4'h2: t_ra1 <= 3;
            4'h3: t_ra1 <= 5;
            4'h4: t_ra1 <= 4;
            4'h5: t_ra1 <= 'bx;
            4'h6: t_ra1 <= 6;
            4'h7: t_ra1 <= 7;
            4'h8: t_ra1 <= 'bx;
            4'h9: t_ra1 <= 2;
            4'ha: t_ra1 <= 7;
            4'hb: t_ra1 <= 3;
            4'hc: t_ra1 <= 4;
            4'hd: t_ra1 <= 5;
            4'he: t_ra1 <= 6;
            4'hf: t_ra1 <= 0;
        endcase
    end

    dct_iv8_1d #(
        .WIDTH        (INPUT_WIDTH),
        .OUT_WIDTH    (TRANSPOSE_WIDTH),
        .OUT_RSHIFT   (OUT_RSHIFT1),
        .B_WIDTH      (DSP_B_WIDTH),
        .A_WIDTH      (DSP_A_WIDTH),
        .P_WIDTH      (DSP_P_WIDTH),
        .COSINE_SHIFT (COSINE_SHIFT),
        .COS_01_32    (COS_01_32),
        .COS_03_32    (COS_03_32),
        .COS_04_32    (COS_04_32),
        .COS_05_32    (COS_05_32),
        .COS_07_32    (COS_07_32),
        .COS_08_32    (COS_08_32),
        .COS_09_32    (COS_09_32),
        .COS_11_32    (COS_11_32),
        .COS_12_32    (COS_12_32),
        .COS_13_32    (COS_13_32),
        .COS_15_32    (COS_15_32)
    ) dct_iv8_1d_pass1_0_i (
        .clk            (clk),                  // input
        .rst            (rst),                  // input
        .en             (dcth_en0),             // input
        .d_in           (dcth_xin0),            // input[23:0] 
        .start          (dcth_start_0_r),       // input
        .dout           (dcth_dout0),           // output[23:0] 
        .pre2_start_out (),                     // output reg 
        .en_out         (dcth_en_out0),         // output reg
        .y_index        (dcth_yindex0)          // output[2:0] reg 
         
    );

    dct_iv8_1d #(
        .WIDTH        (INPUT_WIDTH),
        .OUT_WIDTH    (TRANSPOSE_WIDTH),
        .OUT_RSHIFT   (OUT_RSHIFT1),
        .B_WIDTH      (DSP_B_WIDTH),
        .A_WIDTH      (DSP_A_WIDTH),
        .P_WIDTH      (DSP_P_WIDTH),
        .COSINE_SHIFT (COSINE_SHIFT),
        .COS_01_32    (COS_01_32),
        .COS_03_32    (COS_03_32),
        .COS_04_32    (COS_04_32),
        .COS_05_32    (COS_05_32),
        .COS_07_32    (COS_07_32),
        .COS_08_32    (COS_08_32),
        .COS_09_32    (COS_09_32),
        .COS_11_32    (COS_11_32),
        .COS_12_32    (COS_12_32),
        .COS_13_32    (COS_13_32),
        .COS_15_32    (COS_15_32)
    ) dct_iv8_1d_pass1_1_i (
        .clk            (clk),                  // input
        .rst            (rst),                  // input
        .en             (dcth_en1),             // input
        .d_in           (dcth_xin1),            // input[23:0] 
        .start          (dcth_start_1_r),       // input
        .dout           (dcth_dout1),           // output[23:0] 
        .pre2_start_out (),                     // output reg 
        .en_out         (dcth_en_out1),         // output reg
        .y_index        (dcth_yindex1)          // output[2:0] reg 
 
    );
//dcth_phin_run && (dcth_phin [6:0] ==9)

    dct_iv8_1d #(
        .WIDTH        (TRANSPOSE_WIDTH),
        .OUT_WIDTH    (OUT_WIDTH),
        .OUT_RSHIFT   (OUT_RSHIFT2),
        .B_WIDTH      (DSP_B_WIDTH),
        .A_WIDTH      (DSP_A_WIDTH),
        .P_WIDTH      (DSP_P_WIDTH),
        .COSINE_SHIFT (COSINE_SHIFT),
        .COS_01_32    (COS_01_32),
        .COS_03_32    (COS_03_32),
        .COS_04_32    (COS_04_32),
        .COS_05_32    (COS_05_32),
        .COS_07_32    (COS_07_32),
        .COS_08_32    (COS_08_32),
        .COS_09_32    (COS_09_32),
        .COS_11_32    (COS_11_32),
        .COS_12_32    (COS_12_32),
        .COS_13_32    (COS_13_32),
        .COS_15_32    (COS_15_32)
    ) dct_iv8_1d_pass2_0_i (
        .clk            (clk),                  // input
        .rst            (rst),                  // input
        .en             (dctv_en0),             // input
        .d_in           (dctv_xin0),            // input[23:0] 
        .start          (dctv_start_0_r),       // input
        .dout           (dctv_dout0),           // output[23:0] 
        .pre2_start_out (),                     // output reg 
        .en_out         (dctv_en_out0),         // output reg
        .y_index        (dctv_yindex0)          // output[2:0] reg 
 
    );

    dct_iv8_1d #(
        .WIDTH        (TRANSPOSE_WIDTH),
        .OUT_WIDTH    (OUT_WIDTH),
        .OUT_RSHIFT   (OUT_RSHIFT2),
        .B_WIDTH      (DSP_B_WIDTH),
        .A_WIDTH      (DSP_A_WIDTH),
        .P_WIDTH      (DSP_P_WIDTH),
        .COSINE_SHIFT (COSINE_SHIFT),
        .COS_01_32    (COS_01_32),
        .COS_03_32    (COS_03_32),
        .COS_04_32    (COS_04_32),
        .COS_05_32    (COS_05_32),
        .COS_07_32    (COS_07_32),
        .COS_08_32    (COS_08_32),
        .COS_09_32    (COS_09_32),
        .COS_11_32    (COS_11_32),
        .COS_12_32    (COS_12_32),
        .COS_13_32    (COS_13_32),
        .COS_15_32    (COS_15_32)
    ) dct_iv8_1d_pass2_1_i (
        .clk            (clk),                  // input
        .rst            (rst),                  // input
        .en             (dctv_en1),             // input
        .d_in           (dctv_xin1),            // input[23:0] 
        .start          (dctv_start_1_r),       // input
        .dout           (dctv_dout1),           // output[23:0] 
        .pre2_start_out (),                     // output reg 
        .en_out         (dctv_en_out1),         // output reg
        .y_index        (dctv_yindex1)          // output[2:0] reg 
    );

endmodule


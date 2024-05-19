// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>lens_flat393
 * @file lens_flat393.v
 * @date 2015-08-27  
 * @author Andrey Filippov     
 *
 * @brief Correction of lens+sensor vignetting. Initially it is just
 * a quadratic function  that can be improved later by a piece-linear table
 * function T() of the calculated f(x,y)=p*(x-x0)^2 + q(y-yo)^2 + c.
 * T(f(x,y)) can be used to approximate cos^4). or other vignetting functions
 * 
 * This function - f(x,y) or T(f(x,y)) here deal with full sensor data before 
 * gamma-tables are applied and the data is compressed to 8 bits
 *
 * @copyright Copyright (c) 2008-2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * lens_flat393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  lens_flat393.v is distributed in the hope that it will be useful,
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
`timescale 1ns / 1ps
/*
F2(x,y)=p*(x-x0)^2 + q(y-yo)^2 + c=
       p*x^2 - (2*p*x0) * x + p* (x0*x0) + q*y^2 - (2*q*y0) * y + q* (y0*y0) + c=
       p* x^2 - (2*p*x0) * x + q* y^2 -(2*q)* y + (p* (x0*x0)+q* (y0*y0) + c)
Final:
F2(X,Y)=p* x^2 - (2*p*x0) * x + q* y^2 -(2*q)* y + (p* (x0*x0)+q* (y0*y0) + c):
Ax(Y)= p
Bx(Y)=-(2*p)
F(0,Y)= q*y^2 - (2*q*y0) * y + (q* (y0*y0) + c + p* (x0*x0))
C=  (q* (y0*y0) + c + p* (x0*x0));
BY= - (2*q*y0)
AY= q
AX= p
BX= -2*p*x0
*/
// Increased latency ny 1 to meet timing
module lens_flat393 #(
// Vignetting correction / pixel value scaling - controlled via single data word (same as in 252), some of bits [23:16]
// are used to select register, bits 25:24 - select sub-frame
    parameter SENS_LENS_ADDR =              'h43c, 
    parameter SENS_LENS_ADDR_MASK =         'h7fc,
//    parameter SENS_LENS_HEIGHTS =           'h0, // .. 'h2  set frame heights (all that is not SENS_LENS_COEFF)
    parameter SENS_LENS_COEFF =             'h3, // set vignetting/scale coefficients (
      parameter SENS_LENS_AX =              'h00, // 00000...
      parameter SENS_LENS_AX_MASK =         'hf8,
      parameter SENS_LENS_AY =              'h08, // 00001...
      parameter SENS_LENS_AY_MASK =         'hf8,
      parameter SENS_LENS_C =               'h10, // 00010...
      parameter SENS_LENS_C_MASK =          'hf8,
      parameter SENS_LENS_BX =              'h20, // 001.....
      parameter SENS_LENS_BX_MASK =         'he0,
      parameter SENS_LENS_BY =              'h40, // 010.....
      parameter SENS_LENS_BY_MASK =         'he0,
      parameter SENS_LENS_SCALES =          'h60, // 01100...
      parameter SENS_LENS_SCALES_MASK =     'hf8,
      parameter SENS_LENS_FAT0_IN =         'h68, // 01101000
      parameter SENS_LENS_FAT0_IN_MASK =    'hff,
      parameter SENS_LENS_FAT0_OUT =        'h69, // 01101001
      parameter SENS_LENS_FAT0_OUT_MASK =   'hff,
      parameter SENS_LENS_POST_SCALE =      'h6a, // 01101010
      parameter SENS_LENS_POST_SCALE_MASK = 'hff,
      parameter SENS_NUM_SUBCHN =           3, // number of subchannels on the same sensor port (<=4)
      
      parameter SENS_LENS_F_WIDTH = 19, // AF2015 18, // number of bits in the output result
      parameter SENS_LENS_F_SHIFT = 22, // shift ~2*log2(width/2), for 4K width
      parameter SENS_LENS_B_SHIFT = 12, //(<=F_SHIFT) shift b- coeff (12 is 2^12 - good for lines <4096, 1 output count per width)
      parameter SENS_LENS_A_WIDTH = 19, // AF2015 18, // number of bits in a-coefficient (unsigned). Just to match the caller - MSBs will be anyway discarded
      parameter SENS_LENS_B_WIDTH = 21  // number of bits in b-coefficient (signed).
      
)  (
    input             prst,        // @pclk sync reset
    input             pclk,        // global clock input, pixel rate (96MHz for MT9P006)
    // programming interface
    input             mrst,        // @mclk sync reset
    input             mclk,        // global clock, half DDR3 clock, synchronizes all I/O through the command port
    input       [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input             cmd_stb,     // strobe (with first byte) for the command a/d

    input      [15:0] pxd_in, //    @(posedge pclk)
    input             hact_in,
    input             sof_in,    // start of frame, single pclk, input
    input             eof_in,    // end of frame, single pclk, input

    output reg [15:0] pxd_out,      // pixel data out, 16 bit unsigned
    output            hact_out,     // 
    output            sof_out,      // latency 8 from pxd_in;
    output            eof_out,      // 

    input       [1:0] bayer,
    output      [1:0] subchannel, // for gamma correction (valid before/at start of line, may be invalid at the end)
    output            last_in_sub // last line in subchannel (valid before/at start of line, may be invalid at the end)
                  );

// AF2015 new signals
    wire     [ 1:0] cmd_a;
    wire     [31:0] cmd_data; 
    reg      [31:0] cmd_data_r;        // holds data to cross clock boundary
    wire            cmd_we;

    reg    [15:0] heights_m1_ram[0:3]; // set @ posedge mclk, used at pclk, but should be OK (change before first hact)
    reg    [15:0] line_cntr;           // count image lines to switch to next subchannels
    reg     [1:0] sub_frame_early;     // valid before/at newline to provide coefficients to lens_flat393_line 
    reg     [1:0] sub_frame;
    reg     [1:0] sub_frame_late;      // valid @ hact_d[2]
    reg     [3:0] sub_frame_late_d;    // add extra stages if needed 
    reg           pre_first_line;
    reg           inc_sub_frame;
//    reg    [13:0] hact_d;              // lens_corr_out; /// lens correction out valid (first clock from column0 )
    reg    [14:0] hact_d;              // lens_corr_out; /// lens correction out valid (first clock from column0 )
    wire   [15:0] pxd_d;               // pxd_in delayed buy 4 clocks  
    reg    [ 2:0] newline;
    reg           sosf; // start of subframe
    reg           we_AX,we_BX,we_AY,we_BY,we_C;
    reg           we_scales;/// write additional individual per-color scales (17 bits each)
    reg           we_fatzero_in,we_fatzero_out; ///
    reg           we_post_scale;
//F(x,y)=Ax*x^2+Bx*x+Ay*y^2+By*y+C

    // small rams to store per-subframe parameters, they will be registered at each subframe start
    

    reg    [18:0] AX_ram[0:3]; /// Ax
    reg    [18:0] AY_ram[0:3]; /// Ax
    reg    [20:0] BX_ram[0:3]; /// Bx
    reg    [20:0] BY_ram[0:3]; /// By
    reg    [18:0] C_ram[0:3];  /// C
    reg    [16:0] scales_ram[0:15]; // per-color coefficients (parallel-combined fro all colors)
//    reg    [16:0] scales_r;
    reg    [15:0] fatzero_in_ram[0:3];     /// zero level to subtract before multiplication
    reg    [15:0] fatzero_out_ram[0:3];    /// zero level to add after multiplication
    reg    [ 3:0] post_scale_ram[0:3];     /// shift product after first multiplier - maybe needed when using decimation




    wire   [18:0] FY;    /// F(0,y)
    wire   [23:0] ERR_Y; /// running error for the first column
    wire   [18:0] FXY;   /// F(x,y)
//    reg    [18:0] FXY_sat; // Not used, add extra cycle in calculations?
/// copied form sensorpix353.v
    reg           bayer_nset; 
    reg           bayer0_latched;
    reg    [1:0]  color;
    wire  [35:0]  mult_first_res;
    reg   [17:0]  mult_first_scaled; /// scaled multiplication result (to use with decimation to make parabola 'sharper')
    wire  [35:0]  mult_second_res;

    // Use sub_frame_late?
    wire  [20:0]  pre_pixdo_with_zero= mult_second_res[35:15] + {{5{fatzero_out_ram[sub_frame][15]}},fatzero_out_ram[sub_frame][15:0]};
    reg   [17:0]  pre_pixdo_with_zero_r;


//    wire          sync_bayer=linerun && ~lens_corr_out[0];
//    wire          sync_bayer=hact_d[2] && ~hact_d[3];
    wire          sync_bayer=hact_d[6] && ~hact_d[7];
    
// sub_frame_late_d[3:2] sets 1 cycle ahead of needed, OK to ease timing (there is always >=1 hact gap)
    wire   [17:0] pix_zero = {2'b0,pxd_d[15:0]}-{{2{fatzero_in_ram[sub_frame_late_d[3:2]][15]}},fatzero_in_ram[sub_frame_late_d[3:2]][15:0]};

    // Writing to register files @mclk (4 per-subframe registers for coefficients, 4x4 - for per-subframe per-color scales)
    // these registers  will be read out at other clock (pclk)
    wire set_lens_w =      cmd_we && (cmd_a == SENS_LENS_COEFF );
    wire set_heights_w =   cmd_we && (cmd_a != SENS_LENS_COEFF );
    
    assign subchannel = sub_frame ; 
    assign last_in_sub = inc_sub_frame;
//    assign hact_out = hact_d[13];
    assign hact_out = hact_d[14];
    
    always @(posedge mclk) begin
        cmd_data_r <= cmd_data;
        
        if (set_heights_w) heights_m1_ram[cmd_a] <= cmd_data[15:0];
        
        we_AX          <= set_lens_w && func_cmd_we (cmd_data, SENS_LENS_AX,         SENS_LENS_AX_MASK);
        we_AY          <= set_lens_w && func_cmd_we (cmd_data, SENS_LENS_AY,         SENS_LENS_AY_MASK);
        we_C           <= set_lens_w && func_cmd_we (cmd_data, SENS_LENS_C,          SENS_LENS_C_MASK);
        we_BX          <= set_lens_w && func_cmd_we (cmd_data, SENS_LENS_BX,         SENS_LENS_BX_MASK);
        we_BY          <= set_lens_w && func_cmd_we (cmd_data, SENS_LENS_BY,         SENS_LENS_BY_MASK);
        we_scales      <= set_lens_w && func_cmd_we (cmd_data, SENS_LENS_SCALES,     SENS_LENS_SCALES_MASK);
        we_fatzero_in  <= set_lens_w && func_cmd_we (cmd_data, SENS_LENS_FAT0_IN,    SENS_LENS_FAT0_IN_MASK);
        we_fatzero_out <= set_lens_w && func_cmd_we (cmd_data, SENS_LENS_FAT0_OUT,   SENS_LENS_FAT0_OUT_MASK);
        we_post_scale  <= set_lens_w && func_cmd_we (cmd_data, SENS_LENS_POST_SCALE, SENS_LENS_POST_SCALE_MASK);
        // Write to RAM
        if (we_AX)          AX_ram         [func_chn(cmd_data_r)] <= cmd_data_r[18:0];
        if (we_AY)          AY_ram         [func_chn(cmd_data_r)] <= cmd_data_r[18:0];
        if (we_BX)          BX_ram         [func_chn(cmd_data_r)] <= cmd_data_r[20:0];
        if (we_BY)          BY_ram         [func_chn(cmd_data_r)] <= cmd_data_r[20:0];
        if (we_C)           C_ram          [func_chn(cmd_data_r)] <= cmd_data_r[18:0];
        if (we_scales)      scales_ram     [{func_chn(cmd_data_r), cmd_data_r[18:17]}] <= cmd_data_r[16:0];
        if (we_fatzero_in)  fatzero_in_ram [func_chn(cmd_data_r)] <= cmd_data_r[15:0];
        if (we_fatzero_out) fatzero_out_ram[func_chn(cmd_data_r)] <= cmd_data_r[15:0];
        if (we_post_scale)  post_scale_ram [func_chn(cmd_data_r)] <= cmd_data_r[ 3:0];
    end

    always @ (posedge pclk) begin
//        hact_d <= {hact_d[12:0],hact_in};
        hact_d <= {hact_d[13:0],hact_in};
        newline <= {newline[1:0], hact_d[3] && !hact_d[4]};
    
        if       (sof_in)                  pre_first_line <= 1;
        else if (newline[0])               pre_first_line <= 0;
        
        if (pre_first_line || newline[0])  inc_sub_frame <= (sub_frame != (SENS_NUM_SUBCHN - 1)) && (line_cntr == 0);
        
        sub_frame_early <= sub_frame + inc_sub_frame;
        
        if      (pre_first_line) sub_frame <= 0;
        else if (newline[0])     sub_frame <=     sub_frame_early;
        
        // adjust when to switch?
        if (pre_first_line || (newline[1] && inc_sub_frame))  line_cntr <= heights_m1_ram[sub_frame];
        else if (newline[1] )                                 line_cntr <= line_cntr - 1;
        
//        if (newline[2])   sub_frame_late <= sub_frame;
        if (newline[1])   sub_frame_late <= sub_frame;
        sub_frame_late_d <= {sub_frame_late_d[1:0],sub_frame_late}; // valid @ hact_d[3], use @hact_d[4] as there is always >= 1 clock HACT gap
        
        sosf <= (hact_in && ~hact_d[0]) && (pre_first_line || inc_sub_frame);
        
    end
    
    
//reg color[1:0]

    always @ (posedge pclk) begin
//      bayer_nset <= !sof_in && (bayer_nset || hact_d[1]);
      bayer_nset <= !sof_in && (bayer_nset || hact_d[5]);
      bayer0_latched<= bayer_nset? bayer0_latched:bayer[0];
      color[1:0] <=  { bayer_nset? (sync_bayer ^ color[1]):bayer[1] ,
                   (bayer_nset &&(~sync_bayer))?~color[0]:bayer0_latched };

/// now scale the result (normally post_scale[2:0] ==1)
      case (post_scale_ram[sub_frame][2:0])
        3'h0:mult_first_scaled[17:0]<=  (~mult_first_res[35] & |mult_first_res[34:33]) ? 18'h1ffff:mult_first_res[33:16]; /// only limit positive overflow
        3'h1:mult_first_scaled[17:0]<=  (~mult_first_res[35] & |mult_first_res[34:32]) ? 18'h1ffff:mult_first_res[32:15];
        3'h2:mult_first_scaled[17:0]<=  (~mult_first_res[35] & |mult_first_res[34:31]) ? 18'h1ffff:mult_first_res[31:14];
        3'h3:mult_first_scaled[17:0]<=  (~mult_first_res[35] & |mult_first_res[34:30]) ? 18'h1ffff:mult_first_res[30:13];
        3'h4:mult_first_scaled[17:0]<=  (~mult_first_res[35] & |mult_first_res[34:29]) ? 18'h1ffff:mult_first_res[29:12];
        3'h5:mult_first_scaled[17:0]<=  (~mult_first_res[35] & |mult_first_res[34:28]) ? 18'h1ffff:mult_first_res[28:11];
        3'h6:mult_first_scaled[17:0]<=  (~mult_first_res[35] & |mult_first_res[34:27]) ? 18'h1ffff:mult_first_res[27:10];
        3'h7:mult_first_scaled[17:0]<=  (~mult_first_res[35] & |mult_first_res[34:26]) ? 18'h1ffff:mult_first_res[26: 9];
      endcase

      if (hact_d[12])  pre_pixdo_with_zero_r <= {pre_pixdo_with_zero[20], |pre_pixdo_with_zero[19:16], pre_pixdo_with_zero[15:0]};


//      if (hact_d[12]) pxd_out[15:0] <= pre_pixdo_with_zero[20]? 16'h0:   /// negative - use 0
//                                           ((|pre_pixdo_with_zero[19:16])?16'hffff: ///>0xffff - limit by 0xffff
//                                                                       pre_pixdo_with_zero[15:0]);
      if (hact_d[13]) pxd_out[15:0] <= pre_pixdo_with_zero_r[17] ? 16'h0:   /// negative - use 0
                                      (pre_pixdo_with_zero_r[16] ? 16'hffff: ///>0xffff - limit by 0xffff
                                       pre_pixdo_with_zero_r[15:0]);
    end

    // Replacing MULT18X18SIO of x353, registers on both inputs, outputs
    reg signed [17:0] mul1_a;
    reg signed [17:0] mul1_b;
    reg signed [35:0] mul1_p;
    reg signed [17:0] mul2_a;
    reg signed [17:0] mul2_b;
//    wire [17:0] mul2_b = mult_first_scaled[17:0]; // TODO - delay to have a register!
    reg signed [35:0] mul2_p;
    always @ (posedge pclk) begin
        if (hact_d[7]) mul1_a <= (FXY[18]==FXY[17])?FXY[17:0]:(FXY[18]?18'h20000:18'h1ffff);
        if (hact_d[7]) mul1_b <= {1'b0,scales_ram[{sub_frame_late,~color[1:0]}]};        
        if (hact_d[8]) mul1_p <= mul1_a * mul1_b;
        
        if (hact_d[10]) mul2_a <= pix_zero[17:0];  // adjust sub_frame delay
        if (hact_d[10]) mul2_b <= mult_first_scaled[17:0];  // 18-bit multiplier input - always positive       
        if (hact_d[11]) mul2_p <= mul2_a * mul2_b;
    end
    assign mult_first_res =  mul1_p;
    assign mult_second_res = mul2_p;


    cmd_deser #(
        .ADDR        (SENS_LENS_ADDR),
        .ADDR_MASK   (SENS_LENS_ADDR_MASK),
        .NUM_CYCLES  (6),
        .ADDR_WIDTH  (2),
        .DATA_WIDTH  (32)
    ) cmd_deser_lens_i (
        .rst         (mrst),       // rst), // input
        .clk         (mclk),       // input
        .srst        (mrst),       // input
        .ad          (cmd_ad),     // input[7:0] 
        .stb         (cmd_stb),    // input
        .addr        (cmd_a),      // output[15:0] 
        .data        (cmd_data),   // output[31:0] 
        .we          (cmd_we) // output
    );
    
    dly_16 #(
        .WIDTH(2)
    ) dly_16_sof_eof_i (
        .clk         (pclk),              // input
        .rst         (prst),              // input
//        .dly         (4'd12),             // input[3:0] 
        .dly         (4'd13),             // input[3:0] 
        .din         ({sof_in,eof_in}),   // input[0:0] 
        .dout        ({sof_out,eof_out})  // output[0:0] 
    );

    dly_16 #(
        .WIDTH(16)
    ) dly_16_pxd_i (
        .clk         (pclk),    // input
        .rst         (prst),    // input
        .dly         (4'd10),    // input[3:0] 
        .din         (pxd_in),  // input[0:0] 
        .dout        (pxd_d)    // output[0:0] 
    );
/*  
    dly_16 #(
        .WIDTH(1)
    ) dly_16_sof_d_i (
        .clk         (pclk),              // input
        .rst         (prst),              // input
        .dly         (4'd8),                 // input[3:0] 
        .din         (sof_in),   // input[0:0] 
        .dout        (sosf)  // output[0:0] 
    );
*/
    lens_flat393_line #(
        .F_WIDTH     (SENS_LENS_F_WIDTH),       // number of bits in the output result (signed)
        .F_SHIFT     (SENS_LENS_F_SHIFT),       // shift ~2*log2(width/2), for 4K width
        .B_SHIFT     (SENS_LENS_B_SHIFT),       //(<=F_SHIFT) shift b- coeff (12 is 2^12 - good for lines <4096, 1 output count per width)
        .A_WIDTH     (SENS_LENS_A_WIDTH),       // number of bits in a-coefficient  (signed). Just to match the caller - MSBs will be anyway discarded
        .B_WIDTH     (SENS_LENS_B_WIDTH))       // number of bits in b-coefficient (signed).
     i_fy(
           .pclk     (pclk),                    // pixel clock
           // wrong - need to restart for each sub-frame
           .first    (sosf),                  // initialize running parameters from the inputs (first column). Should be at least 1-cycle gap between "first" and first "next"
           .next     (newline[0]),              // calcualte next pixel
           .F0       (C_ram[sub_frame_early]),  // value of the output in the first column (before saturation), 18 bit, unsigned
           .ERR0     (24'b0),                   // initial value of the running error (-2.0<err<+2.0), scaled by 2^22, so 24 bits
           .A0       (AY_ram[sub_frame_early]), // Ay
           .B0       (BY_ram[sub_frame_early]), // By,  signed
           .F        (FY),
           .ERR      (ERR_Y));

    lens_flat393_line #(
        .F_WIDTH     (SENS_LENS_F_WIDTH),       // number of bits in the output result (signed)
        .F_SHIFT     (SENS_LENS_F_SHIFT),       // shift ~2*log2(width/2), for 4K width
        .B_SHIFT     (SENS_LENS_B_SHIFT),       // (<=F_SHIFT) shift b- coeff (12 is 2^12 - good for lines <4096, 1 output count per width)
        .A_WIDTH     (SENS_LENS_A_WIDTH),       // number of bits in a-coefficient  (signed). Just to match the caller - MSBs will be anyway discarded
        .B_WIDTH     (SENS_LENS_B_WIDTH))       // number of bits in b-coefficient (signed).
     i_fxy(
           .pclk     (pclk),                    // pixel clock
           .first    (newline[0]),              // initialize running parameters from the inputs (first column). Should be at least 1-cycle gap between "first" and first "next"
           .next     (hact_d[6]),               // calcualte next pixel
           .F0       (FY),                      // value of the output in the first column (before saturation), 18 bit, unsigned
           .ERR0     (ERR_Y),                   // initial value of the running error (-2.0<err<+2.0), scaled by 2^22, so 24 bits
           .A0       (AX_ram[sub_frame_early]), // Ax(Y),  signed 
           .B0       (BX_ram[sub_frame_early]), // Bx(Y),  signed
           .F        (FXY), // valid 2 clocks after next (for the second pixel), next cycle after next - for the first pixel
           .ERR());


    function func_cmd_we;
        input [31:0] cmd_data;
        input  [7:0] pattern;
        input  [7:0] mask;
        begin
            func_cmd_we = ((cmd_data[23:16] ^ pattern) & mask) == 0;  
        end
    endfunction
    function [1:0] func_chn;
        input [31:0] cmd_data;
        begin
            func_chn = cmd_data[25:24];
        end
    endfunction
    
endmodule

module lens_flat393_line#(
    parameter F_WIDTH = 19, // AF2015 18, /// number of bits in the output result
    parameter F_SHIFT = 22, /// shift ~2*log2(width/2), for 4K width
    parameter B_SHIFT = 12, ///(<=F_SHIFT) shift b- coeff (12 is 2^12 - good for lines <4096, 1 output count per width)
    parameter A_WIDTH = 19, // AF2015 18, /// number of bits in a-coefficient (unsigned). Just to match the caller - MSBs will be anyway discarded
    parameter B_WIDTH = 21 // number of bits in b-coefficient (signed).
)(
    input                    pclk,   /// pixel clock
    input                    first,  /// initialize running parameters from the inputs (first column). Should be at least 1-cycle gap between "first" and first "next"
    input                    next,   /// calcualte next pixel
    input      [F_WIDTH-1:0] F0,     /// value of the output in the first column (before saturation), 18 bit, unsigned
    input      [F_SHIFT+1:0] ERR0,   /// initial value of the running error (-2.0<err<+2.0), scaled by 2^22, so 24 bits
    input      [A_WIDTH-1:0] A0,     /// a - fixed for negative values
    input      [B_WIDTH-1:0] B0,
    output     [F_WIDTH-1:0] F,
    output reg [F_SHIFT+1:0] ERR); /// running difference between ax^2+bx+c and y, scaled by 2^22, signed, should never overflow
         // output - 18 bits, unsigned (not saturated)
    localparam DF_WIDTH = B_WIDTH - F_SHIFT + B_SHIFT; //21-22+12           11;  /// number of bits in step of F between (df/dx), signed

    reg    [F_SHIFT+1:0] ApB;             // a+b, scaled by 2 ^22, high bits ignored (not really needed - can use ApB0
    reg    [F_SHIFT+1:1] A2X;             // running value for 2*a*x, scaled by 2^22, high bits ignored
    reg    [(DF_WIDTH)-1:0] dF;           // or [9:0] - anyway only lower bits will be used in comparison operations
    reg    [F_WIDTH-1:0] F_r;             // Running value of the output
    reg                  next_d, first_d; // delayed by 1 cycle
    reg    [F_WIDTH-1:0] F1;
    reg    [A_WIDTH-1:0] A;

    wire   [F_SHIFT+1:0] preERR={A2X[F_SHIFT+1:1],1'b0}+ApB[F_SHIFT+1:0]-{dF[1:0],{F_SHIFT{1'b0}}};
    assign F = F_r;
/// Increment can be 0 or +/-1, depending on the required correction
/// It relies on the facts that:
/// - the output F(x) is integer
/// - dF/dx does not chnage by more than +/-1 when x is incremented (abs (d2f/dx2)<1), so the algorithm to get
/// y=round(F(x)) is simple :
/// At each step x, try to chnage y by the same amount as was done at the previous step, adding/subtracting 1 if needed
/// and updating the new running error (difference between the current (integer) value of y and the precise value of F(x)
/// This error is calculated here with the 22 binary digits after the point.
///f=ax^2+bx+c
///
///1)  f <= f+ df +1
///    df <= df+1; 
///    err+= (2ax+a+b-df) -1
///2)  f <= f+ df
///    err+= (2ax+a+b-df)
///3)  f <= f+ df -1
///    df <= df-1; 
///    err+= (2ax+a+b-df) +1
///preERR->inc:
/// 100 -> 11
/// 101 -> 11
/// 110 -> 11
/// 111 -> 00
/// 000 -> 00
/// 001 -> 01
/// 010 -> 01
/// 011 -> 01
    wire           [1:0] inc=   {preERR[F_SHIFT+1] & (~preERR[F_SHIFT] |  ~preERR[F_SHIFT-1]),
                                (preERR[F_SHIFT+1:F_SHIFT-1] != 3'h0)  & 
                                (preERR[F_SHIFT+1:F_SHIFT-1] != 3'h7)};
    always @(posedge pclk) begin
     first_d <=first;
     next_d  <=next;
      if         (first) begin
        F1 [F_WIDTH-1:0] <=  F0[ F_WIDTH-1:0];
        dF[(DF_WIDTH)-1:0] <= B0[B_WIDTH-1: (F_SHIFT-B_SHIFT)];
        ERR[F_SHIFT+1:0] <= ERR0[F_SHIFT+1:0];
        
        ApB[F_SHIFT+1:0] <=  {{F_SHIFT + 2 - A_WIDTH{A0[A_WIDTH-1]}},A0[A_WIDTH-1:0]} + // width correct
//AF2015                      {B0[B_WIDTH-1:0],{F_SHIFT-B_SHIFT{1'b0}}}; /// high bits from B will be discarded
                              {B0[B_SHIFT-1:0],{F_SHIFT-B_SHIFT{1'b0}}}; /// high bits from B are discarded
        A  [A_WIDTH-1:0] <= A0[A_WIDTH-1:0];
      end else if (next) begin
//AF2015        dF[(DF_WIDTH)-1:0] <= dF[(DF_WIDTH)-1:0]+{{((DF_WIDTH)-1){inc[1]}},inc[1:0]};
        dF[(DF_WIDTH)-1:0] <= dF[(DF_WIDTH)-1:0] + {{((DF_WIDTH)-2){inc[1]}},inc[1:0]};
        ERR[F_SHIFT-1:0]<= preERR[F_SHIFT-1:0];
        ERR[F_SHIFT+1:F_SHIFT]<= preERR[F_SHIFT+1:F_SHIFT]-inc[1:0];
      end

      if     (first_d)   F_r[F_WIDTH-1:0] <=  F1[ F_WIDTH-1:0];
      else if (next_d)   F_r[F_WIDTH-1:0] <=  F_r[F_WIDTH-1:0]+{{(F_WIDTH-(DF_WIDTH)){dF[(DF_WIDTH)-1]}},dF[(DF_WIDTH)-1:0]};
//AF2015       if     (first_d) A2X[F_SHIFT+1:1] <=                     {{F_SHIFT+2-A_WIDTH{A[A_WIDTH-1]}},A[A_WIDTH-1:0]};
//AF2015       else if (next)   A2X[F_SHIFT+1:1] <=  A2X[F_SHIFT+1:1] + {{F_SHIFT+2-A_WIDTH{A[A_WIDTH-1]}},A[A_WIDTH-1:0]};
      if     (first_d) A2X[F_SHIFT+1:1] <=                     {{F_SHIFT+1-A_WIDTH{A[A_WIDTH-1]}},A[A_WIDTH-1:0]};
      else if (next)   A2X[F_SHIFT+1:1] <=  A2X[F_SHIFT+1:1] + {{F_SHIFT+1-A_WIDTH{A[A_WIDTH-1]}},A[A_WIDTH-1:0]};
    end 
endmodule

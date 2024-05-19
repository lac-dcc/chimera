// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>quantizer393
 * @file quantizer393.v
 * @author Andrey Filippov     
 *
 * @brief Quantizer module for JPEG/JP4 compressor
 *
 * @copyright Copyright (c) 2002-2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * quantizer393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * quantizer393.v is distributed in the hope that it will be useful,
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

`include "system_defines.vh" 
`timescale 1ns/1ps

// will add extracted DC (8 bits) to data from DCT here that will make data 12 bits (signed) long.
// It will be possible to make a sequintial multiplier for DC - but I'll skip this now.
module quantizer393(
    input             clk,           // pixel clock, posedge
    input             en,   // enable (0 resets counter)
    input             mclk, // system clock to write tables
    input             tser_qe, // enable write to a quantization table
    input             tser_ce, // enable write to a coring table
    input             tser_a_not_d,  // address/not data distributed to submodules
    input      [ 7:0] tser_d,        // byte-wide serialized tables address/data to submodules
    input             ctypei,   // component type input (Y/C)
    input      [ 8:0] dci,      // [7:0]   - average value in a block - subtracted before DCT. now normal signed number
    input             first_stb, //this is first stb pulse in a frame
    input             stb,      // strobe that writes ctypei, dci
    input      [ 2:0] tsi,   // table (quality) select [2:0]
    input             pre_start,// marks first input pixel (one before)
    input             first_in, // first block in (valid @ start)
    output reg        first_out, // valid @ ds
    input      [12:0] di,    // [11:0] pixel data in (signed)
    output reg [12:0] dout,    // [11:0] pixel data out (AC is only 9 bits long?) - changed to 10
    output            dv,    // data out valid
    output            ds,  // data out strobe (one ahead of the start of dv)
    output reg [15:0] dc_tdo, //[15:0], MSB aligned coefficient for the DC component (used in focus module)
    input             dcc_en,  // enable dcc (sync to beginning of a new frame)
    input      [ 2:0] hfc_sel, // hight frequency components select [2:0] (includes components with both numbers >=hfc_sel
                               // hfc_sel == 3'h7 - now high frequency output - just 3 words - brightness and 2 color diffs
    input             color_first, // first MCU in a frame
    input      [ 2:0] coring_num, // coring table pair number (0..7)
    output reg        dcc_vld, // single cycle when dcc_data is valid
    output     [15:0] dcc_data,  // [15:0] dc component data out (for reading by software) 
    input      [ 7:0] n000,      // input [7:0] number of zero pixels (255 if 256) - to be multiplexed with dcc
    input      [ 7:0] n255);     // input [7:0] number of 0xff pixels (255 if 256) - to be multiplexed with dcc

    
    wire       [3:0] tdco; // coring table output
    reg        [3:0] tbac; // coring memory table number (LSB - color)
    reg              coring_range; // input <16, use coring LUT
    wire      [15:0] tdo;
    reg       [ 9:0] tba;   // table output (use) address   
    wire      [15:0] zigzag_q;
    reg              wpage;
    reg              rpage;
    wire      [ 5:0] zwa;
    reg       [ 5:0] zra;
    reg       [12:0] qdo;
    reg       [12:0] qdo0;
    reg              zwe;
    reg       [12:0] d1;
    reg       [12:0] d2,d3; // registered data in, converted to sign+ absolute value
    wire      [27:0] qmul;
    wire             start_a;
    reg       [15:0] tdor;
    reg       [20:0] qmulr; // added 7 bits to total8 fractional for biasing/zero bin
    wire             start_out;
    wire             start_z;
    reg       [ 8:0] dc1;   // registered DC average - with restored sign   

// for fifo for ctype, dc
    wire            ctype;
    wire     [ 8:0] dc;
//    wire            next_dv;
//    reg      [ 2:0] last_dv; // last dv cycle (will turn of unless new ds)
    reg      [ 2:0] ds_r;
    reg      [ 3:0] ren;
    
    reg      [ 5:0] start;
    wire            dcc_stb;
    reg             dcc_run;
    reg             dcc_first;
    reg             dcc_Y;
    reg      [ 1:0] ctype_prev;
    reg      [12:0] dcc_acc;
    reg      [12:0] hfc_acc;
    wire            hfc_en;
    reg             hfc_copy; // copy hfc_acc to dcc_acc
    wire     [10:0] d2_dct;   // 11 bits enough, convetred to positive (before - 0 was in the middle - pixel value 128) - dcc only
    reg             sel_satnum; // select saturation numbers - dcc only
    reg      [15:0] pre_dc_tdo;
    wire            copy_dc_tdo;

    reg             first_interm; // valid @ ds

    wire     [ 2:0] ts;
    wire     [ 2:0] coring_sel;

    reg      [ 2:0] block_mem_ra;
    reg      [ 2:0] block_mem_wa;
    reg      [ 2:0] block_mem_wa_save;
    reg      [15:0] block_mem_ram[0:7];
    wire     [15:0] block_mem_o=block_mem_ram[block_mem_ra[2:0]];

    assign dc[8:0] =          block_mem_o[8:0];
    assign ctype =            block_mem_o[9];
    assign ts[2:0] =          block_mem_o[12:10];
    assign coring_sel[2:0] =  block_mem_o[15:13];

    assign start_a = start[5];
    assign start_z = start[4];
    assign dcc_stb = start[2];
    assign ds = ds_r[2];
    assign dv = ren[3];
    always @ (posedge clk) begin
        if (stb) block_mem_ram[block_mem_wa[2:0]] <= {coring_num[2:0],tsi[2:0], ctypei, dci[8:0]};

        if      (!en) block_mem_wa[2:0] <= 3'h0;
        else if (stb) block_mem_wa[2:0] <= block_mem_wa[2:0] +1;

        if (stb && first_stb)  block_mem_wa_save[2:0] <= block_mem_wa[2:0];

        if      (!en)       block_mem_ra[2:0] <= 3'h0;
        else if (pre_start) block_mem_ra[2:0] <= first_in?block_mem_wa_save[2:0]:(block_mem_ra[2:0] +1);
    end
 
    assign        d2_dct[10:0]={!d2[11] ^ ctype_prev[0], d2[9:0]}; 

    assign        dcc_data[15:0]=sel_satnum?
                    {n255[7:0],n000[7:0]}:
                    {dcc_first || (!dcc_Y && dcc_acc[12]) ,(!dcc_Y && dcc_acc[12]), (!dcc_Y && dcc_acc[12]), dcc_acc[12:0]};
    assign        qmul[27:0]=tdor[15:0]*d3[11:0];

    assign         start_out =   zwe && (zwa[5:0]== 6'h3f);   //adjust?
    assign         copy_dc_tdo = zwe && (zwa[5:0]== 6'h37);   // not critical

    always @ (posedge clk) begin
        d1[12:0]      <= di[12:0];
//inv_sign
        dc1[8:0] <= start[0]?dc[8:0]:9'b0;   // sync to d1[8:0]ctype valid at start, not later
        d2[12:0] <= {dc1[8],dc1[8:0],3'b0} + d1[12:0];
        d3[12]   <= d2[12];
        d3[11:0] <= d2[12]? -d2[11:0]:d2[11:0];

        if (start[0] || !en) tba[9:6] <= {ts[2:0],ctype};
      
/// TODO - make sure ctype switches at needed time (compensate if needed) *****************************************
        if (start[3] || !en) tbac[3:0] <= {coring_sel[2:0],ctype}; // table number to use

        if      (start[0])        tba[5:0] <= 6'b0;
        else if (tba[5:0]!=6'h3f) tba[5:0] <= tba[5:0]+1;
        
        tdor[15:0]  <= tdo[15:0]; // registered table data out
        
        if (start[3])  pre_dc_tdo[15:0] <= tdor[15:0]; //16-bit q. tables)
        
        if (copy_dc_tdo) dc_tdo[15:0]     <= pre_dc_tdo[15:0];
        
        qmulr[19:0] <= qmul[27:8]; // absolute value
        qmulr[20]   <= d3[12];     // sign
        qdo0[12]    <= qmulr[20];  // sign
      
// tdco[3:0] - same timing as qdo0;      
// use lookup table from 8 bits of absolute value (4.4 - 4 fractional) to calculate 4 bit coring output that would replace output
// if input is less thahn 16. For larger values the true rounding will be used.

// Absolute values here have quantization coefficients already applied, so we can use the same coring table for all DCT coefficients.
// there are be 16 tables - 8 Y/C pairs to switch
        qdo0[11:0]  <= qmulr[19:8] + qmulr[7]; // true rounding of the absolute value 
        coring_range<= !(|qmulr[19:12]) && !(&qmulr[11:7]) ; // valid with qdo0
        qdo[11:0]   <= coring_range? (qdo0[12]?-{8'h0,tdco[3:0]}:{8'h0,tdco[3:0]}):(qdo0[12]?-qdo0[11:0]:qdo0[11:0]);
        qdo[12]     <= qdo0[12] && (!coring_range || (tdco[3:0]!=4'h0)); 

        if (start_out)    rpage <= wpage;

//        last_dv <= {last_dv[1:0], en && (zra[5:0] == 6'h3f)};
        
        if (start_out)    zra[5:0] <= 6'b0;
//        else if (zra[5:0]!=6'h3f)   zra[5:0] <= zra[5:0]+1; // conserving energy
        else if (ren[0])  zra[5:0] <= zra[5:0]+1; // conserving energy
        
        ds_r    <= {ds_r[1:0], en && start_out};
        
        if      (!en)                 ren[0] <= 0;
        else if (start_out)           ren[0] <= 1;
        else if ((zra[5:0] == 6'h3f)) ren[0] <= 0;
        
        if      (!en)                 ren[3:1] <= 0;
        else                          ren[3:1] <= ren [2:0]; 
        
        if (ren[2])                   dout[12:0] <= zigzag_q[12:0];
        
        if (start_a)   first_interm <= first_in;
        if (start_out) first_out    <=first_interm;
// zwe???
        zwe <= en && (start_a || (zwe && (zwa[5:0]!=6'h3f)));
        if          (!en) wpage <= 1'b0;
        else if (start_a) wpage <= ~wpage;
    end


    always @ (posedge clk) begin
        sel_satnum <= dcc_run && (start[0]? (ctype_prev[1:0]==2'b10): sel_satnum);
        
        hfc_copy <= dcc_run && (hfc_sel[2:0]!=3'h7) && (tba[5:0]==6'h1f) && ctype_prev[0] && ctype_prev[1];
        
        start[5:0] <= {start[4:0], pre_start}; // needed?
        
        if    (!dcc_en) dcc_run <= 1'b0;
        else if (start[0]) dcc_run <= 1'b1;
        
        if (!dcc_en)    ctype_prev[1:0] <= 2'b11;
        else if (start[0]) ctype_prev[1:0] <= {ctype_prev[0],ctype && dcc_run}; 
        
        if (dcc_stb || hfc_copy) dcc_acc[12:0] <= hfc_copy?
                                                hfc_acc[12:0]:
                                               {(d2_dct[10]&&ctype_prev[0]),(d2_dct[10]&&ctype_prev[0]),d2_dct[10:0]}+((ctype_prev[0] || ctype_prev[1])?13'h0:dcc_acc[12:0]);
                                               
        if (!dcc_run || hfc_copy) hfc_acc <=13'b0;
        else if (hfc_en) hfc_acc <= hfc_acc + {2'b0, d3[10:0]};
        
        if (dcc_stb) dcc_first <= color_first && dcc_run && dcc_stb && ctype && !ctype_prev[0];
        
        if (dcc_stb) dcc_Y <= dcc_run && dcc_stb && ctype && !ctype_prev[0];
        
        dcc_vld <= (dcc_run && dcc_stb && (ctype || ctype_prev[0] || sel_satnum)) || hfc_copy;
    end
    
    wire          twqe;
    wire          twce;
    wire  [15:0]  tdi;
    wire  [22:0]  ta;
    

    table_ad_receive #( // here may be changed to 8-bit from 16-bit
        .MODE_16_BITS (1),
        .NUM_CHN      (2)
    ) table_ad_receive_i (
        .clk       (mclk),              // input
        .a_not_d   (tser_a_not_d),      // input
        .ser_d     (tser_d),            // input[7:0] 
        .dv        ({tser_ce,tser_qe}), // input[1:0] 
        .ta        (ta), // output[22:0] 
        .td        (tdi), // output[15:0] 
        .twe       ({twce,twqe}) // output[1:0] 
    );


//    SRL16 i_hfc_en (.Q(hfc_en), .A0(1'b1), .A1(1'b0), .A2(1'b0), .A3(1'b0), .CLK(clk),
//                    .D(((tba[2:0]>hfc_sel[2:0]) || (tba[5:3]>hfc_sel[2:0])) && dcc_run && !ctype_prev[0])); // dly=1+1
    dly_16 #(.WIDTH(1)) i_hfc_en (
        .clk(clk),
        .rst(1'b0),
        .dly(4'd1),
        .din(((tba[2:0]>hfc_sel[2:0]) || (tba[5:3]>hfc_sel[2:0])) && dcc_run && !ctype_prev[0]),
        .dout(hfc_en));   // dly=1+1

    zigzag393 i_zigzag(   .clk(clk),
                     .start(start_z),
                      .q(zwa[5:0]));

    // All memories below are non-registered, see if they can be made registered
    ram18_var_w_var_r #(
        .REGISTERS    (0),
        .LOG2WIDTH_WR (4),
        .LOG2WIDTH_RD (4),
        .DUMMY        (0)
`ifdef PRELOAD_BRAMS
    `include "includes/quantization_100.dat.vh"
`endif
    ) i_quant_table (
        .rclk         (clk),                          // input
        .raddr        ({tba[9:6],tba[2:0],tba[5:3]}), // input[8:0] 
        .ren          (1'b1),                         // input
        .regen        (1'b1),                         // input
        .data_out     (tdo[15:0]),                    // output[15:0] 
        .wclk         (mclk),                         // input
        .waddr        (ta[9:0]),                      // input[8:0] 
        .we           (twqe),                         // input
        .web          (4'hf),                         // input[3:0] 
        .data_in      (tdi[15:0])                     // input[15:0] 
    );

    ram18_var_w_var_r #(
        .REGISTERS    (0),
        .LOG2WIDTH_WR (4),
        .LOG2WIDTH_RD (2),
        .DUMMY        (0)
`ifdef PRELOAD_BRAMS
    `include "includes/coring.dat.vh"
`endif
    ) i_coring_table (
        .rclk         (clk), // input
        .raddr        ({tbac[3:0],qmulr[11:4]}), // input[10:0] 
        .ren          (1'b1),                    // input
        .regen        (1'b1),                    // input
        .data_out     (tdco[3:0]),               // output[3:0] 
        .wclk         (mclk),                    // input
        .waddr        (ta[9:0]),                 // input[9:0] 
        .we           (twce),                    // input
        .web          (4'hf),                    // input[3:0] 
        .data_in      (tdi[15:0])                // input[15:0] 
    );

    ram18_var_w_var_r #(
        .REGISTERS    (1),
        .LOG2WIDTH_WR (4),
        .LOG2WIDTH_RD (4),
        .DUMMY        (0)
    ) i_zigzagbuf (
        .rclk         (clk),                     // input
        .raddr        ({3'b0,rpage,zra[5:0]}),   // input[9:0] 
        .ren          (ren[0]),                  // input
        .regen        (ren[1]),                  // input
        .data_out     (zigzag_q[15:0]),          // output[15:0] 
        .wclk         (clk),                     // input
        .waddr        ({3'b0,wpage,zwa[5:0]}),   // input[9:0] 
        .we           (zwe),                     // input
        .web          (4'hf),                    // input[3:0] 
        .data_in      ({3'b0,qdo[12:0]})         // input[15:0] 
    );


endmodule

module zigzag393 (
    input            clk,           // system clock, posedge
    input            start,
    output reg [5:0] q);

    reg        [5:0] a;
    wire      [ 4:0] rom_a;
    reg       [ 5:0] rom_q;

    assign   rom_a[4:0]=a[5]?(~a[4:0]):a[4:0];

    always @ (posedge clk) begin
        if (start)   a[5:0] <= 6'b0;
        else   if (a[5:0]!=6'h3f) a[5:0] <= a[5:0]+1;
    end

    // ROM (combinatorial)
    always @(rom_a) case (rom_a)
        5'h00: rom_q <= 6'h00;
        5'h01: rom_q <= 6'h02;
        5'h02: rom_q <= 6'h03;
        5'h03: rom_q <= 6'h09;
        5'h04: rom_q <= 6'h0a;
        5'h05: rom_q <= 6'h14;
        5'h06: rom_q <= 6'h15;
        5'h07: rom_q <= 6'h23;
        5'h08: rom_q <= 6'h01;
        5'h09: rom_q <= 6'h04;
        5'h0a: rom_q <= 6'h08;
        5'h0b: rom_q <= 6'h0b;
        5'h0c: rom_q <= 6'h13;
        5'h0d: rom_q <= 6'h16;
        5'h0e: rom_q <= 6'h22;
        5'h0f: rom_q <= 6'h24;
        5'h10: rom_q <= 6'h05;
        5'h11: rom_q <= 6'h07;
        5'h12: rom_q <= 6'h0c;
        5'h13: rom_q <= 6'h12;
        5'h14: rom_q <= 6'h17;
        5'h15: rom_q <= 6'h21;
        5'h16: rom_q <= 6'h25;
        5'h17: rom_q <= 6'h30;
        5'h18: rom_q <= 6'h06;
        5'h19: rom_q <= 6'h0d;
        5'h1a: rom_q <= 6'h11;
        5'h1b: rom_q <= 6'h18;
        5'h1c: rom_q <= 6'h20;
        5'h1d: rom_q <= 6'h26;
        5'h1e: rom_q <= 6'h2f;
        5'h1f: rom_q <= 6'h31;
    endcase
    // add symmetrical part
    always @ (posedge clk) q[5:0]   <= a[5]? (~rom_q[5:0]):rom_q[5:0];
endmodule

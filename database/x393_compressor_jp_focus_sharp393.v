// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>focus_sharp393
 * @file focus_sharp393.v
 * @author Andrey Filippov     
 *
 * @brief Module to determine focus sharpness on  by integrating
 * DCT coefficient, multiplied my 8x8 array and squared
 *
 * @copyright Copyright (c) 2008-2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * focus_sharp393.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * focus_sharp393.v is distributed in the hope that it will be useful,
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
// TODO: Modify to work with other modes (now only on color)
// NOTE: when removing clk2x, temporarily use clk here, just keep mode ==0 (disabled)
module focus_sharp393(
    input             clk,          // pixel clock, posedge
    input             clk2x,        // 2x pixel clock
    input             en,           // enable (0 resets)
    input             mclk,         // system clock to write tables
    input             tser_we,      // enable write to a  table
    input             tser_a_not_d, // address/not data distributed to submodules
    input      [ 7:0] tser_d,       // byte-wide serialized tables address/data to submodules
    input      [ 1:0] mode,         // focus mode (combine image with focus info) - 0 - none, 1 - replace, 2 - combine all,  3 - combine woi
    input             firsti,       // first macroblock
    input             lasti,        // last macroblock
    input      [ 2:0] tni,          // block number in a macronblock - 0..3 - Y, >=4 - color (sync to stb)
    input             stb,          // strobe that writes ctypei, dci
    input             start,        // marks first input pixel (needs 1 cycle delay from previous DCT stage)
    input      [12:0] di,           // [11:0] pixel data in (signed)
    input             quant_ds,     // quantizator ds
    input      [12:0] quant_d,      // [11:0]quantizator data output
    input      [15:0] quant_dc_tdo, // [15:0], MSB aligned coefficient for the DC component (used in focus module)
    output reg [12:0] dout,           // [11:0] pixel data out, make timing ignore (valid 1.5 clk earlier that Quantizer output)
    output reg        ds,           // data out strobe (one ahead of the start of dv)
    output reg [31:0] hifreq);      //[31:0])  //  accumulated high frequency components in a frame sub-window

    wire   [15:0] tdo;
    reg    [ 5:0] tba;
    reg    [11:0] wnd_reg; // intermediate register
    reg           wnd_wr;  // writing window
    reg    [ 2:0] wnd_a;   // window register address
     
 // next measured in 8x8 blocks, totalwidth - write one less than needed (i.e. 511 fro the 512-wide window)
 // blocks on the border are included
    reg    [ 8:0] wnd_left;
    reg    [ 8:0] wnd_right;
    reg    [ 8:0] wnd_top;
    reg    [ 8:0] wnd_bottom;
    reg    [ 8:1] wnd_totalwidth;
    reg    [ 3:0] filt_sel0; // select filter number, 0..14 (15 used for window parameters)
    reg    [ 3:0] filt_sel;  // select filter number, 0..14 (15 used for window parameters)
    reg           stren; // strength (visualization)
    reg    [ 2:0] ic;
    reg    [ 2:0] oc;
    wire          first,last; //valid at start (with first di word), switches immediately after
    wire   [ 2:0] tn;
    reg    [39:0] acc_frame;
    reg    [12:0] pre_do;
    reg           pre_ds;
    reg           need_corr_max; // limit output by quant_dc_tdo
    reg    [11:0] fdo; // focus data output
    reg           start_d; //start delayed by 1
    reg    [ 2:0] tn_d; //tn delayed by 1

    wire          out_mono;
    wire          out_window;
    wire   [12:0] combined_qf; 
    wire   [12:0] next_do;
    wire   [12:0] fdo_minus_max;
    reg    [11:0] di_d;
    reg    [11:0] d1; 
    reg     [8:0] start2;
//    reg     [7:0] finish2;
    reg     [6:0] finish2; // bit[7] never used
    reg     [5:0] use_k_dly;
    reg    [23:0] acc_blk; // accumulator for the sum ((a[i]*d[i])^2)
    reg    [22:0] sum_blk; // accumulator for the sum ((a[i]*d[i])^2), copied at block end
    reg           acc_ldval; // value to load to acc_blk: 0 - 24'h0, 1 - 24'h7fffff
    wire          acc_clear=start2[8];
    wire          acc_add=use_k_dly[4];
    wire          acc_corr=use_k_dly[5];
    wire          acc_to_out=finish2[6];      
    wire   [17:0] mult_a;
    wire   [17:0] mult_b;
    wire   [35:0] mult_p;

    reg    [17:0] mult_s; //truncated and saturated (always positive) multiplier result (before calculating squared)
    reg           next_ac; // next will be AC component
    reg           use_coef; // use multiplier for the first operation - DCT coeff. by table elements
    reg           started_luma;// started Luma block 
    reg           luma_dc_out; // 1 cycle ahead of the luma DC component out (optionally combined with the WOI (mode=3))
    reg           luma_dc_acc; // 1 cycle ahead of the luma DC component out (always combined with the WOI)
    reg           was_last_luma;
    reg           copy_acc_frame;
    
    wire          twe;
    wire  [15:0]  tdi;
    wire  [22:0]  ta;
    
    assign        fdo_minus_max[12:0]= {1'b0,fdo[11:0]}-{1'b0,quant_dc_tdo[15:5]};
    assign        combined_qf[12:0]=stren?({quant_d[12:0]}+{1'b0,fdo[11:0]}): //original image plus positive
                                          ({quant_d[12],quant_d[12:1]}+ // half original 
                                           {fdo_minus_max[12],fdo_minus_max[12:1]}); // plus half signed
    assign        next_do[12:0] =  (mode[1:0]==2'h1)?(luma_dc_out?fdo_minus_max[12:0]:13'h0):
                                    ((mode[1] && luma_dc_out )? combined_qf[12:0]: {quant_d[12:0]} );

    always @ (posedge clk) begin
        if (!en) ic[2:0] <= 3'b0;
        else if (stb) ic[2:0] <= ic[2:0]+1;
        if (!en) oc[2:0] <= 3'b0;
        else if (start) oc[2:0] <= oc[2:0]+1;
    end

// writing window parameters in the last bank of a table     
    always @ (posedge mclk) begin
      if (twe) begin
          wnd_reg[11:0] <= tdi[11:0] ;
          wnd_a  <= ta[2:0];
        end
        wnd_wr <= twe && (ta[9:3]==7'h78) ; // first 8 location in the last 64-word bank
        if (wnd_wr) begin
            case (wnd_a[2:0])
              3'h0: wnd_left[8:0]       <= wnd_reg[11:3] ;
              3'h1: wnd_right[8:0]      <= wnd_reg[11:3] ;
              3'h2: wnd_top[8:0]        <= wnd_reg[11:3] ;
              3'h3: wnd_bottom[8:0]     <= wnd_reg[11:3] ;
              3'h4: wnd_totalwidth[8:1] <= wnd_reg[11:4] ;
              3'h5: filt_sel0[3:0]      <= wnd_reg[3:0] ;
              3'h6: stren               <= wnd_reg[0] ;
              default: begin end
            endcase
        end
     end
     
// determine if this block needs to be processed (Y, inside WOI)
     reg  [ 7:0]  mblk_hor; //horizontal macroblock (2x2 blocks) counter
     reg  [ 7:0]  mblk_vert; //vertical macroblock (2x2 blocks) counter
     wire         start_of_line= (first || (mblk_hor[7:0] == wnd_totalwidth[8:1]));
     wire         first_in_macro= (tn[2:0]==3'h0);
     reg          in_woi; // maybe specified as slow

     always @(posedge clk) begin
       if (first_in_macro && start) mblk_hor[7:0] <= start_of_line? 8'h0:(mblk_hor[7:0]+1);
       if (first_in_macro && start && start_of_line) mblk_vert[7:0] <= first? 8'h0:(mblk_vert[7:0]+1);
        start_d <= start;
        tn_d[2:0] <= tn[2:0];
        if (start_d) in_woi <= !tn_d[2] && 
                                               ({mblk_hor [7:0],tn_d[0]} >= wnd_left[8:0]) &&
                                               ({mblk_hor [7:0],tn_d[0]} <= wnd_right[8:0]) &&
                                               ({mblk_vert[7:0],tn_d[1]} >= wnd_top[8:0]) &&
                                               ({mblk_vert[7:0],tn_d[1]} <= wnd_bottom[8:0]);
     end
 
//Will use posedge sclk to balance huffman and system

//    wire clkdiv2;
//    FD i_clkdiv2(.C(clk), .D(!clkdiv2), .Q(clkdiv2));
    
    reg  clkdiv2=0;
    always @ (posedge clk) begin
        clkdiv2 <= ~clkdiv2;
    end
    
    
    reg [2:0] clksync;
    wire      csync=clksync[2];
    always @ (posedge clk2x) begin
       clksync[2:0] <= {(clksync[1]==clksync[0]),clksync[0],clkdiv2};
    end

    always @ (posedge clk) begin
        if (di[11]==di[12]) di_d[11:0] <=di[11:0];
        else di_d[11:0] <= {~di[11],{11{di[11]}}}; //saturate
    end
 
    assign       mult_a[17:0] = use_coef ? {1'b0,tdo[15:0],1'b0}: mult_s[17:0];
    assign      mult_b[17:0] = use_coef ? {d1[10:0],{7{d1[0]}}}: mult_s[17:0];

    always @ (posedge clk2x) begin
        filt_sel[3:0] <= filt_sel0[3:0];
        if (clksync[2]) d1[11:0]<=di_d[11:0];
        start2[8:0] <= {start2[7:0], start && csync};
//        finish2[7:0]<= {finish2[6:0],use_coef && !next_ac};
        finish2[6:0]<= {finish2[5:0],use_coef && !next_ac}; // finish2[7] was never used
        if      (!en || start2[0]) tba[5:0] <= 6'h0;
        else if (!csync && (tba[5:0] != 6'h3f))   tba[5:0] <= tba[5:0] + 1;
//        mult_s[17:0] <= (&mult_p[35:31] || !(&mult_p[35:31]))?mult_p[31:14]:18'h1ffff;
        mult_s[17:0] <= (&mult_p[35:31] || !(|mult_p[35:31]))?mult_p[31:14]:18'h1ffff;
        next_ac <= en && (start2[3] || (next_ac && ((tba[5:0] != 6'h3f) || csync )));
        use_coef <= next_ac && !csync;
        use_k_dly[5:0] <= {use_k_dly[4:0],use_coef};
        acc_ldval <= !(|start2[7:6]);
        if      (acc_clear || (acc_corr && acc_blk[23])) acc_blk[23:0] <= {1'b0,{23{acc_ldval}}};
        else if (acc_add)                                acc_blk[23:0] <= acc_blk[23:0] + mult_p[31:8]; // mult_p[35:8];
        if (acc_to_out) fdo[11:0] <= (|acc_blk[23:20])?12'hfff:acc_blk[19:8]; // positive, 0..0xfff
        if (acc_to_out) sum_blk[22:0] <= acc_blk[22:0]; // accumulator for the sum ((a[i]*d[i])^2), copied at block end
   end

//    acc_blk will (after corr) be always with MSB=0 - max 24'h7fffff
// for image output - max 24'h0fffff->12 bit signed, shifted
// combining output
//assign        combined_qf[12:0]={quant_d[11],quant_d[11:0]}+{fdo[11],fdo[11:0]};

//    SRL16 i_out_mono   (.Q(out_mono),   .A0(1'b1), .A1(1'b1), .A2(1'b1), .A3(1'b1), .CLK(clk), .D(started_luma)); // timing not critical
//    SRL16 i_out_window (.Q(out_window), .A0(1'b1), .A1(1'b1), .A2(1'b1), .A3(1'b1), .CLK(clk), .D(in_woi)); // timing not critical
    dly_16 #(.WIDTH(1)) i_out_mono(.clk(clk),  .rst(1'b0), .dly(4'd15), .din(started_luma), .dout(out_mono));    // timing not critical
    dly_16 #(.WIDTH(1)) i_out_window(.clk(clk),.rst(1'b0), .dly(4'd15), .din(in_woi),       .dout(out_window));    // timing not critical
    
    always @ (posedge clk) begin
        if (start) started_luma <= !tn[2];
        luma_dc_out <= quant_ds && out_mono && ((mode[1:0]!=3) || out_window);
        luma_dc_acc <= quant_ds && out_mono && out_window;
        was_last_luma <= en && last && out_mono;
        copy_acc_frame <= was_last_luma && !out_mono;
        if (first && first_in_macro) acc_frame[39:0] <= 40'h0;
        else if (luma_dc_acc)        acc_frame[39:0] <= acc_frame[39:0] + sum_blk[22:0];
        if (copy_acc_frame) hifreq[31:0] <= acc_frame[39:8];
        pre_ds <= quant_ds;
        ds <= pre_ds;
        pre_do[12:0] <= next_do[12:0];
        need_corr_max <=luma_dc_out && (mode[1:0]!=2'h0);
        dout[12:0] <= (need_corr_max && !pre_do[12] && (pre_do[11] || (pre_do[10:0]>quant_dc_tdo[15:5])) )?
                    {2'b0,quant_dc_tdo[15:5]} :
                    pre_do[12:0];
     end
     
     table_ad_receive #(
        .MODE_16_BITS (1),
        .NUM_CHN      (1)
    ) table_ad_receive_i (
        .clk       (mclk),              // input
        .a_not_d   (tser_a_not_d),      // input
        .ser_d     (tser_d),            // input[7:0] 
        .dv        (tser_we),           // input
        .ta        (ta),                // output[22:0] 
        .td        (tdi),               // output[15:0] 
        .twe       (twe)               // output
    );
     
     
/*   
   MULT18X18SIO #(
      .AREG(1), // Enable the input registers on the A port (1=on, 0=off)
      .BREG(1), // Enable the input registers on the B port (1=on, 0=off)
      .B_INPUT("DIRECT"), // B cascade input "DIRECT" or "CASCADE" 
      .PREG(1)  // Enable the input registers on the P port (1=on, 0=off)
   ) i_focus_mult (
      .BCOUT(), // 18-bit cascade output
      .P(mult_p),    // 36-bit multiplier output
      .A(mult_a),    // 18-bit multiplier input
      .B(mult_b),    // 18-bit multiplier input
      .BCIN(18'h0), // 18-bit cascade input
      .CEA(en), // Clock enable input for the A port
      .CEB(en), // Clock enable input for the B port
      .CEP(en), // Clock enable input for the P port
      .CLK(sclk), // Clock input
      .RSTA(1'b0), // Synchronous reset input for the A port
      .RSTB(1'b0), // Synchronous reset input for the B port
      .RSTP(1'b0)  // Synchronous reset input for the P port
   );
*/
    reg      [35:0] mult_p_r;
    reg      [17:0] mult_a_r;
    reg      [17:0] mult_b_r;
    assign mult_p = mult_p_r;
    always @(posedge clk2x) begin
        mult_a_r <= mult_a;
        mult_b_r <= mult_b;
        mult_p_r <= mult_a_r * mult_b_r;
    end

/*     
     RAM16X1D i_tn0    (.D(tni[0]),.DPO(tn[0]),.A0(ic[0]),.A1(ic[1]),.A2(1'b0),.A3(1'b0),.DPRA0(oc[0]),.DPRA1(oc[1]),.DPRA2(1'b0),.DPRA3(1'b0),.WCLK(clk),.WE(stb));
     RAM16X1D i_tn1    (.D(tni[1]),.DPO(tn[1]),.A0(ic[0]),.A1(ic[1]),.A2(1'b0),.A3(1'b0),.DPRA0(oc[0]),.DPRA1(oc[1]),.DPRA2(1'b0),.DPRA3(1'b0),.WCLK(clk),.WE(stb));
     RAM16X1D i_tn2    (.D(tni[2]),.DPO(tn[2]),.A0(ic[0]),.A1(ic[1]),.A2(1'b0),.A3(1'b0),.DPRA0(oc[0]),.DPRA1(oc[1]),.DPRA2(1'b0),.DPRA3(1'b0),.WCLK(clk),.WE(stb));
     RAM16X1D i_first  (.D(firsti),.DPO(first),.A0(ic[0]),.A1(ic[1]),.A2(1'b0),.A3(1'b0),.DPRA0(oc[0]),.DPRA1(oc[1]),.DPRA2(1'b0),.DPRA3(1'b0),.WCLK(clk),.WE(stb));
     RAM16X1D i_last   (.D(lasti), .DPO(last), .A0(ic[0]),.A1(ic[1]),.A2(1'b0),.A3(1'b0),.DPRA0(oc[0]),.DPRA1(oc[1]),.DPRA2(1'b0),.DPRA3(1'b0),.WCLK(clk),.WE(stb));
*/
    reg      [ 4:0] ram4[0:3];
    always @ (posedge   clk) begin
        ram4[ic[1:0]] <= {lasti,firsti,tni[2:0]};
    end
    assign {last,first,tn[2:0]} =  ram4[oc[1:0]];
// is it correct posedge sclk on rd, negedge on wr and no xclk?
/*
   RAMB16_S18_S18 i_focus_dct_tab (
      .DOA(tdo[15:0]),       // Port A 16-bit Data Output
      .DOPA(),     // Port A 2-bit Parity Output
      .ADDRA({filt_sel[3:0],tba[2:0],tba[5:3]}),   // Port A 10-bit Address Input
      .CLKA(sclk),     // Port A Clock
      .DIA(16'b0),       // Port A 16-bit Data Input
      .DIPA(2'b0),     // Port A 2-bit parity Input
      .ENA(1'b1),       // Port A RAM Enable Input
      .SSRA(1'b0),     // Port A Synchronous Set/Reset Input
      .WEA(1'b0),       // Port A Write Enable Input

      .DOB(), // Port B 16-bit Data Output
      .DOPB(),     // Port B 4-bit Parity Output
      .ADDRB({ta[9:0]}),   // Port B 2-bit Address Input
      .CLKB(!sclk),     // Port B Clock
      .DIB(tdi[15:0]),       // Port B 16-bit Data Input
      .DIPB(2'b0),     // Port-B 2-bit parity Input
      .ENB(1'b1),       // PortB RAM Enable Input
      .SSRB(1'b0),     // Port B Synchronous Set/Reset Input
      .WEB(twe)        // Port B Write Enable Input
   );
*/
    ram18_var_w_var_r #(
        .REGISTERS    (0),
        .LOG2WIDTH_WR (4),
        .LOG2WIDTH_RD (4),
        .DUMMY        (0)
`ifdef PRELOAD_BRAMS
    `include "includes/focus_filt.dat.vh"
`endif
    ) i_focus_dct_tab (
        .rclk         (clk), // input
        .raddr        ({filt_sel[3:0],tba[2:0],tba[5:3]}), // input[9:0] 
        .ren          (1'b1), // input
        .regen        (1'b1), // input
        .data_out     (tdo[15:0]), // output[31:0] 
        .wclk         (mclk), // input
        .waddr        (ta[9:0]), // input[8:0] 
        .we           (twe), // input
        .web          (4'hf), // input[3:0] 
        .data_in      (tdi[15:0]) // input[31:0] 
    );

endmodule


// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sens_histogram_snglclk
 * @file sens_histogram_snglclk.v
 * @date 2015-10-21  
 * @author Andrey Filippov     
 *
 * @brief Calculates per-color histogram over the specified rectangular region.
 *              Modified from the original sens_histogram to avoid using double
 *              frequency clock
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * sens_histogram_snglclk.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sens_histogram_snglclk.v is distributed in the hope that it will be useful,
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
`include "system_defines.vh" // just for debugging histograms 
module  sens_histogram_snglclk #(
    parameter HISTOGRAM_RAM_MODE =     "BUF32", // valid: "NOBUF" (32-bits, no buffering - now is replaced by BUF32), "BUF18", "BUF32"
    parameter HISTOGRAM_ADDR =         'h33c,
    parameter HISTOGRAM_ADDR_MASK =    'h7fe,
    parameter HISTOGRAM_LEFT_TOP =     'h0,
    parameter HISTOGRAM_WIDTH_HEIGHT = 'h1, // 1.. 2^16, 0 - use HACT
    parameter [1:0] XOR_HIST_BAYER =  2'b00,// 11 // invert bayer setting
    parameter NUM_FRAME_BITS =          4 // number of bits use for frame number 
    
`ifdef DEBUG_RING
        ,parameter DEBUG_CMD_LATENCY = 2 // SuppressThisWarning VEditor - not used
`endif        
    
)(
    input                           mrst,      // @posedge mclk, sync reset
    input                           prst,      // @posedge pclk, sync reset
    input                           pclk,   // global clock input, pixel rate (96MHz for MT9P006)
    input      [NUM_FRAME_BITS-1:0] frame_num_seq, // frame number from the command sequencer, valid at sof
    input                           sof,
    input                           eof,
    input                           hact,
    input                     [7:0] hist_di, // 8-bit pixel data
    input                     [1:0] bayer,
    input                           mclk,
    input                           hist_en,  // @mclk - gracefully enable/disable histogram
    input                           hist_rst, // @mclk - immediately disable if true
    output                          hist_rq,
    output reg [NUM_FRAME_BITS-1:0] hist_frame, // frame number matching histogram output
    input                           hist_grant,
    output                   [31:0] hist_do,
    output reg                      hist_dv,
    input                     [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                           cmd_stb      // strobe (with first byte) for the command a/d
//    , input         monochrome    // NOT supported in this implementation  - use software to sum
`ifdef DEBUG_RING       
    ,output                       debug_do, // output to the debug ring
     input                        debug_sl, // 0 - idle, (1,0) - shift, (1,1) - load // SuppressThisWarning VEditor - not used
     input                        debug_di  // input from the debug ring
`endif

);
    
    localparam HIST_WIDTH = (HISTOGRAM_RAM_MODE == "BUF18") ? 18 : 32;
    
    reg  [NUM_FRAME_BITS-1:0] hist_frame_ram[0:1]; // frame numbers (in and out)
    reg         hist_bank_write;
    
    reg   [8:0] hist_rwaddr_even; // {bayer[1], pixel}
    reg   [8:0] hist_rwaddr_odd; // {bayer[1], pixel}
    
    reg         hist_bank_read;
    
    wire          set_left_top_w;
    wire          set_width_height_w;
     
    wire    [1:0] pio_addr;
    wire   [31:0] pio_data;
    wire          pio_stb;
    
    reg    [31:0] lt_mclk;   // left+top @ posedge mclk
    reg    [31:0] wh_mclk;   // width+height @ posedge mclk
    reg    [15:0] width_m1;  // @posedge pclk
    reg    [15:0] height_m1; // @posedge pclk 
    reg    [15:0] left;      // @posedge pclk
    reg    [15:0] top;       // @posedge pclk
    
    reg           hist_en_pclk;  // @pclk - gracefully enable/disable histogram
    reg           hist_rst_pclk; // @pclk - immediately disable if true
    reg           en;
    reg           en_new; // @ pclk - enable new frame
    
    reg           en_mclk;
    
    wire          set_left_top_pclk;
    wire          set_width_height_pclk;
//    reg           pclk_sync; // CE for pclk2x, ~=pclk
    reg           odd_pix;
    
    reg     [1:0] bayer_pclk;
    
    reg     [1:0] hact_d;
    
    reg           top_margin;   // above (before) active window
    reg     [1:0] hist_done;    // @pclk single cycle
    wire          hist_done_mclk;
    reg           hist_done_mclk_d; // next cycle after hist_done_mclk (hist_bank_read valid)
    
    reg           vert_woi;     // vertically in window TESTED ACTIVE
    reg           left_margin;  // left of (before) active window
//    reg    [2:0]  woi;          // @ pclk2x - inside WOI (and delayed
    reg    [6:0]  hor_woi;      // vertically in window and delayed
    reg    [15:0] vcntr;        // vertical (line) counter
    reg    [15:0] hcntr;        // horizontal (pixel) counter
    wire          vcntr_zero_w; // vertical counter is zero
    wire          hcntr_zero_w; // horizontal counter is zero

    reg           hist_out; // some data yet to be sent out
    reg           hist_out_d;
    reg     [2:0] hist_re;
    reg           hist_re_even;
    reg           hist_re_odd;
    reg     [9:0] hist_raddr;
    reg           hist_rq_r;
    wire          hist_xfer_done_mclk; //@ mclk
    wire          hist_xfer_done; // @pclk
    reg           hist_xfer_busy; // @pclk, during histogram readout , immediately after woi (no gaps)
    reg           wait_readout;   // only used in NOBUF mode, in outher modes readout is expected to be always finished in time
    
`ifdef DEBUG_RING
    reg    [15:0] debug_line_cntr;
    reg    [15:0] debug_lines;
`endif    
    
    assign set_left_top_w =     pio_stb && (pio_addr == HISTOGRAM_LEFT_TOP );
    assign set_width_height_w = pio_stb && (pio_addr == HISTOGRAM_WIDTH_HEIGHT );
    assign vcntr_zero_w =      !(|vcntr);
    assign hcntr_zero_w =      !(|hcntr);

    assign hist_rq = hist_rq_r;
    assign hist_xfer_done_mclk = hist_out_d && !hist_out && hist_en;

    wire       line_start_w = hact && !hact_d[0]; // // tested active
    reg        pre_first_line;
    reg        frame_active; // until done
    
`ifdef DEBUG_RING
    always @ (posedge pclk) begin
        if      (sof)          debug_line_cntr <= 0;
        else if (line_start_w) debug_line_cntr <= debug_line_cntr + 1;
        
        if      (sof)          debug_lines <= debug_line_cntr;
    end
`endif
    // frame number transfer from write (pclk) to read (mclk)
    always @ (posedge pclk) if (sof)              hist_frame_ram[hist_bank_write] <= frame_num_seq;
    always @ (posedge mclk) if (hist_done_mclk_d) hist_frame <=                      hist_frame_ram[hist_bank_read];
    
    
    always @ (posedge mclk) begin
        if (set_left_top_w)     lt_mclk <= pio_data;
        if (set_width_height_w) wh_mclk <= pio_data;
    end
    
    
    always @ (posedge pclk) begin
        if (set_left_top_pclk)     {top,left} <= lt_mclk[31:0];
        if (set_width_height_pclk) {height_m1,width_m1} <= wh_mclk[31:0];
    end
    
    // process WOI
    always @ (posedge pclk) begin
        hact_d <= {hact_d[0],hact};
        if      (!en)           pre_first_line <= 0;
        else if (sof && en_new) pre_first_line <= 1;
        else if (hact)          pre_first_line <= 0;
    
        if      (!en)                         top_margin <= 0;
        else if (sof && en_new)               top_margin <= 1;
        else if (vcntr_zero_w & line_start_w) top_margin <= 0;
        
        if (!en ||(pre_first_line && !hact))  vert_woi <= 0;
        else if (vcntr_zero_w & line_start_w) vert_woi <= top_margin;
        
        hist_done[0] <= vert_woi && (eof || (vcntr_zero_w && line_start_w)); // hist done never asserted, line_start_w - active
        hist_done[1] <= hist_done[0];
        
        if   (!en || hist_done[0])            frame_active <= 0;
        else if (sof && en_new)               frame_active <= 1;
        
        
        if ((pre_first_line && !hact) || !frame_active) vcntr <= top;
        else if (line_start_w)                          vcntr <= vcntr_zero_w ? height_m1 : (vcntr - 1);
        
        if (!frame_active)                    left_margin <= 0;
        else if (!hact_d[0])                  left_margin <= 1;
        else if (hcntr_zero_w)                left_margin <= 0;

        // !hact_d[0] to limit by right margin if window is set wrong
        
        if (!vert_woi || wait_readout || !hact_d[0]) hor_woi[0] <= 0; // postpone WOI if reading out/erasing histogram (no-buffer mode)
        else if (hcntr_zero_w)                       hor_woi[0] <= left_margin && vert_woi;

        hor_woi[6:1] <= hor_woi[5:0];
        
        if      (!hact_d[0])                     hcntr <= left;
        else if (hcntr_zero_w && left_margin)    hcntr <= width_m1;
        else if (left_margin || hor_woi[0])      hcntr <= hcntr - 1;
        
        if      (!en)                            hist_bank_write <= 0;
        else  if (hist_done[0])                  hist_bank_write <= !hist_bank_write;
        
        // hist_xfer_busy to extend en
        if      (!en)                      hist_xfer_busy <= 0;
        else if (hist_xfer_done)           hist_xfer_busy <= 0;
        else if (vcntr_zero_w && vert_woi) hist_xfer_busy <= 1;
        
        hist_en_pclk <= hist_en;
        hist_rst_pclk <= hist_rst;
        
        if      (hist_rst_pclk)                               en <= 0;
        else if (hist_en_pclk)                                en <= 1;
        else if (!top_margin && !vert_woi && !hist_xfer_busy) en <= 0;
        
        en_new <= !hist_rst_pclk && hist_en_pclk;

        if (!hact && hact_d[0])      bayer_pclk[1] <= !bayer_pclk[1];
        else if (pre_first_line && !hact) bayer_pclk[1] <= XOR_HIST_BAYER[1] ^ bayer[1];

        if (!hact)                        bayer_pclk[0] <= XOR_HIST_BAYER[0] ^ bayer[0];
        else                              bayer_pclk[0] <= ~bayer_pclk[0]; 

    end
    
    reg     [6:0] memen_even;
    reg     [6:0] memen_odd;
    wire          set_ra_even = memen_even[0];
    wire          regen_even =  memen_even[2];
    wire          set_wa_even = memen_even[5];
    wire          we_even =     memen_even[6];
    wire          set_ra_odd =  memen_odd[0];
    wire          regen_odd =   memen_odd[2];
    wire          set_wa_odd =  memen_odd[5];
    wire          we_odd =      memen_odd[6];

    reg           rwen_even; // re or we
    reg           rwen_odd; // re or we

    wire    [7:0] px_d0; // px delayed to match hor_woi (2 cycles)
    wire    [7:0] px_d2; // px delayed by 2 cycles from px_d0
    wire    [7:0] px_d4; // px delayed by 2 cycles from px_d2
    wire    [7:0] px_d5; // px delayed by 1 cycle  from px_d4
    
    reg  [HIST_WIDTH -1 :0] r0;
    reg  [HIST_WIDTH -1 :0] r1;
    reg                     r1_sat; // only used in 18-bit mode
    reg  [HIST_WIDTH -1 :0] r2;
    reg  [HIST_WIDTH -1 :0] r3;
    wire [HIST_WIDTH -1 :0] hist_new_even; // data (to increment) read from the histogram memory, even pixels
    wire [HIST_WIDTH -1 :0] hist_new_odd; // data (to increment) read from the histogram memory, odd pixels
    reg               [3:0] r_load;       // load r0-r1-r2-r3 registers
    reg                     r0_sel;     // select odd/even for r0 (other option possible)
    reg                     eq_prev_prev;    // pixel equals one before previous of the same color
    wire                    eq_prev_prev_d2; // eq_prev_prev delayed by 2 clocks to select r1 source
    reg                     eq_prev;         // pixel equals  previous of the same color
    wire                    eq_prev_d3;      // eq_prev delayed by 3 clocks to select r1 source
//    wire                    start_hor_woi = hcntr_zero_w && left_margin && vert_woi;
        
    
    // hist_di is 2 cycles ahead of hor_woi
    always @(posedge pclk) begin

        if (!hist_en_pclk || !(|hor_woi)) odd_pix <= 0;
        else                              odd_pix <= ~odd_pix;
        
        if (!hist_en_pclk || !((bayer[0] ^ XOR_HIST_BAYER[0] ^ left[0])? hor_woi[1] : hor_woi[0])) memen_even[0] <= 0;
        else                                                                            memen_even[0] <= ~memen_even[0];
        
        memen_even[6:1] <= memen_even[5:0];
         
        if (!hist_en_pclk || !((bayer[0] ^ XOR_HIST_BAYER[0] ^ left[0])? hor_woi[0] : hor_woi[1])) memen_odd[0]  <= 0;
        else                                                                            memen_odd[0]  <= ~memen_odd[0];
        
        memen_odd[6:1] <= memen_odd[5:0];

        if (hor_woi[1:0] == 2'b01) hist_rwaddr_even[8] <= bayer_pclk[1];
        if (hor_woi[1:0] == 2'b01) hist_rwaddr_odd[8]  <= bayer_pclk[1];
        
        if      (set_ra_even) hist_rwaddr_even[7:0] <= px_d0;
        else if (set_wa_even) hist_rwaddr_even[7:0] <= px_d5;
            
        if      (set_ra_odd)  hist_rwaddr_odd[7:0] <= px_d0;
        else if (set_wa_odd)  hist_rwaddr_odd[7:0] <= px_d5;
        
        rwen_even <= memen_even[0] || memen_even[5];
        rwen_odd  <=  memen_odd[0] ||  memen_odd[5];
        
        r_load <= {r_load[2:0], regen_even | regen_odd};
        r0_sel <= regen_odd;
        
//        eq_prev_prev <= hor_woi[4] && (px_d4 == px_d0);
//        eq_prev <=      hor_woi[2] && (px_d2 == px_d0);

        eq_prev_prev <= hor_woi[5] && (px_d4 == px_d0);
        eq_prev <=      hor_woi[3] && (px_d2 == px_d0);

        
        if (r_load[0]) r0 <=     eq_prev_prev_d2 ? r3 : (r0_sel ? hist_new_odd : hist_new_even);
        
        if (r_load[1]) r1 <=     eq_prev_d3 ?      r2 : r0;

        if (r_load[1]) r1_sat <= eq_prev_d3 ?  (&r2) : (&r0);
        
        if (r_load[2]) r2 <=     ((HISTOGRAM_RAM_MODE != "BUF18") || !r1_sat) ?  (r1 + 1) : r1;

        if (r_load[3]) r3 <=     r2;

    end    

    // after hist_out was off, require inactive grant before sending rq
    reg en_rq_start;
    
    always @ (posedge mclk) begin
        hist_done_mclk_d <= hist_done_mclk;
        en_mclk <= en && !hist_rst;
        if      (!en_mclk)         hist_out <= 0;
        else if (hist_done_mclk_d) hist_out <= 1;
        else if (&hist_raddr)      hist_out <= 0;
        
        hist_out_d <= hist_out;
        // reset address each time new transfer is started
        if      (!hist_out)  hist_raddr <= 0;
        else if (hist_re[0]) hist_raddr <= hist_raddr + 1;
        
        // prevent starting rq if grant is still on (back-to-back)
        if      (!hist_out)   en_rq_start <= 0;
        else if (!hist_grant) en_rq_start <= 1;

        hist_rq_r <= !hist_rst & en_mclk && hist_out && !(&hist_raddr) && en_rq_start;
        
        if      (!hist_out || (&hist_raddr[7:0])) hist_re[0] <= 0;
        else if (hist_grant)                      hist_re[0] <= 1;
        
        hist_re[2:1] <= hist_re[1:0];

        if      (!hist_out || (&hist_raddr[7:0])) hist_re_even <= 0;
        else if (hist_grant && !hist_re[0])       hist_re_even <= !hist_raddr[8];
        
        if      (!hist_out || (&hist_raddr[7:0])) hist_re_odd <=  0;
        else if (hist_grant && !hist_re[0])       hist_re_odd <=  hist_raddr[8];

        if (hist_done_mclk)                                        hist_bank_read <= !hist_bank_write; // it already changed
        hist_dv <= hist_re[2];
    
    end



    
    always @ (posedge pclk) begin
        if      (!en)                                          wait_readout <= 0;
        else if (hist_xfer_done)                               wait_readout <= 0;
    
    end

`ifdef DEBUG_RING
    debug_slave #(
        .SHIFT_WIDTH       (64),
        .READ_WIDTH        (64),
        .WRITE_WIDTH       (32),
        .DEBUG_CMD_LATENCY (DEBUG_CMD_LATENCY)
    ) debug_slave_i (
        .mclk       (mclk),     // input
        .mrst       (mrst),     // input
        .debug_di   (debug_di), // input
        .debug_sl   (debug_sl), // input
        .debug_do   (debug_do), // output
        .rd_data   ({debug_lines[15:0], debug_line_cntr[15:0], width_m1[15:0],  hcntr[15:0]}), // input[31:0] 
        .wr_data    (), // output[31:0]  - not used
        .stb        () // output  - not used
    );
`endif
    
    cmd_deser #(
        .ADDR        (HISTOGRAM_ADDR),
        .ADDR_MASK   (HISTOGRAM_ADDR_MASK),
        .NUM_CYCLES  (6),
        .ADDR_WIDTH  (2),
        .DATA_WIDTH  (32),
        .ADDR1       (0),
        .ADDR_MASK1  (0),
        .ADDR2       (0),
        .ADDR_MASK2  (0)
    ) cmd_deser_sens_histogram_i (
        .rst         (1'b0), // input
        .clk         (mclk), // input
        .srst        (mrst), // input
        .ad          (cmd_ad), // input[7:0] 
        .stb         (cmd_stb), // input
        .addr        (pio_addr), // output[15:0] 
        .data        (pio_data), // output[31:0] 
        .we          (pio_stb) // output
    );
    
    dly_16 #(
        .WIDTH(8)
    ) dly_16_px_dly0_i (
        .clk  (pclk),    // input
        .rst  (prst),    // input
        .dly  (4'h2),    // input[3:0] 
        .din  (hist_di), // input[0:0] 
        .dout (px_d0)    // output[0:0] 
    );
    
    dly_16 #(
        .WIDTH(8)
    ) dly_16_px_dly2_i (
        .clk  (pclk),    // input
        .rst  (prst),    // input
        .dly  (4'h1),    // input[3:0] 
        .din  (px_d0),   // input[0:0] 
        .dout (px_d2)    // output[0:0] 
    );
    
    dly_16 #(
        .WIDTH(8)
    ) dly_16_px_dly4_i (
        .clk  (pclk),    // input
        .rst  (prst),    // input
        .dly  (4'h1),    // input[3:0] 
        .din  (px_d2),   // input[0:0] 
        .dout (px_d4)    // output[0:0] 
    );
    
    dly_16 #(
        .WIDTH(8)
    ) dly_16_px_dly5_i (
        .clk  (pclk),    // input
        .rst  (prst),    // input
        .dly  (4'h0),    // input[3:0] 
        .din  (px_d4),   // input[0:0] 
        .dout (px_d5)    // output[0:0] 
    );
    
    dly_16 #(
        .WIDTH(1)
    ) dly_16_eq_prev_prev_d2_i (
        .clk  (pclk),           // input
        .rst  (prst),           // input
        .dly  (4'h1),           // input[3:0] 
        .din  (eq_prev_prev),   // input[0:0] 
        .dout (eq_prev_prev_d2) // output[0:0] 
    );
    
    dly_16 #(
        .WIDTH(1)
    ) dly_16_eq_prev_d3_i (
        .clk  (pclk),           // input
        .rst  (prst),           // input
        .dly  (4'h2),           // input[3:0] 
        .din  (eq_prev),        // input[0:0] 
        .dout (eq_prev_d3)      // output[0:0] 
    );
    
    
    pulse_cross_clock pulse_cross_clock_lt_i (
        .rst         (mrst), // input
        .src_clk     (mclk), // input
        .dst_clk     (pclk), // input
        .in_pulse    (set_left_top_w), // input
        .out_pulse   (set_left_top_pclk),    // output
        .busy() // output
    );
    
    pulse_cross_clock pulse_cross_clock_wh_i (
        .rst         (mrst), // input
        .src_clk     (mclk), // input
        .dst_clk     (pclk), // input
        .in_pulse    (set_width_height_w), // input
        .out_pulse   (set_width_height_pclk),    // output
        .busy() // output
    );
    
    pulse_cross_clock pulse_cross_clock_hist_done_i (
        .rst         (prst), // input
        .src_clk     (pclk), // input
        .dst_clk     (mclk), // input
        .in_pulse    (hist_done[1]), // input // so hist_done[0] is over before hist_done_mclk started
        .out_pulse   (hist_done_mclk),    // output
        .busy() // output
    );

    pulse_cross_clock pulse_cross_clock_hist_xfer_done_i (
        .rst         (mrst), // input
        .src_clk     (mclk), // input
        .dst_clk     (pclk), // input
        .in_pulse    (hist_xfer_done_mclk), // input
        .out_pulse   (hist_xfer_done),    // output
        .busy() // output
    );
    //TODO:  make it double cycle in timing

    // select between 18-bit wide histogram data using a single BRAM or 2 BRAMs having full 32 bits    
    generate
        if ((HISTOGRAM_RAM_MODE=="BUF32") || (HISTOGRAM_RAM_MODE=="NOBUF"))// impossible to use a two RAMB18E1 32-bit wide
            sens_hist_ram_snglclk_32 sens_hist_ram_snglclk_32_i (
                .pclk            (pclk), // input
                .addr_a_even     ({hist_bank_write, hist_rwaddr_even}),            // input[9:0] 
                .addr_a_odd      ({hist_bank_write, hist_rwaddr_odd}),             // input[9:0] 
                .data_in_a       (r2),                                             // input[31:0] 
                .data_out_a_even (hist_new_even),                                  // output[31:0] 
                .data_out_a_odd  (hist_new_odd),                                   // output[31:0] 
                .en_a_even       (rwen_even),                                      // input
                .en_a_odd        (rwen_odd),                                       // input
                .regen_a_even    (regen_even),                                     // input
                .regen_a_odd     (regen_odd),                                      // input
                .we_a_even       (we_even),                                        // input
                .we_a_odd        (we_odd),                                         // input
                .mclk            (mclk),                                           // input
                .addr_b          ({hist_bank_read,hist_raddr[9],hist_raddr[7:0]}), // input[9:0] 
                .data_out_b      (hist_do),                                        // output[31:0] reg 
                .re_even         (hist_re_even),                                   // input
                .re_odd          (hist_re_odd)                                     // input
            );
        else if (HISTOGRAM_RAM_MODE=="BUF18")
            sens_hist_ram_snglclk_18 sens_hist_ram_snglclk_18_i (
                .pclk            (pclk), // input
                .addr_a_even     ({hist_bank_write, hist_rwaddr_even}),            // input[9:0] 
                .addr_a_odd      ({hist_bank_write, hist_rwaddr_odd}),             // input[9:0] 
                .data_in_a       (r2[17:0]),                                       // input[31:0] 
                .data_out_a_even (hist_new_even[17:0]),                            // output[31:0] 
                .data_out_a_odd  (hist_new_odd[17:0]),                             // output[31:0] 
                .en_a_even       (rwen_even),                                      // input
                .en_a_odd        (rwen_odd),                                       // input
                .regen_a_even    (regen_even),                                     // input
                .regen_a_odd     (regen_odd),                                      // input
                .we_a_even       (we_even),                                        // input
                .we_a_odd        (we_odd),                                         // input
                .mclk            (mclk),                                           // input
                .addr_b          ({hist_bank_read,hist_raddr[9],hist_raddr[7:0]}), // input[9:0] 
                .data_out_b      (hist_do),                                        // output[31:0] reg 
                .re_even         (hist_re_even),                                   // input
                .re_odd          (hist_re_odd)                                     // input
            );
        
    endgenerate

endmodule

module sens_hist_ram_snglclk_32(
    input             pclk,
    input       [9:0] addr_a_even,
    input       [9:0] addr_a_odd,
    input      [31:0] data_in_a,
    output     [31:0] data_out_a_even,
    output     [31:0] data_out_a_odd,
    input             en_a_even,
    input             en_a_odd,
    input             regen_a_even,
    input             regen_a_odd,
    input             we_a_even,
    input             we_a_odd,
    
    input             mclk,
    input       [9:0] addr_b,
    output reg [31:0] data_out_b,
    input             re_even,
    input             re_odd
);
    reg   re_even_d;
    reg   re_odd_d;
    reg   odd;
    wire [31:0] data_out_b_w_even;
    wire [31:0] data_out_b_w_odd;
    always @(posedge mclk) begin
        re_even_d <=  re_even;
        re_odd_d <=   re_odd;
//        odd <=        re_odd;
        odd <=        re_odd_d;
        data_out_b <= odd ? data_out_b_w_odd : data_out_b_w_even;
    end
    
    ramt_var_w_var_r #(
        .COMMENT("sens_hist_ram_snglclk_32_ramt_var_w_var_r_even_i"),
        .REGISTERS_A(1),
        .REGISTERS_B(1),
        .LOG2WIDTH_A(5),
        .LOG2WIDTH_B(5),
        .WRITE_MODE_A("NO_CHANGE"),
        .WRITE_MODE_B("READ_FIRST")
    ) ramt_var_w_var_r_even_i (
        .clk_a      (pclk),                                 // input
        .addr_a     (addr_a_even),                          // input[10:0] 
        .en_a       (en_a_even),                            // input
        .regen_a    (regen_a_even),                         // input
        .we_a       (we_a_even),                            // input
        .data_out_a (data_out_a_even),                      // output[15:0] 
        .data_in_a  (data_in_a),                            // input[15:0] 
        .clk_b      (mclk),                                 // input
        .addr_b     (addr_b),     // input[10:0] 
        .en_b       (re_even),                              // input
        .regen_b    (re_even_d),                            // input
        .we_b       (1'b1),                                 // input
        .data_out_b (data_out_b_w_even),                    // output[15:0] 
        .data_in_b  (32'b0)                                 // input[15:0] 
    );

    ramt_var_w_var_r #(
        .COMMENT("sens_hist_ram_snglclk_32_ramt_var_w_var_r_odd_i"),
        .REGISTERS_A(1),
        .REGISTERS_B(1),
        .LOG2WIDTH_A(5),
        .LOG2WIDTH_B(5),
        .WRITE_MODE_A("NO_CHANGE"),
        .WRITE_MODE_B("READ_FIRST")
    ) ramt_var_w_var_r_odd_i (
        .clk_a      (pclk),                                 // input
        .addr_a     (addr_a_odd),                           // input[10:0] 
        .en_a       (en_a_odd),                             // input
        .regen_a    (regen_a_odd),                          // input
        .we_a       (we_a_odd),                             // input
        .data_out_a (data_out_a_odd),                       // output[15:0] 
        .data_in_a  (data_in_a),                            // input[15:0] 
        .clk_b      (mclk),                                 // input
        .addr_b     (addr_b),                               // input[10:0] 
        .en_b       (re_odd),                               // input
        .regen_b    (re_odd_d),                             // input
        .we_b       (1'b1),                                 // input
        .data_out_b (data_out_b_w_odd),                     // output[15:0] 
        .data_in_b  (32'b0)                                 // input[15:0] 
    );

endmodule


module sens_hist_ram_snglclk_18(
    input             pclk,
    input       [9:0] addr_a_even,
    input       [9:0] addr_a_odd,
    input      [17:0] data_in_a,
    output     [17:0] data_out_a_even,
    output     [17:0] data_out_a_odd,
    input             en_a_even,
    input             en_a_odd,
    input             regen_a_even,
    input             regen_a_odd,
    input             we_a_even,
    input             we_a_odd,
    
    input             mclk,
    input       [9:0] addr_b,
    output reg [31:0] data_out_b,
    input             re_even,
    input             re_odd
);
    reg   re_even_d;
    reg   re_odd_d;
    reg   odd;
    wire [17:0] data_out_b_w_even;
    wire [17:0] data_out_b_w_odd;
    always @(posedge mclk) begin
        re_even_d <=  re_even;
        re_odd_d <=   re_odd;
        odd <=        re_odd;
        data_out_b <= {14'b0,(odd ? data_out_b_w_odd : data_out_b_w_even)};
    end
    
    ram18tp_var_w_var_r #(
        .COMMENT("sens_hist_ram_snglclk_18_ramt_var_w_var_r_even_i"),
        .REGISTERS_A(1),
        .REGISTERS_B(1),
        .LOG2WIDTH_A(4),
        .LOG2WIDTH_B(4),
        .WRITE_MODE_A("NO_CHANGE"),
        .WRITE_MODE_B("READ_FIRST")
    ) ramt_var_w_var_r_even_i (
        .clk_a      (pclk),                                 // input
        .addr_a     (addr_a_even),                          // input[10:0] 
        .en_a       (en_a_even),                            // input
        .regen_a    (regen_a_even),                         // input
        .we_a       (we_a_even),                            // input
        .data_out_a (data_out_a_even),                      // output[15:0] 
        .data_in_a  (data_in_a),                            // input[15:0] 
        .clk_b      (mclk),                                 // input
        .addr_b     (addr_b),                               // input[10:0] 
        .en_b       (re_even),                              // input
        .regen_b    (re_even_d),                            // input
        .we_b       (1'b1),                                 // input
        .data_out_b (data_out_b_w_even),                    // output[15:0] 
        .data_in_b  (18'b0)                                 // input[15:0] 
    );

    ram18tp_var_w_var_r #(
        .COMMENT("sens_hist_ram_snglclk_18_ramt_var_w_var_r_odd_i"),
        .REGISTERS_A(1),
        .REGISTERS_B(1),
        .LOG2WIDTH_A(4),
        .LOG2WIDTH_B(4),
        .WRITE_MODE_A("NO_CHANGE"),
        .WRITE_MODE_B("READ_FIRST")
    ) ramt_var_w_var_r_odd_i (
        .clk_a      (pclk),                                 // input
        .addr_a     (addr_a_odd),                           // input[10:0] 
        .en_a       (en_a_odd),                             // input
        .regen_a    (regen_a_odd),                          // input
        .we_a       (we_a_odd),                             // input
        .data_out_a (data_out_a_odd),                       // output[15:0] 
        .data_in_a  (data_in_a),                            // input[15:0] 
        .clk_b      (mclk),                                 // input
        .addr_b     (addr_b),                               // input[10:0] 
        .en_b       (re_odd),                               // input
        .regen_b    (re_odd_d),                             // input
        .we_b       (1'b1),                                 // input
        .data_out_b (data_out_b_w_odd),                     // output[15:0] 
        .data_in_b  (18'b0)                                 // input[15:0] 
    );

endmodule

module  sens_histogram_snglclk_dummy #(
    parameter NUM_FRAME_BITS =          4 // number of bits use for frame number 
)(
    output        hist_rq,
    output [NUM_FRAME_BITS-1:0] hist_frame, // frame number matching histogram output
    
    output [31:0] hist_do,
    output        hist_dv
`ifdef DEBUG_RING       
    , output debug_do,
    input    debug_di
`endif         
);
    assign         hist_rq = 0;
    assign         hist_do = 0;
    assign         hist_dv = 0;
    assign         hist_frame = 0;
`ifdef DEBUG_RING       
    assign  debug_do =  debug_di;
`endif         
    
endmodule
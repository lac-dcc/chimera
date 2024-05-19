// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sens_histogram
 * @file sens_histogram.v
 * @date 2015-05-29  
 * @author Andrey Filippov     
 *
 * @brief Calculates per-color histogram over the specified rectangular region
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * sens_histogram.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sens_histogram.v is distributed in the hope that it will be useful,
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
    // TODO: get rid of pclk2x by doubling memories (making 1 write port and 2 read ones)
    // How to erase?
    // Alternative: copy/erase to a separate buffer in the beginning/end of a frame?

module  sens_histogram #(
    parameter HISTOGRAM_RAM_MODE =     "BUF32", // "NOBUF", // valid: "NOBUF" (32-bits, no buffering), "BUF18", "BUF32"
    parameter HISTOGRAM_ADDR =         'h33c,
    parameter HISTOGRAM_ADDR_MASK =    'h7fe,
    parameter HISTOGRAM_LEFT_TOP =     'h0,
    parameter HISTOGRAM_WIDTH_HEIGHT = 'h1, // 1.. 2^16, 0 - use HACT
    parameter [1:0] XOR_HIST_BAYER =  2'b00// 11 // invert bayer setting
`ifdef DEBUG_RING
        ,parameter DEBUG_CMD_LATENCY = 2 // SuppressThisWarning VEditor - not used
`endif        
    
)(
    input         mrst,      // @posedge mclk, sync reset
    input         prst,      // @posedge pclk, sync reset
    input         pclk,   // global clock input, pixel rate (96MHz for MT9P006)
    input         pclk2x,
    input         sof,
    input         eof,
    input         hact,
    input   [7:0] hist_di, // 8-bit pixel data
    input   [1:0] bayer,
    input         mclk,
    input         hist_en,  // @mclk - gracefully enable/disable histogram
    input         hist_rst, // @mclk - immediately disable if true
    output        hist_rq,
    input         hist_grant,
    output [31:0] hist_do,
    output        hist_dv,
    input   [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input         cmd_stb,      // strobe (with first byte) for the command a/d
    input         monochrome    // tie to 0 to reduce hardware
`ifdef DEBUG_RING       
    ,output                       debug_do, // output to the debug ring
     input                        debug_sl, // 0 - idle, (1,0) - shift, (1,1) - load // SuppressThisWarning VEditor - not used
     input                        debug_di  // input from the debug ring
`endif         
);

    localparam PXD_2X_LATENCY = 2;
    reg         hist_bank_pclk;
    
//    reg   [7:0] hist_d;
    reg   [9:0] hist_addr;
    reg   [9:0] hist_addr_d;
    reg   [9:0] hist_addr_d2;
    reg   [9:0] hist_rwaddr;
    
    reg  [31:0] to_inc; // multiplexed, registered (either from memory or from previously incremented/saturated value)
//    wire [31:0] inc_w; // (before register)
    reg  [31:0] inc_r;  // incremented value, registered
    reg  [31:0] inc_sat; // inc_r registered and possibly saturated (in 18-bit mode), just registered in 32-bit mode) 
    wire [31:0] hist_new;
    reg         hist_rwen;  // read/write enable
//    reg   [2:0] hist_regen; // bram output register enable: [0] - ren, [1] - regen, [2] - next after regen
    reg   [1:0] hist_regen; // bram output register enable: [0] - ren, [1] - regen, [2] - next after regen
    reg         hist_we;    // bram write enable
    reg         hist_bank_mclk;
    
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
    reg           pclk_sync; // CE for pclk2x, ~=pclk
    
    reg     [1:0] bayer_pclk;
    
    reg     [1:0] hact_d;
    
    reg           top_margin;   // above (before) active window
    reg           hist_done;    // @pclk single cycle
    wire          hist_done_mclk;
    reg           vert_woi;     // vertically in window TESTED ACTIVE
    reg           left_margin;  // left of (before) active window
    reg    [2:0]  woi;          // @ pclk2x - inside WOI (and delayed
    reg           hor_woi;      // vertically in window
    reg    [15:0] vcntr;        // vertical (line) counter
    reg    [15:0] hcntr;        // horizontal (pixel) counter
    wire          vcntr_zero_w; // vertical counter is zero
    wire          hcntr_zero_w; // horizontal counter is zero
    reg           same_addr1; // @pclk2x - current histogram address is the same as previous (it was different color, but for future monochrome?)
    reg           same_addr2; // @pclk2x - current histogram address is the same as before-previous (previous was different color)
    

    reg           hist_out; // some data yet to be sent out
    reg           hist_out_d;
    reg     [2:0] hist_re;
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
//    assign inc_w =             to_inc+1;

    assign hist_rq = hist_rq_r;
    assign hist_dv = hist_re[2];
    assign hist_xfer_done_mclk = hist_out_d && !hist_out && hist_en;

//AF2015-new mod
    wire       line_start_w = hact && !hact_d[0]; // // tested active
    reg        pre_first_line;
    reg        frame_active; // until done
    reg        hist_en_pclk2x;
//    reg        hist_rst_pclk2x;
    
    wire       hlstart;      // histogram line start @ posedge pclk2x
    reg  [7:0] pxd_ram [0:15] ; // crossing clock boundary
    reg  [1:0] bayer_ram [0:15] ; // crossing clock boundary
    reg  [0:0] woi_ram [0:15] ; // horizontal WOI to pclk2x
    reg  [3:0] pxd_wa;
    reg  [3:0] pxd_wa_woi;
    reg  [3:0] pxd_ra;
    reg  [3:0] pxd_ra_start; // start value of the pxd_ra counter to account for left margin
    
//    reg  [1:0] bayer_pclk;
    wire [1:0] bayer_2x = bayer_ram[pxd_ra];
    wire [7:0] pxd_2x   = pxd_ram[pxd_ra];
    wire       hor_woi_2x=woi_ram[pxd_ra];
    reg        monochrome_pclk;
    reg        monochrome_2x;
    
`ifdef DEBUG_RING
    always @ (posedge pclk) begin
        if      (sof)          debug_line_cntr <= 0;
        else if (line_start_w) debug_line_cntr <= debug_line_cntr + 1;
        
        if      (sof)          debug_lines <= debug_line_cntr;
    end
`endif    
    
    always @ (posedge pclk) begin
        if (!hact) pxd_wa <= 0;
        else pxd_wa <= pxd_wa + 1;
        
        if (!hact) pxd_wa_woi <= -PXD_2X_LATENCY;
        else       pxd_wa_woi <= pxd_wa_woi + 1;
        
        if (hist_en_pclk && hact)      pxd_ram[pxd_wa] <= hist_di;
        if (hist_en_pclk && hact)      bayer_ram[pxd_wa] <= bayer_pclk;
        if (hist_en_pclk && hact_d[1]) woi_ram[pxd_wa_woi] <= hor_woi;          // PXD_2X_LATENCY;
        
    end
    
    
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
        
        hist_done <= vert_woi && (eof || (vcntr_zero_w && line_start_w)); // hist done never asserted, line_start_w - active
        
        if   (!en || hist_done)               frame_active <= 0;
        else if (sof && en_new)               frame_active <= 1;
        
        
        if ((pre_first_line && !hact) || !frame_active) vcntr <= top;
        else if (line_start_w)                          vcntr <= vcntr_zero_w ? height_m1 : (vcntr - 1);
        
        if (!frame_active)                    left_margin <= 0;
        else if (!hact_d[0])                  left_margin <= 1;
        else if (hcntr_zero_w)                left_margin <= 0;

        // !hact_d[0] to limit by right margin if window is set wrong
        if (!vert_woi || wait_readout || !hact_d[0]) hor_woi <= 0; // postpone WOI if reading out/erasing histogram (no-buffer mode)
        else if (hcntr_zero_w)                       hor_woi <= left_margin && vert_woi;
        
        if      (!hact_d[0])                  hcntr <= left;
        else if (hcntr_zero_w && left_margin) hcntr <= width_m1;
        else if (left_margin || hor_woi)      hcntr <= hcntr - 1;
        
        if      (!en)                                          hist_bank_pclk <= 0;
        else if (hist_done && (HISTOGRAM_RAM_MODE != "NOBUF")) hist_bank_pclk <= !hist_bank_pclk;
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

        if      (monochrome_pclk)         bayer_pclk[1] <= 0;
        else if (!hact && hact_d[0])      bayer_pclk[1] <= !bayer_pclk[1];
        else if (pre_first_line && !hact) bayer_pclk[1] <= XOR_HIST_BAYER[1] ^ bayer[1];

        if      (monochrome_pclk)         bayer_pclk[0] <= 0;
        else if (!hact)                   bayer_pclk[0] <= XOR_HIST_BAYER[0] ^ bayer[0];
        else                              bayer_pclk[0] <= ~bayer_pclk[0]; 

    end

    always @(posedge pclk2x) begin
        monochrome_2x <= monochrome;
        hist_en_pclk2x <= hist_en;
        pxd_ra_start <= left[3:0];
        
        if (!hist_en_pclk2x || hlstart || !(hor_woi_2x || (|woi)))  pclk_sync <= 0;
        else                                                        pclk_sync <= ~pclk_sync;
        
        if (hlstart)        pxd_ra <= pxd_ra_start;
        else if (pclk_sync) pxd_ra <= pxd_ra + 1;
        
    end
    


    always @(posedge pclk2x) begin
        if (pclk_sync)  begin
            woi <= {woi[1:0],hor_woi_2x};
            hist_addr <= {bayer_2x,pxd_2x};
            hist_addr_d <= hist_addr;
            hist_addr_d2 <= hist_addr_d;
            same_addr1 <= monochrome_2x && woi[0] && woi[1] && (hist_addr_d  == hist_addr); // reduce hardware if hard-wire to gnd
            same_addr2 <=                  woi[0] && woi[2] && (hist_addr_d2 == hist_addr);
            if      (same_addr1) to_inc <= inc_r; // only used in monochrome mode
            else if (same_addr2) to_inc <= inc_sat;
            else                 to_inc <= hist_new;
            
            if      (HISTOGRAM_RAM_MODE != "BUF18")  inc_sat <= inc_r;
            else if (inc_r[18])                      inc_sat <= 32'h3fff; // maximal value
            else                                     inc_sat <= {14'b0,inc_r[17:0]};
        end
        hist_rwen <= (woi[0] & ~pclk_sync) || (woi[2] & pclk_sync);
        hist_regen <= {hist_regen[0], woi[0] & ~pclk_sync};
        hist_we <= woi[2] & pclk_sync;
        
        if     (woi[0] & ~pclk_sync) hist_rwaddr <= hist_addr;
        else if (woi[2] & pclk_sync) hist_rwaddr <= hist_addr_d2;
        
        inc_r <= to_inc + 1;
        
    end
    // after hist_out was off, require inactive grant before sending rq
    reg en_rq_start;
    
    always @ (posedge mclk) begin
        en_mclk <= en;
//        monochrome_pclk <= monochrome;
        if      (!en_mclk)       hist_out <= 0;
        else if (hist_done_mclk) hist_out <= 1;
        else if (&hist_raddr)    hist_out <= 0;
        
        hist_out_d <= hist_out;
        // reset address each time new transfer is started
        if      (!hist_out)  hist_raddr <= 0;
        else if (hist_re[0]) hist_raddr <= hist_raddr + 1;
        
// prevent starting rq if grant is still on (back-to-back)
        if      (!hist_out)   en_rq_start <= 0;
        else if (!hist_grant) en_rq_start <= 1;
        hist_rq_r <= en_mclk && hist_out && !(&hist_raddr) && en_rq_start;
        
        if      (!hist_out || (&hist_raddr[7:0])) hist_re[0] <= 0;
        else if (hist_grant && hist_out)          hist_re[0] <= 1;
        
        hist_re[2:1] <= hist_re[1:0];
        
        if      (!en_mclk)                                               hist_bank_mclk <= 0;
        else if (hist_xfer_done_mclk && (HISTOGRAM_RAM_MODE != "NOBUF")) hist_bank_mclk <= !hist_bank_mclk;
    
    end
    
    always @ (posedge pclk) begin
        if      (!en)                                          wait_readout <= 0;
        else if ((HISTOGRAM_RAM_MODE == "NOBUF") && hist_done) wait_readout <= 1;
        else if (hist_xfer_done)                               wait_readout <= 0;
    
        monochrome_pclk <= monochrome;
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

    pulse_cross_clock pulse_cross_clock_hlstart_start_i (
        .rst         (prst), // input
        .src_clk     (pclk), // input
        .dst_clk     (pclk2x), // input
        .in_pulse    (hcntr_zero_w && left_margin && hact_d[0]), // input
        .out_pulse   (hlstart),    // output
        .busy() // output
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
        .in_pulse    (hist_done), // input
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
        if (HISTOGRAM_RAM_MODE=="BUF32")
            sens_hist_ram_double sens_hist_ram_i (
                .pclk2x     (pclk2x), // input
                .addr_a     ({hist_bank_pclk,hist_rwaddr[9:0]}), // input[10:0] 
                .data_in_a  (inc_sat),         // input[31:0] 
                .data_out_a (hist_new),      // output[31:0] 
                .en_a       (hist_rwen),     // input
                .regen_a    (hist_regen[1]), // input
                .we_a       (hist_we),       // input
                .mclk       (mclk),          // input
                .addr_b     ({hist_bank_mclk,hist_raddr[9:0]}), // input[10:0] 
                .data_out_b (hist_do),       // output[31:0] 
                .re_b       (hist_re[0]),    // input
                .regen_b    (hist_re[1])     // input
            );
        else if (HISTOGRAM_RAM_MODE=="BUF18")
            sens_hist_ram_single sens_hist_ram_i (
                .pclk2x     (pclk2x), // input
                .addr_a     ({hist_bank_pclk,hist_rwaddr[9:0]}), // input[10:0] 
                .data_in_a  (inc_sat),      // input[31:0] 
                .data_out_a (hist_new),   // output[31:0] 
                .en_a       (hist_rwen),  // input
                .regen_a    (hist_regen[1]), // input
                .we_a       (hist_we),    // input
                .mclk       (mclk),       // input
                .addr_b     ({hist_bank_mclk,hist_raddr[9:0]}), // input[10:0] 
                .data_out_b (hist_do), // output[31:0] 
                .re_b       (hist_re[0]),    // input
                .regen_b    (hist_re[1])     // input
            );
        else if (HISTOGRAM_RAM_MODE=="NOBUF")
            sens_hist_ram_nobuff sens_hist_ram_i (
                .pclk2x     (pclk2x), // input
                .addr_a     ({hist_bank_pclk,hist_rwaddr[9:0]}), // input[10:0] 
                .data_in_a  (inc_sat),      // input[31:0] 
                .data_out_a (hist_new),   // output[31:0] 
                .en_a       (hist_rwen),  // input
                .regen_a    (hist_regen[1]), // input
                .we_a       (hist_we),    // input
                .mclk       (mclk),       // input
                .addr_b     ({hist_bank_mclk,hist_raddr[9:0]}), // input[10:0] 
                .data_out_b (hist_do), // output[31:0] 
                .re_b       (hist_re[0]),    // input
                .regen_b    (hist_re[1])     // input
            );
        
    endgenerate


endmodule

module sens_hist_ram_single(
    input         pclk2x,
    input  [10:0] addr_a,
    input  [31:0] data_in_a,
    output [31:0] data_out_a,
    input         en_a,
    input         regen_a,
    input         we_a,
    
    input         mclk,
    input  [10:0] addr_b,
    output [31:0] data_out_b,
    input         re_b,
    input         regen_b
);
    wire   [17:0] data_out_a18;
    wire   [17:0] data_out_b18;
    assign data_out_b = {14'b0,data_out_b18};
    assign data_out_a = {14'b0,data_out_a18};
    ramtp_var_w_var_r #(
        .REGISTERS_A(1),
        .REGISTERS_B(1),
        .LOG2WIDTH_A(4),               // 18 bits
        .LOG2WIDTH_B(4),                // 18 bits
        .WRITE_MODE_A("NO_CHANGE"),
        .WRITE_MODE_B("READ_FIRST")
    ) ramtp_var_w_var_r_i (
        .clk_a      (pclk2x),          // input
        .addr_a     (addr_a),          // input[10:0] 
        .en_a       (en_a),            // input
        .regen_a    (regen_a),         // input
        .we_a       (we_a),            // input
        .data_out_a (data_out_a18),    // output[17:0] 
        .data_in_a  (data_in_a[17:0]), // input[17:0] 
        .clk_b      (mclk),            // input
        .addr_b     (addr_b),          // input[10:0] 
        .en_b       (re_b),            // input
        .regen_b    (regen_b),         // input
        .we_b       (1'b1),            // input
        .data_out_b (data_out_b18),    // output[17:0] 
        .data_in_b  (18'b0)            // input[17:0] 
    );
endmodule
// TODO: without ping-pong buffering as histograms are transferred to the system memory over axi master,
// it may be possible to use a single RAM block (if vertical blanking outside of selected window is sufficient)

module sens_hist_ram_double(
    input         pclk2x,
    input  [10:0] addr_a,
    input  [31:0] data_in_a,
    output [31:0] data_out_a,
    input         en_a,
    input         regen_a,
    input         we_a,
    
    input         mclk,
    input  [10:0] addr_b,
    output [31:0] data_out_b,
    input         re_b,
    input         regen_b
);
    
    ramt_var_w_var_r #(
        .REGISTERS_A(1),
        .REGISTERS_B(1),
        .LOG2WIDTH_A(4),
        .LOG2WIDTH_B(4),
        .WRITE_MODE_A("NO_CHANGE"),
        .WRITE_MODE_B("READ_FIRST")
    ) ramt_var_w_var_r_lo_i (
        .clk_a      (pclk2x),           // input
        .addr_a     (addr_a),           // input[10:0] 
        .en_a       (en_a),             // input
        .regen_a    (regen_a),          // input
        .we_a       (we_a),             // input
        .data_out_a (data_out_a[15:0]), // output[15:0] 
        .data_in_a  (data_in_a[15:0]),  // input[15:0] 
        .clk_b      (mclk),             // input
        .addr_b     (addr_b),           // input[10:0] 
        .en_b       (re_b),             // input
        .regen_b    (regen_b),          // input
        .we_b       (1'b1),             // input
        .data_out_b (data_out_b[15:0]), // output[15:0] 
        .data_in_b  (16'b0)             // input[15:0] 
    );
    
    ramt_var_w_var_r #(
        .REGISTERS_A(1),
        .REGISTERS_B(1),
        .LOG2WIDTH_A(4),
        .LOG2WIDTH_B(4),
        .WRITE_MODE_A("NO_CHANGE"),
        .WRITE_MODE_B("READ_FIRST")
    ) ramt_var_w_var_r_hi_i (
        .clk_a      (pclk2x),           // input
        .addr_a     (addr_a),           // input[10:0] 
        .en_a       (en_a),             // input
        .regen_a    (regen_a),          // input
        .we_a       (we_a),             // input
        .data_out_a (data_out_a[31:16]),// output[15:0] 
        .data_in_a  (data_in_a[31:16]), // input[15:0] 
        .clk_b      (mclk),             // input
        .addr_b     (addr_b),           // input[10:0] 
        .en_b       (re_b),             // input
        .regen_b    (regen_b),          // input
        .we_b       (1'b1),             // input
        .data_out_b (data_out_b[31:16]),// output[15:0] 
        .data_in_b  (16'b0)             // input[15:0] 
    );
endmodule

module sens_hist_ram_nobuff(
    input         pclk2x,
    input  [10:0] addr_a,
    input  [31:0] data_in_a,
    output [31:0] data_out_a,
    input         en_a,
    input         regen_a,
    input         we_a,
    
    input         mclk,
    input  [10:0] addr_b,
    output [31:0] data_out_b,
    input         re_b,
    input         regen_b
);
    
    ramt_var_w_var_r #(
        .REGISTERS_A(1),
        .REGISTERS_B(1),
        .LOG2WIDTH_A(5), // 32 bits
        .LOG2WIDTH_B(5),
        .WRITE_MODE_A("NO_CHANGE"),
        .WRITE_MODE_B("READ_FIRST")
    ) ramt_var_w_var_r_i (
        .clk_a      (pclk2x),           // input
        .addr_a     (addr_a[9:0]),      // input[10:0] 
        .en_a       (en_a),             // input
        .regen_a    (regen_a),          // input
        .we_a       (we_a),             // input
        .data_out_a (data_out_a[31:0]), // output[15:0] 
        .data_in_a  (data_in_a[31:0]),  // input[15:0] 
        .clk_b      (mclk),             // input
        .addr_b     (addr_b[9:0]),      // input[10:0] 
        .en_b       (re_b),             // input
        .regen_b    (regen_b),          // input
        .we_b       (1'b1),             // input
        .data_out_b (data_out_b[31:0]), // output[15:0] 
        .data_in_b  (32'b0)             // input[15:0] 
    );
    
endmodule

module  sens_histogram_dummy(
    output        hist_rq,
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
`ifdef DEBUG_RING       
    assign  debug_do =  debug_di;
`endif         
    
endmodule
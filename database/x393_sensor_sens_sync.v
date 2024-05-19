// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sens_sync
 * @file sens_sync.v
 * @date 2015-07-13  
 * @author Andrey Filippov     
 *
 * @brief Handle linescan mode, sensor trigger and late frame sync
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * sens_sync.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  sens_sync.v is distributed in the hope that it will be useful,
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

module  sens_sync#(
    parameter SENS_SYNC_ADDR  =     'h404,
    parameter SENS_SYNC_MASK  =     'h7fc,
    // 2 locations reserved for control/status (if they will be needed)
    parameter SENS_SYNC_MULT  =     'h2,   // relative register address to write number of frames to combine in one (minus 1, '0' - each farme)
                                           // 'hffff - disable frames generation !
    parameter SENS_SYNC_LATE  =     'h3,    // number of lines to delay late frame sync
    parameter SENS_SYNC_FBITS =     16,    // number of bits in a frame counter for linescan mode
    parameter SENS_SYNC_LBITS =     16,    // number of bits in a line counter for sof_late output (limited by eof) 
    parameter SENS_SYNC_LATE_DFLT =  4, // 15,    // number of lines to delay late frame sync
    parameter SENS_SYNC_MINBITS =    8,    // number of bits to enforce minimal frame period 
    parameter SENS_SYNC_MINPER =   130    // minimal frame period (in pclk/mclk?) 
    
)(
//    input         rst,         // global reset
    input         pclk,        // global clock input, pixel rate (96MHz for MT9P006)
    input         mclk,        // global system clock, synchronizes commands
    input         mrst,        // @mclk sync reset
    input         prst,        // @mclk sync reset
    input         en,          // @pclk enable channel (0 resets counters)
    input         sof_in,      // @pclk start of frame input, single-cycle
    input         eof_in,      // @pclk end of frame input, single-cycle (to limit sof_late
    input         hact,        // @pclk (use to count lines for delayed pulse)
    input         trigger_mode,// @mclk - 1 - triggered mode, 0 - free running mode
    input         trig_in,     // @mclk - single-cycle trigger input
    output        trig,        // @pclk trigger signal to the sensor - from trig_in until SOF 
    output reg    sof_out_pclk,// @pclk - use in the same sensor_channel module
    output        sof_out,     // @mclk - single-cycle frame sync (no delay)
    output        sof_late,    // @mclk - single-cycle frame sync (delayed)
    
    input   [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input         cmd_stb      // strobe (with first byte) for the command a/d
    
);
    localparam DATA_WIDTH = (SENS_SYNC_FBITS > SENS_SYNC_LBITS) ? SENS_SYNC_FBITS : SENS_SYNC_LBITS;
    reg [SENS_SYNC_FBITS-1:0] sub_frames_pclk = 0;                  // sub-frame number ("linescan" mode)
    reg [SENS_SYNC_LBITS-1:0] line_dly_pclk = SENS_SYNC_LATE_DFLT;  // sub-frame number ("linescan" mode)
    reg [SENS_SYNC_FBITS-1:0] sub_frames_left;  // sub-frame number ("linescan" mode)
    reg [SENS_SYNC_FBITS-1:0] lines_left;  //Number of lines left to generate sof_late
//    reg      [DATA_WIDTH-1:0] cmd_data_r;
    reg        [DATA_WIDTH:0] cmd_data_r; // 1<<16 - disable SOF
    wire               [31:0] cmd_data;
    wire                [1:0] cmd_a;
    wire                      cmd_we;
    reg                 [1:0] cmd_a_r;
    wire                      set_data_mclk;
    wire                      set_data_pclk;
    wire                      zero_frames_left;
    wire                      trig_in_pclk;
    wire                      pre_sof_out;
    reg                       hact_r; 
    wire                      hact_single;
    reg                       sof_dly; // from sof_in to sof_out;
    wire                      last_line;
    wire                      pre_sof_late;
    reg                       trigger_mode_pclk;
    reg                       en_vacts_free=1'b1; // register to allow only one vacts after trigger in triggered mode. Allows first vacts after mode is set
    reg                       overdue; // generated at camsync to bypass filtering out second vact after trigger. Needed to prevent lock-up
                             // when exposure > triger period (and trigger is operated as divide-by-2)
    reg                       trig_r;
    reg [SENS_SYNC_MINBITS-1:0] period_cntr;
    reg                       period_dly; // runnning counter to enforce > min period
    reg                       en_pclk;
    
    reg                       dis_frame_sync = 0; // @pclk disable frame sync generation (during interface set up to prevent stray fs)
    
    wire                      sof_in_masked = !dis_frame_sync && sof_in; 
    assign set_data_mclk = cmd_we && ((cmd_a == SENS_SYNC_MULT) || (cmd_a == SENS_SYNC_LATE));
    assign zero_frames_left = !(|sub_frames_left);
    assign hact_single = hact && !hact_r;
    assign last_line = !(|lines_left);
    assign pre_sof_late = sof_dly && (eof_in || (hact_single && last_line));
    assign trig = trig_r;
    assign pre_sof_out = sof_in_masked && zero_frames_left && !period_dly && (en_vacts_free || trig_r || overdue);

    always @ (posedge mclk) begin
//        if (set_data_mclk)  cmd_data_r <= cmd_data[DATA_WIDTH-1:0];
        if (set_data_mclk)  cmd_data_r <= cmd_data[DATA_WIDTH:0];
        if (set_data_mclk)  cmd_a_r <= cmd_a;
    end
    
    always @ (posedge pclk) begin
    
        en_pclk <= en;
        if (prst) begin
            sub_frames_pclk <= 0;
            dis_frame_sync <=  0;   
        end else if (set_data_pclk && (cmd_a_r == SENS_SYNC_MULT)) begin
            sub_frames_pclk <= cmd_data_r[SENS_SYNC_FBITS-1:0];
            dis_frame_sync <=  cmd_data_r[SENS_SYNC_FBITS];   
        end    
        if (set_data_pclk && (cmd_a_r == SENS_SYNC_LATE))
            line_dly_pclk <=   cmd_data_r[SENS_SYNC_LBITS-1:0];
            
        if (!en || (sof_in_masked && zero_frames_left)) sub_frames_left <= sub_frames_pclk ;
        else if (sof_in_masked)                         sub_frames_left <=  sub_frames_left - 1;
        
//        if (!en) hact_r <= hact; 
        hact_r <= hact || !en; 
        
        if (!en)               sof_dly <= 0;
        else if (pre_sof_out)  sof_dly <= 1;
        else if (pre_sof_late) sof_dly <= 0;

        else if (!sof_dly)    lines_left <= line_dly_pclk;
        else if (hact_single) lines_left <= lines_left - 1;
        
        trigger_mode_pclk <= trigger_mode; 
        
        if (!trigger_mode_pclk || !en) en_vacts_free<= 1'b1;
        else if (sof_in_masked)        en_vacts_free<= 1'b0;
        
        if (pre_sof_out || !trigger_mode_pclk) overdue <= 1'b0;
        else if (trig_in_pclk)                 overdue <= trig_r;
        
        if (!en || !trigger_mode_pclk  || sof_in_masked) trig_r <=0;
        else if (trig_in_pclk)                           trig_r <= ~trig_r;

        // enforce minimal frame period (applies to both normal and delayed pulse (Make it only in free-running mode?)
        if (!en || !(&period_cntr)) period_dly <= 0;
        else if (pre_sof_out)       period_dly <= 1;
        
        if (!period_dly) period_cntr <= SENS_SYNC_MINPER;
        else             period_cntr <= period_cntr - 1;
        
        sof_out_pclk <= pre_sof_out;
        
    end
    
    cmd_deser #(
        .ADDR        (SENS_SYNC_ADDR),
        .ADDR_MASK   (SENS_SYNC_MASK),
        .NUM_CYCLES  (6),
        .ADDR_WIDTH  (2),
        .DATA_WIDTH  (32),
        .ADDR1       (0),
        .ADDR_MASK1  (0),
        .ADDR2       (0),
        .ADDR_MASK2  (0)
    ) cmd_deser_sens_sync_i (
        .rst         (1'b0),          // input
        .clk         (mclk),          // input
        .srst        (mrst),          // input
        .ad          (cmd_ad),        // input[7:0] 
        .stb         (cmd_stb),       // input
        .addr        (cmd_a),         // output[15:0] 
        .data        (cmd_data),      // output[31:0] 
        .we          (cmd_we)         // output
    );

    // mclk -> pclk    
    pulse_cross_clock pulse_cross_clock_set_data_pclk_i (
        .rst         (mrst),           // input
        .src_clk     (mclk),          // input
        .dst_clk     (pclk),          // input
        .in_pulse    (set_data_mclk), // input
        .out_pulse   (set_data_pclk), // output
        .busy() // output
    );
    
    pulse_cross_clock pulse_cross_clock_trig_in_pclk_i (
        .rst         (!en),           // input
        .src_clk     (mclk),          // input
        .dst_clk     (pclk),          // input
        .in_pulse    (trig_in),       // input
        .out_pulse   (trig_in_pclk),  // output
        .busy() // output
    );
    
    // pclk -> mclk    
    pulse_cross_clock_orst pulse_cross_clock_sof_out_i (
        .rst         (!en_pclk),      // input
        .src_clk     (pclk),          // input
        .orst        (!en),           // input // should work even if pclk is not running
        .dst_clk     (mclk),          // input
        .in_pulse    (pre_sof_out),   // input
        .out_pulse   (sof_out),       // output
        .busy() // output
    );
    pulse_cross_clock_orst pulse_cross_clock_sof_late_i (
        .rst         (!en_pclk),      // input
        .src_clk     (pclk),          // input
        .orst        (!en),           // input // should work even if pclk is not running
        .dst_clk     (mclk),          // input
        .in_pulse    (pre_sof_late),  // input
        .out_pulse   (sof_late),      // output
        .busy() // output
    );

endmodule

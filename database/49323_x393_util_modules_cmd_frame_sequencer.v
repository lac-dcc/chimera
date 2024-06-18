// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmd_frame_sequencer
 * @file cmd_frame_sequencer.v
 * @date 2015-06-30  
 * @author Andrey Filippov     
 *
 * @brief Store/dispatch commands on per-frame basis
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmd_frame_sequencer.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmd_frame_sequencer.v is distributed in the hope that it will be useful,
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
// Comments from the x353 code:
// This command sequencer is designed (together with i2c sequencer) to provide
// pipelined operation of the sensor, FPGA pre-processor and compressor, to avoid
// requirement of resetting the circuitry and loosing several frames when the sensor
// acquisition parameters are changed (especially geometry - WOI, decimation).
// It also reduces real-time requirements to the software, as it is possible to
// program parameters related to the events several frames in the future.
//
// 
// Controller is programmed through 32 locations. Each registers but the control require two writes:
// First write - register address (AXI_WR_ADDR_BITS bits), second - register data (32 bits)
// Writing to the contol register (0x1f) resets the first/second counter so the next write will be "first"
// 0x0..0xf write directly to the frame number [3:0] modulo 16, except if you write to the frame
//          "just missed" - in that case data will go to the current frame.
// 0x10 - write seq commands to be sent ASAP
// 0x11 - write seq commands to be sent after the next frame starts 
//
// 0x1e - write seq commands to be sent after the next 14 frame start pulses
// 0x1f - control register:
//     [14] -   reset all FIFO (takes 32 clock pulses), also - stops seq until run command
//     [13:12] - 3 - run seq, 2 - stop seq , 1,0 - no change to run state
// New - [1:0] - 0: NOP, 1: clear IRQ, 2 - Clear IE, 3: set IE

module  cmd_frame_sequencer#(
    parameter CMDFRAMESEQ_ADDR=                'h780,
    parameter CMDFRAMESEQ_MASK=                'h7e0,
    parameter AXI_WR_ADDR_BITS =                14,
    parameter CMDFRAMESEQ_DEPTH =               64, // 32/64/128
    parameter CMDFRAMESEQ_ABS =                 0,
    parameter CMDFRAMESEQ_REL =                 16,
    parameter CMDFRAMESEQ_CTRL =                31,
    parameter CMDFRAMESEQ_RST_BIT =             14,
    parameter CMDFRAMESEQ_RUN_BIT =             13,
    parameter CMDFRAMESEQ_IRQ_BIT =             0 // [1:0] used
)(
    input                         mrst,
    input                         mclk, // for command/status
     // programming interface
    input                   [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                         cmd_stb,     // strobe (with first byte) for the command a/d
    // frame sync and frame number
    input                         frame_sync,  // @posedge mclk
    output                 [ 3:0] frame_no,    // @posedge mclk
    // command mux interface    
    output [AXI_WR_ADDR_BITS-1:0] waddr,   // write address, valid with wr_en_out
    output                        valid,   // output data valid 
    output                 [31:0] wdata,   // write data, valid with waddr_out and wr_en_out
    input                         ackn,    // command sequencer address/data accepted
    // Interrupt mask, status, request
    output                        is,      // interrupt status (not masked)
    output                        im       // interrupt mask
);
    localparam PNTR_WIDH = (CMDFRAMESEQ_DEPTH > 32) ?((CMDFRAMESEQ_DEPTH > 64) ? 7 : 6) : 5;
    wire                  [4:0] cmd_a;     // 3 cycles before data
    reg                   [3:0] cmd_a_r;   // 2 cycles before data
    wire                        cmd_we;    // 3 cycles befor data
    reg                   [2:0] cmd_we_r;  // cmd_we_r[2] - with cmd_data
    wire                 [31:0] cmd_data;
    
    reg                   [3:0] wpage_asap;     // FIFO page were ASAP writes go
    reg                   [3:0] wpage_prev;     // unused page, currently being cleared
    reg                   [3:0] wpage_next;     // next page to be used
    reg                   [3:0] wpage_w;        // FIFO page where current writes go 
    reg                   [1:0] wpage_inc;      // increment wpage_asap (after frame sync or during reset), and [1] next clock cycle after [0]
    
    wire                        reset_cmd;
    wire                        run_cmd;
    reg                         reset_on;       // reset FIFO in progress
    reg                         seq_enrun=0;      // enable seq
    reg                         we_fifo_wp;     // enable writing to fifo write pointer memory
    reg                         next_frame_rq;  // request to switch to the new frame page, clear pointer for the one just left
    wire                        pre_wpage_inc;
    reg         [PNTR_WIDH-1:0] fifo_wr_pointers_ram [0:15];
    wire        [PNTR_WIDH-1:0] fifo_wr_pointers_outw=fifo_wr_pointers_ram[wpage_w];
    wire        [PNTR_WIDH-1:0] fifo_wr_pointers_outr=fifo_wr_pointers_ram[page_r];
    
    reg         [PNTR_WIDH-1:0] fifo_wr_pointers_outw_r;
    reg         [PNTR_WIDH-1:0] fifo_wr_pointers_outr_r;
//    reg                         d_na;  // register counting address(0) or data(1) when writing sequences
    reg  [AXI_WR_ADDR_BITS-1:0] address_hold; // register to hold command address to write to the sequencer simultaneously with data
    wire                 [63:0] cmdseq_di = {{32 - AXI_WR_ADDR_BITS{1'b0}},address_hold,cmd_data};      // data to write to the command sequencer
    reg                   [2:0] por=0;                //power on reset
    reg                         initialized;        // command fifo initialized
    
    wire                        cmd_we_ctl_w = cmd_we && (cmd_a ==       CMDFRAMESEQ_CTRL); // 3 cycles before data
    reg                   [2:0] cmd_we_ctl_r;   // cmd_we_ctl_r[2] - with data   
    wire                        cmd_we_abs_w = cmd_we && ((cmd_a & 'h10) == CMDFRAMESEQ_ABS);  // 3 cycles before data
    reg                         cmd_we_abs_r;   // 2 cycles before data  
    wire                        cmd_we_rel_w = cmd_we && ((cmd_a & 'h10) == CMDFRAMESEQ_REL) && (cmd_a != CMDFRAMESEQ_CTRL);  // 3 cycles before data   
    reg                         cmd_we_rel_r;   // 2 cycles before data  
//    reg                         cmd_we_any_r;   // any of the abs or rel (valid 2 cycles before data)
    reg                   [2:0] data_cycle_r;      // [2] write to command memory (only with data)  
    reg                         pend_abs;       // got address in absolute mode, waiting to write data
    reg                         pend_rel;       // got address in relative mode, waiting to write data
    
    wire                        reset_seq_done;
    
    reg         [PNTR_WIDH+3:0] seq_cmd_wa;     // width of in-page pointer plus 4 (number of pages)
    wire        [PNTR_WIDH+3:0] seq_cmd_ra;     // width of in-page pointer plus 4 (number of pages)
    
    reg                   [3:0] page_r;         // FIFO page from where commands are generated
    reg                   [1:0] page_r_inc;     // increment page_r - signal and delayed version
    reg         [PNTR_WIDH-1:0] rpointer;       // FIFO read pointer for current page
    reg                   [1:0] read_busy;      // reading and sending command  
    wire                        conf_send_w;    // valid && ackn
    reg                         conf_send_r;    // valid && ackn
    
    wire                        commands_pending; // wants to send some commands
    reg                   [1:0] ren;             // 1-hot ren to BRAM, then regen to BRAM
    wire                        pre_cmd_seq_w;  // 1 cycle before starting command read/send sequence
    reg                         valid_r;

    wire                 [63:0] cmdseq_do; // output data from the sequence
    
    wire                  [1:0] irq_bits = cmd_data[CMDFRAMESEQ_IRQ_BIT +: 2];
    reg                         is_r;      // interrupt status (not masked)
    reg                         im_r;       // interrtupt mask
    wire                        irq_ctrl;
    wire                        we_seq_data;
    
    assign conf_send_w = valid && ackn;
    assign we_seq_data = data_cycle_r[2];
    
    assign is =  is_r;      // interrupt status (not masked)
    assign im =  im_r;       // interrtupt mask
    assign irq_ctrl = cmd_we_ctl_r[2] && (|irq_bits);
    
    assign waddr = cmdseq_do[32 +:AXI_WR_ADDR_BITS];
    assign wdata = cmdseq_do[31:0];
    assign seq_cmd_ra = {page_r,rpointer};
    
    
    assign frame_no = wpage_asap;
    
    assign reset_cmd = (!reset_on && cmd_we_ctl_r[2] && cmd_data[CMDFRAMESEQ_RST_BIT]) || (por[1] && !por[2]);
    assign run_cmd =   (!reset_on && cmd_we_ctl_r[2] && cmd_data[CMDFRAMESEQ_RUN_BIT]);
//    assign reset_seq_done = reset_on && wpage_inc[0] && (wpage_asap == 4'hf);
    assign reset_seq_done = reset_on && wpage_inc[0] && (&wpage_asap[3:1]); // ends after 'he 
    
//    assign pre_wpage_inc = (!cmd_we && !(|cmd_we_r) ) && (!wpage_inc[0] && !wpage_inc[1]) && ((next_frame_rq && initialized) || reset_on) ; 
    // During reset_on write pointer every cycle:
//    assign pre_wpage_inc = (!cmd_we && !(|cmd_we_r) ) && ((next_frame_rq && initialized) || reset_on) ;
    assign pre_wpage_inc = (!cmd_we && !(|cmd_we_r) ) && ((next_frame_rq && !wpage_inc[0] && initialized) || reset_on) ;
    assign commands_pending = rpointer != fifo_wr_pointers_outr_r; // only look at the current page different pages will trigger page increment first
//    assign pre_cmd_seq_w = commands_pending & ~(|page_r_inc) & seq_enrun;
//    assign pre_cmd_seq_w = commands_pending & ~(|page_r_inc) & seq_enrun && !ren[0]; // counter lags
    assign pre_cmd_seq_w = commands_pending & ~(|page_r_inc) & seq_enrun && !read_busy[0]; // counter lags
//    
    assign valid = valid_r;
    
//    parameter CMDFRAMESEQ_IRQ_BIT =             0,
//    parameter CMDFRAMESEQ_IRQ_BITS =            2
    always @ (posedge mclk) begin
        if      (mrst)                            is_r <= 0;
        else if (frame_sync)                      is_r <= 1;
        else if (irq_ctrl && (irq_bits == 2'b01)) is_r <= 0;
        
        if      (mrst)                            im_r <= 0;
        else if (irq_ctrl && irq_bits[1])         im_r <= irq_bits[0];
    end    
    
    always @ (posedge mclk) begin
        if (mrst) por <= 0;
        else      por <= {por[1:0], 1'b1};
        
        if      (mrst)      seq_enrun <= 0;
        else if (reset_cmd) seq_enrun <= 0;
        else if (run_cmd)   seq_enrun <=  cmd_data[CMDFRAMESEQ_RUN_BIT-1];
    
        if      (mrst)           initialized <= 0;
        else if (reset_seq_done) initialized <= 1;
        
//        if      (mrst)         d_na <= 0;
//        else if (cmd_we_ctl_w) d_na <= 0;
//        else if (cmd_we)       d_na <= ~ d_na;
//        else if (cmd_we_r[1])  d_na <= ~ d_na; // same cycle it is used
        
        
        if      (mrst)   valid_r <= 0;
        else if (ren[1]) valid_r <= 1;
        else if (ackn)   valid_r <= 0;
    
    end
   
    always @ (posedge mclk) begin
        cmd_a_r <=      cmd_a[3:0];
        cmd_we_ctl_r <= {cmd_we_ctl_r[1:0],cmd_we_ctl_w};
        cmd_we_r <=     {cmd_we_r[1:0], cmd_we};
        cmd_we_abs_r <= cmd_we_abs_w & ~(pend_abs | pend_rel); // only first (address) of the 2
        cmd_we_rel_r <= cmd_we_rel_w & ~(pend_abs | pend_rel); // only first (address) of the 2
//        cmd_we_any_r <= cmd_we_abs_w | cmd_we_rel_w;
        
//        if (reset_cmd || !por[1] || cmd_we_ctl_w || we_seq_data) pend_abs <= 0;
        if (reset_cmd || !por[1] || cmd_we_ctl_w || data_cycle_r[0]) pend_abs <= 0;
        else if (cmd_we_abs_w)                                       pend_abs <= 1;

//        if (reset_cmd || !por[1] || cmd_we_ctl_w || we_seq_data) pend_rel <= 0;
        if (reset_cmd || !por[1] || cmd_we_ctl_w || data_cycle_r[0]) pend_rel <= 0;
        else if (cmd_we_rel_w)                                       pend_rel <= 1;
        
        
// signals related to writing to seq FIFO
//        if (cmd_we_r[1] && !d_na) address_hold <= cmd_data[AXI_WR_ADDR_BITS-1:0];
//        if (cmd_we_r[1] && (pend_abs || pend_rel)) address_hold <= cmd_data[AXI_WR_ADDR_BITS-1:0];
        if (cmd_we_r[2] && (pend_abs || pend_rel)) address_hold <= cmd_data[AXI_WR_ADDR_BITS-1:0];
// decoded commands        
// write pointer memory
        wpage_inc <= (&por[1:0]) ? {wpage_inc[0],pre_wpage_inc} : 2'b0;

        if (reset_cmd || !por[1]) wpage_next <= 1;
        else if (wpage_inc[0])    wpage_next <= wpage_next + 1; //

        if (reset_cmd || !por[1]) wpage_asap <= 0;
        else if (wpage_inc[0])    wpage_asap <= wpage_next; // valid at cmd_we_*_r
        
        if (reset_cmd || !por[1]) wpage_prev <= 4'hf;
        else if (wpage_inc[0])    wpage_prev <= wpage_asap; // valid at cmd_we_*_r
        
        if      (!por[1])         reset_on <= 0;
        else if (reset_cmd)       reset_on <= 1;
        else if (reset_seq_done)  reset_on <= 0;
        
        if      (!por[1])         next_frame_rq <= 0;
        else if (frame_sync)      next_frame_rq <= 1;
        else if (wpage_inc[0])    next_frame_rq <= 0;
        

// now cmd_we_abs_r or cmd_we_rel_r can not happen with wpage_inc[0] - earliest at the next cycle
// BUG: cmd_a[3:0] was valid cycle before
//        if      (cmd_we_abs_r)    wpage_w <= (cmd_a[3:0] == wpage_prev)? wpage_asap : cmd_a[3:0];
//        else if (cmd_we_rel_r)    wpage_w <= wpage_asap + cmd_a[3:0];
        if      (cmd_we_abs_r)    wpage_w <= (cmd_a_r[3:0] == wpage_prev)? wpage_asap : cmd_a_r[3:0];
        else if (cmd_we_rel_r)    wpage_w <= wpage_asap + cmd_a_r[3:0];
        else if (wpage_inc[0])    wpage_w <= wpage_asap; // will now be previous (switched at the same cycle)
//BUG: Only should be active each other cycle (with data)
//        we_fifo_wp <= cmd_we_any_r[1] || wpage_inc[0];
        we_fifo_wp <= data_cycle_r[1] || wpage_inc[0];
//        data_cycle_r <=  {data_cycle_r[1:0],  cmd_we_any_r &  d_na};
//        data_cycle_r <=  {data_cycle_r[1:0],  (cmd_we_abs_w | cmd_we_rel_w) &  d_na};
//        data_cycle_r <=  {data_cycle_r[1:0],  cmd_we_abs_w &  (pend_abs | pend_rel)}; // any write command is considered second (data)
        data_cycle_r <=  {data_cycle_r[1:0],  (cmd_we_abs_w | cmd_we_rel_w) &  (pend_abs | pend_rel)}; // 
        
//        if (cmd_we_any_r[1])  fifo_wr_pointers_outw_r <= fifo_wr_pointers_outw; // register pointer RAM output (write port)
        if (data_cycle_r[1])     fifo_wr_pointers_outw_r <= fifo_wr_pointers_outw; // register pointer RAM output (write port)
        
        // write to pointer RAM (to the same address as just read from if read)
        if (we_fifo_wp) fifo_wr_pointers_ram[wpage_w] <= wpage_inc[1] ? {PNTR_WIDH{1'b0}}:(fifo_wr_pointers_outw_r + 1); 
//        if (cmd_we_any_r[1]) seq_cmd_wa <= {wpage_w, fifo_wr_pointers_outw};
        if (data_cycle_r[1])  seq_cmd_wa <= {wpage_w, fifo_wr_pointers_outw};
        
        fifo_wr_pointers_outr_r <= fifo_wr_pointers_outr; // just register write pointer for the read page 
        page_r_inc <= {page_r_inc[0],
//                      (~read_busy[0] | conf_send_r) & // not busy or will not be busy next cycle (when page_r_inc active)
                      (~read_busy[0] | conf_send_w) & // not busy or will not be busy next cycle (when page_r_inc active)
                      ~(|page_r_inc) & // read_page was not just incremented, so updated read pointer had a chance to propagate
                       (rpointer == fifo_wr_pointers_outr_r) & // nothing left in the frame FIFO pointed  page_r
                       (page_r != wpage_asap)};  // the page commands are taken from is not the ASAP (current) page
                      
        if      (!por[1] || reset_on) page_r <= 0;
        else if (page_r_inc[0])       page_r <= page_r+1;

//        if      (reset_on || reset_cmd || page_r_inc[0]) rpointer <= 0; // TODO: move to rst ?
        if      (!por[1] || reset_on || page_r_inc[0]) rpointer <= 0; // TODO: move to rst ?
        else if (ren[0])                               rpointer <= rpointer + 1;
        
        conf_send_r <= conf_send_w; // valid && ackn;

//        if (reset_on || reset_cmd) read_busy <= 0;
        if (!por[1] || reset_on) read_busy <= 0;
        else                     read_busy <= {read_busy[0],
//                                               read_busy[0]? (~conf_send_r) : pre_cmd_seq_w};
                                               read_busy[0]? (~conf_send_w) : pre_cmd_seq_w};
        ren <= {ren[0], pre_cmd_seq_w};
// TODO: check generation of the reset sequence

    end

    cmd_deser #(
        .ADDR       (CMDFRAMESEQ_ADDR),
        .ADDR_MASK  (CMDFRAMESEQ_MASK),
        .NUM_CYCLES (6),
        .ADDR_WIDTH (5),
        .DATA_WIDTH (32),
        .WE_EARLY   (3) // generate cmd_we and cmd_a three cycles before cmd_data is valid
    ) cmd_deser_32bit_i (
        .rst        (1'b0), // rst),      // input
        .clk        (mclk),     // input
        .srst       (mrst),      // input
        .ad         (cmd_ad),   // input[7:0] 
        .stb        (cmd_stb),  // input
        .addr       (cmd_a),    // output[3:0] 
        .data       (cmd_data), // output[31:0] 
        .we         (cmd_we)    // output
    );

// Generate one  x64 BRAM, 3 of x32 or 3 x64, depending on the sequnecer depth (CMDFRAMESEQ_DEPTH): 32/64/128 commands per frame
    generate
        if (CMDFRAMESEQ_DEPTH == 32) begin
            ram_var_w_var_r #(
                .COMMENT("cmd_frame_sequencer_CMDFRAMESEQ_DEPTH_32"),
                .REGISTERS(1),
                .LOG2WIDTH_WR(6),
                .LOG2WIDTH_RD(6),
                .DUMMY(0)
            ) ram_var_w_var_r_i (
                .rclk          (mclk),                   // input
//              .raddr         (seq_cmd_ra),             // input[8:0] 
                .raddr         ({seq_cmd_ra[PNTR_WIDH+3 -:4],seq_cmd_ra[4:0]}), // input[8:0] 
                .ren           (ren[0]),                 // input
                .regen         (ren[1]),                 // input
                .data_out      (cmdseq_do),              // output[63:0] 
                .wclk          (mclk),                   // input
                // VDT TODO: make conditions in generate skip parsing if condition does not match
//              .waddr         (seq_cmd_wa),             // input[8:0] 
                .waddr         ({seq_cmd_wa[PNTR_WIDH+3 -:4],seq_cmd_wa[4:0]}), // input[8:0] // just to make VDT happy
                .we            (we_seq_data),        // input
                .web           (8'hff),                  // input[7:0] 
                .data_in       (cmdseq_di)               // input[63:0] 
            );
        
        end
        else if (CMDFRAMESEQ_DEPTH == 64) begin
            ram18_var_w_var_r #(
                .REGISTERS(1),
                .LOG2WIDTH_WR(4),
                .LOG2WIDTH_RD(4),
                .DUMMY(0)
            ) ram18_var_w_var_r_dl_i (
                .rclk          (mclk), // input
//              .raddr         (seq_cmd_ra),             // input[9:0] 
                .raddr         ({seq_cmd_ra[PNTR_WIDH+3 -:4],seq_cmd_ra[5:0]}), // input[9:0] 
                .ren           (ren[0]),                 // input
                .regen         (ren[1]),                 // input
                .data_out      (cmdseq_do[15:0]),        // output[15:0] 
                .wclk          (mclk),                   // input
//              .waddr         (seq_cmd_wa),             // input[9:0] 
//                .waddr         ({seq_cmd_ra[PNTR_WIDH+3 -:4],seq_cmd_ra[5:0]}), // input[9:0] 
                .waddr         ({seq_cmd_wa[PNTR_WIDH+3 -:4],seq_cmd_wa[5:0]}), // input[9:0] 
                .we            (we_seq_data),        // input
                .web           (4'hf),                   // input[3:0] 
                .data_in       (cmdseq_di[15:0])         // input[15:0] 
            );
 
            ram18_var_w_var_r #(
                .REGISTERS(1),
                .LOG2WIDTH_WR(4),
                .LOG2WIDTH_RD(4),
                .DUMMY(0)
            ) ram18_var_w_var_r_dh_i (
                .rclk          (mclk), // input
//              .raddr         (seq_cmd_ra),             // input[9:0] 
                .raddr         ({seq_cmd_ra[PNTR_WIDH+3 -:4],seq_cmd_ra[5:0]}), // input[9:0] 
                .ren           (ren[0]),                 // input
                .regen         (ren[1]),                 // input
                .data_out      (cmdseq_do[31:16]),       // output[15:0] 
                .wclk          (mclk),                   // input
//              .waddr         (seq_cmd_wa),             // input[9:0] 
//                .waddr         ({seq_cmd_ra[PNTR_WIDH+3 -:4],seq_cmd_ra[5:0]}), // input[9:0] 
                .waddr         ({seq_cmd_wa[PNTR_WIDH+3 -:4],seq_cmd_wa[5:0]}), // input[9:0] 
                .we            (we_seq_data),        // input
                .web           (4'hf),                   // input[3:0] 
                .data_in       (cmdseq_di[31:16])        // input[15:0] 
            );

            ram18_var_w_var_r #(
                .REGISTERS(1),
                .LOG2WIDTH_WR(4),
                .LOG2WIDTH_RD(4),
                .DUMMY(0)
            ) ram18_var_w_var_r_ad_i (
                .rclk          (mclk), // input
//              .raddr         (seq_cmd_ra),             // input[9:0] 
                .raddr         ({seq_cmd_ra[PNTR_WIDH+3 -:4],seq_cmd_ra[5:0]}), // input[9:0] 
                .ren           (ren[0]),                 // input
                .regen         (ren[1]),                 // input
                .data_out      (cmdseq_do[47:32]),       // output[15:0] 
                .wclk          (mclk),                   // input
//              .waddr         (seq_cmd_wa),             // input[9:0] 
//                .waddr         ({seq_cmd_ra[PNTR_WIDH+3 -:4],seq_cmd_ra[5:0]}), // input[9:0] 
                .waddr         ({seq_cmd_wa[PNTR_WIDH+3 -:4],seq_cmd_wa[5:0]}), // input[9:0] 
                .we            (we_seq_data),        // input
                .web           (4'hf),                   // input[3:0] 
                .data_in       (cmdseq_di[47:32])        // input[15:0] 
            );
        
        end
        
        else if (CMDFRAMESEQ_DEPTH == 128)  begin
            ram_var_w_var_r #(
                .COMMENT("cmd_frame_sequencer_CMDFRAMESEQ_DEPTH_128A"),
                .REGISTERS(1),
                .LOG2WIDTH_WR(4),
                .LOG2WIDTH_RD(4),
                .DUMMY(0)
            ) ram_var_w_var_r_dl_i (
                .rclk          (mclk), // input
//              .raddr         (seq_cmd_ra),             // input[10:0] 
                .raddr         ({seq_cmd_ra[PNTR_WIDH+3 -:4],seq_cmd_ra[6:0]}), // input[10:0] 
                .ren           (ren[0]),                 // input
                .regen         (ren[1]),                 // input
                .data_out      (cmdseq_do[15:0]),        // output[15:0] 
                .wclk          (mclk),                   // input
//              .waddr         (seq_cmd_wa),             // input[9:0] 
//                .waddr         ({seq_cmd_ra[PNTR_WIDH+3 -:4],seq_cmd_ra[6:0]}), // input[10:0] 
                .waddr         ({seq_cmd_wa[PNTR_WIDH+3 -:4],seq_cmd_wa[6:0]}), // input[10:0] 
                .we            (we_seq_data),        // input
                .web           (8'hff),                  // input[7:0] 
                .data_in       (cmdseq_di[15:0])         // input[15:0] 
            );
        
            ram_var_w_var_r #(
                .COMMENT("cmd_frame_sequencer_CMDFRAMESEQ_DEPTH_128B"),
                .REGISTERS(1),
                .LOG2WIDTH_WR(4),
                .LOG2WIDTH_RD(4),
                .DUMMY(0)
            ) ram_var_w_var_r_dh_i (
                .rclk          (mclk), // input
//              .raddr         (seq_cmd_ra),             // input[10:0] 
                .raddr         ({seq_cmd_ra[PNTR_WIDH+3 -:4],seq_cmd_ra[6:0]}), // input[10:0] 
                .ren           (ren[0]),                 // input
                .regen         (ren[1]),                 // input
                .data_out      (cmdseq_do[31:16]),       // output[15:0] 
                .wclk          (mclk),                   // input
//              .waddr         (seq_cmd_wa),             // input[9:0] 
                .waddr         ({seq_cmd_ra[PNTR_WIDH+3 -:4],seq_cmd_ra[6:0]}), // input[10:0] 
                .we            (we_seq_data),        // input
                .web           (8'hff),                  // input[7:0] 
                .data_in       (cmdseq_di[31:16])        // input[15:0] 
            );
        
            ram_var_w_var_r #(
                .COMMENT("cmd_frame_sequencer_CMDFRAMESEQ_DEPTH_128C"),
                .REGISTERS(1),
                .LOG2WIDTH_WR(4),
                .LOG2WIDTH_RD(4),
                .DUMMY(0)
            ) ram_var_w_var_r_ad_i (
                .rclk          (mclk), // input
//              .raddr         (seq_cmd_ra),             // input[10:0] 
                .raddr         ({seq_cmd_ra[PNTR_WIDH+3 -:4],seq_cmd_ra[6:0]}), // input[10:0] 
                .ren           (ren[0]),                 // input
                .regen         (ren[1]),                 // input
                .data_out      (cmdseq_do[47:32]),       // output[15:0] 
                .wclk          (mclk),                   // input
//              .waddr         (seq_cmd_wa),             // input[9:0] 
                .waddr         ({seq_cmd_ra[PNTR_WIDH+3 -:4],seq_cmd_ra[6:0]}), // input[10:0] 
                .we            (we_seq_data),        // input
                .web           (8'hff),                  // input[7:0] 
                .data_in       (cmdseq_di[47:32])        // input[15:0] 
            );
        
        end
        else begin
            // cause some error - invalid CMDFRAMESEQ_DEPTH
        end
    endgenerate

endmodule


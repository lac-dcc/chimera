// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmprs_afi_mux
 * @file cmprs_afi_mux.v
 * @date 2015-06-26  
 * @author Andrey Filippov     
 *
 * @brief Writes comressor data from up to 4 channels to system memory over AXI_HP
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmprs_afi_mux.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmprs_afi_mux.v is distributed in the hope that it will be useful,
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

module  cmprs_afi_mux#(
    parameter CMPRS_AFIMUX_ADDR=                'h140, //TODO: assign valid address
    parameter CMPRS_AFIMUX_MASK=                'h7f0,
    parameter CMPRS_AFIMUX_EN=                  'h0, // enables (global and per-channel)
/*
used 10 bits, in each pair [0] - value, [1] - set (0 - nop). [7:0] - per-channel control, [9:8] - common enable/disable (independent)
*/    
    parameter CMPRS_AFIMUX_RST=                 'h1, // per-channel resets
/*
bits [3:0] - persistent per-channel reset (0 - run, 1 - reset)
 */    
    parameter CMPRS_AFIMUX_MODE=                'h2, // per-channel select - which register to return as status
/*
mode == 0 - show EOF pointer, internal
mode == 1 - show EOF pointer, confirmed
mode == 2 - show current pointer, internal
mode == 3 - show current pointer, confirmed
each group of 4 bits per channel : bits [1:0] - select, bit[2] - sset (0 - nop), bit[3] - not used
 */    
    parameter CMPRS_AFIMUX_STATUS_CNTRL=        'h4, // .. 'h7
/*
    4 consecutive locations, per-channel status control 
*/    
    parameter CMPRS_AFIMUX_SA_LEN=              'h8, // .. 'hf
/*
    27-bit "chunk" addresses and lengths. 1 chunk = 32 bytes, so 27 bit covers all 2^32 address range
     8 .. 11 - per-channel start adddresses,
    12 .. 15 - per-channel buffer lengths (will roll over to start address)
(0..3 - start addresses, 4..7 - lengths)    
*/    

    parameter CMPRS_AFIMUX_STATUS_REG_ADDR=     'h20,  //Uses 4 locations TODO: assign valid address
    parameter CMPRS_AFIMUX_WIDTH =              26, // maximal for status: currently only works with 26)
    parameter CMPRS_AFIMUX_CYCBITS =            3,
    parameter AFI_MUX_BUF_LATENCY =             4'd2  // buffers read latency from fifo_ren* to fifo_rdata* valid : 2 if no register layers are used
`ifdef DEBUG_RING
    ,parameter DEBUG_CMD_LATENCY = 2 
`endif        
    
)(
//    input                         rst,
    input                         mclk, // for command/status
    input                         hclk,   // global clock to run axi_hp @ 150MHz, shared by all compressor channels
    input                         mrst,      // @posedge mclk, sync reset
    input                         hrst,      // @posedge xclk, sync reset
    // programming interface
    input                   [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                         cmd_stb,     // strobe (with first byte) for the command a/d
    output                  [7:0] status_ad,   // status address/data - up to 5 bytes: A - {seq,status[1:0]} - status[2:9] - status[10:17] - status[18:25]
    output                        status_rq,   // input request to send status downstream
    input                         status_start, // Acknowledge of the first status packet byte (address)
    
    // compressor channel 0
    output                        fifo_rst0,      // reset FIFO (set read address to write, reset count)
    output                        fifo_ren0,
    input                  [63:0] fifo_rdata0,
//    input                         fifo_eof0,        // single rclk pulse signalling EOF
    output                        eof_written0,   // confirm frame written over AFI to the system memory (single hclk pulse)
    input                         pre_flush0,     // before last data chunk was written to FIFO
    input                         fifo_flush0,    // EOF, need to output all what is in FIFO (Stays active until enough data chunks are read)
    input                  [7:0]  fifo_count0,    // number of 32-byte chunks in FIFO

    // compressor channel 1
    output                        fifo_rst1,      // reset FIFO (set read address to write, reset count)
    output                        fifo_ren1,
    input                  [63:0] fifo_rdata1,
//    input                         fifo_eof1,        // single rclk pulse signalling EOF
    output                        eof_written1,   // confirm frame written over AFI to the system memory (single hclk pulse)
    input                         pre_flush1,     // before last data chunk was written to FIFO
    input                         fifo_flush1,    // EOF, need to output all what is in FIFO (Stays active until enough data chunks are read)
    input                  [7:0]  fifo_count1,    // number of 32-byte chunks in FIFO

    // compressor channel 2
    output                        fifo_rst2,      // reset FIFO (set read address to write, reset count)
    output                        fifo_ren2,
    input                  [63:0] fifo_rdata2,
//    input                         fifo_eof2,        // single rclk pulse signalling EOF
    output                        eof_written2,   // confirm frame written over AFI to the system memory (single hclk pulse)
    input                         pre_flush2,     // before last data chunk was written to FIFO
    input                         fifo_flush2,    // EOF, need to output all what is in FIFO (Stays active until enough data chunks are read)
    input                  [7:0]  fifo_count2,    // number of 32-byte chunks in FIFO

    // compressor channel 3
    output                        fifo_rst3,      // reset FIFO (set read address to write, reset count)
    output                        fifo_ren3,
    input                  [63:0] fifo_rdata3,
//    input                         fifo_eof3,        // single rclk pulse signalling EOF
    output                        eof_written3,   // confirm frame written over AFI to the system memory (single hclk pulse)
    input                         pre_flush3,     // before last data chunk was written to FIFO
    input                         fifo_flush3,    // EOF, need to output all what is in FIFO (Stays active until enough data chunks are read)
    input                  [7:0]  fifo_count3,    // number of 32-byte chunks in FIFO
    
    // axi_hp signals write channel
    // write address
    output                 [31:0] afi_awaddr,
    output                        afi_awvalid,
    input                         afi_awready, // @SuppressThisWarning VEditor unused - used FIF0 level
    output                 [ 5:0] afi_awid,
    output                 [ 1:0] afi_awlock,
    output                 [ 3:0] afi_awcache,
    output                 [ 2:0] afi_awprot,
    output reg             [ 3:0] afi_awlen,
    output                 [ 1:0] afi_awsize,
    output                 [ 1:0] afi_awburst,
    output                 [ 3:0] afi_awqos,
    // write data
    output                 [63:0] afi_wdata,
    output                        afi_wvalid,
    input                         afi_wready,  // @SuppressThisWarning VEditor unused - used FIF0 level
    output                 [ 5:0] afi_wid,
    output                        afi_wlast,
    output                 [ 7:0] afi_wstrb,
    // write response
    input                         afi_bvalid,
    output                        afi_bready,
    input                  [ 5:0] afi_bid,
    input                  [ 1:0] afi_bresp,    // @SuppressThisWarning VEditor unused
    // PL extra (non-AXI) signals
    input                  [ 7:0] afi_wcount,
    input                  [ 5:0] afi_wacount,
    output                        afi_wrissuecap1en
`ifdef DEBUG_RING       
    ,output                       debug_do, // output to the debug ring
     input                        debug_sl, // 0 - idle, (1,0) - shift, (1,1) - load // SuppressThisWarning VEditor - not used
     input                        debug_di  // input from the debug ring
`endif         
);
//`ifdef DEBUG_RING
//    assign  debug_do = debug_di; // just temporarily to short-circuit the ring
//`endif        
    reg         en;      // enable mux
    reg         en_d;    // or use it to reset all channels?
    wire        en_nrst = en && ! hrst; // when hclk is not yet available 
    reg   [3:0] en_chn;  // per-channel enable 
    
    wire [31:0] cmd_data;
    wire [ 3:0] cmd_a;
    wire        cmd_we;
    wire        cmd_we_status_w;    
    wire        cmd_we_mode_w;    

    wire        cmd_we_sa_len_w;
    wire        cmd_we_en_w;    
    wire        cmd_we_rst_w; 

    reg [26:0] sa_len_d;
    reg  [2:0] sa_len_wa;
    reg  [3:0] rst_mclk;
    reg  [9:0] en_mclk;

    // hclk domain    
//    reg [26:0] sa_len_d;
//    reg  [2:0] sa_len_wa;
    wire       sa_len_we;
    wire       en_we;
    wire       en_rst;
    
    wire  [3:0] fifo_flush =     {fifo_flush3,     fifo_flush2,     fifo_flush1,     fifo_flush0};
    wire  [3:0] pre_flush = {pre_flush3, pre_flush2, pre_flush1, pre_flush0};
    reg   [3:0] ren_suspend_flush;  // suspend buffer read until flush is finished
    
//    reg   [2:0] cur_chn;          // 'b0xx - none, 'b1** - ** - channel number (should match fifo_ren*)
    reg   [1:0] cur_chn;           // 'b0xx - none, 'b1** - ** - channel number (should match fifo_ren*)
    reg  [31:0] left_to_eof;  // number of chunks left to end of frame (one less: 3 means 4 left)
    reg   [3:0] fifo_flush_d;      // fifo_flush* delayed by 1 clk (to detect rising edge
    reg   [3:0] eof_stb;           // single-cycle pulse after fifo_flush is asserted
//    reg   [1:0] w64_cnt;           // count 64-bit words in a chunk
// adjusted counters used for channel arbitration
// pessimistic FIFO content counter - decrements (form FIFO counter) on FIFO reads, knows nothing of writes
    reg  [35:0] counts_corr0; // registers to hold corrected (decremented currently processed ones if any) fifo count values, MSB - needs flush
    reg  [17:0] counts_corr1; // first arbitration level winning values
    reg   [8:0] counts_corr2;      // second arbitration level winning values
    
    reg   [1:0] winner1;           // 2 first level arbitration winners
    reg   [1:0] winner2;           // 2-bit second level arbitration winner
    wire  [1:0] pre_winner2_w;     // 1 cycle ahead of winner2
    
//    reg   [1:0] cur_chn;          // Can it be the same as cur_chn?
    wire  [7:0] fifo_count0_m1 = fifo_count0 - 1;
    wire  [7:0] fifo_count1_m1 = fifo_count1 - 1;
    wire  [7:0] fifo_count2_m1 = fifo_count2 - 1;
    wire  [7:0] fifo_count3_m1 = fifo_count3 - 1;
    // See if we need to bother - any channel needs flushing or has >= 4 of 32-byte chunks to transfer in a single AXI 16-burst 64 bit wide (latency = 4)
    wire        need_to_bother = |counts_corr2[8:2];
    reg         ready_to_start; // TBD: either idle or soon will finish the previous burst (include AFI FIFO level here too?)
//    wire  [3:0] last_chunk_w;
    reg   [3:0] busy; // TODO: adjust number of bits. During continuous run busy is deasseted for 1 clock cycle
    wire        done_burst_w; // de-asset busy
    wire        pre_busy_w;
    reg         first_busy; // cycle after pre_busy_w
    reg   [3:0] pend_last;  // waiting for last chunk
    reg         last_burst_in_frame;
//    reg   [1:0] wlen32; // 2 high bits of burst len (LSB are always 2'b11)
    
    reg   [3:0] wleft; // number of 64-bit words left to be sent - also used as awlen (valid @ awvalid)
//    reg   [2:0] chunk_inc;              // how much to increment chunk pointer (1..4)
    
//    wire  [2:0] pre_chunk_inc = (|counts_corr2[7:2])? // Would like to increment, if not roll-over
//                                 3'h4 :
//                                ({1'b0,left_to_eof[winner2 * 8 +: 2]} + 3'h1);

    // Why it has priority for |counts_corr2[7:2] ? If next frame started, it may skip EOF? Or not?
    // it is just to pass to a channel, actual transfer size will be decided here (depending on EOF) 
    wire  [1:0] pre_chunk_inc_m1 = (|counts_corr2[7:2])? // Would like to increment, if not roll-over
                                   2'h3 :
                                   left_to_eof[winner2 * 8 +: 2];
    

    reg [ 3:0] reset_pointers;         // per-channel - after chunk_start_hclk or chunk_len_hclk were written or  explicit fifo_rst*
    
    wire        ptr_resetting;          // pointers are being reset in cmprs_afi_mux_ptr module
    
    
    wire [26:0] chunk_addr;
    reg   [1:0] awvalid;
    reg         wvalid;
    reg         wlast;
    reg  [63:0] wdata;     // registered data from one of the 4 buffers
    wire        wdata_en;  // register enable for wdata
    wire  [1:0] wdata_sel; // source select for wdata
    reg   [3:0] fifo_ren;
    
    wire [26:0] chunk_ptr_rd;
    wire [ 3:0] chunk_ptr_ra;
    
    // If flushing - whatever is left to EOF, otherwise corrected FIFO contents of the winner
    wire [ 7:0] items_left = counts_corr2[8] ? left_to_eof[(winner2 * 8)  +: 8] : counts_corr2[7:0];
    
    reg   [5:0] afi_awid_r;
    // "rollover" - roll over destination memory range 
    wire [2:0] max_wlen; // 0,1,2,3,7 (7 - not limited by rollover) - calculated by cmprs_afi_mux_ptr
    // wants to write (want_wleft32+1) 32-byte chunks (4,3,2,1)
    wire [1:0] want_wleft32 = (|items_left[7:2])? 2'b11 : items_left[1:0]; // want to set wleft[3:2] if not roll-over (actually "3" means 2)

    wire rollover_limited_w = max_wlen[1:0] < want_wleft32;
    wire afi_wvalid_w;
    

    assign cmd_we_status_w = cmd_we && ((cmd_a & 'hc) ==       CMPRS_AFIMUX_STATUS_CNTRL);    
    assign cmd_we_mode_w =   cmd_we && (cmd_a ==               CMPRS_AFIMUX_MODE);    

    assign cmd_we_sa_len_w = cmd_we && ((cmd_a & 'h8) ==       CMPRS_AFIMUX_SA_LEN);
    assign cmd_we_en_w =     cmd_we && (cmd_a ==               CMPRS_AFIMUX_EN);    
    assign cmd_we_rst_w =    cmd_we && (cmd_a ==               CMPRS_AFIMUX_RST);    
    assign afi_wvalid =      afi_wvalid_w && !hrst;
    
    
    // use last_chunk_w to apply a special id to waddr and wdata and watch for it during readout
    // compose ID of channel number, frame bumber LSBs and last/not last chunk
/*    
    assign last_chunk_w[3:0] = {(left_to_eof[3 * 8 +: 8]==1),
                                (left_to_eof[2 * 8 +: 8]==1),
                                (left_to_eof[1 * 8 +: 8]==1),
                                (left_to_eof[0 * 8 +: 8]==1)};
*/    
    assign pre_busy_w = !busy[0] && ready_to_start && need_to_bother && !ptr_resetting;
    assign done_burst_w = busy[0] && !(|wleft[3:1]);  // when wleft[3:0] == 0, busy is 0
    assign {fifo_rst3, fifo_rst2, fifo_rst1, fifo_rst0} = reset_pointers;
    assign {fifo_ren3, fifo_ren2, fifo_ren1, fifo_ren0} = fifo_ren;
    
    assign pre_winner2_w = (counts_corr1[1 * 9 +: 9] > counts_corr1[0 * 9 +: 9]) ? {1'b1,winner1[1]} : {1'b0,winner1[0]};
    
    assign afi_awaddr =  {chunk_addr,5'b0};
    assign afi_awid =    afi_awid_r; //  {1'b0,wleft[3:2],last_burst_in_frame,cur_chn}; 
    assign afi_awvalid = awvalid[1] && !hrst;
//    assign afi_awlen = {wleft[3:2],2'b11};
    assign afi_wdata = wdata;
//    assign afi_bready = 1'b1; // always ready
    
// other fixed-value AFI signals
    assign afi_awlock =        2'h0;
    assign afi_awcache =       4'h3;
    assign afi_awprot =        3'h0;
    assign afi_awsize =        2'h3;
    assign afi_awburst =       2'h1;
    assign afi_awqos =         4'h0;
    assign afi_wstrb =         8'hff;
    assign afi_wrissuecap1en = 1'b0;
    
    
    
`ifdef DEBUG_RING
    debug_slave #(
        .SHIFT_WIDTH       (64),
        .READ_WIDTH        (64),
        .WRITE_WIDTH       (32),
        .DEBUG_CMD_LATENCY (DEBUG_CMD_LATENCY)
    ) debug_slave_i (
        .mclk       (mclk),          // input
        .mrst       (mrst),          // input
        .debug_di   (debug_di), // input
        .debug_sl   (debug_sl),      // input
        .debug_do   (debug_do), // output
        .rd_data   ({
        left_to_eof[31:0],
        24'b0,
        fifo_count0[7:0]
        }), // input[31:0]
        .wr_data    (), // output[31:0]  - not used
        .stb        () // output  - not used
    );
`endif    
    always @ (posedge mclk) begin
        if (cmd_we_sa_len_w) begin
            sa_len_d <= cmd_data[26:0];
            sa_len_wa <= cmd_a[2:0];
        end
        if      (mrst)         en_mclk <=  0;
        else if (cmd_we_en_w)  en_mclk <=  cmd_data[9:0];
        
        if      (mrst)         rst_mclk <=  ~0;
        else if (cmd_we_rst_w) rst_mclk <= cmd_data[3:0];
    end

    always @ (posedge hclk) begin
        reset_pointers <= ((en && !en_d) || hrst)? 4'hf : (en_rst ? rst_mclk : 4'h0);
        if      (hrst)                en_chn[0] <= 0;
        else if (en_we && en_mclk[1]) en_chn[0] <= en_mclk[0];

        if      (hrst)                en_chn[1] <= 0;
        else if (en_we && en_mclk[3]) en_chn[1] <= en_mclk[2];

        if      (hrst)                en_chn[2] <= 0;
        else if (en_we && en_mclk[5]) en_chn[2] <= en_mclk[4];

        if      (hrst)                en_chn[3] <= 0;
        else if (en_we && en_mclk[7]) en_chn[3] <= en_mclk[6];

        if      (hrst)                en        <= 0;
        else if (en_we && en_mclk[9]) en        <= en_mclk[8];
        
    end

    
    always @ (posedge hclk) begin
        en_d <= en && !hrst;
    
        ready_to_start <= en && // ready to strta a burst
                          !afi_wacount[5] && !(&afi_wacount[4:1]) &&  // >=2 free 
                          !afi_wcount[7] &&  !(&afi_wcount[6:3]);     // >=8 free (4 would be enough too)
    
        fifo_flush_d <= {fifo_flush3,fifo_flush2,fifo_flush1,fifo_flush0};
        eof_stb <= {fifo_flush3 & ~fifo_flush_d[3],
                    fifo_flush2 & ~fifo_flush_d[2],
                    fifo_flush1 & ~fifo_flush_d[1],
                    fifo_flush0 & ~fifo_flush_d[0]};
                    
        // TODO: change &w64_cnt[1:0] so left_to_eof[*] will be updated earlier and valid at pre_busy_w       
        // Done, updating at the first (not last) word of 4
        // Now seems that eof_stb[i] & fifo_ren{i} == 0
        // Seems needs to decrement fifo_count0_m1 regardless of &wleft[1:0] - if started, will eventually decrement
        // How to make sure that decremented value always >0?
//        if (eof_stb[0])                      left_to_eof[0 * 8 +: 8] <= fifo_count0_m1 - (fifo_ren0 & (&wleft[1:0]));
        if (eof_stb[0])                      left_to_eof[0 * 8 +: 8] <= fifo_count0_m1 - fifo_ren0;
        else if (fifo_ren0 & (&wleft[1:0]))  left_to_eof[0 * 8 +: 8] <= left_to_eof[0 * 8 +: 8] - 1;
    
//        if (eof_stb[1])                      left_to_eof[1 * 8 +: 8] <= fifo_count1_m1 - (fifo_ren1 & (&wleft[1:0]));
        if (eof_stb[1])                      left_to_eof[1 * 8 +: 8] <= fifo_count1_m1 - fifo_ren1;
        else if (fifo_ren1 & (&wleft[1:0]))  left_to_eof[1 * 8 +: 8] <= left_to_eof[1 * 8 +: 8] - 1;
    
//        if (eof_stb[2])                      left_to_eof[2 * 8 +: 8] <= fifo_count2_m1 - (fifo_ren2 & (&wleft[1:0]));
        if (eof_stb[2])                      left_to_eof[2 * 8 +: 8] <= fifo_count2_m1 - fifo_ren2;
        else if (fifo_ren2 & (&wleft[1:0]))  left_to_eof[2 * 8 +: 8] <= left_to_eof[2 * 8 +: 8] - 1;
    
//        if (eof_stb[3])                      left_to_eof[3 * 8 +: 8] <= fifo_count3_m1 - (fifo_ren3 & (&wleft[1:0]));
        if (eof_stb[3])                      left_to_eof[3 * 8 +: 8] <= fifo_count3_m1 - fifo_ren3;
        else if (fifo_ren3 & (&wleft[1:0]))  left_to_eof[3 * 8 +: 8] <= left_to_eof[3 * 8 +: 8] - 1;
    
        // Calculate corrected values decrementing currently served channel (if any) values by 1 (latency 1 clk)
        // During ren_suspend_flush (from pre_flush to flush) 0 - effectively disable, after flush - highest priority
        
        if ((fifo_count0 == 0) || !en_chn[0] ||ren_suspend_flush[0]) counts_corr0[0 * 9 +: 9] <= 0;
        else if (fifo_ren[0])                      counts_corr0[0 * 9 +: 9] <= (fifo_count0_m1 == 0)? 0 : {fifo_flush0,fifo_count0_m1};
        else                                       counts_corr0[0 * 9 +: 9] <= {fifo_flush0,fifo_count0};

        if ((fifo_count1 == 0) || !en_chn[1] ||ren_suspend_flush[1]) counts_corr0[1 * 9 +: 9] <= 0;
        else if (fifo_ren[1])                      counts_corr0[1 * 9 +: 9] <= (fifo_count1_m1 == 0)? 0 : {fifo_flush1,fifo_count1_m1};
        else                                       counts_corr0[1 * 9 +: 9] <= {fifo_flush1,fifo_count1};

        if ((fifo_count2 == 0) || !en_chn[2] ||ren_suspend_flush[2]) counts_corr0[2 * 9 +: 9] <= 0;
        else if (fifo_ren[2])                      counts_corr0[2 * 9 +: 9] <= (fifo_count2_m1 == 0)? 0 : {fifo_flush2,fifo_count2_m1};
        else                                       counts_corr0[2 * 9 +: 9] <= {fifo_flush2,fifo_count2};

        if ((fifo_count3 == 0) || !en_chn[3] ||ren_suspend_flush[3]) counts_corr0[3 * 9 +: 9] <= 0;
        else if (fifo_ren[3])                      counts_corr0[3 * 9 +: 9] <= (fifo_count3_m1 == 0)? 0 : {fifo_flush3,fifo_count3_m1};
        else                                       counts_corr0[3 * 9 +: 9] <= {fifo_flush3,fifo_count3};

        // 2-level arbitration
        // first arbitration level (latency 2 clk)
        if (counts_corr0[1 * 9 +: 9] > counts_corr0[0 * 9 +: 9]) begin
            counts_corr1[0 * 9 +: 9] <= counts_corr0[1 * 9 +: 9];
            winner1[0] <=      1;
        end else begin
            counts_corr1[0 * 9 +: 9] <= counts_corr0[0 * 9 +: 9];
            winner1[0] <=      0;
        end

        if (counts_corr0[3 * 9 +: 9] > counts_corr0[2 * 9 +: 9]) begin
            counts_corr1[1 * 9 +: 9] <= counts_corr0[3 * 9 +: 9];
            winner1[1] <=      1;
        end else begin
            counts_corr1[1 * 9 +: 9] <= counts_corr0[2 * 9 +: 9];
            winner1[1] <=      0;
        end
        
        // second arbitration level (latency 3 clk)
        if (counts_corr1[1 * 9 +: 9] > counts_corr1[0 * 9 +: 9]) begin
            counts_corr2 <= counts_corr1[1 * 9 +: 9];
//            winner2 <=      {1'b1,winner1[1]};
        end else begin
            counts_corr2 <= counts_corr1[0 * 9 +: 9];
//            winner2 <=      {1'b0,winner1[0]};
        end
        
        winner2 <=  pre_winner2_w;
        
        //ready_to_start need_to_bother
        //done_burst
        if      (!en)          busy <= 0;
        else   busy <= {busy[2:0], pre_busy_w | (busy[0] & ~done_burst_w)};
        
        if      (!en)          first_busy <= 0;
        else                   first_busy <= pre_busy_w;
        
        if      (!en)          pend_last <= 0;
        else pend_last <= eof_stb | (pend_last & ~({4{first_busy & last_burst_in_frame}} & fifo_ren )); 
        
//pend_last        
        
        if      (!en)        wleft <= 0;
//        else if (pre_busy_w) wleft <= {(max_wlen[1:0] > want_wleft32) ? want_wleft32 : max_wlen[1:0], 2'b11};
//    wire rollover_limited_w = max_wlen[1:0] < want_wleft32;
        else if (pre_busy_w) wleft <= {rollover_limited_w ? max_wlen[1:0]: want_wleft32, 2'b11}; // same for == 
        
        else if (wleft != 0) wleft <= wleft - 1;

 //       if      (!en)        wvalid <= 0;
        if      (!en_nrst)   wvalid <= 0;
        else if (pre_busy_w) wvalid <= 1;
        else if (wlast)      wvalid <= 0; // should be after pre_busy_w as both can happen simultaneously

        if      (!en)          fifo_ren <= 0;
        else if (pre_busy_w)   fifo_ren <= {(winner2 == 3) ?1'b1:1'b0,
                                            (winner2 == 2) ?1'b1:1'b0,
                                            (winner2 == 1) ?1'b1:1'b0,
                                            (winner2 == 0) ?1'b1:1'b0};
        else if (wlast)        fifo_ren <= 0;
        
// new mods
        if (!en) ren_suspend_flush <= 0;
        else ren_suspend_flush <= pre_flush | (ren_suspend_flush & ~fifo_flush );
        
        
        
        if (hrst) awvalid <= 0; 
        else      awvalid <= {awvalid[0],pre_busy_w}; // no need to wait for afi_awready, will use fifo levels to enable pre_busy_w
        
        if (pre_busy_w)  begin
            cur_chn <= winner2;
//    wire rollover_limited_w = max_wlen[1:0] < want_wleft32;
//            last_burst_in_frame <= counts_corr2[8] && (left_to_eof[winner2 * 8 + 2 +: 6] == 0) && pend_last[winner2];
            last_burst_in_frame <= counts_corr2[8] && (left_to_eof[winner2 * 8 + 2 +: 6] == 0) && pend_last[winner2] &&!rollover_limited_w;
        end
        
        wlast <= done_burst_w; // when wleft==4'h1

        // wdata register mux
        if (wdata_en) wdata <= wdata_sel[1]?(wdata_sel[0]?fifo_rdata3:fifo_rdata2):(wdata_sel[0]?fifo_rdata1:fifo_rdata0);

//        if (pre_busy_w) chunk_inc <= (|counts_corr2[7:2])? // Would like to increment, if not roll-over
//                                       3'h4 :
//                                       ({1'b0,left_to_eof[winner2 * 8 +: 2]} + 3'h1);
                                       
        if (awvalid[0]) afi_awid_r <={1'b0,wleft[3:2],last_burst_in_frame,cur_chn};
        
        if (awvalid[0]) afi_awlen <= {wleft[3:2],2'b11};
                                 
        
    end

    // delay write channel controls signal to match data latency. wid bits will be optimized (6 -> 3)    
    dly_16 #(
        .WIDTH(2) // 8)
    ) afi_wx_i (
        .clk       (hclk), // input
        .rst       (!en),  // input
        .dly       (AFI_MUX_BUF_LATENCY), // input[3:0] will delay by AFI_MUX_BUF_LATENCY+1 (normally 3) 
        .din       ({    wvalid,     wlast}), // , afi_awid_r}), // afi_awid}), // input[0:0] 
        .dout      ({afi_wvalid_w, afi_wlast}) //, afi_wid})     // output[0:0] 
    );
    localparam [3:0] AFI_MUX_BUF_LATENCYM1 = AFI_MUX_BUF_LATENCY - 1;
    dly_16 #(
        .WIDTH(9) // 3)
    ) afi_wdata_i (
        .clk       (hclk), // input
        .rst       (!en),  // input
        .dly       (AFI_MUX_BUF_LATENCYM1), // input[3:0] will delay by AFI_MUX_BUF_LATENCY+1 (normally 3) 
        .din       ({wvalid,   cur_chn,   afi_awid_r}), //}), // input[0:0] 
        .dout      ({wdata_en, wdata_sel, afi_wid})     // }) // output[0:0] 
    );
    
    cmd_deser #(
        .ADDR       (CMPRS_AFIMUX_ADDR),
        .ADDR_MASK  (CMPRS_AFIMUX_MASK),
        .NUM_CYCLES (6),
        .ADDR_WIDTH (4),
        .DATA_WIDTH (32)
    ) cmd_deser_32bit_i (
        .rst        (1'b0),     // rst),      // input
        .clk        (mclk),     // input
        .srst       (mrst),      // input
        .ad         (cmd_ad),   // input[7:0] 
        .stb        (cmd_stb),  // input
        .addr       (cmd_a),    // output[3:0] 
        .data       (cmd_data), // output[31:0] 
        .we         (cmd_we)    // output
    );
    
    wire [53:0] chunk_ptr_rd01; // [0:1]; // combines 2 pointers - write one and write response one

    cmprs_afi_mux_ptr cmprs_afi_mux_ptr_i (
        .hclk                (hclk),                // input
        .sa_len_di           (sa_len_d[26:0]),      // input[26:0] 
        .sa_len_wa           (sa_len_wa[2:0]),      // input[2:0] 
        .sa_len_we           (sa_len_we),           // input
        .en                  (en),                  // input
        .reset_pointers      (reset_pointers),      // input[3:0] 
        .pre_busy_w          (pre_busy_w),          // input
        .pre_winner_channel  (pre_winner2_w),       // input[1:0] 
//        .winner_channel      (winner2),             // input[1:0] 
        .need_to_bother      (need_to_bother),      // input
//        .chunk_inc           (chunk_inc),           // input[2:0]
        .chunk_inc_want_m1   (pre_chunk_inc_m1),    // input[1:0] Want to increment by this (0..3) + 1, if not roll over 
        .last_burst_in_frame (last_burst_in_frame), // input
        .busy                (busy),                // input[3:0] 
        .ptr_resetting       (ptr_resetting),       // output
        .chunk_addr          (chunk_addr),          // output[26:0] reg 
        .chunk_ptr_ra        (chunk_ptr_ra[2:0]),   // input[2:0] 
        .chunk_ptr_rd        (chunk_ptr_rd01[0 * 27 +: 27]),    // output[26:0]
        .max_wlen            (max_wlen)             // output[2:0]: msb - no rollover  (>3)
    );
    assign chunk_ptr_rd=chunk_ptr_ra[3]?chunk_ptr_rd01[1 * 27 +: 27]:chunk_ptr_rd01[0 * 27 +: 27];
    cmprs_afi_mux_ptr_wresp cmprs_afi_mux_ptr_wresp_i (
        .hclk                (hclk),                // input
        .length_di           (sa_len_d[26:0]),      // input[26:0] 
        .length_wa           (sa_len_wa[1:0]),      // input[1:0] 
        .length_we           (sa_len_we & sa_len_wa[2]), // input
        .en                  (en),                  // input
        .reset_pointers      (reset_pointers),      // input[3:0] 
        .chunk_ptr_ra        (chunk_ptr_ra[2:0]),   // input[2:0] 
        .chunk_ptr_rd        (chunk_ptr_rd01[1* 27 +: 27]),   // output[26:0] 
        .eof_written         ({eof_written3,eof_written2,eof_written1,eof_written0}), // output[3:0] reg 
        .afi_bvalid          (afi_bvalid),          // input
        .afi_bready          (afi_bready),          // output
        .afi_bid             (afi_bid)              // input[5:0] 
    );

    cmprs_afi_mux_status #(
        .CMPRS_AFIMUX_STATUS_REG_ADDR (CMPRS_AFIMUX_STATUS_REG_ADDR), // uses 4 locations
        .CMPRS_AFIMUX_WIDTH(CMPRS_AFIMUX_WIDTH),
        .CMPRS_AFIMUX_CYCBITS(CMPRS_AFIMUX_CYCBITS)
    ) cmprs_afi_mux_status_i (
//        .rst          (rst), // input
        .hclk         (hclk), // input
        .mclk         (mclk), // input
        .mrst         (mrst), // input
        .hrst         (hrst), // input
        .cmd_data     (cmd_data[15:0]), // input[15:0] 
        .cmd_a        (cmd_a[1:0]), // input[1:0] 
        .status_we    (cmd_we_status_w), // input
        .mode_we      (cmd_we_mode_w), // input
        .status_ad    (status_ad), // output[7:0] 
        .status_rq    (status_rq), // output
        .status_start (status_start), // input
        .en           (en), // input
        .chunk_ptr_ra (chunk_ptr_ra), // output[3:0] reg 
        .chunk_ptr_rd (chunk_ptr_rd[CMPRS_AFIMUX_WIDTH-1:0]) // input[25:0] 
    );
    pulse_cross_clock sa_len_we_i (.rst(mrst), .src_clk(mclk), .dst_clk(hclk), .in_pulse(cmd_we_sa_len_w), .out_pulse(sa_len_we),.busy());
    pulse_cross_clock en_we_i     (.rst(mrst), .src_clk(mclk), .dst_clk(hclk), .in_pulse(cmd_we_en_w),     .out_pulse(en_we),    .busy());
    pulse_cross_clock en_rst_i    (.rst(mrst), .src_clk(mclk), .dst_clk(hclk), .in_pulse(cmd_we_rst_w),    .out_pulse(en_rst),.busy());

endmodule

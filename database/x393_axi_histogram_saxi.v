// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>histogram_saxi
 * @file histogram_saxi.v
 * @date 2015-06-04  
 * @author Andrey Filippov     
 *
 * @brief Histograms transfer to the system memory over S_AXI 
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * histogram_saxi.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  histogram_saxi.v is distributed in the hope that it will be useful,
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
// Number of histograms per sensor is now statically defined by NUM_FRAME_BITS
// It may be modified to both reduce this number (by masking) or increase ( by
// keeping pointer locally)

module  histogram_saxi#(
    parameter HIST_SAXI_ADDR =           'h380,  // 16 locations to write 20 bits of a 4KB page for the histogram
    parameter HIST_SAXI_ADDR_MASK =      'h7f0,
    parameter HIST_SAXI_MODE_ADDR =      'h390,
      parameter HIST_SAXI_MODE_WIDTH =   8,
      parameter HIST_SAXI_EN =           0,
      parameter HIST_SAXI_NRESET =       1,
      parameter HIST_CONFIRM_WRITE =     2, // wait write confirmation for each block
      parameter HIST_SAXI_AWCACHE =      4, // Write 4'h3 there, //..7 cache mode (4 bits, default 4'h3)
      
    parameter HIST_SAXI_MODE_ADDR_MASK = 'h7ff,
//    parameter HIST_SAXI_STATUS_REG =     'h34,
    parameter NUM_FRAME_BITS = 4 // number of bits use for frame number 
    `ifdef DEBUG_RING
            ,parameter DEBUG_CMD_LATENCY = 2 
    `endif        
)(
//    input                      rst,
    input                      mclk,   // for command/status
    input                      aclk,   // global clock to run s_axi (@150MHz?)
    input                      mrst,      // @posedge mclk, sync reset
    input                      arst,      // @posedge aclk, sync reset
    
    // sensor 0, data valid @posedge mclk
    input [NUM_FRAME_BITS-1:0] frame0, // frame number for which the histogram is provided
    input                      hist_request0, // request to transfer a burst
    output                     hist_grant0,   // request to transfer over S_AXI granted
    input                [1:0] hist_chn0,     // histogram (sub) channel, valid with request and transfer
    input                      hist_dvalid0,  // output data valid - active when sending a burst
    input               [31:0] hist_data0,    // output[31:0] histogram data

    // sensor 1, data valid @posedge mclk
    input [NUM_FRAME_BITS-1:0] frame1, // frame number for which the histogram is provided
    input                      hist_request1, // request to transfer a burst
    output                     hist_grant1,   // request to transfer over S_AXI granted
    input                [1:0] hist_chn1,     // histogram (sub) channel, valid with request and transfer
    input                      hist_dvalid1,  // output data valid - active when sending a burst
    input               [31:0] hist_data1,    // output[31:0] histogram data

    // sensor 2, data valid @posedge mclk
    input [NUM_FRAME_BITS-1:0] frame2, // frame number for which the histogram is provided
    input                      hist_request2, // request to transfer a burst
    output                     hist_grant2,   // request to transfer over S_AXI granted
    input                [1:0] hist_chn2,     // histogram (sub) channel, valid with request and transfer
    input                      hist_dvalid2,  // output data valid - active when sending a burst
    input               [31:0] hist_data2,    // output[31:0] histogram data

    // sensor 3, data valid @posedge mclk
    input [NUM_FRAME_BITS-1:0] frame3, // frame number for which the histogram is provided
    input                      hist_request3, // request to transfer a burst
    output                     hist_grant3,   // request to transfer over S_AXI granted
    input                [1:0] hist_chn3,     // histogram (sub) channel, valid with request and transfer
    input                      hist_dvalid3,  // output data valid - active when sending a burst
    input               [31:0] hist_data3,     // output[31:0] histogram data
    
    // command interface
    input                [7:0] cmd_ad,       // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                      cmd_stb,      // strobe (with first byte) for the command a/d
    // S_AXI inerface w/o read channel
    // write address    
    output              [31:0] saxi_awaddr,            // AXI PS Slave GP0 AWADDR[31:0], input
    output                     saxi_awvalid,           // AXI PS Slave GP0 AWVALID, input
    input                      saxi_awready,           // AXI PS Slave GP0 AWREADY, output
    output               [5:0] saxi_awid,              // AXI PS Slave GP0 AWID[5:0], input
    output               [1:0] saxi_awlock,            // AXI PS Slave GP0 AWLOCK[1:0], input
    output              [ 3:0] saxi_awcache,           // AXI PS Slave GP0 AWCACHE[3:0], input
    output              [ 2:0] saxi_awprot,            // AXI PS Slave GP0 AWPROT[2:0], input
    output              [ 3:0] saxi_awlen,             // AXI PS Slave GP0 AWLEN[3:0], input
    output              [ 1:0] saxi_awsize,            // AXI PS Slave GP0 AWSIZE[1:0], input
    output              [ 1:0] saxi_awburst,           // AXI PS Slave GP0 AWBURST[1:0], input
    output              [ 3:0] saxi_awqos,             // AXI PS Slave GP0 AWQOS[3:0], input
    // write data
    output              [31:0] saxi_wdata,             // AXI PS Slave GP0 WDATA[31:0], input
    output                     saxi_wvalid,            // AXI PS Slave GP0 WVALID, input
    input                      saxi_wready,            // AXI PS Slave GP0 WREADY, output
    output              [ 5:0] saxi_wid,               // AXI PS Slave GP0 WID[5:0], input
    output                     saxi_wlast,             // AXI PS Slave GP0 WLAST, input
    output              [ 3:0] saxi_wstrb,             // AXI PS Slave GP0 WSTRB[3:0], input
    // write response
    input                      saxi_bvalid,            // AXI PS Slave GP0 BVALID, output
    output                     saxi_bready,            // AXI PS Slave GP0 BREADY, input
    input               [ 5:0] saxi_bid,               // AXI PS Slave GP0 BID[5:0], output //TODO:  Update range !!!  // @SuppressThisWarning VEditor unused
    input               [ 1:0] saxi_bresp              // AXI PS Slave GP0 BRESP[1:0], output    // @SuppressThisWarning VEditor unused
 `ifdef DEBUG_RING       
    ,output                       debug_do, // output to the debug ring
     input                        debug_sl, // 0 - idle, (1,0) - shift, (1,1) - load
     input                        debug_di  // input from the debug ring
`endif         
);
/*
`ifdef DEBUG_RING
    localparam DEBUG_RING_LENGTH = 1; // for now - just connect the histogram(s) module(s)
    wire [DEBUG_RING_LENGTH:0] debug_ring; // TODO: adjust number of bits
    assign debug_do = debug_ring[0];
    assign debug_ring[DEBUG_RING_LENGTH] = debug_di;
`endif    
*/
    localparam ATTRIB_WIDTH = NUM_FRAME_BITS + 4 +2;
    reg  [HIST_SAXI_MODE_WIDTH-1:0]  mode = 0;
    wire                             en =     mode[HIST_SAXI_EN] & mode[HIST_SAXI_NRESET];
    reg                        [3:0] awcache_mode;
    reg                              confirm_write;
    wire                             nreset = mode[HIST_SAXI_NRESET];
    wire                             we_mode;
    wire                             we_addr;
    wire                      [31:0] cmd_data;
    wire                       [3:0] cmd_wa;
    reg                       [19:0] hist_start_page[0:15]; // start page (4KB) of the per-sensor histogram system memory
    
    reg                        [2:0] burst;
    wire                       [3:0] pri_rq;
    reg                        [2:0] enc_rq;
    wire                             busy_w;
    reg                              busy_r;
    reg                        [1:0] mux_sel;
    wire                             start_w;
    reg                              started;
    reg        [4*ATTRIB_WIDTH -1:0] attrib; // to hold frame number, sensor number and burst (color) for the histograms in the buffer
    wire                             page_sent_mclk; // page sent over saxi - pulse in mclk domain
    reg                        [1:0] page_wr;         // page number being written
    reg                        [7:0] page_wa;         // 32-bit word address in page being written
    reg                        [2:0] pages_in_buf_wr; // pages in buffer (as seen from write side), 0..4
    wire                             buf_full = pages_in_buf_wr[2];
    wire                             dav;
    reg                              dav_r;
    wire                             burst_done_w;
    reg                              grant;
    
    wire                      [31:0] din;
    reg                       [31:0] din_r;
    wire                             rq_in;
    wire                       [1:0] sub_chn_w;
    reg                        [1:0] sub_chn_r;
    wire        [NUM_FRAME_BITS-1:0] frame_w; // frame number for which the histogram is provided
    reg         [NUM_FRAME_BITS-1:0] frame_r; //
    reg                              wr_attr; // in the beginning of the burst - write attributes to FIFO 
    wire                       [3:0] chn_sel;
    reg                        [3:0] chn_grant;
    
    
    
    // aclk domain
    wire                             page_sent_aclk; // page sent over saxi
    reg                              preen_aclk;
    reg                              en_aclk;
    reg                              prenreset_aclk;
    reg                              nreset_aclk;
    wire                             page_written_aclk;
    reg                        [2:0] pages_in_buf_rd; // pages in buffer (as seen from read side), 0..4
    reg                        [1:0] page_rd;         // page number being read
    reg                        [7:0] page_ra;         // 32-bit word address in page being read
    wire                             buf_empty = (pages_in_buf_rd==0);
    
    reg                        [3:0] block_run; // TODO: adjust width 
    wire                             block_start_w;
    reg                        [3:0] block_start_r;
    wire                             block_end;
    reg [NUM_FRAME_BITS + 4 +2 -1:0] attrib_r;
    wire                       [3:0] attrib_chn;
    wire        [NUM_FRAME_BITS-1:0] attrib_frame;
    wire                       [1:0] attrib_color;
    reg                       [19:0] hist_start_page_r;
    reg                      [31:10] hist_start_addr; // higher bits of the system memory address of the histogram (1024 bytes) start
    reg                      [31: 6] start_addr_r; // higher bits of the system memory address of the saxi burst start address
    
    wire                             saxi_start_burst_w;
    reg                              first_burst;
    wire                      [31:0] inter_buf_data; // data between bram buffer and a small FIFO
    reg                        [3:0] wburst_cntr;    // count words in output data burst (using max==16)
    reg                        [4:0] num_bursts_in_buf; // number of 16-word bursts written no buffer but not yet sent to SAXI 
    reg                        [4:0] num_bursts_pending; // number of 16-word bursts written no buffer but not yet confirmed from SAXI
    wire                             fifo_nempty;
    wire                             fifo_half_full;
    reg                        [2:0] buf_re; // {fifo_we, buf_regen, buf_re}
    wire                             buf_re_w;
    wire                             fifo_re;
    reg                              saxi_bvalid_r;
    reg                              page_read_run; // reading buffer page until page_ra reads 'hff
    
//    reg                        [9:0] buf_raddr; // nuffer read address {page[1:0], addr [7:0]}
    
`ifdef DEBUG_RING
    reg [7:0] extra_wa;
    reg [7:0] extra_ra;
    reg [15:0] num_addr_saxi;
    reg [15:0] num_data_saxi;
    always @ (posedge mclk) begin

        if (!en)               extra_wa <= 0;
        else if (burst_done_w) extra_wa <= extra_wa + 1;
        
    
    end
    always @ (posedge aclk) begin

        if (!en_aclk)            extra_ra <= 0;
        else if (page_sent_aclk) extra_ra <= extra_ra + 1;
        
        if (!nreset_aclk)                      num_addr_saxi <= 0;
        else if (saxi_awvalid && saxi_awready) num_addr_saxi <= num_addr_saxi + 1;
    
        if (!nreset_aclk)                    num_data_saxi <= 0;
        else if (saxi_wvalid && saxi_wready) num_data_saxi <= num_data_saxi + 1;
    end
    
    debug_slave #(
        .SHIFT_WIDTH       (160),
        .READ_WIDTH        (160),
        .WRITE_WIDTH       (32),
        .DEBUG_CMD_LATENCY (DEBUG_CMD_LATENCY)
    ) debug_slave_i (
        .mclk       (mclk),          // input
        .mrst       (mrst),          // input
        .debug_di   (debug_di), // input
        .debug_sl   (debug_sl),      // input
        .debug_do   (debug_do), // output
        .rd_data   ({
          num_addr_saxi[15:0],
          num_data_saxi[15:0],
        
          extra_wa[7:0],page_wa[7:0],
          extra_ra[7:0],page_ra[7:0],
//          16'b0,
          
          3'b0,num_bursts_in_buf,
          3'b0,num_bursts_pending,
          
          page_wr[1:0],page_rd[1:0],3'b0, saxi_wlast,
          saxi_wready, saxi_wvalid, saxi_wid[5:0],
          
          6'b0,saxi_awready,saxi_awvalid,
          saxi_awlock[1:0], saxi_awid[5:0],
          saxi_awcache[3:0], 1'b0,saxi_awprot[2:0],
          saxi_awlen[3:0], saxi_awburst[1:0], saxi_awsize[1:0],
           
          2'b0 ,hist_chn0[1:0],frame0[3:0],
          chn_grant[3:0],
          1'b0, busy_w, busy_r, started,
          1'b0, burst[2:0], 1'b0,pages_in_buf_wr[2:0],
          start_w, enc_rq[2:0], pri_rq[3:0]  
        }), // input[31:0]
        .wr_data    (), // output[31:0]  - not used
        .stb        () // output  - not used
    );

`endif
    
    assign pri_rq = {hist_request3 & ~hist_request2 & ~hist_request1 & ~hist_request0,
                     hist_request2 & ~hist_request1 & ~ hist_request0,
                     hist_request1 & ~hist_request0,
                     hist_request0};
    assign busy_w = |burst;
    assign start_w =      enc_rq[2] && !busy_r && !started;
    assign chn_sel =     {mux_sel[1] & mux_sel[0], mux_sel[1] & ~mux_sel[0], ~mux_sel[1] & mux_sel[0], ~mux_sel[1] & ~mux_sel[0]};
    assign dav =          mux_sel[1] ? (mux_sel[0] ? hist_dvalid3 :  hist_dvalid2)   : (mux_sel[0] ? hist_dvalid1  : hist_dvalid0); 
    assign din =          mux_sel[1] ? (mux_sel[0] ? hist_data3 :    hist_data2)     : (mux_sel[0] ? hist_data1    : hist_data0);
    assign rq_in =        mux_sel[1] ? (mux_sel[0] ? hist_request3 : hist_request2)  : (mux_sel[0] ? hist_request1 :  hist_request0); 
    assign sub_chn_w =    mux_sel[1] ? (mux_sel[0] ? hist_chn3 :     hist_chn2)      : (mux_sel[0] ? hist_chn1     : hist_chn0); 
    assign frame_w =      mux_sel[1] ? (mux_sel[0] ? frame3 :        frame2)         : (mux_sel[0] ? frame1        : frame0); 
    assign burst_done_w = dav_r && !dav && en;
    assign hist_grant0 =  chn_grant[0];
    assign hist_grant1 =  chn_grant[1];
    assign hist_grant2 =  chn_grant[2];
    assign hist_grant3 =  chn_grant[3];
    
    assign block_start_w = !(|block_run[2:0]) && !buf_empty && en_aclk ; // make it finish all started transactions

    assign attrib_chn =   attrib_r[NUM_FRAME_BITS+2+:4];
    assign attrib_frame = attrib_r[2+:NUM_FRAME_BITS];
    assign attrib_color = attrib_r[1:0];

    assign saxi_start_burst_w =  saxi_awvalid && saxi_awready;
    
    assign saxi_awaddr = {start_addr_r[31:6],6'b0};
    
    assign saxi_awvalid = ((|start_addr_r[9:6]) || first_burst) && !arst;    
//{enc_rq[1:0], sub_chn_r, frame_r,  burst[1:0]}
    
    // assign block_end= ???;
    assign saxi_awid[5:0] = {attrib_chn,attrib_color};
    // TODO: assign static values:
    assign saxi_awlock=  2'h0;     // AXI PS Slave GP0 AWLOCK[1:0], input
    assign saxi_awcache= awcache_mode; // 4'h3;          // AXI PS Slave GP0 AWCACHE[3:0], input
    assign saxi_awprot=  3'h0;     // AXI PS Slave GP0 AWPROT[2:0], input
    assign saxi_awlen=   4'hf;     // 16 words AXI PS Slave GP0 AWLEN[3:0], input
    assign saxi_awsize=  2'h2;     // 4 bytes; AXI PS Slave GP0 AWSIZE[1:0], input
    assign saxi_awburst= 2'h1;     // Increment address bursts AXI PS Slave GP0 AWBURST[1:0], input
    assign saxi_awqos=   4'h0;     // AXI PS Slave GP0 AWQOS[3:0], input
      
//    assign saxi_wvalid = en_aclk && fifo_nempty && (|num_bursts_in_buf);
    assign saxi_wvalid = en_aclk && fifo_nempty; //  && (|num_bursts_in_buf); - not needed, buffer read will stop at address 'hff
    
    assign saxi_bready = 1'b1; // always ready
    assign saxi_wlast =  &wburst_cntr;
    assign saxi_wid[5:0] = {attrib_chn,attrib_color}; // TODO: Verify they match FIFO output (otherwise save them in FIFO too) block_start waits for FIFO?
    assign saxi_wstrb =    4'hf; // All bytes
    
      
    // TODO: Maybe reduce pause between 16-burst pages? Allow some overlap? 
    assign buf_re_w = en_aclk && (|pages_in_buf_rd) && !fifo_half_full && !(&page_ra) && page_read_run; // will stay off until next page
    assign fifo_re= saxi_wvalid && saxi_wready;
    // currently waiting for SAXI to get confirmnation of all data in the current page before proceeding to the next
    //
//    assign confirm_write
    assign block_end = !(|block_start_r) && (confirm_write? (!(|num_bursts_pending)):(!(|num_bursts_in_buf)));
//    assign block_end = !(|block_start_r) && !(|num_bursts_pending);
    assign page_sent_aclk = block_run[1] && !block_run[0]; 
              
    // command interface
    always @(posedge mclk) begin
        if      (mrst)     mode <= 0;
        else if (we_mode) mode <= cmd_data[HIST_SAXI_MODE_WIDTH-1:0];
    end
    always @(posedge mclk) begin
        if (we_addr) hist_start_page[cmd_wa] <= cmd_data[19:0];
//        en_aclk <= en;
    end

    // mclk (write) port of the buffer
    // once started, will read full histogram from the same sensor
    
    // Buffer write logic
    always @(posedge mclk) begin
        enc_rq <= {|pri_rq, pri_rq[3] | pri_rq[2], pri_rq[3] | pri_rq[1]};
        busy_r <= busy_w;
        if  (!en || busy_r) started <= 0;
        else if (enc_rq[2]) started <= 1;
        
        if (start_w) mux_sel <= enc_rq[1:0];
        
        if (!en) dav_r <= 0;
        else     dav_r <= dav;
        din_r <= din;
        
        sub_chn_r <=sub_chn_w;
        frame_r <= frame_w;     
        if      (!en)          burst <= 0;
        else if (start_w)      burst <= 4;
        else if (burst_done_w) burst <= burst + 1;
                
        if      (!en)          page_wr <= 0;
        else if (burst_done_w) page_wr <= page_wr + 1;

        if      (!en)                              pages_in_buf_wr <= 0;
        else if ( burst_done_w && !page_sent_mclk) pages_in_buf_wr <= pages_in_buf_wr + 1;
        else if (!burst_done_w &&  page_sent_mclk) pages_in_buf_wr <= pages_in_buf_wr - 1;
        
//        grant <= en && rq_in && !buf_full && (grant || busy_r); // delay grant until chn_sel is set (first cycle of started)
        grant <= en && rq_in && !dav_r && !buf_full && (grant || busy_r); // delay grant until chn_sel is set (first cycle of started)

        
        if (!en) chn_grant <= 0;
        else     chn_grant <= {4{grant}} & chn_sel;
        
        wr_attr <=  en && !dav_r && dav;
        
        if (wr_attr) attrib[page_wr * ATTRIB_WIDTH +: ATTRIB_WIDTH] <= {enc_rq[1:0], sub_chn_r, frame_r,  burst[1:0]};
        
        if (!dav_r) page_wa <= 0;
        else        page_wa <= page_wa + 1; 
    end
    
    // Buffer read, SAXI send logic
    always @(posedge aclk) begin
        preen_aclk <= en; 
        en_aclk <=    preen_aclk && en && !arst; 
        prenreset_aclk <= nreset; 
        nreset_aclk <=    prenreset_aclk && nreset; 

        if      (!en_aclk)                     page_rd <= 0;
        else if (page_sent_aclk)               page_rd <= page_rd + 1;

        if      (!en_aclk || block_start_r[0]) page_ra <= 0;
        else if (buf_re[0])                    page_ra <= page_ra + 1;
        
        if      (!en_aclk)  page_read_run <= 0;
        else                page_read_run <= block_start_r[1] || (page_read_run && !(&page_ra)); // until page_ra is 8'hff
        
        if      (!en_aclk)                              pages_in_buf_rd <= 0;
        else if ( page_written_aclk && !page_sent_aclk) pages_in_buf_rd <= pages_in_buf_rd + 1;
        else if (!page_written_aclk &&  page_sent_aclk) pages_in_buf_rd <= pages_in_buf_rd - 1;
        
        if  (!nreset_aclk) block_run <= 0;
        else               block_run <= {block_run[2:0],block_start_w | (block_run[0] & ~ block_end)};
        
        if (!nreset_aclk) block_start_r <= 0;
//        else          block_start_r <= {block_run[2:0], block_start_w};
        else            block_start_r <= {block_start_r[2:0], block_start_w};
        
        if (block_start_r[0]) attrib_r <= attrib[page_rd * ATTRIB_WIDTH +: ATTRIB_WIDTH];

        if (block_start_r[1]) hist_start_page_r <= hist_start_page[attrib_chn];
        if (block_start_r[2]) hist_start_addr[31:12] <= hist_start_page_r + attrib_frame; 
        if (block_start_r[2]) hist_start_addr[11:10]  <= attrib_color; 
        
        if (arst || block_start_r[3]) start_addr_r[31:6] <= {hist_start_addr[31:10], 4'b0}; 
        else if (saxi_start_burst_w)  start_addr_r[31:6] <= start_addr_r[31:6] + 1;
        
        if (!nreset_aclk ||  arst)   first_burst <= 0;
        else if (block_start_r[3])   first_burst <= 1; // block_start_r[3] - same as start_addr_r set
        else if (saxi_start_burst_w) first_burst <= 0;
        
        if (block_start_r[0]) awcache_mode <= mode[HIST_SAXI_AWCACHE+:4];
        if (block_start_r[0]) confirm_write <= mode[HIST_CONFIRM_WRITE];
        
        
        // wdata channel        
        saxi_bvalid_r <=saxi_bvalid; 
        buf_re <= {buf_re[1:0],buf_re_w};
        
        if      (!nreset_aclk) wburst_cntr <= 0;
        else if (fifo_re)      wburst_cntr <= wburst_cntr +1;
        
        if      (block_start_r[0])      num_bursts_in_buf <= 5'h10; // change [2]?
        else if (saxi_wlast && fifo_re) num_bursts_in_buf <= num_bursts_in_buf - 1;

        if      (block_start_r[0])      num_bursts_pending <= 5'h10; // change [2]?
        else if (saxi_bvalid_r)         num_bursts_pending <= num_bursts_pending - 1;
        
        
    end    
    

    pulse_cross_clock pulse_cross_clock_page_sent_i (
        .rst         (arst), // input
        .src_clk     (aclk), // input
        .dst_clk     (mclk), // input
        .in_pulse    (page_sent_aclk), // input
        .out_pulse   (page_sent_mclk), // output
        .busy() // output
    );
    pulse_cross_clock pulse_cross_clock_page_written_aclk_i (
        .rst         (mrst), // input
        .src_clk     (mclk), // input
        .dst_clk     (aclk), // input
        .in_pulse    (burst_done_w), // input
        .out_pulse   (page_written_aclk), // output
        .busy() // output
    );
//burst_done_w
    cmd_deser #(
        .ADDR        (HIST_SAXI_ADDR),
        .ADDR_MASK   (HIST_SAXI_ADDR_MASK),
        .NUM_CYCLES  (6),
        .ADDR_WIDTH  (4),
        .DATA_WIDTH  (32),
        .ADDR1       (HIST_SAXI_MODE_ADDR),
        .ADDR_MASK1  (HIST_SAXI_MODE_ADDR_MASK),
        .ADDR2       (0),
        .ADDR_MASK2  (0)
    ) cmd_deser_histogram_saxi_i (
        .rst         (1'b0),             // input
        .clk         (mclk),             // input
        .srst        (mrst),             // input
        .ad          (cmd_ad),           // input[7:0] 
        .stb         (cmd_stb),          // input
        .addr        (cmd_wa),           // output[3:0] 
        .data        (cmd_data),         // output[31:0] 
        .we          ({we_mode,we_addr}) // output
    );

    ram_var_w_var_r #(
        .COMMENT("histogram_saxi"),
        .REGISTERS(1),
        .LOG2WIDTH_WR(5),
        .LOG2WIDTH_RD(5),
        .DUMMY(0)
    ) ram_var_w_var_r_i (
        .rclk      (aclk),                         // input
        .raddr     ({page_rd[1:0],page_ra[7:0]}),  // input[9:0] 
        .ren       (buf_re[0]),                    // input
        .regen     (buf_re[1]),                    // input
        .data_out  (inter_buf_data),               // output[31:0] 
        .wclk      (mclk),                         // input
        .waddr     ({page_wr[1:0], page_wa[7:0]}), // input[9:0] 
        .we        (dav_r),                        // input
        .web       (8'hff),                        // input[7:0] 
        .data_in   (din_r)                         // input[31:0] 
    );
    // Small extra FIFO to tolerate ram_var_w_var_r latency
    fifo_same_clock #(
        .DATA_WIDTH(32),
        .DATA_DEPTH(4)
    ) fifo_same_clock_i (
        .rst       (1'b0),           // input
        .clk       (aclk),           // input
        .sync_rst  (!en_aclk),       // input
        .we        (buf_re[2]),      // input
        .re        (fifo_re),        // input 
        .data_in   (inter_buf_data), // input[31:0] 
        .data_out  (saxi_wdata),     // output[31:0] 
        .nempty    (fifo_nempty),    // output
        .half_full (fifo_half_full)  // output reg 
    );
endmodule


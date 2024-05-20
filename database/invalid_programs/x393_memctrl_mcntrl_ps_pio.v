// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>mcntrl_ps_pio
 * @file mcntrl_ps_pio.v
 * @date 2015-01-27  
 * @author Andrey Filippov     
 *
 * @brief Read/write channels to DDR3 memory with software-programmable
 * command sequence
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * mcntrl_ps_pio.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  mcntrl_ps_pio.v is distributed in the hope that it will be useful,
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
`include "system_defines.vh" 
`undef DEBUG_FIFO
module  mcntrl_ps_pio#(
    parameter MCNTRL_PS_ADDR=                    'h100,
    parameter MCNTRL_PS_MASK=                    'h3e0, // both channels 0 and 1
    parameter MCNTRL_PS_STATUS_REG_ADDR=         'h2,
    parameter MCNTRL_PS_EN_RST=                  'h0,
    parameter MCNTRL_PS_CMD=                     'h1,
    parameter MCNTRL_PS_STATUS_CNTRL=            'h2
)(
    input                        mrst,
    input                        mclk,
// programming interface
    input                  [7:0] cmd_ad,      // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                        cmd_stb,     // strobe (with first byte) for the command a/d
    
    output                 [7:0] status_ad,     // byte-wide address/data
    output                       status_rq,     // request to send downstream (last byte with rq==0)
    input                        status_start,   // acknowledge of address (first byte) from downsteram   
    
// buffers R/W access 
// read port 0   
    input                        port0_clk,
    input                        port0_re,
    input                        port0_regen, 
    input                [9:0]   port0_addr, // includes page
    output              [31:0]   port0_data,
// write port 1
    input                        port1_clk,
    input                        port1_we,
    input                [9:0]   port1_addr, // includes page
    input               [31:0]   port1_data,
// memory controller interface
// read port 0   
    output reg                   want_rq,
    output reg                   need_rq,
    input                        channel_pgm_en, 
    output               [9:0]   seq_data, // only address 
    output                       seq_set,
    input                        seq_done,
    input                        buf_wr,
    input                        buf_wpage_nxt,
    input                        buf_run,  // @ posedge, use to force page nimber in the buffer (use fifo)
    input                        buf_wrun, // @ negedge, use to force page nimber in the buffer (use fifo)
    
    input               [63:0]   buf_wdata,
    input                        buf_rpage_nxt,
    input                        buf_rd, //buf_rd_chn1,
    output              [63:0]   buf_rdata // buf_rdata_chn1 
);
 localparam CMD_WIDTH=15;
 localparam CMD_FIFO_DEPTH=4;
 localparam PAGE_FIFO_DEPTH  = 4;// fifo depth to hold page numbers for channels (2 bits should be OK now)
 localparam PAGE_CNTR_BITS = 4;
 
 reg [PAGE_CNTR_BITS-1:0] pending_pages; 


 wire               [4:0] cmd_a; // just to compare
 wire              [31:0] cmd_data;
 wire                     cmd_we;
 wire               [1:0] status_data;
 
 wire     [CMD_WIDTH-1:0] cmd_out; 
 wire                     cmd_nempty;
 wire                     cmd_half_full; // to status bit

// decoded commands
 wire                     set_cmd_w;
 wire                     set_status_w;
 wire                     set_en_rst; // set enable, reset register
 reg                [1:0] en_reset;//
 wire                     chn_rst = ~en_reset[0]; // resets command, including fifo;
 wire                     chn_en = &en_reset[1];   // enable requests by channel (continue ones in progress)
// reg                      mem_run;              // sequencer pgm granted and set, waiting/executing memory transfer to/from buffur 0/1
 wire                     busy;
 wire                     short_busy; // does not include memory transaction
 wire                     start;
 //reg                [1:0] page;
 reg                [1:0] cmd_set_d;
// command bit fields
 wire               [9:0] cmd_seq_a= cmd_out[9:0];
 wire               [1:0] cmd_page=  cmd_out[11:10];
 wire                     cmd_need=  cmd_out[12];
 wire                     cmd_wr= cmd_out[13]; // chn=   cmd_out[13]; command write, not read
 wire                     cmd_wait=  cmd_out[14]; // wait cmd finished before proceeding
 reg                      cmd_set;
 reg                      cmd_wait_r;
 
 wire               [1:0] page_out;
 reg                      nreset_page_fifo;
 reg                      nreset_page_fifo_neg;

wire cmd_wr_out;
reg     [1:0] page_out_r;
reg     [1:0] page_out_r_negedge;
reg           page_r_set;
reg           page_w_set_early;
reg           page_w_set_early_negedge;
reg           en_page_w_set;
reg           page_w_set_negedge;



 
// assign short_busy= want_rq || need_rq ||want_rq1 || need_rq1 || cmd_set; // cmd_set - advance FIFO
 assign short_busy= want_rq || need_rq || cmd_set; // cmd_set - advance FIFO
 assign busy= short_busy || (pending_pages != 0); //  mem_run;
 assign start= chn_en && !short_busy && cmd_nempty && ((pending_pages == 0) || !cmd_wait_r); //(!mem_run || !cmd_wait_r); // do not wait memory transaction if wait 
 assign seq_data= cmd_seq_a;
 assign seq_set=cmd_set;
 assign status_data=   {cmd_half_full,cmd_nempty | busy};
 assign set_cmd_w =    cmd_we && (cmd_a== MCNTRL_PS_CMD);
 assign set_status_w = cmd_we && (cmd_a== MCNTRL_PS_STATUS_CNTRL);
 assign set_en_rst =   cmd_we && (cmd_a== MCNTRL_PS_EN_RST);
 //PAGE_CNTR_BITS
    always @ (posedge mclk) begin
    
        if      (mrst)                  pending_pages <= 0;
        else if (chn_rst)               pending_pages <= 0;
        else if ( cmd_set && !seq_done) pending_pages <= pending_pages + 1;
        else if (!cmd_set &&  seq_done) pending_pages <= pending_pages - 1;
        
        if (mrst) nreset_page_fifo <= 0;
        else      nreset_page_fifo <= cmd_nempty | busy;
        
        if      (mrst)           cmd_wait_r <= 0;
        else if (channel_pgm_en) cmd_wait_r <= cmd_wait;
        
        if (mrst)            en_reset <= 0;
        else if (set_en_rst) en_reset <= cmd_data[1:0];
        
        if (mrst) begin
            want_rq <= 0;
            need_rq <= 0;
        end else if (chn_rst || channel_pgm_en) begin
            want_rq <= 0;
            need_rq <= 0;
        end else if (start) begin
            want_rq <= 1; // !cmd_chn;
            need_rq <= cmd_need; // !cmd_chn && cmd_need;
        end
        
        
        if (mrst)          cmd_set <= 0;
        else if (chn_rst) cmd_set <= 0;
        else              cmd_set <= channel_pgm_en;
        
        
        if (mrst)          cmd_set_d <= 0;
        else              cmd_set_d <= {cmd_set_d[0],cmd_set & ~cmd_wr}; // only for channel0 (memory read)
    end
    
    
    cmd_deser #(
        .ADDR       (MCNTRL_PS_ADDR),
        .ADDR_MASK  (MCNTRL_PS_MASK),
        .NUM_CYCLES (6),
        .ADDR_WIDTH (5),
        .DATA_WIDTH (32)
    ) cmd_deser_mcontr_32bit_i (
        .rst        (1'b0),       // rst), // input
        .clk        (mclk),       // input
        .srst       (mrst),       // input
        .ad         (cmd_ad),     // input[7:0] 
        .stb        (cmd_stb),    // input
        .addr       (cmd_a),      // output[15:0] 
        .data       (cmd_data),   // output[31:0] 
        .we         (cmd_we)      // output
    );

    status_generate #(
        .STATUS_REG_ADDR  (MCNTRL_PS_STATUS_REG_ADDR),
        .PAYLOAD_BITS     (2)
    ) status_generate_i (
        .rst              (1'b0),          // rst), // input
        .clk              (mclk),          // input
        .srst             (mrst),          // input
        .we               (set_status_w),  // input
        .wd               (cmd_data[7:0]), // input[7:0] 
        .status           (status_data),   // input[25:0] 
        .ad               (status_ad),     // output[7:0] 
        .rq               (status_rq),     // output
        .start            (status_start)   // input
    );

fifo_same_clock   #(
    .DATA_WIDTH(CMD_WIDTH),
    .DATA_DEPTH(CMD_FIFO_DEPTH) 
    ) cmd_fifo_i (
        .rst       (1'b0),
        .clk       (mclk),
        .sync_rst  (chn_rst), // synchronously reset fifo;
        .we        (set_cmd_w),
        .re        (cmd_set),
        .data_in   (cmd_data[CMD_WIDTH-1:0]),
        .data_out  (cmd_out),  //SuppressThisWarning ISExst Assignment to awsize_out ignored, since the identifier is never used
        .nempty    (cmd_nempty),
        .half_full (cmd_half_full)
`ifdef DEBUG_FIFO
        ,
        .under      (waddr_under), // output reg 
        .over       (waddr_over), // output reg
        .wcount     (waddr_wcount), // output[3:0] reg 
        .rcount     (waddr_rcount), // output[3:0] reg 
        .num_in_fifo(waddr_num_in_fifo) // output[3:0] 
`endif         
    );


// Port 0 (read DDR to AXI) buffer
    mcntrl_buf_rd #(
        .LOG2WIDTH_RD(5)
    ) chn0_buf_i (
        .ext_clk      (port0_clk),          // input
        .ext_raddr    (port0_addr),         // input[9:0] 
        .ext_rd       (port0_re),           // input
        .ext_regen    (port0_regen),        // input
        .ext_data_out (port0_data),         // output[31:0] 
//        .emul64       (1'b0),               // input Modify buffer addresses (used for JP4 until a 64-wide mode is implemented)
        .wclk         (!mclk),              // input
        .wpage_in     (page_out_r_negedge), // page_neg), // input[1:0] 
        .wpage_set    (page_w_set_negedge), // wpage_set_chn0_neg), // input 
        .page_next    (buf_wpage_nxt),      // input
        .page         (),                   // output[1:0]
        .we           (buf_wr),             // input
        .data_in      (buf_wdata)           // input[63:0] 
    );
    
// Port 1 (write DDR from AXI) buffer
    mcntrl_buf_wr #(
        .LOG2WIDTH_WR(5)
    ) chn1_buf_i (
        .ext_clk      (port1_clk),          // input
        .ext_waddr    (port1_addr),         // input[9:0] 
        .ext_we       (port1_we),           // input
        .ext_data_in  (port1_data),         // input[31:0] 
        .rclk         (mclk),               // input
        .rpage_in     (page_out_r),         // page), // input[1:0] 
        .rpage_set    (page_r_set),         // rpage_set_chn1), // input 
        .page_next    (buf_rpage_nxt),      // input
        .page         (),                   // output[1:0]
        .rd           (buf_rd),             // input
        .data_out     (buf_rdata)           // output[63:0] 
    );

fifo_same_clock   #(
    .DATA_WIDTH(3),
    .DATA_DEPTH(PAGE_FIFO_DEPTH) 
    ) page_fifo1_i (
        .rst       (1'b0),
        .clk       (mclk),                      // posedge
        .sync_rst  (mrst || !nreset_page_fifo), // synchronously reset fifo;
        .we        (channel_pgm_en),
        .re        (buf_run),
        .data_in   ({cmd_wr,cmd_page}),         // page),
        .data_out  ({cmd_wr_out,page_out}),
        .nempty    (),                          // page_fifo1_nempty),
        .half_full ()
    );

always @ (posedge mclk) begin
    if      (mrst)    page_out_r <= 0;
    else if (buf_run) page_out_r <= page_out;
    

end

always @ (posedge mclk) begin
   page_r_set <=        cmd_wr_out && buf_run;  // page_out_r, page_r_set - output to buffer
   page_w_set_early <= !cmd_wr_out && buf_run;
end

always @ (negedge mclk) begin
    nreset_page_fifo_neg <= nreset_page_fifo;
    page_w_set_early_negedge <= page_w_set_early;
    page_out_r_negedge <= page_out_r;
    if (!nreset_page_fifo_neg || buf_wrun) en_page_w_set <= 0;
    else if (page_w_set_early_negedge)     en_page_w_set <= 1;
    page_w_set_negedge <= en_page_w_set && buf_wrun;
end        
    
endmodule


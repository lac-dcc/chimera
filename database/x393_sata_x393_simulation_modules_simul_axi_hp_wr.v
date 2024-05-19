// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*******************************************************************************
 * Module: simul_axi_hp_wr
 * Date:2015-04-25  
 * Author: Andrey Filippov     
 * Description: Simplified model of AXI_HP write channel (64-bit only)
 *
 * Copyright (c) 2015 Elphel, Inc.
 * simul_axi_hp_wr.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  simul_axi_hp_wr.v is distributed in the hope that it will be useful,
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
 *******************************************************************************/
`timescale 1ns/1ps

module  simul_axi_hp_wr#(
    parameter [1:0] HP_PORT=0
) (
    input         rst,
    // AXI signals
    input         aclk,
    output        aresetn, // do not use?
    // write address
    input  [31:0] awaddr,
    input         awvalid,
    output        awready,
    input  [ 5:0] awid,
    input  [ 1:0] awlock,   // verify the correct values are here
    input  [ 3:0] awcache,  // verify the correct values are here
    input  [ 2:0] awprot,   // verify the correct values are here
    input  [ 3:0] awlen,
    input  [ 1:0] awsize,
    input  [ 1:0] awburst,
    input  [ 3:0] awqos,    // verify the correct values are here
    // write data
    input  [63:0] wdata,
    input         wvalid,
    output        wready,
    input  [ 5:0] wid,
    input         wlast,
    input  [ 7:0] wstrb,
    // write response
    output        bvalid,
    input         bready,
    output [ 5:0] bid,
    output [ 1:0] bresp,
    // PL extra (non-AXI) signals
    output [ 7:0] wcount,
    output [ 5:0] wacount, // racount has only 3 bits
    input         wrissuecap1en, // do not use yet
    // Simulation signals - use same aclk
    output [31:0] sim_wr_address,
    output [ 5:0] sim_wid,
    output        sim_wr_valid, // ready to provide simulation data
    input         sim_wr_ready, // simulation may pause this channel by keeping this signal inactive
    output [63:0] sim_wr_data,
    output [ 7:0] sim_wr_stb,
    input  [ 3:0] sim_bresp_latency, // latency in writing data outside of the module 
    output [ 2:0] sim_wr_cap,
    output [ 3:0] sim_wr_qos,
    input  [31:0] reg_addr,
    input         reg_wr,
    input         reg_rd,
    input  [31:0] reg_din,
    output [31:0] reg_dout
);
//    localparam ADDRESS_BITS=32;
    localparam AFI_BASECTRL= 32'hf8008000+ (HP_PORT << 12);
    localparam AFI_WRCHAN_CTRL= AFI_BASECTRL + 'h14;
    localparam AFI_WRCHAN_ISSUINGCAP= AFI_BASECTRL + 'h18;
    localparam AFI_WRQOS= AFI_BASECTRL + 'h1c;
    localparam AFI_WRDATAFIFO_LEVEL= AFI_BASECTRL + 'h20;
    localparam AFI_WRDEBUG= AFI_BASECTRL + 'h24; // SuppressThisWarning VEditor - not yet used
    
    localparam VALID_AWLOCK =  2'b0; // TODO
    localparam VALID_AWCACHE = 4'b0011; //
    localparam VALID_AWPROT =  3'b000;
    localparam VALID_AWLOCK_MASK =  2'b11; // TODO
    localparam VALID_AWCACHE_MASK = 4'b0011; //
    localparam VALID_AWPROT_MASK =  3'b010;
/*
http://forums.xilinx.com/t5/Embedded-Processor-System-Design/Accessing-DDR-from-PL-on-Zynq/m-p/324877#M8413
Solved it!
To make it work, I set the (AR/AW)CACHE=0x11 and (AR/AW)PROT=0x00. In the CDMA datasheet, these were the recommended values, which I confirmed with ChipScope, when attached to CDMA's master port.
The default values set by VHLS were 0x00 and 0x10 respectively, which is also the case in the last post.
Alex
UPDATE: Xilinx docs say that (AR/AW)CACHE is ignored

*/    
    
    reg   [3:0] WrDataThreshold =  'hf;
    reg   [1:0] WrCmdReleaseMode =  0;
    reg         wrQosHeadOfCmdQEn =   0;
    reg         wrFabricOutCmdEn =    0;
    reg         wrFabricQosEn =       0;
    reg         wr32BitEn =         0; // verify it i 0
    reg   [2:0] wrIssueCap1 =       0;
    reg   [2:0] wrIssueCap0 =       7;
    reg   [3:0] staticQos =         0;

    wire  [3:0] wr_qos_in;
    wire  [3:0] wr_qos_out;

    wire        aw_nempty;
    wire        w_nempty;
    wire        enough_data; // enough data to start a new burst
    wire [11:3] next_wr_address; // bits that are incrtemented in 64-bit mode (higher are kept according to AXI 4KB inc. limit)
    reg  [31:0] write_address;
    reg   [5:0] awid_r;          // awid registered with write_address
    wire        fifo_wd_rd; // read data fifo
    wire        last_confirmed_write;


    wire  [5:0] awid_out; // verify it matches wid_out when outputting data
    wire  [1:0] awburst_out;
    wire  [1:0] awsize_out; // verify it is 3'h3
    wire  [3:0] awlen_out;
    wire [31:0] awaddr_out;
    wire  [5:0] wid_out;
    wire        wlast_out;
    wire  [7:0] wstrb_out;
    wire [63:0] wdata_out;

    reg         fifo_data_we_d;
    reg         fifo_addr_we_d;
    reg   [3:0] write_left;
    reg  [ 1:0] wburst;             // registered burst type
    reg  [ 3:0] wlen;               // registered awlen type (for wrapped over transfers)
    wire        start_write_burst_w;
    reg         start_write_burst_r; // next after start_write_burst_w
    wire        write_in_progress_w; // should go inactive last confirmed upstream cycle
    reg         write_in_progress;
    reg  [ 7:0] num_full_data = 0; // Number of full data bursts in FIFO

    wire  [5:0] wresp_num_in_fifo;
    reg         was_wresp_re=0;
    wire        wresp_re;
        
    // documentation sais : "When set, allows the priority of a transaction at the head of the WrCmdQ to be promoted if higher
    // priority transactions are backed up behind it." Whqt about demotion? Assuming it is not demoted
    assign sim_wr_qos = (wrQosHeadOfCmdQEn && (wr_qos_in > wr_qos_out))? wr_qos_in : wr_qos_out;
    assign sim_wr_cap = (wrFabricOutCmdEn && wrissuecap1en) ? wrIssueCap1 : wrIssueCap0;
    assign wr_qos_in = wrFabricQosEn?(awqos & {4{awvalid}}) : staticQos;
 //awqos & {4{awvalid}}   
    assign aresetn= ~rst; // probably not needed at all - docs say "do not use"
    // Supported control register fields
    assign reg_dout=(reg_rd && (reg_addr==AFI_WRDATAFIFO_LEVEL))?
                          {24'b0,wcount}:
                    (   (reg_rd && (reg_addr==AFI_WRCHAN_CTRL))?
                          {20'b0,WrDataThreshold,2'b0,WrCmdReleaseMode,wrQosHeadOfCmdQEn,wrFabricOutCmdEn,wrFabricQosEn,wr32BitEn}:
                     (  (reg_rd && (reg_addr==AFI_WRCHAN_ISSUINGCAP))?
                          {25'b0,wrIssueCap1,1'b0,wrIssueCap0}:
                      ( (reg_rd && (reg_addr==AFI_WRQOS))?
                          {28'b0,staticQos}:32'bz)));

    always @ (posedge aclk or posedge rst) begin
        if (rst) begin
            WrDataThreshold  <= 'hf;
            WrCmdReleaseMode <= 0;
            wrQosHeadOfCmdQEn  <= 0;
            wrFabricOutCmdEn   <= 0;
            wrFabricQosEn      <= 0;
            wr32BitEn        <= 0;
        end else if (reg_wr && (reg_addr==AFI_WRCHAN_CTRL)) begin
            WrDataThreshold  <= reg_din[11:8];
            WrCmdReleaseMode <= reg_din[5:4];
            wrQosHeadOfCmdQEn  <= reg_din[3];
            wrFabricOutCmdEn   <= reg_din[2];
            wrFabricQosEn      <= reg_din[1];
            wr32BitEn        <= reg_din[0];
        end
        if (rst) begin
            wrIssueCap1  <= 0;
            wrIssueCap0  <= 7;
        end else if (reg_wr && (reg_addr==AFI_WRCHAN_ISSUINGCAP)) begin
            wrIssueCap1  <= reg_din[6:4];
            wrIssueCap0  <= reg_din[2:0];
        end
        if (rst) begin
            staticQos  <= 0;
        end else if (reg_wr && (reg_addr==AFI_WRQOS)) begin
            staticQos  <= reg_din[3:0];
        end
    end    

    // generate ready signals for address and data
    assign wready= !wcount[7] && (!(&wcount[6:0]) || !fifo_data_we_d);
    always @ (posedge rst or posedge aclk) begin
        if (rst) fifo_data_we_d<=0;
        else fifo_data_we_d <= wready && wvalid;
    end
    assign awready= !wacount[5] && (!(&wacount[4:0]) || !fifo_addr_we_d);
    always @ (posedge rst or posedge aclk) begin
        if (rst) fifo_addr_we_d<=0;
        else fifo_addr_we_d <= awready && awvalid;
    end
    
    // Count full data bursts ready in FIFO
    always @ (posedge rst or posedge aclk) begin
        if (rst) num_full_data <=0;
        else if (wvalid && wready && wlast     && !start_write_burst_w) num_full_data <= num_full_data + 1;
        else if (!(wvalid && wready && wlast)  &&  start_write_burst_w) num_full_data <= num_full_data - 1;
    end
    
    
    assign sim_wr_address= write_address;
    assign enough_data=|num_full_data || ((WrCmdReleaseMode==2'b01) && (wcount > {4'b0,WrDataThreshold}));
    assign fifo_wd_rd=   write_in_progress && w_nempty && sim_wr_ready;
    assign sim_wr_valid= write_in_progress && w_nempty; // for continuing writes
    assign last_confirmed_write = (write_left==0) && fifo_wd_rd && wlast_out; // wlast_out should take precedence over write_left?
    assign start_write_burst_w= 
        aw_nempty && enough_data &&
        (! write_in_progress || last_confirmed_write);

    assign write_in_progress_w= 
        (aw_nempty && enough_data) || (write_in_progress && !last_confirmed_write); 

    // AXI: Bursts should not cross 4KB boundaries (... and to limit size of the address incrementer)
    // in 64 bit mode - low 3 bits are preserved, next 9 are incremented        
    assign      next_wr_address[11:3] =
      wburst[1]?
        (wburst[0]? {9'bx}:((write_address[11:3] + 1) & {5'h1f, ~wlen[3:0]})):
        (wburst[0]? (write_address[11:3]+1):(write_address[11:3]));
    assign sim_wr_data= wdata_out; 
    assign sim_wid= wid_out;    
    assign sim_wr_stb=wstrb_out;
    
    always @ (posedge  aclk) begin
        start_write_burst_r <= start_write_burst_w;
        if (start_write_burst_r) begin
            if (awid_r != wid_out) begin
                $display ("%m: at time %t ERROR: awid=%h, wid=%h",$time,awid_out,wid_out);
                $stop;
            end
        end
        if (start_write_burst_w) begin
            if (awsize_out != 2'h3) begin
                $display ("%m: at time %t ERROR: awsize_out=%h, currently only 'h3 (8 bytes) is valid",$time,awsize_out);
                $stop;
            end
        end
        if (awvalid && awready) begin
            if (((awlock ^ VALID_AWLOCK) & VALID_AWLOCK_MASK) != 0) begin
                $display ("%m: at time %t ERROR: awlock = %h, valid %h with mask %h",$time, awlock, VALID_AWLOCK, VALID_AWLOCK_MASK);
                $stop;
            end
            if (((awcache ^ VALID_AWCACHE) & VALID_AWCACHE_MASK) != 0) begin
                $display ("%m: at time %t ERROR: awcache = %h, valid %h with mask %h",$time, awcache, VALID_AWCACHE, VALID_AWCACHE_MASK);
                $stop;
            end
            if (((awprot ^ VALID_AWPROT) & VALID_AWPROT_MASK) != 0) begin
                $display ("%m: at time %t ERROR: awprot = %h, valid %h with mask %h",$time, awprot, VALID_AWPROT, VALID_AWPROT_MASK);
                $stop;
            end
        end
    end
    
    
        
    always @ (posedge  aclk or posedge  rst) begin
      if   (rst)                    wburst[1:0] <= 0;
      else if (start_write_burst_w) wburst[1:0] <= awburst_out[1:0];

      if   (rst)                    wlen[3:0] <= 0;
      else if (start_write_burst_w) wlen[3:0] <= awlen_out[3:0];
    
      if   (rst) write_in_progress <= 0;
      else       write_in_progress <= write_in_progress_w;

      if   (rst) write_left <= 0;
      else if (start_write_burst_w) write_left <= awlen_out[3:0]; // precedence over inc
      else if (fifo_wd_rd)           write_left <= write_left-1; //SuppressThisWarning ISExst Result of 32-bit expression is truncated to fit in 4-bit target.
            
      if   (rst)                    write_address <= 32'bx;
      else if (start_write_burst_w) write_address <= awaddr_out; // precedence over inc
      else if (fifo_wd_rd)          write_address <= {write_address[31:12],next_wr_address[11:3],write_address[2:0]};
      
      if   (rst)                    awid_r <= 6'bx;
      else if (start_write_burst_w) awid_r <= awid_out; // precedence over inc
      
    end
        
       

fifo_same_clock_fill   #( .DATA_WIDTH(50),.DATA_DEPTH(5)) // read - 4, write - 32?
    waddr_i (
        .rst          (rst),
        .clk          (aclk),
        .sync_rst     (1'b0),
        .we           (awvalid && awready),
        .re           (start_write_burst_w),
        .data_in      ({awid[5:0],     awburst[1:0],    awsize[1:0],    awlen[3:0],    awaddr[31:0],     wr_qos_in[3:0]}),
        .data_out     ({awid_out[5:0], awburst_out[1:0],awsize_out[1:0],awlen_out[3:0],awaddr_out[31:0], wr_qos_out[3:0]}),
        .nempty       (aw_nempty),
        .half_full    (), //aw_half_full),
        .under        (), //waddr_under),  // output reg 
        .over         (), //waddr_over),   // output reg
        .wcount       (), //waddr_wcount), // output[3:0] reg 
        .rcount       (), //waddr_rcount), // output[3:0] reg 
        .wnum_in_fifo (wacount),           // output[3:0] 
        .rnum_in_fifo ()                   // output[3:0] 
    );
fifo_same_clock_fill   #( .DATA_WIDTH(79),.DATA_DEPTH(7))    
    wdata_i (
        .rst          (rst),
        .clk          (aclk),
        .sync_rst     (1'b0),
        .we           (wvalid && wready),
        .re           (fifo_wd_rd), //start_write_burst_w), // wrong
        .data_in      ({wlast,     wid[5:0],          wstrb[7:0],     wdata[63:0]}),
        .data_out     ({wlast_out,wid_out[5:0],  wstrb_out[7:0], wdata_out[63:0]}),
        .nempty       (w_nempty),
        .half_full    (), //w_half_full),
        .under        (), //wdata_under), // output reg 
        .over         (), //wdata_over), // output reg
        .wcount       (), //wdata_wcount), // output[3:0] reg 
        .rcount       (), //wdata_rcount), // output[3:0] reg 
        .wnum_in_fifo (wcount), // output[3:0] 
        .rnum_in_fifo () // output[3:0] 
    );
// **** Write response channel ****    
    wire [ 1:0] bresp_value=2'b0;
    wire [ 1:0] bresp_in;
    
    wire fifo_wd_rd_dly;
    wire [5:0] bid_in;

//    input  [ 3:0] sim_bresp_latency, // latency in writing data outside of the module 

    dly_16 #(
        .WIDTH(1)
    ) bresp_dly_16_i (
        .clk    (aclk),                   // input
        .rst    (rst),                    // input
        .dly    (sim_bresp_latency[3:0]), // input[3:0] 
        .din    (last_confirmed_write),   //fifo_wd_rd), // input[0:0] 
        .dout   (fifo_wd_rd_dly)          // output[0:0] 
    );

    // first FIFO for bresp - latency outside of the module
// wresp per burst, not per item !    
fifo_same_clock_fill  #( .DATA_WIDTH(8),.DATA_DEPTH(5))    
    wresp_ext_i (
        .rst          (rst),
        .clk          (aclk),
        .sync_rst     (1'b0),
        .we           (last_confirmed_write), // fifo_wd_rd),
        .re           (fifo_wd_rd_dly), // not allowing RE next cycle after bvalid
        .data_in      ({wid_out[5:0],bresp_value[1:0]}),
        .data_out     ({bid_in[5:0],bresp_in[1:0]}),
        .nempty       (),
        .half_full    (), //),
        .under        (),  //wresp_under), // output reg 
        .over         (),  //wresp_over), // output reg
        .wcount       (),  //wresp_wcount), // output[3:0] reg 
        .rcount       (),  //wresp_rcount), // output[3:0] reg 
        .wnum_in_fifo (), // wresp_num_in_fifo) // output[3:0] 
        .rnum_in_fifo ()  // wresp_num_in_fifo) // output[3:0] 
    );

    assign wresp_re=bready && bvalid; // && !was_wresp_re;
    always @ (posedge rst or posedge aclk) begin
        if (rst) was_wresp_re<=0;
        else was_wresp_re <= wresp_re;
    end
    assign bvalid=|wresp_num_in_fifo[5:1] || (!was_wresp_re && wresp_num_in_fifo[0]);
    // second wresp FIFO (does it exist in the actual module)?
fifo_same_clock_fill  #( .DATA_WIDTH(8),.DATA_DEPTH(5))    
    wresp_i (
        .rst          (rst),
        .clk          (aclk),
        .sync_rst     (1'b0),
        .we           (fifo_wd_rd_dly),
        .re           (wresp_re), // not allowing RE next cycle after bvalid
        .data_in      ({bid_in[5:0],bresp_in[1:0]}),
        .data_out     ({bid[5:0],bresp[1:0]}),
        .nempty       (), //bvalid),
        .half_full    (), //),
        .under        (), //wresp_under),       // output reg 
        .over         (), //wresp_over),        // output reg
        .wcount       (), //wresp_wcount),      // output[3:0] reg 
        .rcount       (), //wresp_rcount),      // output[3:0] reg 
        .wnum_in_fifo (), // wresp_num_in_fifo) // output[3:0] 
        .rnum_in_fifo (wresp_num_in_fifo)       // wresp_num_in_fifo) // output[3:0] 
    );

endmodule


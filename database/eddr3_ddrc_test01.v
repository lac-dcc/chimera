/*******************************************************************************
 * Module: ddrc_test01
 * Date:2014-05-18  
 * Author: Andrey Filippov
 * Description: DDR3 controller test with axi
 *
 * Copyright (c) 2014 Elphel, Inc.
 * ddrc_test01.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  ddrc_test01.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *******************************************************************************/
`timescale 1ns/1ps
`define use200Mhz 1
`define DEBUG_FIFO 1 
module  ddrc_test01 #(
    parameter PHASE_WIDTH =     8,
    parameter SLEW_DQ =         "SLOW",
    parameter SLEW_DQS =        "SLOW",
    parameter SLEW_CMDA =       "SLOW",
    parameter SLEW_CLK =        "SLOW",
    parameter IBUF_LOW_PWR =    "TRUE",
`ifdef use200Mhz
    parameter real REFCLK_FREQUENCY = 200.0, // 300.0,
    parameter HIGH_PERFORMANCE_MODE = "FALSE",
    parameter CLKIN_PERIOD          = 20, // 10, //ns >1.25, 600<Fvco<1200 // Hardware 150MHz , change to             | 6.667
    parameter CLKFBOUT_MULT =       16,   // 8, // Fvco=Fclkin*CLKFBOUT_MULT_F/DIVCLK_DIVIDE, Fout=Fvco/CLKOUT#_DIVIDE  | 16
    parameter CLKFBOUT_MULT_REF =   16,   // 18,   // 9, // Fvco=Fclkin*CLKFBOUT_MULT_F/DIVCLK_DIVIDE, Fout=Fvco/CLKOUT#_DIVIDE  | 6
    parameter CLKFBOUT_DIV_REF =    4, // 200Mhz 3, // To get 300MHz for the reference clock
`else
    parameter real REFCLK_FREQUENCY = 300.0,
    parameter HIGH_PERFORMANCE_MODE = "FALSE",
    parameter CLKIN_PERIOD          = 10, //ns >1.25, 600<Fvco<1200
    parameter CLKFBOUT_MULT =       8, // Fvco=Fclkin*CLKFBOUT_MULT_F/DIVCLK_DIVIDE, Fout=Fvco/CLKOUT#_DIVIDE
    parameter CLKFBOUT_MULT_REF =   9, // Fvco=Fclkin*CLKFBOUT_MULT_F/DIVCLK_DIVIDE, Fout=Fvco/CLKOUT#_DIVIDE
    parameter CLKFBOUT_DIV_REF =    3, // To get 300MHz for the reference clock
`endif    
    parameter DIVCLK_DIVIDE=        1,
    parameter CLKFBOUT_PHASE =      0.000,
    parameter SDCLK_PHASE =         0.000,
    parameter CLK_PHASE =           0.000,
    parameter CLK_DIV_PHASE =       0.000,
    parameter MCLK_PHASE =          90.000,
    parameter REF_JITTER1 =         0.010,
    parameter SS_EN =              "FALSE",
    parameter SS_MODE =      "CENTER_HIGH",
    parameter SS_MOD_PERIOD =       10000,
    parameter CMD_PAUSE_BITS=       10,
    parameter CMD_DONE_BIT=         10,
    parameter AXI_WR_ADDR_BITS =    13,
    parameter AXI_RD_ADDR_BITS =    13,
    parameter CONTROL_ADDR =        'h1000, // AXI write address of control write registers
    parameter CONTROL_ADDR_MASK =   'h1400, // AXI write address of control registers
    parameter STATUS_ADDR =         'h1400, // AXI write address of status read registers
    parameter STATUS_ADDR_MASK =    'h1400, // AXI write address of status registers
    parameter BUSY_WR_ADDR =        'h1800, // AXI write address to generate busy
    parameter BUSY_WR_ADDR_MASK =   'h1c00, // AXI write address mask to generate busy
    parameter CMD0_ADDR =           'h0800, // AXI write to command sequence memory
    parameter CMD0_ADDR_MASK =      'h1800, // AXI read address mask for the command sequence memory
    parameter PORT0_RD_ADDR =       'h0000, // AXI read address to generate busy
    parameter PORT0_RD_ADDR_MASK =  'h1c00, // AXI read address mask to generate busy
    parameter PORT1_WR_ADDR =       'h0400, // AXI read address to generate busy
    parameter PORT1_WR_ADDR_MASK =  'h1c00,  // AXI read address mask to generate busy
    // parameters below to be ORed with CONTROL_ADDR and CONTROL_ADDR_MASK respectively
    parameter DLY_LD_REL =            'h080,  // address to generate delay load
    parameter DLY_LD_REL_MASK =       'h380,  // address mask to generate delay load
    parameter DLY_SET_REL =           'h070,  // address to generate delay set
    parameter DLY_SET_REL_MASK =      'h3ff,  // address mask to generate delay set
    parameter RUN_CHN_REL =           'h000,  // address to set sequnecer channel and  run (4 LSB-s - channel)
    parameter RUN_CHN_REL_MASK =      'h3f0,  // address mask to generate sequencer channel/run
    parameter PATTERNS_REL =          'h020,  // address to set DQM and DQS patterns (16'h0055)
    parameter PATTERNS_REL_MASK =     'h3ff,  // address mask to set DQM and DQS patterns
    parameter PATTERNS_TRI_REL =      'h021,  // address to set DQM and DQS tristate on/off patterns {dqs_off,dqs_on, dq_off,dq_on} - 4 bits each
    parameter PATTERNS_TRI_REL_MASK = 'h3ff,  // address mask to set DQM and DQS tristate patterns
    parameter WBUF_DELAY_REL =        'h022,  // extra delay (in mclk cycles) to add to write buffer enable (DDR3 read data)
    parameter WBUF_DELAY_REL_MASK =   'h3ff,  // address mask to set extra delay
    parameter PAGES_REL =             'h023,  // address to set buffer pages {port1_page[1:0],port1_int_page[1:0],port0_page[1:0],port0_int_page[1:0]}
    parameter PAGES_REL_MASK =        'h3ff,  // address mask to set DQM and DQS patterns
    parameter CMDA_EN_REL =           'h024,  // address to enable('h825)/disable('h824) command/address outputs  
    parameter CMDA_EN_REL_MASK =      'h3fe,  // address mask for command/address outputs
    parameter SDRST_ACT_REL =         'h026,  // address to activate('h827)/deactivate('h826) active-low reset signal to DDR3 memory  
    parameter SDRST_ACT_REL_MASK =    'h3fe,  // address mask for reset DDR3
    parameter CKE_EN_REL =            'h028,  // address to enable('h829)/disable('h828) CKE signal to memory   
    parameter CKE_EN_REL_MASK =       'h3fe,  // address mask for command/address outputs
    parameter DCI_RST_REL =           'h02a,  // address to activate('h82b)/deactivate('h82a) Zynq DCI calibrate circuitry  
    parameter DCI_RST_REL_MASK =      'h3fe,  // address mask for DCI calibrate circuitry
    parameter DLY_RST_REL =           'h02c,  // address to activate('h82d)/deactivate('h82c) delay calibration circuitry  
    parameter DLY_RST_REL_MASK =      'h3fe,  // address mask for delay calibration circuitry
    parameter EXTRA_REL =             'h02e,  // address to set extra parameters (currently just inv_clk_div)
    parameter EXTRA_REL_MASK =        'h3ff,  // address mask for extra parameters
    parameter REFRESH_EN_REL =        'h030,  // address to enable('h31) and disable ('h30) DDR refresh
    parameter REFRESH_EN_REL_MASK =   'h3fe,  // address mask to enable/disable DDR refresh
    parameter REFRESH_PER_REL =       'h032,  // address to set refresh period in 32 x tCK
    parameter REFRESH_PER_REL_MASK =  'h3ff,  // address mask set refresh period
    parameter REFRESH_ADDR_REL =      'h033,  // address to set sequencer start address for DDR refresh
    parameter REFRESH_ADDR_REL_MASK = 'h3ff   // address mask set refresh sequencer address
)(
    // DDR3 interface
    output                       SDRST, // DDR3 reset (active low)
    output                       SDCLK, // DDR3 clock differential output, positive
    output                       SDNCLK,// DDR3 clock differential output, negative
    output  [ADDRESS_NUMBER-1:0] SDA,   // output address ports (14:0) for 4Gb device
    output                 [2:0] SDBA,  // output bank address ports
    output                       SDWE,  // output WE port
    output                       SDRAS, // output RAS port
    output                       SDCAS, // output CAS port
    output                       SDCKE, // output Clock Enable port
    output                       SDODT, // output ODT port

    inout                 [15:0] SDD,   // DQ  I/O pads
    output                       SDDML, // LDM  I/O pad (actually only output)
    inout                        DQSL,  // LDQS I/O pad
    inout                        NDQSL, // ~LDQS I/O pad
    output                       SDDMU, // UDM  I/O pad (actually only output)
    inout                        DQSU,  // UDQS I/O pad
    inout                        NDQSU,
    output                       DUMMY_TO_KEEP,  // to keep PS7 signals from "optimization"
    input                        MEMCLK
     // ~UDQS I/O pad
    // AXI write (ps -> pl)
);
    localparam ADDRESS_NUMBER=15;
// Source for reset and clock
   wire    [3:0]     fclk;      // PL Clocks [3:0], output
   wire    [3:0]     frst;      // PL Clocks [3:0], output
   
   
    
// AXI write interface signals
//(* keep = "true" *)
   wire           axi_aclk;    // clock - should be buffered
//   wire           axi_naclk;   // debugging
//   wire           axi_aresetn; // reset, active low
//(* dont_touch = "true" *)
   wire           axi_rst;     // reset, active high
// AXI Write Address
   wire   [31:0]  axi_awaddr;  // AWADDR[31:0], input
   wire           axi_awvalid; // AWVALID, input
   wire           axi_awready; // AWREADY, output
   wire   [11:0]  axi_awid;    // AWID[11:0], input
//   input  [ 1:0] awlock,     // AWLOCK[1:0], input
//   input  [ 3:0] awcache,    // AWCACHE[3:0], input
//   input  [ 2:0] awprot,     // AWPROT[2:0], input
   wire   [ 3:0]  axi_awlen;       // AWLEN[3:0], input
   wire   [ 1:0]  axi_awsize;      // AWSIZE[1:0], input
   wire   [ 1:0]  axi_awburst;     // AWBURST[1:0], input
//   input  [ 3:0] awqos,      // AWQOS[3:0], input
// AXI PS Master GP0: Write Data
   wire   [31:0]  axi_wdata;       // WDATA[31:0], input
   wire           axi_wvalid;      // WVALID, input
   wire           axi_wready;      // WREADY, output
   wire   [11:0]  axi_wid;         // WID[11:0], input
   wire           axi_wlast;       // WLAST, input
   wire   [ 3:0]  axi_wstb;        // WSTRB[3:0], input
// AXI PS Master GP0: Write Responce
   wire           axi_bvalid;      // BVALID, output
   wire           axi_bready;      // BREADY, input
   wire   [11:0]  axi_bid;         // BID[11:0], output
   wire   [ 1:0]  axi_bresp;       // BRESP[1:0], output
   
// BRAM (and other write modules) interface from AXI write
   wire [AXI_WR_ADDR_BITS-1:0] axiwr_pre_awaddr; // same as awaddr_out, early address to decode and return dev_ready
   wire           axiwr_start_burst; // start of write burst, valid pre_awaddr, save externally to control ext. dev_ready multiplexer
   wire           axiwr_dev_ready;   // extrernal combinatorial ready signal, multiplexed from different sources according to pre_awaddr@start_burst
   wire           axiwr_bram_wclk;
   wire  [AXI_WR_ADDR_BITS-1:0] axiwr_bram_waddr;
   wire           axiwr_bram_wen;    // external memory write enable, (internally combined with registered dev_ready
// SuppressWarnings VEditor unused (yet?) 
   wire    [3:0]  axiwr_bram_wstb; 
   wire   [31:0]  axiwr_bram_wdata;

 // AXI Read Address   
   wire   [31:0]  axi_araddr;  // ARADDR[31:0], input 
   wire           axi_arvalid; // ARVALID, input
   wire           axi_arready; // ARREADY, output
   wire   [11:0]  axi_arid;    // ARID[11:0], input
//   input  [ 1:0] arlock,  // ARLOCK[1:0], input
//   input  [ 3:0] archache,// ARCACHE[3:0], input
//   input  [ 2:0] arprot,  // ARPROT[2:0], input
   wire   [ 3:0]  axi_arlen;   // ARLEN[3:0], input
   wire   [ 1:0]  axi_arsize;  // ARSIZE[1:0], input
   wire   [ 1:0]  axi_arburst; // ARBURST[1:0], input
//   input  [ 3:0] adqos,   // ARQOS[3:0], input
// AXI Read Data
   wire   [31:0]  axi_rdata;   // RDATA[31:0], output
   wire           axi_rvalid;  // RVALID, output
   wire           axi_rready;  // RREADY, input
   wire   [11:0]  axi_rid;     // RID[11:0], output
   wire           axi_rlast;   // RLAST, output
   wire   [ 1:0]  axi_rresp;

// External memory synchronization
   wire [AXI_RD_ADDR_BITS-1:0] axird_pre_araddr; // same as awaddr_out, early address to decode and return dev_ready
   wire           axird_start_burst; // start of read burst, valid pre_araddr, save externally to control ext. dev_ready multiplexer
   wire           axird_dev_ready;   // extrernal combinatorial ready signal, multiplexed from different sources according to pre_araddr@start_burst
// External memory interface   
// SuppressWarnings VEditor unused (yet?) - use mclk 
   wire           axird_bram_rclk;  //      .rclk(aclk),                  // clock for read port
   wire  [AXI_RD_ADDR_BITS-1:0] axird_bram_raddr; //   .raddr(read_in_progress?read_address[9:0]:10'h3ff),    // read address
   wire           axird_bram_ren;   //      .ren(bram_reg_re_w) ,      // read port enable
   wire           axird_bram_regen; //   .regen(bram_reg_re_w),        // output register enable
   wire  [31:0]   axird_bram_rdata;  //      .data_out(rdata[31:0]),       // data out
   wire  [31:0]   port0_rdata;  //
   wire  [31:0]   status_rdata;  //

   wire        mclk;
   wire        en_cmd0_wr;
   wire [10:0] axi_run_addr; 
   wire [ 3:0] axi_run_chn;  
   wire        axi_run_seq; 
   wire [10:0] run_addr; // multiplexed - from refresh or axi 
   wire [ 3:0] run_chn;   // multiplexed - from refresh or axi
   wire        run_seq; 
   
   wire        run_seq_rq_in; // higher priority request to run sequence
   wire        run_seq_rq_gen;// SuppressThisWarning VEditor : unused this wants to run sequencer 
//   wire        run_seq_busy;  // sequencer is busy or access granted to other master
   
   
//   wire        run_done; // output
   wire        run_busy; // TODO: add to ddrc_sequencer 
   wire [ 7:0] dly_data; // input[7:0] 
   wire [ 6:0] dly_addr; // input[6:0] 
   wire        ld_delay; // input
   wire        set; // input

   wire        locked; // output
   wire        locked_mmcm;
   wire        locked_pll;
   wire        dly_ready;
   wire        dci_ready;

   wire        phy_locked_mmcm;
   wire        phy_locked_pll;
   wire        phy_dly_ready;
   wire        phy_dci_ready;

   wire [ 7:0] tmp_debug; 
   
   wire        ps_rdy; // output
   wire [ 7:0] ps_out; // output[7:0] 

   wire        en_port0_rd;
   wire        en_port0_regen;
   wire        en_port1_wr;

   wire [ 1:0] port0_page; // input[1:0] 
   wire [ 1:0] port0_int_page; // input[1:0] 

   wire [ 1:0] port1_page; // input[1:0] 
   wire [ 1:0] port1_int_page;// input[1:0] 

// additional control signals
   wire        cmda_en; // enable DDR3 memory control and addreee outputs
   wire        ddr_rst; // generate DDR3 memory reset (active hight)
   wire        dci_rst;  // active high - reset DCI circuitry
   wire        dly_rst;  // active high - reset delay calibration circuitry
   
   
   
   wire        ddr_cke; // control of the DDR3 memory CKE signal
   
   wire        inv_clk_div; // input
   wire [ 7:0] dqs_pattern; // input[7:0] 8'h55 
   wire [ 7:0] dqm_pattern; // input[7:0] 8'h00

   reg    select_port0;
   reg    select_status;
   wire axiwr_dev_busy;
   wire axird_dev_busy;
   
   wire [ 3:0] dq_tri_on_pattern;
   wire [ 3:0] dq_tri_off_pattern;
   wire [ 3:0] dqs_tri_on_pattern;
   wire [ 3:0] dqs_tri_off_pattern;
   wire [ 3:0] wbuf_delay;
   
   wire        port0_rd_match;
   reg         port0_rd_match_r; // rd address matched in previous cycle

   wire [7:0] refresh_period;
   wire [10:0] refresh_address;
   wire       refresh_en;
   wire       refresh_set;

   assign      port0_rd_match=(((axird_bram_raddr ^ PORT0_RD_ADDR) & PORT0_RD_ADDR_MASK)==0);  
   assign en_cmd0_wr=     axiwr_bram_wen   && (((axiwr_bram_waddr ^ CMD0_ADDR) & CMD0_ADDR_MASK)==0);
   assign en_port0_rd=    axird_bram_ren   && port0_rd_match;
   assign en_port0_regen= axird_bram_regen && port0_rd_match_r;

   assign en_port1_wr=    axiwr_bram_wen   && (((axiwr_bram_waddr ^ PORT1_WR_ADDR) & PORT1_WR_ADDR_MASK)==0);
   
   
   assign axiwr_dev_ready = ~axiwr_dev_busy; //may combine (AND) multiple sources if needed
   assign axird_bram_rdata= select_port0? port0_rdata[31:0]:(select_status?status_rdata[31:0]:32'bx);
   assign axird_dev_ready = ~axird_dev_busy; //may combine (AND) multiple sources if needed
   
   assign locked=locked_mmcm && locked_pll;

// Clock and reset from PS
    wire comb_rst=~frst[0] | frst[1];
    reg axi_rst_pre=1'b1;

    always @(posedge comb_rst or posedge axi_aclk) begin
        if (comb_rst) axi_rst_pre <= 1'b1;
        else          axi_rst_pre <= 1'b0;
    end
     
BUFG bufg_axi_rst_i   (.O(axi_rst),.I(axi_rst_pre));
BUFG bufg_axi_aclk_i  (.O(axi_aclk),.I(fclk[0]));
//BUFG bufg_axi_naclk_i (.O(axi_naclk),.I(~fclk[0]));



   
always @ (posedge axi_aclk) begin
   port0_rd_match_r <= port0_rd_match; // rd address matched in previous cycle
end

always @ (posedge axi_rst or posedge axi_aclk) begin
    if (axi_rst) select_port0 <= 1'b0;
    else if (axird_start_burst) select_port0 <= (((axird_pre_araddr^ PORT0_RD_ADDR) & PORT0_RD_ADDR_MASK)==0);
    if (axi_rst) select_status <= 1'b0;
    else if (axird_start_burst) select_status <= (((axird_pre_araddr^ STATUS_ADDR) & STATUS_ADDR_MASK)==0);
    
end

`ifdef DEBUG_FIFO
        wire    waddr_under, wdata_under, wresp_under; 
        wire    waddr_over, wdata_over, wresp_over;
        reg     waddr_under_r, wdata_under_r, wresp_under_r;
        reg     waddr_over_r, wdata_over_r, wresp_over_r;
        wire    fifo_rst= frst[2];
        wire [3:0]   waddr_wcount; 
        wire [3:0]   waddr_rcount; 
        wire [3:0]   waddr_num_in_fifo; 
        
        wire [3:0]   wdata_wcount; 
        wire [3:0]   wdata_rcount; 
        wire [3:0]   wdata_num_in_fifo; 
        
        wire [3:0]   wresp_wcount; 
        wire [3:0]   wresp_rcount; 
        wire [3:0]   wresp_num_in_fifo; 
        wire [3:0]   wleft;
        wire [3:0]   wlength; // output[3:0] 
        wire [3:0]   wlen_in_dbg; // output[3:0] reg 
        
           
    always @(posedge fifo_rst or posedge axi_aclk) begin
     if (fifo_rst) {waddr_under_r, wdata_under_r, wresp_under_r,waddr_over_r, wdata_over_r, wresp_over_r} <= 0;
     else {waddr_under_r, wdata_under_r, wresp_under_r, waddr_over_r, wdata_over_r, wresp_over_r} <=
          {waddr_under_r, wdata_under_r, wresp_under_r, waddr_over_r, wdata_over_r, wresp_over_r} | 
          {waddr_under,   wdata_under,   wresp_under,   waddr_over,   wdata_over,   wresp_over};
    end         
`endif

   
/*
    dly_addr[1],
    dly_addr[0],
    clkin_stopped_mmcm,
    clkfb_stopped_mmcm,
    ddr_rst,
    rst_in,
    dci_rst,
    dly_rst
*/

//MEMCLK
wire [63:0] gpio_in;
assign gpio_in={
frst[3]?{
16'b0,
    1'b1,              // 1
    MEMCLK,            // 1/0? - external clock
    1'b0,              //
    1'b0,              // 
    
    frst[1],           // 0 (follows)
    fclk[1:0],         // 2'bXX (toggle)
    axird_dev_busy,    // 0

    4'b0,              // 4'b0
    
    4'b0,              // 4'b0
    
    tmp_debug[7:4],    // 4'b0111 -> 4'bx00x
                       //    dly_addr[1],        0
                       //    dly_addr[0],        0
                       //    clkin_stopped_mmcm, 0 
                       //    clkfb_stopped_mmcm, 0
    tmp_debug[3:0],     // 4'b1100 -> 4'bxx00
                       //    ddr_rst, 1 1 4000609c -> 0 , 40006098 -> 1
                       //    rst_in,  0 0
                       //    dci_rst, 0 1
                       //    dly_rst  0 1
    phy_locked_mmcm,   //  1 1
    phy_locked_pll,    //  1 1
    phy_dci_ready,     //  1 0
    phy_dly_ready,     //  1 0
    
    locked_mmcm,       //  1 1
    locked_pll,        //  1 1
    dci_ready,         //  1 0
    dly_ready         //  1 0
                       
    }:{
        waddr_wcount[3:0], 
        waddr_rcount[3:0], 
        waddr_num_in_fifo[3:0], 
        
        wdata_wcount[3:0], 
        wdata_rcount[3:0], 
        wdata_num_in_fifo[3:0], 
        
        wresp_wcount[3:0], 
        wresp_rcount[3:0], 
        wresp_num_in_fifo[3:0],
        wleft[3:0],
        wlength[3:0], 
        wlen_in_dbg[3:0] 
    },
    
    
    //ps_out[7:4],       // 4'b0 input[7:0] 4'b0
    
    //ps_out[3:0],       // 4'b0 input[7:0] 4'b0
    1'b0,
    waddr_under_r,
    wdata_under_r,
    wresp_under_r,
    
    1'b0, 
    waddr_over_r,
    wdata_over_r,
    wresp_over_r, // ???
     
    run_busy, // input // 0 
    locked, // input   // 1
    ps_rdy, // input   // 1
    axi_arready,       // 1
    
    axi_awready,       // 1
    axi_wready,        // 1  - sometimes gets stuck with 0 (axi_awready==1) ? TODO: Add timeout 
    fifo_rst,   // fclk[0],          // 0/1 
    axi_rst_pre //axi_rst            // 0
};

assign DUMMY_TO_KEEP = 1'b0; // dbg_toggle[0];

    axibram_write #(
        .ADDRESS_BITS(AXI_WR_ADDR_BITS)
    ) axibram_write_i (  //SuppressThisWarning ISExst Output port <bram_wstb> of the instance <axibram_write_i> is unconnected or connected to loadless signal.
        .aclk        (axi_aclk), // input
        .rst         (axi_rst), // input
        .awaddr      (axi_awaddr[31:0]), // input[31:0] 
        .awvalid     (axi_awvalid), // input
        .awready     (axi_awready), // output
        .awid        (axi_awid[11:0]), // input[11:0] 
        .awlen       (axi_awlen[3:0]), // input[3:0] 
        .awsize      (axi_awsize[1:0]), // input[1:0] 
        .awburst     (axi_awburst[1:0]), // input[1:0] 
        .wdata       (axi_wdata[31:0]), // input[31:0] 
        .wvalid      (axi_wvalid), // input
        .wready      (axi_wready), // output
        .wid         (axi_wid[11:0]), // input[11:0] 
        .wlast       (axi_wlast), // input
        .wstb        (axi_wstb[3:0]), // input[3:0] 
        .bvalid      (axi_bvalid), // output
        .bready      (axi_bready), // input
        .bid         (axi_bid[11:0]), // output[11:0] 
        .bresp       (axi_bresp[1:0]), // output[1:0] 
        .pre_awaddr  (axiwr_pre_awaddr[AXI_WR_ADDR_BITS-1:0]), // output[9:0] 
        .start_burst (axiwr_start_burst), // output
        .dev_ready   (axiwr_dev_ready), // input
        .bram_wclk   (axiwr_bram_wclk), // output
        .bram_waddr  (axiwr_bram_waddr[AXI_WR_ADDR_BITS-1:0]), // output[9:0] 
        .bram_wen    (axiwr_bram_wen), // output
        .bram_wstb   (axiwr_bram_wstb[3:0]), // output[3:0] //SuppressThisWarning ISExst Assignment to axiwr_bram_wstb ignored, since the identifier is never used
        .bram_wdata  (axiwr_bram_wdata[31:0]) // output[31:0]
`ifdef DEBUG_FIFO
        ,
        .waddr_under (waddr_under), // output
        .wdata_under (wdata_under), // output
        .wresp_under (wresp_under), // output
        .waddr_over  (waddr_over),  // output
        .wdata_over  (wdata_over),  // output
        .wresp_over  (wresp_over),   // output
        .waddr_wcount(waddr_wcount), // output[3:0] 
        .waddr_rcount(waddr_rcount), // output[3:0] 
        .waddr_num_in_fifo(waddr_num_in_fifo), // output[3:0] 
        .wdata_wcount(wdata_wcount), // output[3:0] 
        .wdata_rcount(wdata_rcount), // output[3:0] 
        .wdata_num_in_fifo(wdata_num_in_fifo), // output[3:0] 
        .wresp_wcount(wresp_wcount), // output[3:0] 
        .wresp_rcount(wresp_rcount), // output[3:0] 
        .wresp_num_in_fifo(wresp_num_in_fifo), // output[3:0]
        .wleft       (wleft[3:0]),
        .wlength     (wlength[3:0]), // output[3:0] 
        .wlen_in_dbg (wlen_in_dbg[3:0]) // output[3:0] reg 
                 
`endif         
    );

    /* Instance template for module axibram_read */
    axibram_read #(
        .ADDRESS_BITS(AXI_RD_ADDR_BITS)
    ) axibram_read_i ( //SuppressThisWarning ISExst Output port <bram_rclk> of the instance <axibram_read_i> is unconnected or connected to loadless signal.
        .aclk        (axi_aclk), // input
        .rst         (axi_rst), // input
        .araddr      (axi_araddr[31:0]), // input[31:0] 
        .arvalid     (axi_arvalid), // input
        .arready     (axi_arready), // output
        .arid        (axi_arid[11:0]), // input[11:0] 
        .arlen       (axi_arlen[3:0]), // input[3:0] 
        .arsize      (axi_arsize[1:0]), // input[1:0] 
        .arburst     (axi_arburst[1:0]), // input[1:0] 
        .rdata       (axi_rdata[31:0]), // output[31:0] 
        .rvalid      (axi_rvalid), // output reg 
        .rready      (axi_rready), // input
        .rid         (axi_rid), // output[11:0] reg 
        .rlast       (axi_rlast), // output reg 
        .rresp       (axi_rresp[1:0]), // output[1:0] 
        .pre_araddr  (axird_pre_araddr[AXI_RD_ADDR_BITS-1:0]), // output[9:0] 
        .start_burst (axird_start_burst), // output
        .dev_ready   (axird_dev_ready), // input
        .bram_rclk   (axird_bram_rclk), // output //SuppressThisWarning ISExst Assignment to axird_bram_rclk ignored, since the identifier is never used
        .bram_raddr  (axird_bram_raddr[AXI_RD_ADDR_BITS-1:0]), // output[9:0] 
        .bram_ren    (axird_bram_ren), // output
        .bram_regen  (axird_bram_regen), // output
        .bram_rdata  (axird_bram_rdata) // input[31:0] 
    );
    ddrc_control #(
        .AXI_WR_ADDR_BITS      (AXI_WR_ADDR_BITS),
        .CONTROL_ADDR          (CONTROL_ADDR),
        .CONTROL_ADDR_MASK     (CONTROL_ADDR_MASK),
//        .STATUS_ADDR       (STATUS_ADDR),
//        .STATUS_ADDR_MASK  (STATUS_ADDR_MASK),
        .BUSY_WR_ADDR          (BUSY_WR_ADDR),
        .BUSY_WR_ADDR_MASK     (BUSY_WR_ADDR_MASK),
        .DLY_LD_REL            (DLY_LD_REL),
        .DLY_LD_REL_MASK       (DLY_LD_REL_MASK),
        .DLY_SET_REL           (DLY_SET_REL),
        .DLY_SET_REL_MASK      (DLY_SET_REL_MASK),
        .RUN_CHN_REL           (RUN_CHN_REL),
        .RUN_CHN_REL_MASK      (RUN_CHN_REL_MASK),
        .PATTERNS_REL          (PATTERNS_REL),
        .PATTERNS_REL_MASK     (PATTERNS_REL_MASK),
        .PATTERNS_TRI_REL      (PATTERNS_TRI_REL),
        .PATTERNS_TRI_REL_MASK (PATTERNS_TRI_REL_MASK),
        .WBUF_DELAY_REL        (WBUF_DELAY_REL),
        .WBUF_DELAY_REL_MASK   (WBUF_DELAY_REL_MASK),
        .PAGES_REL             (PAGES_REL),
        .PAGES_REL_MASK        (PAGES_REL_MASK),
        .CMDA_EN_REL           (CMDA_EN_REL),
        .CMDA_EN_REL_MASK      (CMDA_EN_REL_MASK),
        .SDRST_ACT_REL         (SDRST_ACT_REL),  
        .SDRST_ACT_REL_MASK    (SDRST_ACT_REL_MASK),
        .CKE_EN_REL            (CKE_EN_REL),   
        .CKE_EN_REL_MASK       (CKE_EN_REL_MASK),
        .DCI_RST_REL           (DCI_RST_REL),
        .DCI_RST_REL_MASK      (DCI_RST_REL_MASK),
        .DLY_RST_REL           (DLY_RST_REL),
        .DLY_RST_REL_MASK      (DLY_RST_REL_MASK),
        .EXTRA_REL             (EXTRA_REL),
        .EXTRA_REL_MASK        (EXTRA_REL_MASK),
        .REFRESH_EN_REL        (REFRESH_EN_REL),
        .REFRESH_EN_REL_MASK   (REFRESH_EN_REL_MASK),
        .REFRESH_PER_REL       (REFRESH_PER_REL),
        .REFRESH_PER_REL_MASK  (REFRESH_PER_REL_MASK),
        .REFRESH_ADDR_REL      (REFRESH_ADDR_REL),
        .REFRESH_ADDR_REL_MASK (REFRESH_ADDR_REL_MASK)
        
    ) ddrc_control_i (
        .clk                 (axiwr_bram_wclk),         // same as axi_aclk
        .mclk                (mclk),                    // input
        .rst                 (axi_rst),                 // input
        .pre_waddr           (axiwr_pre_awaddr[AXI_WR_ADDR_BITS-1:0]), // input[11:0] 
        .start_wburst        (axiwr_start_burst),       // input
        .waddr               (axiwr_bram_waddr[AXI_WR_ADDR_BITS-1:0]), // input[11:0] 
        .wr_en               (axiwr_bram_wen),          // input
        .wdata               (axiwr_bram_wdata[31:0]),  // input[31:0] (no input for wstb here) 
        .busy                (axiwr_dev_busy),          // output
        .run_addr            (axi_run_addr[10:0]),          // output[10:0] 
        .run_chn             (axi_run_chn[3:0]),            // output[3:0] 
        .run_seq             (axi_run_seq),                 // output
        
        .run_seq_rq_in       (run_seq_rq_in),           // input
        .run_seq_rq_gen      (run_seq_rq_gen),          // output
        .run_seq_busy        (run_busy),                // input

        .refresh_address     (refresh_address[10:0]), // output[10:0] 
        .refresh_period      (refresh_period[7:0]), // output[7:0] 
        .refresh_set         (refresh_set), // output
        .refresh_en          (refresh_en), // output
        
        .dly_data            (dly_data[7:0]),           // output[7:0] 
        .dly_addr            (dly_addr[6:0]),           // output[6:0] 
        .ld_delay            (ld_delay),                // output
        .dly_set             (set),                     // output
        .cmda_en             (cmda_en),                 // output
        .ddr_rst             (ddr_rst),                 // output
        .dci_rst             (dci_rst),                 // output
        .dly_rst             (dly_rst),                 // output
        .ddr_cke             (ddr_cke),                 // output
        .inv_clk_div         (inv_clk_div),             // output
        .dqs_pattern         (dqs_pattern[7:0]),        // output[7:0] 
        .dqm_pattern         (dqm_pattern[7:0]),        // output[7:0]
        .dq_tri_on_pattern   (dq_tri_on_pattern[3:0]),  // output[3:0] 
        .dq_tri_off_pattern  (dq_tri_off_pattern[3:0]), // output[3:0] 
        .dqs_tri_on_pattern  (dqs_tri_on_pattern[3:0]), // output[3:0] 
        .dqs_tri_off_pattern (dqs_tri_off_pattern[3:0]),// output[3:0] 
        .wbuf_delay          (wbuf_delay[3:0]),         // output[3:0] 
        .port0_page          (port0_page[1:0]),         // output[1:0] 
        .port0_int_page      (port0_int_page[1:0]),     // output[1:0] 
        .port1_page          (port1_page[1:0]),         // output[1:0] 
        .port1_int_page      (port1_int_page[1:0])      // output[1:0] 
    );

    assign run_addr = axi_run_seq ?  axi_run_addr[10:0] : refresh_address[10:0];
    assign run_chn =  axi_run_seq ?  axi_run_chn[3:0] : 4'h0;
    assign run_seq = axi_run_seq || refresh_grant;
    
/*
   wire        run_seq_rq_in; // higher priority request to run sequence
   wire        run_seq_rq_gen;// SuppressThisWarning VEditor : unused this wants to run sequencer 
//   wire        run_seq_busy;  // sequencer is busy or access granted to other master
run_busy
    wire [10:0] refresh_address;
   
*/    
//   assign run_seq_rq_in = 1'b0; // higher priority request input

    wire       refresh_want;
    wire       refresh_need;
    reg        refresh_grant;

   assign run_seq_rq_in = refresh_en && refresh_need; // higher priority request input

    
    ddr_refresh ddr_refresh_i (
        .rst              (axi_rst), // input
        .clk              (mclk), // input
        .refresh_period   (refresh_period[7:0]), // input[7:0] 
        .set              (refresh_set), // input
        .want             (refresh_want), // output
        .need             (refresh_need), // output
        .grant            (refresh_grant) // input
    );
    always @(posedge axi_rst or  posedge mclk) begin
         if (axi_rst) refresh_grant <= 0; 
         else refresh_grant <= !refresh_grant && refresh_en && !run_busy && !axi_run_seq && (refresh_need || (refresh_want && !run_seq_rq_gen)); 
    end
    
    ddrc_status
//     #(
//        .AXI_RD_ADDR_BITS (AXI_RD_ADDR_BITS),
//        .SELECT_ADDR      (SELECT_RD_ADDR),
//        .SELECT_ADDR_MASK (SELECT_RD_ADDR_MASK),
//        .BUSY_ADDR        (BUSY_RD_ADDR),
//        .BUSY_ADDR_MASK   (BUSY_RD_ADDR_MASK)
//    )
     ddrc_status_i (
//        .clk              (axi_aclk), // input
//        .mclk             (mclk), // input
//        .rst              (axi_rst), // input
//        .pre_raddr        (axird_pre_araddr[AXI_RD_ADDR_BITS-1:0]), // input[11:0] 
//        .start_rburst     (axird_start_burst), // input
//        .raddr            (axird_bram_raddr[AXI_RD_ADDR_BITS-1:0]), // input[11:0] 
//        .rd_en            (axird_bram_regen), // input
        .rdata            (status_rdata[31:0]), // output[31:0] 
        .busy             (axird_dev_busy), // output
//        .run_done         (run_done), // input
        .run_busy         (run_busy), // input
        .locked           (locked), // input
        .locked_mmcm      (locked_mmcm), // input
        .locked_pll       (locked_pll), // input
        .dly_ready        (dly_ready), // input
        .dci_ready        (dci_ready), // input
        
        .ps_rdy           (ps_rdy), // input
        .ps_out           (ps_out[7:0]) // input[7:0] 
    );


    ddrc_sequencer #(
        .PHASE_WIDTH      (PHASE_WIDTH),
        .SLEW_DQ          (SLEW_DQ),
        .SLEW_DQS         (SLEW_DQS),
        .SLEW_CMDA        (SLEW_CMDA),
        .SLEW_CLK         (SLEW_CLK),
        .IBUF_LOW_PWR     (IBUF_LOW_PWR),
        .REFCLK_FREQUENCY (REFCLK_FREQUENCY),
        .HIGH_PERFORMANCE_MODE(HIGH_PERFORMANCE_MODE),
        .CLKIN_PERIOD     (CLKIN_PERIOD),
        .CLKFBOUT_MULT    (CLKFBOUT_MULT),
        .CLKFBOUT_MULT_REF(CLKFBOUT_MULT_REF),
        .CLKFBOUT_DIV_REF (CLKFBOUT_DIV_REF),
        .DIVCLK_DIVIDE    (DIVCLK_DIVIDE),
        .CLKFBOUT_PHASE   (CLKFBOUT_PHASE),
        .SDCLK_PHASE      (SDCLK_PHASE),
        .CLK_PHASE        (CLK_PHASE),
        .CLK_DIV_PHASE    (CLK_DIV_PHASE),
        .MCLK_PHASE       (MCLK_PHASE),
        .REF_JITTER1      (REF_JITTER1),
        .SS_EN            (SS_EN),
        .SS_MODE          (SS_MODE),
        .SS_MOD_PERIOD    (SS_MOD_PERIOD),
        .CMD_PAUSE_BITS   (CMD_PAUSE_BITS),
        .CMD_DONE_BIT     (CMD_DONE_BIT)
    ) ddrc_sequencer_i ( //SuppressThisWarning ISExst Output port <run_done> of the instance <ddrc_sequencer_i> is unconnected or connected to loadless signal.
        .SDRST          (SDRST), // output
        .SDCLK          (SDCLK), // output
        .SDNCLK         (SDNCLK), // output
        .SDA            (SDA[14:0]), // output[14:0] // BUG with localparam - fixed
        .SDBA           (SDBA[2:0]), // output[2:0] 
        .SDWE           (SDWE), // output
        .SDRAS          (SDRAS), // output
        .SDCAS          (SDCAS), // output
        .SDCKE          (SDCKE), // output
        .SDODT          (SDODT), // output
        .SDD            (SDD[15:0]), // inout[15:0] 
        .SDDML          (SDDML), // inout
        .DQSL           (DQSL), // inout
        .NDQSL          (NDQSL), // inout
        .SDDMU          (SDDMU), // inout
        .DQSU           (DQSU), // inout
        .NDQSU          (NDQSU), // inout
        .clk_in         (axi_aclk), // input
        .rst_in         (axi_rst), // input
        .mclk           (mclk), // output
        .cmd0_clk       (axi_aclk), // input
        .cmd0_we        (en_cmd0_wr), // input
        .cmd0_addr      (axiwr_bram_waddr[9:0]), // input[9:0] 
        .cmd0_data      (axiwr_bram_wdata[31:0]), // input[31:0] 
        .cmd1_clk       (mclk), // input
        // TODO: add - from PL generation of the command sequences
        .cmd1_we          (1'b0), // input
        .cmd1_addr        (10'b0), // input[9:0] 
        .cmd1_data        (32'b0), // input[31:0]
         
        .run_addr       (run_addr[10:0]), // input[10:0] 
        .run_chn        (run_chn[3:0]), // input[3:0] 
        .run_seq        (run_seq), // input #################### DISABLED ####################
//        .run_seq        (1'b0 && run_seq), // input #################### DISABLED ####################
//        .run_done       (run_done), // output
        .run_done       (), // output
        .run_busy       (run_busy), // output
        .dly_data       (dly_data[7:0]), // input[7:0] 
        .dly_addr       (dly_addr[6:0]), // input[6:0] 
        .ld_delay       (ld_delay), // input
        .set            (set), // input
//        .locked         (locked), // output
        .locked_mmcm     (locked_mmcm), // output
        .locked_pll      (locked_pll), // output
        .dly_ready       (dly_ready), // output
        .dci_ready       (dci_ready), // output

        .phy_locked_mmcm (phy_locked_mmcm), // output
        .phy_locked_pll  (phy_locked_pll), // output
        .phy_dly_ready   (phy_dly_ready), // output
        .phy_dci_ready   (phy_dci_ready), // output
        
        .tmp_debug       (tmp_debug[7:0]),
        .ps_rdy         (ps_rdy), // output
        .ps_out         (ps_out[7:0]), // output[7:0]
         
        .port0_clk      (axi_aclk), // input
        .port0_re       (en_port0_rd), // input
        .port0_regen    (en_port0_regen), // input
        .port0_page     (port0_page[1:0]), // input[1:0] 
        .port0_int_page (port0_int_page[1:0]), // input[1:0] 
        .port0_addr     (axird_bram_raddr[7:0]), // input[7:0] 
        .port0_data     (port0_rdata[31:0]), // output[31:0] 
        .port1_clk      (axi_aclk), // input
        .port1_we       (en_port1_wr), // input
        .port1_page     (port1_page[1:0]), // input[1:0] 
        .port1_int_page (port1_int_page[1:0]), // input[1:0] 
        .port1_addr     (axiwr_bram_waddr[7:0]), // input[7:0] 
        .port1_data     (axiwr_bram_wdata[31:0]), // input[31:0] 
        .cmda_en        (cmda_en), // input
        .ddr_rst        (ddr_rst), // input
        .dci_rst        (dci_rst), // input
        .dly_rst        (dly_rst), // input
        .ddr_cke        (ddr_cke), // input
        .inv_clk_div    (inv_clk_div), // input
        .dqs_pattern    (dqs_pattern), // input[7:0] 
        .dqm_pattern    (dqm_pattern), // input[7:0]
        .dq_tri_on_pattern   (dq_tri_on_pattern[3:0]),  // input[3:0] 
        .dq_tri_off_pattern  (dq_tri_off_pattern[3:0]), // input[3:0] 
        .dqs_tri_on_pattern  (dqs_tri_on_pattern[3:0]), // input[3:0] 
        .dqs_tri_off_pattern (dqs_tri_off_pattern[3:0]),// input[3:0] 
        .wbuf_delay          (wbuf_delay[3:0])          // input[3:0] 
    );


  PS7 ps7_i (
 // EMIO interface
 // CAN interface
    .EMIOCAN0PHYTX(),            // CAN 0 TX, output
    .EMIOCAN0PHYRX(),            // CAN 0 RX, input
    .EMIOCAN1PHYTX(),            // Can 1 TX, output
    .EMIOCAN1PHYRX(),            // CAN 1 RX, input
 // GMII 0
    .EMIOENET0GMIICRS(),         // GMII 0 Carrier sense, input
    .EMIOENET0GMIICOL(),         // GMII 0 Collision detect, input
    .EMIOENET0EXTINTIN(),        // GMII 0 Controller Interrupt input, input
    // GMII 0 TX signals
    .EMIOENET0GMIITXCLK(),       // GMII 0 TX clock, input
    .EMIOENET0GMIITXD(),         // GMII 0 Tx Data[7:0], output
    .EMIOENET0GMIITXEN(),        // GMII 0 Tx En, output
    .EMIOENET0GMIITXER(),        // GMII 0 Tx Err, output
    // GMII 0 TX timestamp signals
    .EMIOENET0SOFTX(),           // GMII 0 Tx Tx Start-of-Frame, output
    .EMIOENET0PTPDELAYREQTX(),   // GMII 0 Tx PTP delay req frame detected, output
    .EMIOENET0PTPPDELAYREQTX(),  // GMII 0 Tx PTP peer delay frame detect, output
    .EMIOENET0PTPPDELAYRESPTX(), // GMII 0 Tx PTP pear delay response frame detected, output
    .EMIOENET0PTPSYNCFRAMETX(),  // GMII 0 Tx PTP sync frame detected, output
    // GMII 0 RX signals
    .EMIOENET0GMIIRXCLK(),       // GMII 0 Rx Clock, input
    .EMIOENET0GMIIRXD(),         // GMII 0 Rx Data (7:0), input
    .EMIOENET0GMIIRXDV(),        // GMII 0 Rx Data valid, input
    .EMIOENET0GMIIRXER(),        // GMII 0 Rx Error, input
    // GMII 0 RX timestamp signals
    .EMIOENET0SOFRX(),           // GMII 0 Rx Start of Frame, output
    .EMIOENET0PTPDELAYREQRX(),   // GMII 0 Rx PTP delay req frame detected
    .EMIOENET0PTPPDELAYREQRX(),  // GMII 0 Rx PTP peer delay frame detected, output
    .EMIOENET0PTPPDELAYRESPRX(), // GMII 0 Rx PTP peer delay responce frame detected, output
    .EMIOENET0PTPSYNCFRAMERX(),  // GMII 0 Rx PTP sync frame detected, output
    // MDIO 0
    .EMIOENET0MDIOMDC(),         // MDIO 0 MD clock output, output
    .EMIOENET0MDIOO(),           // MDIO 0 MD data output, output
    .EMIOENET0MDIOTN(),          // MDIO 0 MD data 3-state, output
    .EMIOENET0MDIOI(),           // MDIO 0 MD data input, input

 // GMII 1
    .EMIOENET1GMIICRS(),         // GMII 1 Carrier sense, input
    .EMIOENET1GMIICOL(),         // GMII 1 Collision detect, input
    .EMIOENET1EXTINTIN(),        // GMII 1 Controller Interrupt input, input
    // GMII 1 TX signals
    .EMIOENET1GMIITXCLK(),       // GMII 1 TX clock, input
    .EMIOENET1GMIITXD(),         // GMII 1 Tx Data[7:0], output
    .EMIOENET1GMIITXEN(),        // GMII 1 Tx En, output
    .EMIOENET1GMIITXER(),        // GMII 1 Tx Err, output
    // GMII 1 TX timestamp signals
    .EMIOENET1SOFTX(),           // GMII 1 Tx Tx Start-of-Frame, output
    .EMIOENET1PTPDELAYREQTX(),   // GMII 1 Tx PTP delay req frame detected, output
    .EMIOENET1PTPPDELAYREQTX(),  // GMII 1 Tx PTP peer delay frame detect, output
    .EMIOENET1PTPPDELAYRESPTX(), // GMII 1 Tx PTP pear delay response frame detected, output
    .EMIOENET1PTPSYNCFRAMETX(),  // GMII 1 Tx PTP sync frame detected, output
    // GMII 1 RX signals
    .EMIOENET1GMIIRXCLK(),       // GMII 1 Rx Clock, input
    .EMIOENET1GMIIRXD(),         // GMII 1 Rx Data (7:0), input
    .EMIOENET1GMIIRXDV(),        // GMII 1 Rx Data valid, input
    .EMIOENET1GMIIRXER(),        // GMII 1 Rx Error, input
    // GMII 1 RX timestamp signals
    .EMIOENET1SOFRX(),           // GMII 1 Rx Start of Frame, output
    .EMIOENET1PTPDELAYREQRX(),   // GMII 1 Rx PTP delay req frame detected
    .EMIOENET1PTPPDELAYREQRX(),  // GMII 1 Rx PTP peer delay frame detected, output
    .EMIOENET1PTPPDELAYRESPRX(), // GMII 1 Rx PTP peer delay responce frame detected, output
    .EMIOENET1PTPSYNCFRAMERX(),  // GMII 1 Rx PTP sync frame detected, output
    // MDIO 1
    .EMIOENET1MDIOMDC(),         // MDIO 1 MD clock output, output
    .EMIOENET1MDIOO(),           // MDIO 1 MD data output, output
    .EMIOENET1MDIOTN(),          // MDIO 1 MD data 3-state, output
    .EMIOENET1MDIOI(),           // MDIO 1 MD data input, input
  // EMIO GPIO
    .EMIOGPIOO(),                // EMIO GPIO Data out[63:0], output
    .EMIOGPIOI(gpio_in[63:0]),   // EMIO GPIO Data in[63:0], input
    .EMIOGPIOTN(),               // EMIO GPIO OutputEnable[63:0], output
  // EMIO I2C 0  
    .EMIOI2C0SCLO(),             // I2C 0 SCL OUT, output // manual says input
    .EMIOI2C0SCLI(),             // I2C 0 SCL IN,  input  // manual says output
    .EMIOI2C0SCLTN(),            // I2C 0 SCL EN,  output // manual says input 
    .EMIOI2C0SDAO(),             // I2C 0 SDA OUT, output // manual says input
    .EMIOI2C0SDAI(),             // I2C 0 SDA IN,  input  // manual says output
    .EMIOI2C0SDATN(),            // I2C 0 SDA EN,  output // manual says input
  // EMIO I2C 1  
    .EMIOI2C1SCLO(),             // I2C 1 SCL OUT, output // manual says input
    .EMIOI2C1SCLI(),             // I2C 1 SCL IN,  input  // manual says output
    .EMIOI2C1SCLTN(),            // I2C 1 SCL EN,  output // manual says input 
    .EMIOI2C1SDAO(),             // I2C 1 SDA OUT, output // manual says input
    .EMIOI2C1SDAI(),             // I2C 1 SDA IN,  input  // manual says output
    .EMIOI2C1SDATN(),            // I2C 1 SDA EN,  output // manual says input
// JTAG
    .EMIOPJTAGTCK(),             // JTAG TCK, input
    .EMIOPJTAGTMS(),             // JTAG TMS, input
    .EMIOPJTAGTDI(),             // JTAG TDI, input
    .EMIOPJTAGTDO(),             // JTAG TDO, output
    .EMIOPJTAGTDTN(),            // JTAG TDO OE, output
 // SDIO 0  
    .EMIOSDIO0CLKFB(),           // SDIO 0 Clock feedback, input
    .EMIOSDIO0CLK(),             // SDIO 0 Clock, output
    .EMIOSDIO0CMDI(),            // SDIO 0 Command in, input
    .EMIOSDIO0CMDO(),            // SDIO 0 Command out, output
    .EMIOSDIO0CMDTN(),           // SDIO 0 command OE, output
    .EMIOSDIO0DATAI(),           // SDIO 0 Data in [3:0], input
    .EMIOSDIO0DATAO(),           // SDIO 0 Data out [3:0], output
    .EMIOSDIO0DATATN(),          // SDIO 0 Data OE [3:0], output
    .EMIOSDIO0CDN(),             // SDIO 0 Card detect, input
    .EMIOSDIO0WP(),              // SDIO 0 Write protect, input
    .EMIOSDIO0BUSPOW(),          // SDIO 0 Power control, output
    .EMIOSDIO0LED(),             // SDIO 0 LED control, output
    .EMIOSDIO0BUSVOLT(),         // SDIO 0 Bus voltage [2:0], output
 // SDIO 1  
    .EMIOSDIO1CLKFB(),           // SDIO 1 Clock feedback, input
    .EMIOSDIO1CLK(),             // SDIO 1 Clock, output
    .EMIOSDIO1CMDI(),            // SDIO 1 Command in, input
    .EMIOSDIO1CMDO(),            // SDIO 1 Command out, output
    .EMIOSDIO1CMDTN(),           // SDIO 1 command OE, output
    .EMIOSDIO1DATAI(),           // SDIO 1 Data in [3:0], input
    .EMIOSDIO1DATAO(),           // SDIO 1 Data out [3:0], output
    .EMIOSDIO1DATATN(),          // SDIO 1 Data OE [3:0], output
    .EMIOSDIO1CDN(),             // SDIO 1 Card detect, input
    .EMIOSDIO1WP(),              // SDIO 1 Write protect, input
    .EMIOSDIO1BUSPOW(),          // SDIO 1 Power control, output
    .EMIOSDIO1LED(),             // SDIO 1 LED control, output
    .EMIOSDIO1BUSVOLT(),         // SDIO 1 Bus voltage [2:0], output
  // SPI 0    
    .EMIOSPI0SCLKI(),            // SPI 0 CLK in , input
    .EMIOSPI0SCLKO(),            // SPI 0 CLK out, output
    .EMIOSPI0SCLKTN(),           // SPI 0 CLK OE, output
    .EMIOSPI0SI(),               // SPI 0 MOSI in , input
    .EMIOSPI0MO(),               // SPI 0 MOSI out , output
    .EMIOSPI0MOTN(),             // SPI 0 MOSI OE, output
    .EMIOSPI0MI(),               // SPI 0 MISO in, input
    .EMIOSPI0SO(),               // SPI 0 MISO out, output
    .EMIOSPI0STN(),              // SPI 0 MISO OE, output
    .EMIOSPI0SSIN(),             // SPI 0 Slave select 0 in, input
    .EMIOSPI0SSON(),             // SPI 0 Slave select [2:0] out, output
    .EMIOSPI0SSNTN(),            // SPI 0 Slave select OE, output
  // SPI 1    
    .EMIOSPI1SCLKI(),            // SPI 1 CLK in , input
    .EMIOSPI1SCLKO(),            // SPI 1 CLK out, output
    .EMIOSPI1SCLKTN(),           // SPI 1 CLK OE, output
    .EMIOSPI1SI(),               // SPI 1 MOSI in , input
    .EMIOSPI1MO(),               // SPI 1 MOSI out , output
    .EMIOSPI1MOTN(),             // SPI 1 MOSI OE, output
    .EMIOSPI1MI(),               // SPI 1 MISO in, input
    .EMIOSPI1SO(),               // SPI 1 MISO out, output
    .EMIOSPI1STN(),              // SPI 1 MISO OE, output
    .EMIOSPI1SSIN(),             // SPI 1 Slave select 0 in, input
    .EMIOSPI1SSON(),             // SPI 1 Slave select [2:0] out, output
    .EMIOSPI1SSNTN(),            // SPI 1 Slave select OE, output
// TPIU signals (Trace)    
    .EMIOTRACECTL(),             // Trace CTL, output
    .EMIOTRACEDATA(),            // Trace Data[31:0], output
    .EMIOTRACECLK(),             // Trace CLK, input
// Timers/counters    
    .EMIOTTC0CLKI(),             // Counter/Timer 0 clock in [2:0], input
    .EMIOTTC0WAVEO(),            // Counter/Timer 0 wave out[2:0], output
    .EMIOTTC1CLKI(),             // Counter/Timer 1 clock in [2:0], input
    .EMIOTTC1WAVEO(),            // Counter/Timer 1 wave out[2:0], output
 //UART 0
    .EMIOUART0TX(),              // UART 0 Transmit, output
    .EMIOUART0RX(),              // UART 0 Receive, input
    .EMIOUART0CTSN(),            // UART 0 Clear To Send, input
    .EMIOUART0RTSN(),            // UART 0 Ready to Send, output
    .EMIOUART0DSRN(),            // UART 0 Data Set Ready , input
    .EMIOUART0DCDN(),            // UART 0 Data Carrier Detect, input
    .EMIOUART0RIN(),             // UART 0 Ring Indicator, input
    .EMIOUART0DTRN(),            // UART 0 Data Terminal Ready, output
 //UART 1
    .EMIOUART1TX(),              // UART 1 Transmit, output
    .EMIOUART1RX(),              // UART 1 Receive, input
    .EMIOUART1CTSN(),            // UART 1 Clear To Send, input
    .EMIOUART1RTSN(),            // UART 1 Ready to Send, output
    .EMIOUART1DSRN(),            // UART 1 Data Set Ready , input
    .EMIOUART1DCDN(),            // UART 1 Data Carrier Detect, input
    .EMIOUART1RIN(),             // UART 1 Ring Indicator, input
    .EMIOUART1DTRN(),            // UART 1 Data Terminal Ready, output
 // USB 0    
    .EMIOUSB0PORTINDCTL(),       // USB 0 Port Indicator [1:0], output 
    .EMIOUSB0VBUSPWRFAULT(),     // USB 0 Power Fault, input
    .EMIOUSB0VBUSPWRSELECT(),    // USB 0 Power Select, output
 // USB 1    
    .EMIOUSB1PORTINDCTL(),       // USB 1 Port Indicator [1:0], output 
    .EMIOUSB1VBUSPWRFAULT(),     // USB 1 Power Fault, input
    .EMIOUSB1VBUSPWRSELECT(),    // USB 1 Power Select, output
 // Watchdog Timer    
    .EMIOWDTCLKI(),              // Watchdog Timer Clock in, input
    .EMIOWDTRSTO(),              // Watchdog Timer Reset out, output
 // DMAC 0  
    .DMA0ACLK(),                 // DMAC 0 Clock, input
    .DMA0DRVALID(),              // DMAC 0 DMA Request Valid, input
    .DMA0DRLAST(),               // DMAC 0 DMA Request Last, input
    .DMA0DRTYPE(),               // DMAC 0 DMA Request Type [1:0] ()single/burst/ackn flush/reserved), input
    .DMA0DRREADY(),              // DMAC 0 DMA Request Ready, output
    .DMA0DAVALID(),              // DMAC 0 DMA Acknowledge Valid (DA_TYPE[1:0] valid), output
    .DMA0DAREADY(),              // DMAC 0 DMA Acknowledge (peripheral can accept DA_TYPE[1:0]), input
    .DMA0DATYPE(),               // DMAC 0 DMA Ackbowledge TYpe (completed single AXI, completed burst AXI, flush request), output
    .DMA0RSTN(),                 // DMAC 0 RESET output (reserved, do not use), output
 // DMAC 1 
    .DMA1ACLK(),                 // DMAC 1 Clock, input
    .DMA1DRVALID(),              // DMAC 1 DMA Request Valid, input
    .DMA1DRLAST(),               // DMAC 1 DMA Request Last, input
    .DMA1DRTYPE(),               // DMAC 1 DMA Request Type [1:0] ()single/burst/ackn flush/reserved), input
    .DMA1DRREADY(),              // DMAC 1 DMA Request Ready, output
    .DMA1DAVALID(),              // DMAC 1 DMA Acknowledge Valid (DA_TYPE[1:0] valid), output
    .DMA1DAREADY(),              // DMAC 1 DMA Acknowledge (peripheral can accept DA_TYPE[1:0]), input
    .DMA1DATYPE(),               // DMAC 1 DMA Ackbowledge TYpe (completed single AXI, completed burst AXI, flush request), output
    .DMA1RSTN(),                 // DMAC 1 RESET output (reserved, do not use), output
 // DMAC 2  
    .DMA2ACLK(),                 // DMAC 2 Clock, input
    .DMA2DRVALID(),              // DMAC 2 DMA Request Valid, input
    .DMA2DRLAST(),               // DMAC 2 DMA Request Last, input
    .DMA2DRTYPE(),               // DMAC 2 DMA Request Type [1:0] ()single/burst/ackn flush/reserved), input
    .DMA2DRREADY(),              // DMAC 2 DMA Request Ready, output
    .DMA2DAVALID(),              // DMAC 2 DMA Acknowledge Valid (DA_TYPE[1:0] valid), output
    .DMA2DAREADY(),              // DMAC 2 DMA Acknowledge (peripheral can accept DA_TYPE[1:0]), input
    .DMA2DATYPE(),               // DMAC 2 DMA Ackbowledge TYpe (completed single AXI, completed burst AXI, flush request), output
    .DMA2RSTN(),                 // DMAC 2 RESET output (reserved, do not use), output
 // DMAC 3  
    .DMA3ACLK(),                 // DMAC 3 Clock, input
    .DMA3DRVALID(),              // DMAC 3 DMA Request Valid, input
    .DMA3DRLAST(),               // DMAC 3 DMA Request Last, input
    .DMA3DRTYPE(),               // DMAC 3 DMA Request Type [1:0] ()single/burst/ackn flush/reserved), input
    .DMA3DRREADY(),              // DMAC 3 DMA Request Ready, output
    .DMA3DAVALID(),              // DMAC 3 DMA Acknowledge Valid (DA_TYPE[1:0] valid), output
    .DMA3DAREADY(),              // DMAC 3 DMA Acknowledge (peripheral can accept DA_TYPE[1:0]), input
    .DMA3DATYPE(),               // DMAC 3 DMA Ackbowledge TYpe (completed single AXI, completed burst AXI, flush request), output
    .DMA3RSTN(),                 // DMAC 3 RESET output (reserved, do not use), output
 // Interrupt signals
    .IRQF2P(),                   // Interrupts, OL to PS [19:0], input
    .IRQP2F(),                   // Interrupts, OL to PS [28:0], output
 // Event Signals
    .EVENTEVENTI(),              // EVENT Wake up one or both CPU from WFE state, input
    .EVENTEVENTO(),              // EVENT Asserted when one of the COUs executed SEV instruction, output
    .EVENTSTANDBYWFE(),          // EVENT CPU standby mode [1:0], asserted when CPU is waiting for an event, output
    .EVENTSTANDBYWFI(),          // EVENT CPU standby mode [1:0], asserted when CPU is waiting for an interrupt, output
 // PL Resets and clocks
    .FCLKCLK(fclk[3:0]),         // PL Clocks [3:0], output
    .FCLKCLKTRIGN(),             // PL Clock Throttle Control [3:0], input
    .FCLKRESETN(frst[3:0]),      // PL General purpose user reset [3:0], output (active low)
// Debug signals
    .FTMTP2FDEBUG(),             // Debug General purpose debug output [31:0], output
    .FTMTF2PDEBUG(),             // Debug General purpose debug input [31:0], input
    .FTMTP2FTRIG(),              // Debug Trigger PS to PL [3:0], output
    .FTMTP2FTRIGACK(),           // Debug Trigger PS to PL acknowledge[3:0], input
    .FTMTF2PTRIG(),              // Debug Trigger PL to PS [3:0], input
    .FTMTF2PTRIGACK(),           // Debug Trigger PL to PS acknowledge[3:0], output
    .FTMDTRACEINCLOCK(),         // Debug Trace PL to PS Clock, input
    .FTMDTRACEINVALID(),         // Debug Trace PL to PS Clock, data&id valid, input
    .FTMDTRACEINDATA(),          // Debug Trace PL to PS data [31:0], input
    .FTMDTRACEINATID(),          // Debug Trace PL to PS ID [3:0], input
// DDR Urgent
    .DDRARB(),                   // DDR Urgent[3:0], input
    
// SRAM interrupt (on rising edge)
    .EMIOSRAMINTIN(),             // SRAM interrupt #50 shared with NAND busy, input
// AXI interfaces
    .FPGAIDLEN(1'b1),             //Idle PL AXI interfaces (active low), input
// AXI PS Master GP0    
// AXI PS Master GP0: Clock, Reset
    .MAXIGP0ACLK(axi_aclk),       // AXI PS Master GP0 Clock , input
//    .MAXIGP0ACLK(fclk[0]),       // AXI PS Master GP0 Clock , input
//      .MAXIGP0ACLK(~fclk[0]),       // AXI PS Master GP0 Clock , input
//      .MAXIGP0ACLK(axi_naclk),       // AXI PS Master GP0 Clock , input
    //
    .MAXIGP0ARESETN(),            // AXI PS Master GP0 Reset, output
// AXI PS Master GP0: Read Address    
    .MAXIGP0ARADDR  (axi_araddr[31:0]), // AXI PS Master GP0 ARADDR[31:0], output  
    .MAXIGP0ARVALID (axi_arvalid),     // AXI PS Master GP0 ARVALID, output
    .MAXIGP0ARREADY (axi_arready),     // AXI PS Master GP0 ARREADY, input
    .MAXIGP0ARID    (axi_arid[11:0]),     // AXI PS Master GP0 ARID[11:0], output
    .MAXIGP0ARLOCK   (),  // AXI PS Master GP0 ARLOCK[1:0], output
    .MAXIGP0ARCACHE  (),// AXI PS Master GP0 ARCACHE[3:0], output
    .MAXIGP0ARPROT(),  // AXI PS Master GP0 ARPROT[2:0], output
    .MAXIGP0ARLEN   (axi_arlen[3:0]),    // AXI PS Master GP0 ARLEN[3:0], output
    .MAXIGP0ARSIZE  (axi_arsize[1:0]),  // AXI PS Master GP0 ARSIZE[1:0], output
    .MAXIGP0ARBURST (axi_arburst[1:0]),// AXI PS Master GP0 ARBURST[1:0], output
    .MAXIGP0ARQOS    (),    // AXI PS Master GP0 ARQOS[3:0], output
// AXI PS Master GP0: Read Data
    .MAXIGP0RDATA   (axi_rdata[31:0]),   // AXI PS Master GP0 RDATA[31:0], input
    .MAXIGP0RVALID  (axi_rvalid),       // AXI PS Master GP0 RVALID, input
    .MAXIGP0RREADY  (axi_rready),       // AXI PS Master GP0 RREADY, output
    .MAXIGP0RID     (axi_rid[11:0]),       // AXI PS Master GP0 RID[11:0], input
    .MAXIGP0RLAST   (axi_rlast),         // AXI PS Master GP0 RLAST, input
    .MAXIGP0RRESP   (axi_rresp[1:0]),    // AXI PS Master GP0 RRESP[1:0], input
    
// AXI PS Master GP0: Write Address    
    .MAXIGP0AWADDR  (axi_awaddr[31:0]), // AXI PS Master GP0 AWADDR[31:0], output
    .MAXIGP0AWVALID (axi_awvalid),     // AXI PS Master GP0 AWVALID, output
    .MAXIGP0AWREADY (axi_awready),     // AXI PS Master GP0 AWREADY, input
    .MAXIGP0AWID    (axi_awid[11:0]),     // AXI PS Master GP0 AWID[11:0], output
    .MAXIGP0AWLOCK   (),  // AXI PS Master GP0 AWLOCK[1:0], output
    .MAXIGP0AWCACHE  (),// AXI PS Master GP0 AWCACHE[3:0], output
    .MAXIGP0AWPROT   (),  // AXI PS Master GP0 AWPROT[2:0], output
    .MAXIGP0AWLEN   (axi_awlen[3:0]),    // AXI PS Master GP0 AWLEN[3:0], output
    .MAXIGP0AWSIZE  (axi_awsize[1:0]),  // AXI PS Master GP0 AWSIZE[1:0], output
    .MAXIGP0AWBURST (axi_awburst[1:0]),// AXI PS Master GP0 AWBURST[1:0], output
    .MAXIGP0AWQOS    (),          // AXI PS Master GP0 AWQOS[3:0], output
// AXI PS Master GP0: Write Data
    .MAXIGP0WDATA   (axi_wdata[31:0]),   // AXI PS Master GP0 WDATA[31:0], output
    .MAXIGP0WVALID  (axi_wvalid),       // AXI PS Master GP0 WVALID, output
    .MAXIGP0WREADY  (axi_wready),       // AXI PS Master GP0 WREADY, input
    .MAXIGP0WID     (axi_wid[11:0]),       // AXI PS Master GP0 WID[11:0], output
    .MAXIGP0WLAST   (axi_wlast),         // AXI PS Master GP0 WLAST, output
    .MAXIGP0WSTRB   (axi_wstb[3:0]),    // AXI PS Master GP0 WSTRB[3:0], output
// AXI PS Master GP0: Write Responce
    .MAXIGP0BVALID  (axi_bvalid),       // AXI PS Master GP0 BVALID, input
    .MAXIGP0BREADY  (axi_bready),       // AXI PS Master GP0 BREADY, output
    .MAXIGP0BID     (axi_bid[11:0]),       // AXI PS Master GP0 BID[11:0], input
    .MAXIGP0BRESP   (axi_bresp[1:0]),    // AXI PS Master GP0 BRESP[1:0], input

// AXI PS Master GP1    
// AXI PS Master GP1: Clock, Reset
    .MAXIGP1ACLK(),              // AXI PS Master GP1 Clock , input
    .MAXIGP1ARESETN(),           // AXI PS Master GP1 Reset, output
// AXI PS Master GP1: Read Address    
    .MAXIGP1ARADDR(),            // AXI PS Master GP1 ARADDR[31:0], output  
    .MAXIGP1ARVALID(),           // AXI PS Master GP1 ARVALID, output
    .MAXIGP1ARREADY(),           // AXI PS Master GP1 ARREADY, input
    .MAXIGP1ARID(),              // AXI PS Master GP1 ARID[11:0], output
    .MAXIGP1ARLOCK(),            // AXI PS Master GP1 ARLOCK[1:0], output
    .MAXIGP1ARCACHE(),           // AXI PS Master GP1 ARCACHE[3:0], output
    .MAXIGP1ARPROT(),            // AXI PS Master GP1 ARPROT[2:0], output
    .MAXIGP1ARLEN(),             // AXI PS Master GP1 ARLEN[3:0], output
    .MAXIGP1ARSIZE(),            // AXI PS Master GP1 ARSIZE[1:0], output
    .MAXIGP1ARBURST(),           // AXI PS Master GP1 ARBURST[1:0], output
    .MAXIGP1ARQOS(),             // AXI PS Master GP1 ARQOS[3:0], output
// AXI PS Master GP1: Read Data
    .MAXIGP1RDATA(),             // AXI PS Master GP1 RDATA[31:0], input
    .MAXIGP1RVALID(),            // AXI PS Master GP1 RVALID, input
    .MAXIGP1RREADY(),            // AXI PS Master GP1 RREADY, output
    .MAXIGP1RID(),               // AXI PS Master GP1 RID[11:0], input
    .MAXIGP1RLAST(),             // AXI PS Master GP1 RLAST, input
    .MAXIGP1RRESP(),             // AXI PS Master GP1 RRESP[1:0], input
// AXI PS Master GP1: Write Address    
    .MAXIGP1AWADDR(),            // AXI PS Master GP1 AWADDR[31:0], output
    .MAXIGP1AWVALID(),           // AXI PS Master GP1 AWVALID, output
    .MAXIGP1AWREADY(),           // AXI PS Master GP1 AWREADY, input
    .MAXIGP1AWID(),              // AXI PS Master GP1 AWID[11:0], output
    .MAXIGP1AWLOCK(),            // AXI PS Master GP1 AWLOCK[1:0], output
    .MAXIGP1AWCACHE(),           // AXI PS Master GP1 AWCACHE[3:0], output
    .MAXIGP1AWPROT(),            // AXI PS Master GP1 AWPROT[2:0], output
    .MAXIGP1AWLEN(),             // AXI PS Master GP1 AWLEN[3:0], output
    .MAXIGP1AWSIZE(),            // AXI PS Master GP1 AWSIZE[1:0], output
    .MAXIGP1AWBURST(),           // AXI PS Master GP1 AWBURST[1:0], output
    .MAXIGP1AWQOS(),             // AXI PS Master GP1 AWQOS[3:0], output
// AXI PS Master GP1: Write Data
    .MAXIGP1WDATA(),             // AXI PS Master GP1 WDATA[31:0], output
    .MAXIGP1WVALID(),            // AXI PS Master GP1 WVALID, output
    .MAXIGP1WREADY(),            // AXI PS Master GP1 WREADY, input
    .MAXIGP1WID(),               // AXI PS Master GP1 WID[11:0], output
    .MAXIGP1WLAST(),             // AXI PS Master GP1 WLAST, output
    .MAXIGP1WSTRB(),             // AXI PS Master GP1 WSTRB[3:0], output
// AXI PS Master GP1: Write Responce
    .MAXIGP1BVALID(),            // AXI PS Master GP1 BVALID, input
    .MAXIGP1BREADY(),            // AXI PS Master GP1 BREADY, output
    .MAXIGP1BID(),               // AXI PS Master GP1 BID[11:0], input
    .MAXIGP1BRESP(),             // AXI PS Master GP1 BRESP[1:0], input

// AXI PS Slave GP0    
// AXI PS Slave GP0: Clock, Reset
    .SAXIGP0ACLK(),              // AXI PS Slave GP0 Clock , input
    .SAXIGP0ARESETN(),           // AXI PS Slave GP0 Reset, output
// AXI PS Slave GP0: Read Address    
    .SAXIGP0ARADDR(),            // AXI PS Slave GP0 ARADDR[31:0], input  
    .SAXIGP0ARVALID(),           // AXI PS Slave GP0 ARVALID, input
    .SAXIGP0ARREADY(),           // AXI PS Slave GP0 ARREADY, output
    .SAXIGP0ARID(),              // AXI PS Slave GP0 ARID[5:0], input
    .SAXIGP0ARLOCK(),            // AXI PS Slave GP0 ARLOCK[1:0], input
    .SAXIGP0ARCACHE(),           // AXI PS Slave GP0 ARCACHE[3:0], input
    .SAXIGP0ARPROT(),            // AXI PS Slave GP0 ARPROT[2:0], input
    .SAXIGP0ARLEN(),             // AXI PS Slave GP0 ARLEN[3:0], input
    .SAXIGP0ARSIZE(),            // AXI PS Slave GP0 ARSIZE[1:0], input
    .SAXIGP0ARBURST(),           // AXI PS Slave GP0 ARBURST[1:0], input
    .SAXIGP0ARQOS(),             // AXI PS Slave GP0 ARQOS[3:0], input
// AXI PS Slave GP0: Read Data
    .SAXIGP0RDATA(),             // AXI PS Slave GP0 RDATA[31:0], output
    .SAXIGP0RVALID(),            // AXI PS Slave GP0 RVALID, output
    .SAXIGP0RREADY(),            // AXI PS Slave GP0 RREADY, input
    .SAXIGP0RID(),               // AXI PS Slave GP0 RID[5:0], output
    .SAXIGP0RLAST(),             // AXI PS Slave GP0 RLAST, output
    .SAXIGP0RRESP(),             // AXI PS Slave GP0 RRESP[1:0], output
// AXI PS Slave GP0: Write Address    
    .SAXIGP0AWADDR(),            // AXI PS Slave GP0 AWADDR[31:0], input
    .SAXIGP0AWVALID(),           // AXI PS Slave GP0 AWVALID, input
    .SAXIGP0AWREADY(),           // AXI PS Slave GP0 AWREADY, output
    .SAXIGP0AWID(),              // AXI PS Slave GP0 AWID[5:0], input
    .SAXIGP0AWLOCK(),            // AXI PS Slave GP0 AWLOCK[1:0], input
    .SAXIGP0AWCACHE(),           // AXI PS Slave GP0 AWCACHE[3:0], input
    .SAXIGP0AWPROT(),            // AXI PS Slave GP0 AWPROT[2:0], input
    .SAXIGP0AWLEN(),             // AXI PS Slave GP0 AWLEN[3:0], input
    .SAXIGP0AWSIZE(),            // AXI PS Slave GP0 AWSIZE[1:0], input
    .SAXIGP0AWBURST(),           // AXI PS Slave GP0 AWBURST[1:0], input
    .SAXIGP0AWQOS(),             // AXI PS Slave GP0 AWQOS[3:0], input
// AXI PS Slave GP0: Write Data
    .SAXIGP0WDATA(),             // AXI PS Slave GP0 WDATA[31:0], input
    .SAXIGP0WVALID(),            // AXI PS Slave GP0 WVALID, input
    .SAXIGP0WREADY(),            // AXI PS Slave GP0 WREADY, output
    .SAXIGP0WID(),               // AXI PS Slave GP0 WID[5:0], input
    .SAXIGP0WLAST(),             // AXI PS Slave GP0 WLAST, input
    .SAXIGP0WSTRB(),             // AXI PS Slave GP0 WSTRB[3:0], input
// AXI PS Slave GP0: Write Responce
    .SAXIGP0BVALID(),            // AXI PS Slave GP0 BVALID, output
    .SAXIGP0BREADY(),            // AXI PS Slave GP0 BREADY, input
    .SAXIGP0BID(),               // AXI PS Slave GP0 BID[5:0], output //TODO:  Update range !!!
    .SAXIGP0BRESP(),             // AXI PS Slave GP0 BRESP[1:0], output

// AXI PS Slave GP1    
// AXI PS Slave GP1: Clock, Reset
    .SAXIGP1ACLK(),              // AXI PS Slave GP1 Clock , input
    .SAXIGP1ARESETN(),           // AXI PS Slave GP1 Reset, output
// AXI PS Slave GP1: Read Address    
    .SAXIGP1ARADDR(),            // AXI PS Slave GP1 ARADDR[31:0], input  
    .SAXIGP1ARVALID(),           // AXI PS Slave GP1 ARVALID, input
    .SAXIGP1ARREADY(),           // AXI PS Slave GP1 ARREADY, output
    .SAXIGP1ARID(),              // AXI PS Slave GP1 ARID[5:0], input
    .SAXIGP1ARLOCK(),            // AXI PS Slave GP1 ARLOCK[1:0], input
    .SAXIGP1ARCACHE(),           // AXI PS Slave GP1 ARCACHE[3:0], input
    .SAXIGP1ARPROT(),            // AXI PS Slave GP1 ARPROT[2:0], input
    .SAXIGP1ARLEN(),             // AXI PS Slave GP1 ARLEN[3:0], input
    .SAXIGP1ARSIZE(),            // AXI PS Slave GP1 ARSIZE[1:0], input
    .SAXIGP1ARBURST(),           // AXI PS Slave GP1 ARBURST[1:0], input
    .SAXIGP1ARQOS(),             // AXI PS Slave GP1 ARQOS[3:0], input
// AXI PS Slave GP1: Read Data
    .SAXIGP1RDATA(),             // AXI PS Slave GP1 RDATA[31:0], output
    .SAXIGP1RVALID(),            // AXI PS Slave GP1 RVALID, output
    .SAXIGP1RREADY(),            // AXI PS Slave GP1 RREADY, input
    .SAXIGP1RID(),               // AXI PS Slave GP1 RID[5:0], output
    .SAXIGP1RLAST(),             // AXI PS Slave GP1 RLAST, output
    .SAXIGP1RRESP(),             // AXI PS Slave GP1 RRESP[1:0], output
// AXI PS Slave GP1: Write Address    
    .SAXIGP1AWADDR(),            // AXI PS Slave GP1 AWADDR[31:0], input
    .SAXIGP1AWVALID(),           // AXI PS Slave GP1 AWVALID, input
    .SAXIGP1AWREADY(),           // AXI PS Slave GP1 AWREADY, output
    .SAXIGP1AWID(),              // AXI PS Slave GP1 AWID[5:0], input
    .SAXIGP1AWLOCK(),            // AXI PS Slave GP1 AWLOCK[1:0], input
    .SAXIGP1AWCACHE(),           // AXI PS Slave GP1 AWCACHE[3:0], input
    .SAXIGP1AWPROT(),            // AXI PS Slave GP1 AWPROT[2:0], input
    .SAXIGP1AWLEN(),             // AXI PS Slave GP1 AWLEN[3:0], input
    .SAXIGP1AWSIZE(),            // AXI PS Slave GP1 AWSIZE[1:0], input
    .SAXIGP1AWBURST(),           // AXI PS Slave GP1 AWBURST[1:0], input
    .SAXIGP1AWQOS(),             // AXI PS Slave GP1 AWQOS[3:0], input
// AXI PS Slave GP1: Write Data
    .SAXIGP1WDATA(),             // AXI PS Slave GP1 WDATA[31:0], input
    .SAXIGP1WVALID(),            // AXI PS Slave GP1 WVALID, input
    .SAXIGP1WREADY(),            // AXI PS Slave GP1 WREADY, output
    .SAXIGP1WID(),               // AXI PS Slave GP1 WID[5:0], input
    .SAXIGP1WLAST(),             // AXI PS Slave GP1 WLAST, input
    .SAXIGP1WSTRB(),             // AXI PS Slave GP1 WSTRB[3:0], input
// AXI PS Slave GP1: Write Responce
    .SAXIGP1BVALID(),            // AXI PS Slave GP1 BVALID, output
    .SAXIGP1BREADY(),            // AXI PS Slave GP1 BREADY, input
    .SAXIGP1BID(),               // AXI PS Slave GP1 BID[5:0], output
    .SAXIGP1BRESP(),             // AXI PS Slave GP1 BRESP[1:0], output

// AXI PS Slave HP0    
// AXI PS Slave HP0: Clock, Reset
    .SAXIHP0ACLK(),              // AXI PS Slave HP0 Clock , input
    .SAXIHP0ARESETN(),           // AXI PS Slave HP0 Reset, output
// AXI PS Slave HP0: Read Address    
    .SAXIHP0ARADDR(),            // AXI PS Slave HP0 ARADDR[31:0], input  
    .SAXIHP0ARVALID(),           // AXI PS Slave HP0 ARVALID, input
    .SAXIHP0ARREADY(),           // AXI PS Slave HP0 ARREADY, output
    .SAXIHP0ARID(),              // AXI PS Slave HP0 ARID[5:0], input
    .SAXIHP0ARLOCK(),            // AXI PS Slave HP0 ARLOCK[1:0], input
    .SAXIHP0ARCACHE(),           // AXI PS Slave HP0 ARCACHE[3:0], input
    .SAXIHP0ARPROT(),            // AXI PS Slave HP0 ARPROT[2:0], input
    .SAXIHP0ARLEN(),             // AXI PS Slave HP0 ARLEN[3:0], input
    .SAXIHP0ARSIZE(),            // AXI PS Slave HP0 ARSIZE[2:0], input
    .SAXIHP0ARBURST(),           // AXI PS Slave HP0 ARBURST[1:0], input
    .SAXIHP0ARQOS(),             // AXI PS Slave HP0 ARQOS[3:0], input
// AXI PS Slave HP0: Read Data
    .SAXIHP0RDATA(),             // AXI PS Slave HP0 RDATA[63:0], output
    .SAXIHP0RVALID(),            // AXI PS Slave HP0 RVALID, output
    .SAXIHP0RREADY(),            // AXI PS Slave HP0 RREADY, input
    .SAXIHP0RID(),               // AXI PS Slave HP0 RID[5:0], output
    .SAXIHP0RLAST(),             // AXI PS Slave HP0 RLAST, output
    .SAXIHP0RRESP(),             // AXI PS Slave HP0 RRESP[1:0], output
    .SAXIHP0RCOUNT(),            // AXI PS Slave HP0 RCOUNT[7:0], output
    .SAXIHP0RACOUNT(),           // AXI PS Slave HP0 RACOUNT[2:0], output
    .SAXIHP0RDISSUECAP1EN(),     // AXI PS Slave HP0 RDISSUECAP1EN, input
// AXI PS Slave HP0: Write Address    
    .SAXIHP0AWADDR(),            // AXI PS Slave HP0 AWADDR[31:0], input
    .SAXIHP0AWVALID(),           // AXI PS Slave HP0 AWVALID, input
    .SAXIHP0AWREADY(),           // AXI PS Slave HP0 AWREADY, output
    .SAXIHP0AWID(),              // AXI PS Slave HP0 AWID[5:0], input
    .SAXIHP0AWLOCK(),            // AXI PS Slave HP0 AWLOCK[1:0], input
    .SAXIHP0AWCACHE(),           // AXI PS Slave HP0 AWCACHE[3:0], input
    .SAXIHP0AWPROT(),            // AXI PS Slave HP0 AWPROT[2:0], input
    .SAXIHP0AWLEN(),             // AXI PS Slave HP0 AWLEN[3:0], input
    .SAXIHP0AWSIZE(),            // AXI PS Slave HP0 AWSIZE[1:0], input
    .SAXIHP0AWBURST(),           // AXI PS Slave HP0 AWBURST[1:0], input
    .SAXIHP0AWQOS(),             // AXI PS Slave HP0 AWQOS[3:0], input
// AXI PS Slave HP0: Write Data
    .SAXIHP0WDATA(),             // AXI PS Slave HP0 WDATA[63:0], input
    .SAXIHP0WVALID(),            // AXI PS Slave HP0 WVALID, input
    .SAXIHP0WREADY(),            // AXI PS Slave HP0 WREADY, output
    .SAXIHP0WID(),               // AXI PS Slave HP0 WID[5:0], input
    .SAXIHP0WLAST(),             // AXI PS Slave HP0 WLAST, input
    .SAXIHP0WSTRB(),             // AXI PS Slave HP0 WSTRB[7:0], input
    .SAXIHP0WCOUNT(),            // AXI PS Slave HP0 WCOUNT[7:0], output
    .SAXIHP0WACOUNT(),           // AXI PS Slave HP0 WACOUNT[5:0], output
    .SAXIHP0WRISSUECAP1EN(),     // AXI PS Slave HP0 WRISSUECAP1EN, input
// AXI PS Slave HP0: Write Responce
    .SAXIHP0BVALID(),            // AXI PS Slave HP0 BVALID, output
    .SAXIHP0BREADY(),            // AXI PS Slave HP0 BREADY, input
    .SAXIHP0BID(),               // AXI PS Slave HP0 BID[5:0], output
    .SAXIHP0BRESP(),             // AXI PS Slave HP0 BRESP[1:0], output

// AXI PS Slave HP1    
// AXI PS Slave 1: Clock, Reset
    .SAXIHP1ACLK(),              // AXI PS Slave HP1 Clock , input
    .SAXIHP1ARESETN(),           // AXI PS Slave HP1 Reset, output
// AXI PS Slave HP1: Read Address    
    .SAXIHP1ARADDR(),            // AXI PS Slave HP1 ARADDR[31:0], input  
    .SAXIHP1ARVALID(),           // AXI PS Slave HP1 ARVALID, input
    .SAXIHP1ARREADY(),           // AXI PS Slave HP1 ARREADY, output
    .SAXIHP1ARID(),              // AXI PS Slave HP1 ARID[5:0], input
    .SAXIHP1ARLOCK(),            // AXI PS Slave HP1 ARLOCK[1:0], input
    .SAXIHP1ARCACHE(),           // AXI PS Slave HP1 ARCACHE[3:0], input
    .SAXIHP1ARPROT(),            // AXI PS Slave HP1 ARPROT[2:0], input
    .SAXIHP1ARLEN(),             // AXI PS Slave HP1 ARLEN[3:0], input
    .SAXIHP1ARSIZE(),            // AXI PS Slave HP1 ARSIZE[2:0], input
    .SAXIHP1ARBURST(),           // AXI PS Slave HP1 ARBURST[1:0], input
    .SAXIHP1ARQOS(),             // AXI PS Slave HP1 ARQOS[3:0], input
// AXI PS Slave HP1: Read Data
    .SAXIHP1RDATA(),             // AXI PS Slave HP1 RDATA[63:0], output
    .SAXIHP1RVALID(),            // AXI PS Slave HP1 RVALID, output
    .SAXIHP1RREADY(),            // AXI PS Slave HP1 RREADY, input
    .SAXIHP1RID(),               // AXI PS Slave HP1 RID[5:0], output
    .SAXIHP1RLAST(),             // AXI PS Slave HP1 RLAST, output
    .SAXIHP1RRESP(),             // AXI PS Slave HP1 RRESP[1:0], output
    .SAXIHP1RCOUNT(),            // AXI PS Slave HP1 RCOUNT[7:0], output
    .SAXIHP1RACOUNT(),           // AXI PS Slave HP1 RACOUNT[2:0], output
    .SAXIHP1RDISSUECAP1EN(),     // AXI PS Slave HP1 RDISSUECAP1EN, input
// AXI PS Slave HP1: Write Address    
    .SAXIHP1AWADDR(),            // AXI PS Slave HP1 AWADDR[31:0], input
    .SAXIHP1AWVALID(),           // AXI PS Slave HP1 AWVALID, input
    .SAXIHP1AWREADY(),           // AXI PS Slave HP1 AWREADY, output
    .SAXIHP1AWID(),              // AXI PS Slave HP1 AWID[5:0], input
    .SAXIHP1AWLOCK(),            // AXI PS Slave HP1 AWLOCK[1:0], input
    .SAXIHP1AWCACHE(),           // AXI PS Slave HP1 AWCACHE[3:0], input
    .SAXIHP1AWPROT(),            // AXI PS Slave HP1 AWPROT[2:0], input
    .SAXIHP1AWLEN(),             // AXI PS Slave HP1 AWLEN[3:0], input
    .SAXIHP1AWSIZE(),            // AXI PS Slave HP1 AWSIZE[1:0], input
    .SAXIHP1AWBURST(),           // AXI PS Slave HP1 AWBURST[1:0], input
    .SAXIHP1AWQOS(),             // AXI PS Slave HP1 AWQOS[3:0], input
// AXI PS Slave HP1: Write Data
    .SAXIHP1WDATA(),             // AXI PS Slave HP1 WDATA[63:0], input
    .SAXIHP1WVALID(),            // AXI PS Slave HP1 WVALID, input
    .SAXIHP1WREADY(),            // AXI PS Slave HP1 WREADY, output
    .SAXIHP1WID(),               // AXI PS Slave HP1 WID[5:0], input
    .SAXIHP1WLAST(),             // AXI PS Slave HP1 WLAST, input
    .SAXIHP1WSTRB(),             // AXI PS Slave HP1 WSTRB[7:0], input
    .SAXIHP1WCOUNT(),            // AXI PS Slave HP1 WCOUNT[7:0], output
    .SAXIHP1WACOUNT(),           // AXI PS Slave HP1 WACOUNT[5:0], output
    .SAXIHP1WRISSUECAP1EN(),     // AXI PS Slave HP1 WRISSUECAP1EN, input
// AXI PS Slave HP1: Write Responce
    .SAXIHP1BVALID(),            // AXI PS Slave HP1 BVALID, output
    .SAXIHP1BREADY(),            // AXI PS Slave HP1 BREADY, input
    .SAXIHP1BID(),               // AXI PS Slave HP1 BID[5:0], output
    .SAXIHP1BRESP(),             // AXI PS Slave HP1 BRESP[1:0], output

// AXI PS Slave HP2    
// AXI PS Slave HP2: Clock, Reset
    .SAXIHP2ACLK(),              // AXI PS Slave HP2 Clock , input
    .SAXIHP2ARESETN(),           // AXI PS Slave HP2 Reset, output
// AXI PS Slave HP2: Read Address    
    .SAXIHP2ARADDR(),            // AXI PS Slave HP2 ARADDR[31:0], input  
    .SAXIHP2ARVALID(),           // AXI PS Slave HP2 ARVALID, input
    .SAXIHP2ARREADY(),           // AXI PS Slave HP2 ARREADY, output
    .SAXIHP2ARID(),              // AXI PS Slave HP2 ARID[5:0], input
    .SAXIHP2ARLOCK(),            // AXI PS Slave HP2 ARLOCK[1:0], input
    .SAXIHP2ARCACHE(),           // AXI PS Slave HP2 ARCACHE[3:0], input
    .SAXIHP2ARPROT(),            // AXI PS Slave HP2 ARPROT[2:0], input
    .SAXIHP2ARLEN(),             // AXI PS Slave HP2 ARLEN[3:0], input
    .SAXIHP2ARSIZE(),            // AXI PS Slave HP2 ARSIZE[2:0], input
    .SAXIHP2ARBURST(),           // AXI PS Slave HP2 ARBURST[1:0], input
    .SAXIHP2ARQOS(),             // AXI PS Slave HP2 ARQOS[3:0], input
// AXI PS Slave HP2: Read Data
    .SAXIHP2RDATA(),             // AXI PS Slave HP2 RDATA[63:0], output
    .SAXIHP2RVALID(),            // AXI PS Slave HP2 RVALID, output
    .SAXIHP2RREADY(),            // AXI PS Slave HP2 RREADY, input
    .SAXIHP2RID(),               // AXI PS Slave HP2 RID[5:0], output
    .SAXIHP2RLAST(),             // AXI PS Slave HP2 RLAST, output
    .SAXIHP2RRESP(),             // AXI PS Slave HP2 RRESP[1:0], output
    .SAXIHP2RCOUNT(),            // AXI PS Slave HP2 RCOUNT[7:0], output
    .SAXIHP2RACOUNT(),           // AXI PS Slave HP2 RACOUNT[2:0], output
    .SAXIHP2RDISSUECAP1EN(),     // AXI PS Slave HP2 RDISSUECAP1EN, input
// AXI PS Slave HP2: Write Address    
    .SAXIHP2AWADDR(),            // AXI PS Slave HP2 AWADDR[31:0], input
    .SAXIHP2AWVALID(),           // AXI PS Slave HP2 AWVALID, input
    .SAXIHP2AWREADY(),           // AXI PS Slave HP2 AWREADY, output
    .SAXIHP2AWID(),              // AXI PS Slave HP2 AWID[5:0], input
    .SAXIHP2AWLOCK(),            // AXI PS Slave HP2 AWLOCK[1:0], input
    .SAXIHP2AWCACHE(),           // AXI PS Slave HP2 AWCACHE[3:0], input
    .SAXIHP2AWPROT(),            // AXI PS Slave HP2 AWPROT[2:0], input
    .SAXIHP2AWLEN(),             // AXI PS Slave HP2 AWLEN[3:0], input
    .SAXIHP2AWSIZE(),            // AXI PS Slave HP2 AWSIZE[1:0], input
    .SAXIHP2AWBURST(),           // AXI PS Slave HP2 AWBURST[1:0], input
    .SAXIHP2AWQOS(),             // AXI PS Slave HP2 AWQOS[3:0], input
// AXI PS Slave HP2: Write Data
    .SAXIHP2WDATA(),             // AXI PS Slave HP2 WDATA[63:0], input
    .SAXIHP2WVALID(),            // AXI PS Slave HP2 WVALID, input
    .SAXIHP2WREADY(),            // AXI PS Slave HP2 WREADY, output
    .SAXIHP2WID(),               // AXI PS Slave HP2 WID[5:0], input
    .SAXIHP2WLAST(),             // AXI PS Slave HP2 WLAST, input
    .SAXIHP2WSTRB(),             // AXI PS Slave HP2 WSTRB[7:0], input
    .SAXIHP2WCOUNT(),            // AXI PS Slave HP2 WCOUNT[7:0], output
    .SAXIHP2WACOUNT(),           // AXI PS Slave HP2 WACOUNT[5:0], output
    .SAXIHP2WRISSUECAP1EN(),     // AXI PS Slave HP2 WRISSUECAP1EN, input
// AXI PS Slave HP2: Write Responce
    .SAXIHP2BVALID(),            // AXI PS Slave HP2 BVALID, output
    .SAXIHP2BREADY(),            // AXI PS Slave HP2 BREADY, input
    .SAXIHP2BID(),               // AXI PS Slave HP2 BID[5:0], output
    .SAXIHP2BRESP(),             // AXI PS Slave HP2 BRESP[1:0], output

// AXI PS Slave HP3    
// AXI PS Slave HP3: Clock, Reset
    .SAXIHP3ACLK(),              // AXI PS Slave HP3 Clock , input
    .SAXIHP3ARESETN(),           // AXI PS Slave HP3 Reset, output
// AXI PS Slave HP3: Read Address    
    .SAXIHP3ARADDR(),            // AXI PS Slave HP3 ARADDR[31:0], input  
    .SAXIHP3ARVALID(),           // AXI PS Slave HP3 ARVALID, input
    .SAXIHP3ARREADY(),           // AXI PS Slave HP3 ARREADY, output
    .SAXIHP3ARID(),              // AXI PS Slave HP3 ARID[5:0], input
    .SAXIHP3ARLOCK(),            // AXI PS Slave HP3 ARLOCK[1:0], input
    .SAXIHP3ARCACHE(),           // AXI PS Slave HP3 ARCACHE[3:0], input
    .SAXIHP3ARPROT(),            // AXI PS Slave HP3 ARPROT[2:0], input
    .SAXIHP3ARLEN(),             // AXI PS Slave HP3 ARLEN[3:0], input
    .SAXIHP3ARSIZE(),            // AXI PS Slave HP3 ARSIZE[2:0], input
    .SAXIHP3ARBURST(),           // AXI PS Slave HP3 ARBURST[1:0], input
    .SAXIHP3ARQOS(),             // AXI PS Slave HP3 ARQOS[3:0], input
// AXI PS Slave HP3: Read Data
    .SAXIHP3RDATA(),             // AXI PS Slave HP3 RDATA[63:0], output
    .SAXIHP3RVALID(),            // AXI PS Slave HP3 RVALID, output
    .SAXIHP3RREADY(),            // AXI PS Slave HP3 RREADY, input
    .SAXIHP3RID(),               // AXI PS Slave HP3 RID[5:0], output
    .SAXIHP3RLAST(),             // AXI PS Slave HP3 RLAST, output
    .SAXIHP3RRESP(),             // AXI PS Slave HP3 RRESP[1:0], output
    .SAXIHP3RCOUNT(),            // AXI PS Slave HP3 RCOUNT[7:0], output
    .SAXIHP3RACOUNT(),           // AXI PS Slave HP3 RACOUNT[2:0], output
    .SAXIHP3RDISSUECAP1EN(),     // AXI PS Slave HP3 RDISSUECAP1EN, input
// AXI PS Slave HP3: Write Address    
    .SAXIHP3AWADDR(),            // AXI PS Slave HP3 AWADDR[31:0], input
    .SAXIHP3AWVALID(),           // AXI PS Slave HP3 AWVALID, input
    .SAXIHP3AWREADY(),           // AXI PS Slave HP3 AWREADY, output
    .SAXIHP3AWID(),              // AXI PS Slave HP3 AWID[5:0], input
    .SAXIHP3AWLOCK(),            // AXI PS Slave HP3 AWLOCK[1:0], input
    .SAXIHP3AWCACHE(),           // AXI PS Slave HP3 AWCACHE[3:0], input
    .SAXIHP3AWPROT(),            // AXI PS Slave HP3 AWPROT[2:0], input
    .SAXIHP3AWLEN(),             // AXI PS Slave HP3 AWLEN[3:0], input
    .SAXIHP3AWSIZE(),            // AXI PS Slave HP3 AWSIZE[1:0], input
    .SAXIHP3AWBURST(),           // AXI PS Slave HP3 AWBURST[1:0], input
    .SAXIHP3AWQOS(),             // AXI PS Slave HP3 AWQOS[3:0], input
// AXI PS Slave HP3: Write Data
    .SAXIHP3WDATA(),             // AXI PS Slave HP3 WDATA[63:0], input
    .SAXIHP3WVALID(),            // AXI PS Slave HP3 WVALID, input
    .SAXIHP3WREADY(),            // AXI PS Slave HP3 WREADY, output
    .SAXIHP3WID(),               // AXI PS Slave HP3 WID[5:0], input
    .SAXIHP3WLAST(),             // AXI PS Slave HP3 WLAST, input
    .SAXIHP3WSTRB(),             // AXI PS Slave HP3 WSTRB[7:0], input
    .SAXIHP3WCOUNT(),            // AXI PS Slave HP3 WCOUNT[7:0], output
    .SAXIHP3WACOUNT(),           // AXI PS Slave HP3 WACOUNT[5:0], output
    .SAXIHP3WRISSUECAP1EN(),     // AXI PS Slave HP3 WRISSUECAP1EN, input
// AXI PS Slave HP3: Write Responce
    .SAXIHP3BVALID(),            // AXI PS Slave HP3 BVALID, output
    .SAXIHP3BREADY(),            // AXI PS Slave HP3 BREADY, input
    .SAXIHP3BID(),               // AXI PS Slave HP3 BID[5:0], output
    .SAXIHP3BRESP(),             // AXI PS Slave HP3 BRESP[1:0], output

// AXI PS Slave ACP    
// AXI PS Slave ACP: Clock, Reset
    .SAXIACPACLK(),              // AXI PS Slave ACP Clock, input
    .SAXIACPARESETN(),           // AXI PS Slave ACP Reset, output
// AXI PS Slave ACP: Read Address    
    .SAXIACPARADDR(),            // AXI PS Slave ACP ARADDR[31:0], input  
    .SAXIACPARVALID(),           // AXI PS Slave ACP ARVALID, input
    .SAXIACPARREADY(),           // AXI PS Slave ACP ARREADY, output
    .SAXIACPARID(),              // AXI PS Slave ACP ARID[2:0], input
    .SAXIACPARLOCK(),            // AXI PS Slave ACP ARLOCK[1:0], input
    .SAXIACPARCACHE(),           // AXI PS Slave ACP ARCACHE[3:0], input
    .SAXIACPARPROT(),            // AXI PS Slave ACP ARPROT[2:0], input
    .SAXIACPARLEN(),             // AXI PS Slave ACP ARLEN[3:0], input
    .SAXIACPARSIZE(),            // AXI PS Slave ACP ARSIZE[2:0], input
    .SAXIACPARBURST(),           // AXI PS Slave ACP ARBURST[1:0], input
    .SAXIACPARQOS(),             // AXI PS Slave ACP ARQOS[3:0], input
    .SAXIACPARUSER(),            // AXI PS Slave ACP ARUSER[4:0], input
// AXI PS Slave ACP: Read Data
    .SAXIACPRDATA(),             // AXI PS Slave ACP RDATA[63:0], output
    .SAXIACPRVALID(),            // AXI PS Slave ACP RVALID, output
    .SAXIACPRREADY(),            // AXI PS Slave ACP RREADY, input
    .SAXIACPRID(),               // AXI PS Slave ACP RID[2:0], output
    .SAXIACPRLAST(),             // AXI PS Slave ACP RLAST, output
    .SAXIACPRRESP(),             // AXI PS Slave ACP RRESP[1:0], output
// AXI PS Slave ACP: Write Address    
    .SAXIACPAWADDR(),            // AXI PS Slave ACP AWADDR[31:0], input
    .SAXIACPAWVALID(),           // AXI PS Slave ACP AWVALID, input
    .SAXIACPAWREADY(),           // AXI PS Slave ACP AWREADY, output
    .SAXIACPAWID(),              // AXI PS Slave ACP AWID[2:0], input
    .SAXIACPAWLOCK(),            // AXI PS Slave ACP AWLOCK[1:0], input
    .SAXIACPAWCACHE(),           // AXI PS Slave ACP AWCACHE[3:0], input
    .SAXIACPAWPROT(),            // AXI PS Slave ACP AWPROT[2:0], input
    .SAXIACPAWLEN(),             // AXI PS Slave ACP AWLEN[3:0], input
    .SAXIACPAWSIZE(),            // AXI PS Slave ACP AWSIZE[1:0], input
    .SAXIACPAWBURST(),           // AXI PS Slave ACP AWBURST[1:0], input
    .SAXIACPAWQOS(),             // AXI PS Slave ACP AWQOS[3:0], input
    .SAXIACPAWUSER(),            // AXI PS Slave ACP AWUSER[4:0], input
    
// AXI PS Slave ACP: Write Data
    .SAXIACPWDATA(),             // AXI PS Slave ACP WDATA[63:0], input
    .SAXIACPWVALID(),            // AXI PS Slave ACP WVALID, input
    .SAXIACPWREADY(),            // AXI PS Slave ACP WREADY, output
    .SAXIACPWID(),               // AXI PS Slave ACP WID[2:0], input
    .SAXIACPWLAST(),             // AXI PS Slave ACP WLAST, input
    .SAXIACPWSTRB(),             // AXI PS Slave ACP WSTRB[7:0], input
// AXI PS Slave ACP: Write Responce
    .SAXIACPBVALID(),            // AXI PS Slave ACP BVALID, output
    .SAXIACPBREADY(),            // AXI PS Slave ACP BREADY, input
    .SAXIACPBID(),               // AXI PS Slave ACP BID[2:0], output
    .SAXIACPBRESP(),             // AXI PS Slave ACP BRESP[1:0], output
// Direct connection to PS package pads
    .DDRA(),                     // PS DDRA[14:0], inout
    .DDRBA(),                    // PS DDRBA[2:0], inout
    .DDRCASB(),                  // PS DDRCASB, inout
    .DDRCKE(),                   // PS DDRCKE, inout
    .DDRCKP(),                   // PS DDRCKP, inout
    .DDRCKN(),                   // PS DDRCKN, inout
    .DDRCSB(),                   // PS DDRCSB, inout
    .DDRDM(),                    // PS DDRDM[3:0], inout
    .DDRDQ(),                    // PS DDRDQ[31:0], inout
    .DDRDQSP(),                  // PS DDRDQSP[3:0], inout
    .DDRDQSN(),                  // PS DDRDQSN[3:0], inout
    .DDRDRSTB(),                 // PS DDRDRSTB, inout
    .DDRODT(),                   // PS DDRODT, inout
    .DDRRASB(),                  // PS DDRRASB, inout
    .DDRVRN(),                   // PS DDRVRN, inout
    .DDRVRP(),                   // PS DDRVRP, inout
    .DDRWEB(),                   // PS DDRWEB, inout
    .MIO(),                      // PS MIO[53:0], inout // clg225 has less
    .PSCLK(),                    // PS PSCLK, inout
    .PSPORB(),                   // PS PSPORB, inout
    .PSSRSTB()                  // PS PSSRSTB, inout
  );

endmodule


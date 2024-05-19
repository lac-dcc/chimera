// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b> x393_dut
 * @file x393_dut.v
 * @date 2016-06-27  
 * @author Andrey Filippov
 *     
 * @brief Top DUT module for simulating x393 project with Cocotb
 * Includes instances of other Verilog simulation modules and I/O ports
 * for interfacing with Python modules 
 *
 * @copyright Copyright (c) 2016 Elphel, Inc.
 *
 * <b>License:</b>
 * 
 * x393_dut.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * x393_dut.v is distributed in the hope that it will be useful,
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
`define COCOTB
//`define DISABLE_SENSOR_2
`include "system_defines.vh"
module  x393_dut#(
`include "includes/x393_parameters.vh" // SuppressThisWarning VEditor - not used
`include "includes/x393_simulation_parameters.vh"
)(
    output          dutm0_aclk,
    output          reset_out,
// axi ps master gp0: read address    
    input    [31:0] dutm0_araddr,
    output          dutm0_arready,
    input           dutm0_arvalid,  // was dutm0_ar_set_cmd
    input    [11:0] dutm0_arid,
    input     [1:0] dutm0_arlock,   //SuppressThisWarning VEditor unused
    input     [3:0] dutm0_arcache,  //SuppressThisWarning VEditor unused
    input     [2:0] dutm0_arprot,   //SuppressThisWarning VEditor unused
    input     [3:0] dutm0_arlen,
    input     [1:0] dutm0_arsize,
    input     [1:0] dutm0_arburst,
    input     [3:0] dutm0_arqos,    //SuppressThisWarning VEditor unused
    
// axi ps master gp0: read data
    output   [31:0] dutm0_rdata,
    output          dutm0_rvalid,
    output          dutm0_rready, // internally generated as a slow response to dutm0_rvalid. Cn be moved to Python and made input here
    output   [11:0] dutm0_rid,
    output          dutm0_rlast,
    output    [1:0] dutm0_rresp,
// axi ps master gp0: write address
    input    [31:0] dutm0_awaddr,
    input           dutm0_awvalid,
    output          dutm0_awready,
    input    [11:0] dutm0_awid,
    input     [1:0] dutm0_awlock,   //SuppressThisWarning VEditor unused
    input     [3:0] dutm0_awcache,  //SuppressThisWarning VEditor unused
    input     [2:0] dutm0_awprot,   //SuppressThisWarning VEditor unused
    input     [3:0] dutm0_awlen,
    input     [1:0] dutm0_awsize,
    input     [1:0] dutm0_awburst,
    input     [3:0] dutm0_awqos,    //SuppressThisWarning VEditor unused
// axi ps master gp0: write data
    input    [31:0] dutm0_wdata,
    input           dutm0_wvalid,
    output          dutm0_wready,
    input    [11:0] dutm0_wid,
    input           dutm0_wlast,
    input    [ 3:0] dutm0_wstb,
// axi ps master gp0: write response
    output          dutm0_bvalid,
    output          dutm0_bready,// internally generated as a slow response to dutm0_bvalid. Cn be moved to Python and made input here
    output   [11:0] dutm0_bid,
    output    [1:0] dutm0_bresp,
    
    // SAXIHP* R/W control register access (internal address decoders)
    output          ps_sbus_clk, // =hclk    
    input    [31:0] ps_sbus_addr,
    input           ps_sbus_wr,
    input           ps_sbus_rd,
    input    [31:0] ps_sbus_din,
    output   [31:0] ps_sbus_dout,
    
    output          axi_hclk, // Clock for AXI interfaces
    output          saxi0_aclk, //== hclk
    // Membridge FPGA -> CPU
    output   [31:0] saxihp0_wr_address,    
    output   [ 5:0] saxihp0_wid,    
    output          saxihp0_wr_valid,    
    input           saxihp0_wr_ready,    
    output   [63:0] saxihp0_wr_data,    
    output    [7:0] saxihp0_wr_stb,    
    input     [3:0] saxihp0_bresp_latency,    
    output    [2:0] saxihp0_wr_cap,    
    output    [3:0] saxihp0_wr_qos,    

    // Membridge CPU -> FPGA
    output   [31:0] saxihp0_rd_address,    
    output   [ 5:0] saxihp0_rid,    
    input           saxihp0_rd_valid,    
    output          saxihp0_rd_ready,    
    input    [63:0] saxihp0_rd_data,    
    input     [1:0] saxihp0_rd_resp,    
    output    [2:0] saxihp0_rd_cap,    
    output    [3:0] saxihp0_rd_qos,    

    // Compressed images FPGA -> CPU
    output   [31:0] saxihp1_wr_address,    
    output   [ 5:0] saxihp1_wid,    
    output          saxihp1_wr_valid,    
    input           saxihp1_wr_ready,    
    output   [63:0] saxihp1_wr_data,    
    output    [7:0] saxihp1_wr_stb,    
    input     [3:0] saxihp1_bresp_latency,    
    output    [2:0] saxihp1_wr_cap,    
    output    [3:0] saxihp1_wr_qos,    
    
    // Histograms FPGA -> CPU
    output   [31:0] saxigp0_wr_address,    
    output   [ 5:0] saxigp0_wid,    
    output          saxigp0_wr_valid,    
    input           saxigp0_wr_ready,    
    output   [31:0] saxigp0_wr_data,    
    output    [3:0] saxigp0_wr_stb,    
    output    [1:0] saxigp0_wr_size,    
    input     [3:0] saxigp0_bresp_latency,    
    output    [3:0] saxigp0_wr_qos,    
    
    // Event logger FPGA -> CPU
    output   [31:0] saxigp1_wr_address,    
    output   [ 5:0] saxigp1_wid,    
    output          saxigp1_wr_valid,    
    input           saxigp1_wr_ready,    
    output   [31:0] saxigp1_wr_data,    
    output    [3:0] saxigp1_wr_stb,    
    output    [1:0] saxigp1_wr_size,    
    input     [3:0] saxigp1_bresp_latency,    
    output    [3:0] saxigp1_wr_qos,    
    


    output [NUM_INTERRUPTS-1:0] irq_r, // {x393_i.sata_irq, x393_i.cmprs_irq[3:0], x393_i.frseq_irq[3:0]};

    // SATA and SATA clock I/O
    
    input   [3:0] dutm0_xtra_rdlag,  // ready signal lag in axi read channel (0 - RDY=1, 1..15 - RDY is asserted N cycles after valid)   
    input   [3:0] dutm0_xtra_blag,   // ready signal lag in axi arete response channel (0 - RDY=1, 1..15 - RDY is asserted N cycles after valid)   
    
    
    // SATA data interface
    input         sata_rxn, 
    input         sata_rxp,
    output        sata_txn,
    output        sata_txp,
// sata clocking iface
    input         sata_extclkp,
    input         sata_extclkn
    
);



    assign        irq_r = {x393_i.sata_irq, x393_i.cmprs_irq[3:0], x393_i.frseq_irq[3:0]};
    assign        axi_hclk = x393_i.ps7_i.SAXIHP0ACLK; // 150 MHz
    assign        saxi0_aclk = x393_i.ps7_i.SAXIGP0ACLK; // == hclk, 150MHz
    assign        ps_sbus_clk = x393_i.ps7_i.SAXIHP0ACLK; // == hclk
 
// Temporary = to be moved to Python?

    // MAXIGP0 AXI interface
    wire          maxigp0aclk;
    wire          maxigp0aresetn;
// axi ps master gp0: read address    
    wire   [31:0] maxigp0araddr;  
    wire          maxigp0arvalid;
    wire          maxigp0arready;
    wire   [11:0] maxigp0arid;
    wire    [1:0] maxigp0arlock;
    wire    [3:0] maxigp0arcache;
    wire    [2:0] maxigp0arprot;
    wire    [3:0] maxigp0arlen;
    wire    [1:0] maxigp0arsize;
    wire    [1:0] maxigp0arburst;
    wire    [3:0] maxigp0arqos;
// axi ps master gp0: read data
    wire   [31:0] maxigp0rdata;
    wire          maxigp0rvalid;
    wire          maxigp0rready;
    wire   [11:0] maxigp0rid;
    wire          maxigp0rlast;
    wire    [1:0] maxigp0rresp;
// axi ps master gp0: write address    
    wire   [31:0] maxigp0awaddr;
    wire          maxigp0awvalid;
    wire          maxigp0awready;
    wire   [11:0] maxigp0awid;
    wire    [1:0] maxigp0awlock;
    wire    [3:0] maxigp0awcache;
    wire    [2:0] maxigp0awprot;
    wire    [3:0] maxigp0awlen;
    wire    [1:0] maxigp0awsize;
    wire    [1:0] maxigp0awburst;
    wire    [3:0] maxigp0awqos;
// axi ps master gp0: write data
    wire   [31:0] maxigp0wdata;
    wire          maxigp0wvalid;
    wire          maxigp0wready;
    wire   [11:0] maxigp0wid;
    wire          maxigp0wlast;
    wire    [3:0] maxigp0wstrb;
// axi ps master gp0: write response
    wire          maxigp0bvalid;
    wire          maxigp0bready;
    wire   [11:0] maxigp0bid;
    wire    [1:0] maxigp0bresp;

    assign dutm0_aclk =   maxigp0aclk;
    assign dutm0_rdata =  maxigp0rdata;
    assign dutm0_rid =    maxigp0rid;
    assign dutm0_rresp =  maxigp0rresp;
    assign dutm0_bid =    maxigp0bid;
    assign dutm0_bresp =  maxigp0bresp;
    assign dutm0_rvalid = maxigp0rvalid;
    assign dutm0_bvalid = maxigp0bvalid;
    assign dutm0_rready = maxigp0rready; // temporary
    assign dutm0_bready = maxigp0bready; // temporary
    assign dutm0_rlast=   maxigp0rlast;

  
//    reg [11:0] LAST_ARID; // last issued ARID

  // SuppressWarnings VEditor : assigned in $readmem() system task
    wire [SIMUL_AXI_READ_WIDTH-1:0] SIMUL_AXI_ADDR_W;
  // SuppressWarnings VEditor
    wire        SIMUL_AXI_MISMATCH;
  // SuppressWarnings VEditor
    reg  [31:0] SIMUL_AXI_READ;
  // SuppressWarnings VEditor
    reg  [SIMUL_AXI_READ_WIDTH-1:0] SIMUL_AXI_ADDR;
  // SuppressWarnings VEditor
    reg         SIMUL_AXI_FULL; // some data available
//    wire        SIMUL_AXI_EMPTY= ~rvalid && rready && (rid==LAST_ARID); //S uppressThisWarning VEditor : may be unused, just for simulation // use it to wait for?
//    reg  [31:0] registered_rdata; // here read data from tasks goes
  // SuppressWarnings VEditor
    reg         WAITING_STATUS;   // tasks are waiting for status
    // SuppressWarnings VEditor all - these variables are just for viewing, not used anywhere else
    reg DEBUG1, DEBUG2, DEBUG3;
//    reg [7:0] target_phase=0; // to compare/wait for phase shifter ready
    
  // End of Temporary = to be moved to Python?
    
// For simulating MAXIGP0
    
    
    wire [11:0]  #(AXI_TASK_HOLD) dutm0_arid_w = dutm0_arid;
    wire [31:0]  #(AXI_TASK_HOLD) dutm0_araddr_w = dutm0_araddr;
    wire  [3:0]  #(AXI_TASK_HOLD) dutm0_arlen_w = dutm0_arlen;
    wire  [1:0]  #(AXI_TASK_HOLD) dutm0_arsize_w = dutm0_arsize;
    wire  [1:0]  #(AXI_TASK_HOLD) dutm0_arburst_w = dutm0_arburst;
    wire [11:0]  #(AXI_TASK_HOLD) dutm0_awid_w = dutm0_awid;
    wire [31:0]  #(AXI_TASK_HOLD) dutm0_awaddr_w = dutm0_awaddr;
    wire  [3:0]  #(AXI_TASK_HOLD) dutm0_awlen_w = dutm0_awlen;
    wire  [1:0]  #(AXI_TASK_HOLD) dutm0_awsize_w = dutm0_awsize;
    wire  [1:0]  #(AXI_TASK_HOLD) dutm0_awburst_w = dutm0_awburst;
    wire [11:0]  #(AXI_TASK_HOLD) dutm0_wid_w = dutm0_wid;
    wire [31:0]  #(AXI_TASK_HOLD) dutm0_wdata_w = dutm0_wdata;
    wire [ 3:0]  #(AXI_TASK_HOLD) dutm0_wstb_w = dutm0_wstb;
    wire         #(AXI_TASK_HOLD) dutm0_wlast_w = dutm0_wlast;
    wire         #(AXI_TASK_HOLD) dut_arvalid_w = dutm0_arvalid;
    wire         #(AXI_TASK_HOLD) dutm0_awvalid_w = dutm0_awvalid;  // was dutm0_aw_set_cmd
    wire         #(AXI_TASK_HOLD) dutm0_wvalid_w =  dutm0_wvalid;   // was dutm0_wset_cmd


    // Connect MAXIGP0 i/o to that of PS7 inside x393_i
    assign maxigp0aclk =                 x393_i.axi_aclk;
    assign x393_i.ps7_i.MAXIGP0ARESETN = maxigp0aresetn;
// AXI PS Master GP0: Read Address    
    assign x393_i.ps7_i.MAXIGP0ARADDR =  maxigp0araddr;
    assign x393_i.ps7_i.MAXIGP0ARVALID = maxigp0arvalid;
    assign maxigp0arready=               x393_i.ps7_i.MAXIGP0ARREADY;
    assign x393_i.ps7_i.MAXIGP0ARID=     maxigp0arid;
    assign x393_i.ps7_i.MAXIGP0ARLOCK=   maxigp0arlock;
    assign x393_i.ps7_i.MAXIGP0ARCACHE=  maxigp0arcache;
    assign x393_i.ps7_i.MAXIGP0ARPROT=   maxigp0arprot; 
    assign x393_i.ps7_i.MAXIGP0ARLEN=    maxigp0arlen;
    assign x393_i.ps7_i.MAXIGP0ARSIZE=   maxigp0arsize;
    assign x393_i.ps7_i.MAXIGP0ARBURST=  maxigp0arburst;
    assign x393_i.ps7_i.MAXIGP0ARQOS=    maxigp0arqos;
// AXI PS Master GP0: Read Data
    assign maxigp0rdata=                 x393_i.ps7_i.MAXIGP0RDATA;
    assign maxigp0rvalid=                x393_i.ps7_i.MAXIGP0RVALID;
    assign x393_i.ps7_i.MAXIGP0RREADY=   maxigp0rready;
    assign maxigp0rid=                   x393_i.ps7_i.MAXIGP0RID;
    assign maxigp0rlast=                 x393_i.ps7_i.MAXIGP0RLAST;
    assign maxigp0rresp=                 x393_i.ps7_i.MAXIGP0RRESP;
// AXI PS Master GP0: Write Address    
    assign x393_i.ps7_i.MAXIGP0AWADDR=   maxigp0awaddr;
    assign x393_i.ps7_i.MAXIGP0AWVALID=  maxigp0awvalid;
    assign maxigp0awready=               x393_i.ps7_i.MAXIGP0AWREADY;
    assign x393_i.ps7_i.MAXIGP0AWID=     maxigp0awid;
    assign x393_i.ps7_i.MAXIGP0AWLOCK=   maxigp0awlock;
    assign x393_i.ps7_i.MAXIGP0AWCACHE=  maxigp0awcache;
    assign x393_i.ps7_i.MAXIGP0AWPROT=   maxigp0awprot;
    assign x393_i.ps7_i.MAXIGP0AWLEN=    maxigp0awlen;
    assign x393_i.ps7_i.MAXIGP0AWSIZE=   maxigp0awsize;
    assign x393_i.ps7_i.MAXIGP0AWBURST=  maxigp0awburst;
    assign x393_i.ps7_i.MAXIGP0AWQOS=    maxigp0awqos;
// AXI PS Master GP0: Write Data
    assign x393_i.ps7_i.MAXIGP0WDATA=    maxigp0wdata;
    assign x393_i.ps7_i.MAXIGP0WVALID=   maxigp0wvalid;
    assign maxigp0wready=                x393_i.ps7_i.MAXIGP0WREADY;
    assign x393_i.ps7_i.MAXIGP0WID=      maxigp0wid;
    assign x393_i.ps7_i.MAXIGP0WLAST=    maxigp0wlast;
    assign x393_i.ps7_i.MAXIGP0WSTRB=    maxigp0wstrb;
// AXI PS Master GP0: Write response
    assign maxigp0bvalid=                x393_i.ps7_i.MAXIGP0BVALID;
    assign x393_i.ps7_i.MAXIGP0BREADY=   maxigp0bready;
    assign maxigp0bid=                   x393_i.ps7_i.MAXIGP0BID;
    assign maxigp0bresp=                 x393_i.ps7_i.MAXIGP0BRESP;

// From x393_testbench03.tf
`ifdef IVERILOG              
//    $display("IVERILOG is defined");
    `ifdef NON_VDT_ENVIROMENT
        parameter fstname="x393.fst";
    `else
        `include "IVERILOG_INCLUDE.v"
    `endif // NON_VDT_ENVIROMENT
`else // IVERILOG
//    $display("IVERILOG is not defined");
    `ifdef COCOTB
        `ifdef NON_VDT_ENVIROMENT
            parameter fstname = "x393.fst";
        `else // NON_VDT_ENVIROMENT
            `include "IVERILOG_INCLUDE.v"
        `endif // NON_VDT_ENVIROMENT
    `else
        `ifdef CVC
            `ifdef NON_VDT_ENVIROMENT
                parameter fstname = "x393.fst";
            `else // NON_VDT_ENVIROMENT
                `include "IVERILOG_INCLUDE.v"
            `endif // NON_VDT_ENVIROMENT
        `else
            parameter fstname = "x393.fst";
        `endif // CVC
    `endif // COCOTB
`endif // IVERILOG
`define DEBUG_WR_SINGLE 1  
`define DEBUG_RD_DATA 1  

//`include "includes/x393_cur_params_sim.vh" // parameters that may need adjustment, should be before x393_localparams.vh
// *** Adjusting includes/x393_cur_params_target.vh by the hardware may break simulation, hard-wired parameters below are tested ***

/*
`ifdef USE_HARD_CURPARAMS
    `include "includes/x393_cur_params_target_simulation.vh" // SuppressThisWarning VEditor - not used parameters that may need adjustment, should be before x393_localparams.vh

//    localparam  DLY_LANE0_ODELAY =  80'hd85c1014141814181218;
//    localparam  DLY_LANE0_IDELAY =  72'h2c7a8380897c807b88;
//    localparam  DLY_LANE1_ODELAY =  80'hd8581812181418181814;
//    localparam  DLY_LANE1_IDELAY =  72'h108078807a887c8280;
//    localparam          DLY_CMDA = 256'hd3d3d3d4dcd1d8cc494949494949494949d4d3ccd3d3dbd4ccd4d2d3d1d2d8cc;
//    localparam         DLY_PHASE =   8'h33;
`else
    `include "includes/x393_cur_params_target.vh" // SuppressThisWarning VEditor - not used parameters that may need adjustment, should be before x393_localparams.vh
`endif

`include "includes/x393_localparams.vh" // SuppressThisWarning VEditor - not used
*/
// ========================== parameters from x353 ===================================

`ifdef SYNC_COMPRESS
    parameter DEPEND=1'b1;
`else  
    parameter DEPEND=1'b0; // SuppressThisWarning VEditor - may be not used
`endif

`ifdef HISPI 
    parameter HBLANK=            132; // all in time
///    parameter HBLANK=            122; // 72; // 62; // 52; // 90; // 12; /// 52; //********************* Still too fast
///    parameter HBLANK=            92; // 72; // 62; // 52; // 90; // 12; /// 52; //*********************
    parameter BLANK_ROWS_BEFORE= 9; /// 3; // 9; // 3; //8; ///2+2 - a little faster than compressor
    parameter BLANK_ROWS_AFTER=  8; /// 1; //8;
    
`else
//    parameter HBLANK=            12; // 52; // 12; /// 52; //*********************
    parameter HBLANK=            52; // 12; // 52; // 12; /// 52; //*********************
    parameter BLANK_ROWS_BEFORE= 8;  // 1; //8; ///2+2 - a little faster than compressor
    parameter BLANK_ROWS_AFTER=  8; // 1; //8;
`endif 
 parameter TRIG_LINES=        8;
 parameter VBLANK=            2; /// 2 lines //SuppressThisWarning Veditor UNUSED
 parameter CYCLES_PER_PIXEL=  3; /// 2 for JP4, 3 for JPEG // SuppressThisWarning VEditor - not used
`ifdef PF
  parameter PF_HEIGHT=8;
  parameter FULL_HEIGHT=WOI_HEIGHT;
  parameter PF_STRIPES=WOI_HEIGHT/PF_HEIGHT;
`else  
  parameter PF_HEIGHT=0; // SuppressThisWarning VEditor - not used
  parameter PF_STRIPES=0; // SuppressThisWarning VEditor - not used
`endif
  parameter WOI_MARGINS = 0; // 4;

  parameter VIRTUAL_WIDTH=    FULL_WIDTH + HBLANK;
  parameter VIRTUAL_HEIGHT=   FULL_HEIGHT + BLANK_ROWS_BEFORE + BLANK_ROWS_AFTER;  //SuppressThisWarning Veditor UNUSED
  parameter TRIG_INTERFRAME=  100; /// extra 100 clock cycles between frames  //SuppressThisWarning Veditor UNUSED
  parameter TRIG_DELAY=      200; /// delay in sensor clock cycles // SuppressThisWarning VEditor - not used
  parameter FULL_WIDTH=  WOI_WIDTH +  WOI_MARGINS;
  parameter FULL_HEIGHT= WOI_HEIGHT + WOI_MARGINS;
//  localparam       SENSOR_MEMORY_WIDTH_BURSTS = (FULL_WIDTH + 15) >> 4;
//  localparam       SENSOR_MEMORY_MASK = (1 << (FRAME_WIDTH_ROUND_BITS-4)) -1;
//  localparam       SENSOR_MEMORY_FULL_WIDTH_BURSTS = (SENSOR_MEMORY_WIDTH_BURSTS + SENSOR_MEMORY_MASK) & (~SENSOR_MEMORY_MASK); 


// ========================== end of parameters from x353 ===================================
    reg [639:0] TEST_TITLE="abcdef"; //SuppressThisWarning VEditor

// Sensor signals - as on sensor pads
    wire        PX1_MCLK; // input sensor input clock
    wire        PX1_MRST; // input 
    wire        PX1_ARO;  // input 
    wire        PX1_ARST; // input 
    wire        PX1_OFST = 1'b1; // input // I2C address ofset by 2: for simulation 0 - still mode, 1 - video mode.
    wire [11:0] PX1_D;    // output[11:0]
  // SuppressWarnings VEditor : not used in HISPI mode
    wire        PX1_DCLK; // output sensor output clock (connect to sensor BPF output )
    wire        PX1_HACT; // output 
    wire        PX1_VACT; // output 

    wire        PX2_MCLK; // input sensor input clock
    wire        PX2_MRST; // input 
    wire        PX2_ARO;  // input 
    wire        PX2_ARST; // input 
    wire        PX2_OFST = 1'b1; // input // I2C address ofset by 2: for simulation 0 - still mode, 1 - video mode.
    wire [11:0] PX2_D;    // output[11:0] 
  // SuppressWarnings VEditor : not used in HISPI mode
    wire        PX2_DCLK; // output sensor output clock (connect to sensor BPF output )
    wire        PX2_HACT; // output 
    wire        PX2_VACT; // output 

    wire        PX3_MCLK; // input sensor input clock
    wire        PX3_MRST; // input 
    wire        PX3_ARO;  // input 
    wire        PX3_ARST; // input 
    wire        PX3_OFST = 1'b1; // input // I2C address ofset by 2: for simulation 0 - still mode, 1 - video mode.
    wire [11:0] PX3_D;    // output[11:0] 
  // SuppressWarnings VEditor : not used in HISPI mode
    wire        PX3_DCLK; // output sensor output clock (connect to sensor BPF output )
    wire        PX3_HACT; // output 
    wire        PX3_VACT; // output 

    wire        PX4_MCLK; // input sensor input clock
    wire        PX4_MRST; // input 
    wire        PX4_ARO;  // input 
    wire        PX4_ARST; // input 
    wire        PX4_OFST = 1'b1; // input // I2C address ofset by 2: for simulation 0 - still mode, 1 - video mode.
    wire [11:0] PX4_D;    // output[11:0] 
  // SuppressWarnings VEditor : not used in HISPI mode
    wire        PX4_DCLK; // output sensor output clock (connect to sensor BPF output )
    wire        PX4_HACT; // output 
    wire        PX4_VACT; // output 

    wire       PX1_MCLK_PRE;       // input to pixel clock mult/divisor       // SuppressThisWarning VEditor - may be unused
    wire       PX2_MCLK_PRE;       // input to pixel clock mult/divisor       // SuppressThisWarning VEditor - may be unused
    wire       PX3_MCLK_PRE;       // input to pixel clock mult/divisor       // SuppressThisWarning VEditor - may be unused
    wire       PX4_MCLK_PRE;       // input to pixel clock mult/divisor       // SuppressThisWarning VEditor - may be unused

// Sensor signals - as on FPGA pads
    wire [ 7:0] sns1_dp;   // inout[7:0] {PX_MRST, PXD8, PXD6, PXD4, PXD2, PXD0, PX_HACT, PX_DCLK}
    wire [ 7:0] sns1_dn;   // inout[7:0] {PX_ARST, PXD9, PXD7, PXD5, PXD3, PXD1, PX_VACT, PX_BPF}
    wire        sns1_clkp; // inout CNVCLK/TDO
    wire        sns1_clkn; // inout CNVSYNC/TDI
    wire        sns1_scl;  // inout PX_SCL
    wire        sns1_sda;  // inout PX_SDA
    wire        sns1_ctl;  // inout PX_ARO/TCK
    wire        sns1_pg;   // inout SENSPGM

    wire [ 7:0] sns2_dp;   // inout[7:0] {PX_MRST, PXD8, PXD6, PXD4, PXD2, PXD0, PX_HACT, PX_DCLK}
    wire [ 7:0] sns2_dn;   // inout[7:0] {PX_ARST, PXD9, PXD7, PXD5, PXD3, PXD1, PX_VACT, PX_BPF}
    wire        sns2_clkp; // inout CNVCLK/TDO
    wire        sns2_clkn; // inout CNVSYNC/TDI
    wire        sns2_scl;  // inout PX_SCL
    wire        sns2_sda;  // inout PX_SDA
    wire        sns2_ctl;  // inout PX_ARO/TCK
    wire        sns2_pg;   // inout SENSPGM

    wire [ 7:0] sns3_dp;   // inout[7:0] {PX_MRST, PXD8, PXD6, PXD4, PXD2, PXD0, PX_HACT, PX_DCLK}
    wire [ 7:0] sns3_dn;   // inout[7:0] {PX_ARST, PXD9, PXD7, PXD5, PXD3, PXD1, PX_VACT, PX_BPF}
    wire        sns3_clkp; // inout CNVCLK/TDO
    wire        sns3_clkn; // inout CNVSYNC/TDI
    wire        sns3_scl;  // inout PX_SCL
    wire        sns3_sda;  // inout PX_SDA
    wire        sns3_ctl;  // inout PX_ARO/TCK
    wire        sns3_pg;   // inout SENSPGM

    wire [ 7:0] sns4_dp;   // inout[7:0] {PX_MRST, PXD8, PXD6, PXD4, PXD2, PXD0, PX_HACT, PX_DCLK}
    wire [ 7:0] sns4_dn;   // inout[7:0] {PX_ARST, PXD9, PXD7, PXD5, PXD3, PXD1, PX_VACT, PX_BPF}
    wire        sns4_clkp; // inout CNVCLK/TDO
    wire        sns4_clkn; // inout CNVSYNC/TDI
    wire        sns4_scl;  // inout PX_SCL
    wire        sns4_sda;  // inout PX_SDA
    wire        sns4_ctl;  // inout PX_ARO/TCK
    wire        sns4_pg;   // inout SENSPGM

// Keep signals defined even if HISPI is not, to preserve non-existing signals in .sav files of gtkwave    
`ifdef HISPI
    localparam PIX_CLK_DIV =          1; // scale clock from FPGA to sensor pixel clock
    localparam PIX_CLK_MULT =        11; // scale clock from FPGA to sensor pixel clock
`else    
    localparam PIX_CLK_DIV =          1; // scale clock from FPGA to sensor pixel clock
    localparam PIX_CLK_MULT =         1; // scale clock from FPGA to sensor pixel clock
`endif
`ifdef HISPI
    localparam HISPI_FULL_HEIGHT =    FULL_HEIGHT;  // >0 - count lines, ==0 - wait for the end of VACT
    localparam HISPI_CLK_DIV =        3; // from pixel clock to serial output pixel rate TODO: Set real ones, adjsut sensor clock too
    localparam HISPI_CLK_MULT =      10; // from pixel clock to serial output pixel rate TODO: Set real ones, adjsut sensor clock too

    localparam HISPI_EMBED_LINES =    2; // first lines will be marked as "embedded" (non-image data)
//    localparam HISPI_MSB_FIRST =      0; // 0 - serialize LSB first, 1 - MSB first
    localparam HISPI_FIFO_LOGDEPTH = 12; // 49-bit wide FIFO address bits (>log (line_length + 2)
`endif    
    
//`ifdef HISPI
    wire [3:0] PX1_LANE_P;         // SuppressThisWarning VEditor - may be unused
    wire [3:0] PX1_LANE_N;         // SuppressThisWarning VEditor - may be unused
    wire       PX1_CLK_P;          // SuppressThisWarning VEditor - may be unused
    wire       PX1_CLK_N;          // SuppressThisWarning VEditor - may be unused
    wire [3:0] PX1_GP;             // Sensor input          // SuppressThisWarning VEditor - may be unused
    wire       PX1_FLASH = 1'bx;   // Sensor output - not yet defined          // SuppressThisWarning VEditor - may be unused
    wire       PX1_SHUTTER = 1'bx; // Sensor output - not yet defined         // SuppressThisWarning VEditor - may be unused

    wire [3:0] PX2_LANE_P;         // SuppressThisWarning VEditor - may be unused
    wire [3:0] PX2_LANE_N;         // SuppressThisWarning VEditor - may be unused
    wire       PX2_CLK_P;          // SuppressThisWarning VEditor - may be unused
    wire       PX2_CLK_N;          // SuppressThisWarning VEditor - may be unused
    wire [3:0] PX2_GP;             // Sensor input          // SuppressThisWarning VEditor - may be unused
    wire       PX2_FLASH = 1'bx;   // Sensor output - not yet defined          // SuppressThisWarning VEditor - may be unused
    wire       PX2_SHUTTER = 1'bx; // Sensor output - not yet defined         // SuppressThisWarning VEditor - may be unused

    wire [3:0] PX3_LANE_P;         // SuppressThisWarning VEditor - may be unused
    wire [3:0] PX3_LANE_N;         // SuppressThisWarning VEditor - may be unused
    wire       PX3_CLK_P;          // SuppressThisWarning VEditor - may be unused
    wire       PX3_CLK_N;          // SuppressThisWarning VEditor - may be unused
    wire [3:0] PX3_GP;             // Sensor input          // SuppressThisWarning VEditor - may be unused
    wire       PX3_FLASH = 1'bx;   // Sensor output - not yet defined          // SuppressThisWarning VEditor - may be unused
    wire       PX3_SHUTTER = 1'bx; // Sensor output - not yet defined         // SuppressThisWarning VEditor - may be unused
    
    wire [3:0] PX4_LANE_P;         // SuppressThisWarning VEditor - may be unused
    wire [3:0] PX4_LANE_N;         // SuppressThisWarning VEditor - may be unused
    wire       PX4_CLK_P;          // SuppressThisWarning VEditor - may be unused
    wire       PX4_CLK_N;          // SuppressThisWarning VEditor - may be unused
    wire [3:0] PX4_GP;             // Sensor input          // SuppressThisWarning VEditor - may be unused
    wire       PX4_FLASH = 1'bx;   // Sensor output - not yet defined          // SuppressThisWarning VEditor - may be unused
    wire       PX4_SHUTTER = 1'bx; // Sensor output - not yet defined         // SuppressThisWarning VEditor - may be unused
//`endif    

`ifdef HISPI
    assign sns1_dp[3:0] =  PX1_LANE_P;
    assign sns1_dn[3:0] =  PX1_LANE_N;
    assign sns1_clkp =     PX1_CLK_P;
    assign sns1_clkn =     PX1_CLK_N;
    // non-HiSPi signals
    assign sns1_dp[4] =    PX1_FLASH;
    assign sns1_dn[4] =    PX1_SHUTTER;
    assign PX1_GP[3:0] = {sns1_dn[7],sns1_dn[6], sns1_dn[5], sns1_dp[5]};
    assign PX1_MCLK_PRE =  sns1_dp[6]; // from FPGA to sensor
    assign PX1_MRST =      sns1_dp[7]; // from FPGA to sensor
    assign PX1_ARST =      sns1_dn[7]; // same as GP[3]
    assign PX1_ARO =       sns1_dn[5]; // same as GP[1]
    
    assign sns2_dp[3:0] =  PX2_LANE_P;
    assign sns2_dn[3:0] =  PX2_LANE_N;
    assign sns2_clkp =     PX2_CLK_P;
    assign sns2_clkn =     PX2_CLK_N;
    // non-HiSPi signals
    assign sns2_dp[4] =    PX1_FLASH;
    assign sns2_dn[4] =    PX2_SHUTTER;
    assign PX2_GP[3:0] = {sns2_dn[7],sns2_dn[6], sns2_dn[5], sns2_dp[5]};
    assign PX2_MCLK_PRE =  sns2_dp[6]; // from FPGA to sensor
    assign PX2_MRST =      sns2_dp[7]; // from FPGA to sensor
    assign PX2_ARST =      sns2_dn[7]; // same as GP[3]
    assign PX2_ARO =       sns2_dn[5]; // same as GP[1]
    
    assign sns3_dp[3:0] =  PX3_LANE_P;
    assign sns3_dn[3:0] =  PX3_LANE_N;
    assign sns3_clkp =     PX3_CLK_P;
    assign sns3_clkn =     PX3_CLK_N;
    // non-HiSPi signals
    assign sns3_dp[4] =    PX3_FLASH;
    assign sns3_dn[4] =    PX3_SHUTTER;
    assign PX3_GP[3:0] = {sns3_dn[7],sns3_dn[6], sns3_dn[5], sns3_dp[5]};
    assign PX3_MCLK_PRE =  sns3_dp[6]; // from FPGA to sensor
    assign PX3_MRST =      sns3_dp[7]; // from FPGA to sensor
    assign PX3_ARST =      sns3_dn[7]; // same as GP[3]
    assign PX3_ARO =       sns3_dn[5]; // same as GP[1]
    
    assign sns4_dp[3:0] =  PX4_LANE_P;
    assign sns4_dn[3:0] =  PX4_LANE_N;
    assign sns4_clkp =     PX4_CLK_P;
    assign sns4_clkn =     PX4_CLK_N;
    // non-HiSPi signals
    assign sns4_dp[4] =    PX4_FLASH;
    assign sns4_dn[4] =    PX4_SHUTTER;
    assign PX4_GP[3:0] = {sns4_dn[7],sns4_dn[6], sns4_dn[5], sns4_dp[5]};
    assign PX4_MCLK_PRE =  sns4_dp[6]; // from FPGA to sensor
    assign PX4_MRST =      sns4_dp[7]; // from FPGA to sensor
    assign PX4_ARST =      sns4_dn[7]; // same as GP[3]
    assign PX4_ARO =       sns4_dn[5]; // same as GP[1]
`else
    //connect parallel12 sensor to sensor port 1
    assign sns1_dp[6:1] =  {PX1_D[10], PX1_D[8], PX1_D[6], PX1_D[4], PX1_D[2], PX1_HACT};
    assign PX1_MRST =       sns1_dp[7]; // from FPGA to sensor
    assign PX1_MCLK_PRE =   sns1_dp[0]; // from FPGA to sensor
    assign sns1_dn[6:0] =  {PX1_D[11], PX1_D[9], PX1_D[7], PX1_D[5], PX1_D[3], PX1_VACT, PX1_DCLK};
    assign PX1_ARST =       sns1_dn[7];
    assign sns1_clkn =      PX1_D[0];  // inout CNVSYNC/TDI
    assign sns1_clkp =      PX1_D[1];  // CNVCLK/TDO
    assign PX1_ARO =       sns1_ctl;  // from FPGA to sensor

    assign PX2_MRST =       sns2_dp[7]; // from FPGA to sensor
    assign PX2_MCLK_PRE =   sns2_dp[0]; // from FPGA to sensor
    assign PX2_ARST =       sns2_dn[7];
    assign PX2_ARO =        sns2_ctl;  // from FPGA to sensor
    
    assign PX3_MRST =       sns3_dp[7]; // from FPGA to sensor
    assign PX3_MCLK_PRE =   sns3_dp[0]; // from FPGA to sensor
    assign PX3_ARST =       sns3_dn[7];
    assign PX3_ARO =        sns3_ctl;  // from FPGA to sensor
    
    assign PX4_MRST =       sns4_dp[7]; // from FPGA to sensor
    assign PX4_MCLK_PRE =   sns4_dp[0]; // from FPGA to sensor
    assign PX4_ARST =       sns4_dn[7];
    assign PX4_ARO =        sns4_ctl;  // from FPGA to sensor

    
`ifdef SAME_SENSOR_DATA
    assign sns2_dp[6:1] =  {PX2_D[10], PX2_D[8], PX2_D[6], PX2_D[4], PX2_D[2], PX2_HACT};
    assign sns2_dn[6:0] =  {PX2_D[11], PX2_D[9], PX2_D[7], PX2_D[5], PX2_D[3], PX2_VACT, PX2_DCLK};
    assign sns2_clkn =      PX2_D[0];  // inout CNVSYNC/TDI
    assign sns2_clkp =      PX2_D[1];  // CNVCLK/TDO

    assign sns3_dp[6:1] =  {PX3_D[10], PX3_D[8], PX3_D[6], PX3_D[4], PX3_D[2], PX3_HACT};
    assign sns3_dn[6:0] =  {PX3_D[11], PX3_D[9], PX3_D[7], PX3_D[5], PX3_D[3], PX3_VACT, PX3_DCLK};
    assign sns3_clkn =      PX3_D[0];  // inout CNVSYNC/TDI
    assign sns3_clkp =      PX3_D[1];  // CNVCLK/TDO

    assign sns4_dp[6:1] =  {PX4_D[10], PX4_D[8], PX4_D[6], PX4_D[4], PX4_D[2], PX4_HACT};
    assign sns4_dn[6:0] =  {PX4_D[11], PX4_D[9], PX4_D[7], PX4_D[5], PX4_D[3], PX4_VACT, PX4_DCLK};
    assign sns4_clkn =      PX4_D[0];  // inout CNVSYNC/TDI
    assign sns4_clkp =      PX4_D[1];  // CNVCLK/TDO

`else    
    //connect parallel12 sensor to sensor port 2 (all data rotated left by 1 bit)
///    assign sns2_dp[6:1] =  {PX2_D[9], PX2_D[7], PX2_D[5], PX2_D[3], PX2_D[1], PX2_HACT};
///    assign sns2_dn[6:0] =  {PX2_D[10], PX2_D[8], PX2_D[6], PX2_D[4], PX2_D[2], PX2_VACT, PX2_DCLK};
///    assign sns2_clkn =      PX2_D[11];  // inout CNVSYNC/TDI
///    assign sns2_clkp =      PX2_D[0];  // CNVCLK/TDO

    assign sns2_dp[6:1] =  {PX2_D[10], PX2_D[8], PX2_D[6], PX2_D[4], PX2_D[2], PX2_HACT};
    assign sns2_dn[6:0] =  {PX2_D[11], PX2_D[9], PX2_D[7], PX2_D[5], PX2_D[3], PX2_VACT, PX2_DCLK};
    assign sns2_clkn =      PX2_D[0];  // inout CNVSYNC/TDI
    assign sns2_clkp =      PX2_D[1];  // CNVCLK/TDO
    
    //connect parallel12 sensor to sensor port 3  (all data rotated left by 2 bits
///    assign sns3_dp[6:1] =  {PX3_D[8], PX3_D[6], PX3_D[4], PX3_D[2], PX3_D[0], PX3_HACT};
///    assign sns3_dn[6:0] =  {PX3_D[9], PX3_D[7], PX3_D[5], PX3_D[3], PX3_D[1], PX3_VACT, PX3_DCLK};
///    assign sns3_clkn =      PX3_D[10];  // inout CNVSYNC/TDI
///    assign sns3_clkp =      PX3_D[11];  // CNVCLK/TDO
    assign sns3_dp[6:1] =  {PX3_D[10], PX3_D[8], PX3_D[6], PX3_D[4], PX3_D[2], PX3_HACT};
    assign sns3_dn[6:0] =  {PX3_D[11], PX3_D[9], PX3_D[7], PX3_D[5], PX3_D[3], PX3_VACT, PX3_DCLK};
    assign sns3_clkn =      PX3_D[0];  // inout CNVSYNC/TDI
    assign sns3_clkp =      PX3_D[1];  // CNVCLK/TDO
    
    //connect parallel12 sensor to sensor port 4  (all data rotated left by 3 bits
///    assign sns4_dp[6:1] =  {PX4_D[5], PX4_D[3], PX4_D[1], PX4_D[11], PX4_D[9], PX4_HACT};
///    assign sns4_dn[6:0] =  {PX4_D[6], PX4_D[4], PX4_D[2], PX4_D[0], PX4_D[10], PX4_VACT, PX4_DCLK};
///    assign sns4_clkn =      PX4_D[7];  // inout CNVSYNC/TDI
///    assign sns4_clkp =      PX4_D[8];  // CNVCLK/TDO
    assign sns4_dp[6:1] =  {PX4_D[10], PX4_D[8], PX4_D[6], PX4_D[4], PX4_D[2], PX4_HACT};
    assign sns4_dn[6:0] =  {PX4_D[11], PX4_D[9], PX4_D[7], PX4_D[5], PX4_D[3], PX4_VACT, PX4_DCLK};
    assign sns4_clkn =      PX4_D[0];  // inout CNVSYNC/TDI
    assign sns4_clkp =      PX4_D[1];  // CNVCLK/TDO
`endif
`endif



    wire [ 9:0] gpio_pins; // inout[9:0] ([8]-synco0,[7]-syncio0,[6]-synco1,[9]-syncio1)
// Connect trigger outs to triggets in (#10 needed for Icarus)

  // DDR3 signals
    wire        SDRST;
    wire        SDCLK;  // output
    wire        SDNCLK; // output
    wire [ADDRESS_NUMBER-1:0] SDA;    // output[14:0] 
    wire [ 2:0] SDBA;   // output[2:0] 
    wire        SDWE;   // output
    wire        SDRAS;  // output
    wire        SDCAS;  // output
    wire        SDCKE;  // output
    wire        SDODT;  // output
    wire [15:0] SDD;    // inout[15:0] 
    wire        SDDML;  // inout
    wire        DQSL;   // inout
    wire        NDQSL;  // inout
    wire        SDDMU;  // inout
    wire        DQSU;   // inout
    wire        NDQSU;  // inout
    wire        memclk;

    wire        ffclk0p; // input
    wire        ffclk0n; // input
    wire        ffclk1p; // input
    wire        ffclk1n;  // input


// axi_hp register access
  // PS memory mapped registers to read/write over a separate simulation bus running at HCLK, no waits
    wire [31:0] ps_reg_dout0w;
    wire [31:0] ps_reg_dout0r;
    wire [31:0] ps_reg_dout1w;
//    wire [31:0] ps_reg_dout2w; // Unused
    wire        ps_reg_dvalid0w;
    wire        ps_reg_dvalid0r;
    wire        ps_reg_dvalid1w;
//    wire        ps_reg_dvalid2w; // Unused
    assign ps_sbus_dout = {32{ps_reg_dvalid0w}} & ps_reg_dout0w &
                          {32{ps_reg_dvalid0r}} & ps_reg_dout0r &
                          {32{ps_reg_dvalid1w}} & ps_reg_dout1w;
//                          & {32{ps_reg_dvalid2w}} & ps_reg_dout2w; 
  
//    reg [639:0] TEST_TITLE="abcdef"; //S uppressThisWarning VEditor May use again later
  // Simulation signals
    wire        CLK;
    reg        RST;
//    reg        RST_CLEAN  = 1;
/*
    wire [NUM_INTERRUPTS-1:0] IRQ_R =   {x393_i.sata_irq, x393_i.cmprs_irq[3:0], x393_i.frseq_irq[3:0]}; 
    wire [NUM_INTERRUPTS-1:0] IRQ_ACKN;
    wire                [3:0] IRQ_FRSEQ_ACKN = IRQ_ACKN[3:0];
    wire                [3:0] IRQ_CMPRS_ACKN = IRQ_ACKN[7:4];
    wire                      IRQ_SATA_ACKN =  IRQ_ACKN[8]; // SuppressThisWarning VEditor - not used
    reg                 [3:0] IRQ_FRSEQ_DONE = 0;
    reg                 [3:0] IRQ_CMPRS_DONE = 0;
    reg                       IRQ_SATA_DONE =  0;
    wire [NUM_INTERRUPTS-1:0] IRQ_DONE = {IRQ_SATA_DONE, IRQ_CMPRS_DONE, IRQ_FRSEQ_DONE};
    
    reg  [NUM_INTERRUPTS-1:0] IRQ_M =  0; // all disabled - on/off by software
    reg                       IRQ_EN = 1; // handled automatically when accessing MAXI_GP0
    wire                      MAIN_GO;    // main loop can proceed (no INTA)
    wire [NUM_INTERRUPTS-1:0] IRQ_S;      // masked interrupt requests
    wire                      IRQS=|IRQ_S; // at least one interrupt is pending (to yield by main w/o slowing down)
    wire                [3:0] IRQ_FRSEQ_S = IRQ_S[3:0];
    wire                [3:0] IRQ_CMPRS_S = IRQ_S[7:4];
    wire                      IRQ_SATA_S =  IRQ_S[8];// SuppressThisWarning VEditor - not used
    
*/
    assign reset_out = RST || x393_i.arst;
    x393 #(
// TODO: Are these parameters needed? They are included in x393 from the save x393_parameters.vh    
        .MCONTR_WR_MASK                    (MCONTR_WR_MASK),
        .MCONTR_RD_MASK                    (MCONTR_RD_MASK),
        .MCONTR_CMD_WR_ADDR                (MCONTR_CMD_WR_ADDR),
        .MCONTR_BUF0_RD_ADDR               (MCONTR_BUF0_RD_ADDR),
        .MCONTR_BUF0_WR_ADDR               (MCONTR_BUF0_WR_ADDR),
        .MCONTR_BUF2_RD_ADDR               (MCONTR_BUF2_RD_ADDR),
        .MCONTR_BUF2_WR_ADDR               (MCONTR_BUF2_WR_ADDR),
        .MCONTR_BUF3_RD_ADDR               (MCONTR_BUF3_RD_ADDR),
        .MCONTR_BUF3_WR_ADDR               (MCONTR_BUF3_WR_ADDR),
        .MCONTR_BUF4_RD_ADDR               (MCONTR_BUF4_RD_ADDR),
        .MCONTR_BUF4_WR_ADDR               (MCONTR_BUF4_WR_ADDR),
        .CONTROL_ADDR                      (CONTROL_ADDR),
        .CONTROL_ADDR_MASK                 (CONTROL_ADDR_MASK),
        .STATUS_ADDR                       (STATUS_ADDR),
        .STATUS_ADDR_MASK                  (STATUS_ADDR_MASK),
        .AXI_WR_ADDR_BITS                  (AXI_WR_ADDR_BITS),
        .AXI_RD_ADDR_BITS                  (AXI_RD_ADDR_BITS),
        .STATUS_DEPTH                      (STATUS_DEPTH),
        .DLY_LD                            (DLY_LD),
        .DLY_LD_MASK                       (DLY_LD_MASK),
        .MCONTR_PHY_0BIT_ADDR              (MCONTR_PHY_0BIT_ADDR),
        .MCONTR_PHY_0BIT_ADDR_MASK         (MCONTR_PHY_0BIT_ADDR_MASK),
        .MCONTR_PHY_0BIT_DLY_SET           (MCONTR_PHY_0BIT_DLY_SET),
        .MCONTR_PHY_0BIT_CMDA_EN           (MCONTR_PHY_0BIT_CMDA_EN),
        .MCONTR_PHY_0BIT_SDRST_ACT         (MCONTR_PHY_0BIT_SDRST_ACT),
        .MCONTR_PHY_0BIT_CKE_EN            (MCONTR_PHY_0BIT_CKE_EN),
        .MCONTR_PHY_0BIT_DCI_RST           (MCONTR_PHY_0BIT_DCI_RST),
        .MCONTR_PHY_0BIT_DLY_RST           (MCONTR_PHY_0BIT_DLY_RST),
        .MCONTR_TOP_0BIT_ADDR              (MCONTR_TOP_0BIT_ADDR),
        .MCONTR_TOP_0BIT_ADDR_MASK         (MCONTR_TOP_0BIT_ADDR_MASK),
        .MCONTR_TOP_0BIT_MCONTR_EN         (MCONTR_TOP_0BIT_MCONTR_EN),
        .MCONTR_TOP_0BIT_REFRESH_EN        (MCONTR_TOP_0BIT_REFRESH_EN),
        .MCONTR_PHY_16BIT_ADDR             (MCONTR_PHY_16BIT_ADDR),
        .MCONTR_PHY_16BIT_ADDR_MASK        (MCONTR_PHY_16BIT_ADDR_MASK),
        .MCONTR_PHY_16BIT_PATTERNS         (MCONTR_PHY_16BIT_PATTERNS),
        .MCONTR_PHY_16BIT_PATTERNS_TRI     (MCONTR_PHY_16BIT_PATTERNS_TRI),
        .MCONTR_PHY_16BIT_WBUF_DELAY       (MCONTR_PHY_16BIT_WBUF_DELAY),
        .MCONTR_PHY_16BIT_EXTRA            (MCONTR_PHY_16BIT_EXTRA),
        .MCONTR_PHY_STATUS_CNTRL           (MCONTR_PHY_STATUS_CNTRL),
        .MCONTR_ARBIT_ADDR                 (MCONTR_ARBIT_ADDR),
        .MCONTR_ARBIT_ADDR_MASK            (MCONTR_ARBIT_ADDR_MASK),
        .MCONTR_TOP_16BIT_ADDR             (MCONTR_TOP_16BIT_ADDR),
        .MCONTR_TOP_16BIT_ADDR_MASK        (MCONTR_TOP_16BIT_ADDR_MASK),
        .MCONTR_TOP_16BIT_CHN_EN           (MCONTR_TOP_16BIT_CHN_EN),
        .MCONTR_TOP_16BIT_REFRESH_PERIOD   (MCONTR_TOP_16BIT_REFRESH_PERIOD),
        .MCONTR_TOP_16BIT_REFRESH_ADDRESS  (MCONTR_TOP_16BIT_REFRESH_ADDRESS),
        .MCONTR_TOP_16BIT_STATUS_CNTRL     (MCONTR_TOP_16BIT_STATUS_CNTRL),
        .MCONTR_PHY_STATUS_REG_ADDR        (MCONTR_PHY_STATUS_REG_ADDR),
        .MCONTR_TOP_STATUS_REG_ADDR        (MCONTR_TOP_STATUS_REG_ADDR),
        .CHNBUF_READ_LATENCY               (CHNBUF_READ_LATENCY),
        .DFLT_DQS_PATTERN                  (DFLT_DQS_PATTERN),
        .DFLT_DQM_PATTERN                  (DFLT_DQM_PATTERN),
        .DFLT_DQ_TRI_ON_PATTERN            (DFLT_DQ_TRI_ON_PATTERN),
        .DFLT_DQ_TRI_OFF_PATTERN           (DFLT_DQ_TRI_OFF_PATTERN),
        .DFLT_DQS_TRI_ON_PATTERN           (DFLT_DQS_TRI_ON_PATTERN),
        .DFLT_DQS_TRI_OFF_PATTERN          (DFLT_DQS_TRI_OFF_PATTERN),
        .DFLT_WBUF_DELAY                   (DFLT_WBUF_DELAY),
        .DFLT_INV_CLK_DIV                  (DFLT_INV_CLK_DIV),
        .DFLT_CHN_EN                       (DFLT_CHN_EN),
        .DFLT_REFRESH_ADDR                 (DFLT_REFRESH_ADDR),
        .DFLT_REFRESH_PERIOD               (DFLT_REFRESH_PERIOD),
        .ADDRESS_NUMBER                    (ADDRESS_NUMBER),
        .COLADDR_NUMBER                    (COLADDR_NUMBER),
        .PHASE_WIDTH                       (PHASE_WIDTH),
        .SLEW_DQ                           (SLEW_DQ),
        .SLEW_DQS                          (SLEW_DQS),
        .SLEW_CMDA                         (SLEW_CMDA),
        .SLEW_CLK                          (SLEW_CLK),
        .IBUF_LOW_PWR                      (IBUF_LOW_PWR),
        .REFCLK_FREQUENCY                  (REFCLK_FREQUENCY),
        .HIGH_PERFORMANCE_MODE             (HIGH_PERFORMANCE_MODE),
        .CLKIN_PERIOD                      (CLKIN_PERIOD),
        .CLKFBOUT_MULT                     (CLKFBOUT_MULT),
        .DIVCLK_DIVIDE                     (DIVCLK_DIVIDE),
        .CLKFBOUT_USE_FINE_PS              (CLKFBOUT_USE_FINE_PS),
        .CLKFBOUT_PHASE                    (CLKFBOUT_PHASE),
        .SDCLK_PHASE                       (SDCLK_PHASE),
        .CLK_PHASE                         (CLK_PHASE),
        .CLK_DIV_PHASE                     (CLK_DIV_PHASE),
        .MCLK_PHASE                        (MCLK_PHASE),
        .REF_JITTER1                       (REF_JITTER1),
        .SS_EN                             (SS_EN),
        .SS_MODE                           (SS_MODE),
        .SS_MOD_PERIOD                     (SS_MOD_PERIOD),
        .CMD_PAUSE_BITS                    (CMD_PAUSE_BITS),
        .CMD_DONE_BIT                      (CMD_DONE_BIT),
        .NUM_CYCLES_LOW_BIT                (NUM_CYCLES_LOW_BIT),
        .NUM_CYCLES_00                     (NUM_CYCLES_00),
        .NUM_CYCLES_01                     (NUM_CYCLES_01),
        .NUM_CYCLES_02                     (NUM_CYCLES_02),
        .NUM_CYCLES_03                     (NUM_CYCLES_03),
        .NUM_CYCLES_04                     (NUM_CYCLES_04),
        .NUM_CYCLES_05                     (NUM_CYCLES_05),
        .NUM_CYCLES_06                     (NUM_CYCLES_06),
        .NUM_CYCLES_07                     (NUM_CYCLES_07),
        .NUM_CYCLES_08                     (NUM_CYCLES_08),
        .NUM_CYCLES_09                     (NUM_CYCLES_09),
        .NUM_CYCLES_10                     (NUM_CYCLES_10),
        .NUM_CYCLES_11                     (NUM_CYCLES_11),
        .NUM_CYCLES_12                     (NUM_CYCLES_12),
        .NUM_CYCLES_13                     (NUM_CYCLES_13),
        .NUM_CYCLES_14                     (NUM_CYCLES_14),
        .NUM_CYCLES_15                     (NUM_CYCLES_15),
        .MCNTRL_PS_ADDR                    (MCNTRL_PS_ADDR),
        .MCNTRL_PS_MASK                    (MCNTRL_PS_MASK),
        .MCNTRL_PS_STATUS_REG_ADDR         (MCNTRL_PS_STATUS_REG_ADDR),
        .MCNTRL_PS_EN_RST                  (MCNTRL_PS_EN_RST),
        .MCNTRL_PS_CMD                     (MCNTRL_PS_CMD),
        .MCNTRL_PS_STATUS_CNTRL            (MCNTRL_PS_STATUS_CNTRL),
        .NUM_XFER_BITS                     (NUM_XFER_BITS),
        .FRAME_WIDTH_BITS                  (FRAME_WIDTH_BITS),
        .FRAME_HEIGHT_BITS                 (FRAME_HEIGHT_BITS),
        .MCNTRL_SCANLINE_CHN1_ADDR         (MCNTRL_SCANLINE_CHN1_ADDR),
        .MCNTRL_SCANLINE_CHN3_ADDR         (MCNTRL_SCANLINE_CHN3_ADDR),
        .MCNTRL_SCANLINE_MASK              (MCNTRL_SCANLINE_MASK),
        .MCNTRL_SCANLINE_MODE              (MCNTRL_SCANLINE_MODE),
        .MCNTRL_SCANLINE_STATUS_CNTRL      (MCNTRL_SCANLINE_STATUS_CNTRL),
        .MCNTRL_SCANLINE_STARTADDR         (MCNTRL_SCANLINE_STARTADDR),
        .MCNTRL_SCANLINE_FRAME_FULL_WIDTH  (MCNTRL_SCANLINE_FRAME_FULL_WIDTH),
        .MCNTRL_SCANLINE_WINDOW_WH         (MCNTRL_SCANLINE_WINDOW_WH),
        .MCNTRL_SCANLINE_WINDOW_X0Y0       (MCNTRL_SCANLINE_WINDOW_X0Y0),
        .MCNTRL_SCANLINE_WINDOW_STARTXY    (MCNTRL_SCANLINE_WINDOW_STARTXY),
        .MCNTRL_SCANLINE_STATUS_REG_CHN1_ADDR   (MCNTRL_SCANLINE_STATUS_REG_CHN1_ADDR),
        .MCNTRL_SCANLINE_STATUS_REG_CHN3_ADDR   (MCNTRL_SCANLINE_STATUS_REG_CHN3_ADDR),
        .MCNTRL_SCANLINE_PENDING_CNTR_BITS (MCNTRL_SCANLINE_PENDING_CNTR_BITS),
        .MCNTRL_SCANLINE_FRAME_PAGE_RESET  (MCNTRL_SCANLINE_FRAME_PAGE_RESET),
        .MAX_TILE_WIDTH                    (MAX_TILE_WIDTH),
        .MAX_TILE_HEIGHT                   (MAX_TILE_HEIGHT),
        .MCNTRL_TILED_CHN2_ADDR            (MCNTRL_TILED_CHN2_ADDR),
        .MCNTRL_TILED_CHN4_ADDR            (MCNTRL_TILED_CHN4_ADDR),
        .MCNTRL_TILED_MASK                 (MCNTRL_TILED_MASK),
        .MCNTRL_TILED_MODE                 (MCNTRL_TILED_MODE),
        .MCNTRL_TILED_STATUS_CNTRL         (MCNTRL_TILED_STATUS_CNTRL),
        .MCNTRL_TILED_STARTADDR            (MCNTRL_TILED_STARTADDR),
        .MCNTRL_TILED_FRAME_FULL_WIDTH     (MCNTRL_TILED_FRAME_FULL_WIDTH),
        .MCNTRL_TILED_WINDOW_WH            (MCNTRL_TILED_WINDOW_WH),
        .MCNTRL_TILED_WINDOW_X0Y0          (MCNTRL_TILED_WINDOW_X0Y0),
        .MCNTRL_TILED_WINDOW_STARTXY       (MCNTRL_TILED_WINDOW_STARTXY),
        .MCNTRL_TILED_TILE_WHS             (MCNTRL_TILED_TILE_WHS),
        .MCNTRL_TILED_STATUS_REG_CHN2_ADDR (MCNTRL_TILED_STATUS_REG_CHN2_ADDR),
        .MCNTRL_TILED_STATUS_REG_CHN4_ADDR (MCNTRL_TILED_STATUS_REG_CHN4_ADDR),
        .MCNTRL_TILED_PENDING_CNTR_BITS    (MCNTRL_TILED_PENDING_CNTR_BITS),
        .MCNTRL_TILED_FRAME_PAGE_RESET     (MCNTRL_TILED_FRAME_PAGE_RESET),
        .BUFFER_DEPTH32                    (BUFFER_DEPTH32),
        .MCNTRL_TEST01_ADDR                 (MCNTRL_TEST01_ADDR),
        .MCNTRL_TEST01_MASK                 (MCNTRL_TEST01_MASK),
        .MCNTRL_TEST01_CHN1_MODE            (MCNTRL_TEST01_CHN1_MODE),
        .MCNTRL_TEST01_CHN1_STATUS_CNTRL    (MCNTRL_TEST01_CHN1_STATUS_CNTRL),
        .MCNTRL_TEST01_CHN2_MODE            (MCNTRL_TEST01_CHN2_MODE),
        .MCNTRL_TEST01_CHN2_STATUS_CNTRL    (MCNTRL_TEST01_CHN2_STATUS_CNTRL),
        .MCNTRL_TEST01_CHN3_MODE            (MCNTRL_TEST01_CHN3_MODE),
        .MCNTRL_TEST01_CHN3_STATUS_CNTRL    (MCNTRL_TEST01_CHN3_STATUS_CNTRL),
        .MCNTRL_TEST01_CHN4_MODE            (MCNTRL_TEST01_CHN4_MODE),
        .MCNTRL_TEST01_CHN4_STATUS_CNTRL    (MCNTRL_TEST01_CHN4_STATUS_CNTRL),
        .MCNTRL_TEST01_STATUS_REG_CHN1_ADDR (MCNTRL_TEST01_STATUS_REG_CHN1_ADDR),
        .MCNTRL_TEST01_STATUS_REG_CHN2_ADDR (MCNTRL_TEST01_STATUS_REG_CHN2_ADDR),
        .MCNTRL_TEST01_STATUS_REG_CHN3_ADDR (MCNTRL_TEST01_STATUS_REG_CHN3_ADDR),
        .MCNTRL_TEST01_STATUS_REG_CHN4_ADDR (MCNTRL_TEST01_STATUS_REG_CHN4_ADDR)
    ) x393_i (
`ifdef HISPI
        .sns1_dp   (sns1_dp[3:0]),    // inout[3:0]
        .sns1_dn   (sns1_dn[3:0]),    // inout[3:0]
        .sns1_dp74 (sns1_dp[7:4]),    // inout[3:0]
        .sns1_dn74 (sns1_dn[7:4]),    // inout[3:0]
`else    
        .sns1_dp   (sns1_dp),    // inout[7:0] {PX_MRST, PXD8, PXD6, PXD4, PXD2, PXD0, PX_HACT, PX_DCLK}
        .sns1_dn   (sns1_dn),    // inout[7:0] {PX_ARST, PXD9, PXD7, PXD5, PXD3, PXD1, PX_VACT, PX_BPF}
`endif        
        .sns1_clkp (sns1_clkp),  // inout       CNVCLK/TDO
        .sns1_clkn (sns1_clkn),  // inout       CNVSYNC/TDI
        .sns1_scl  (sns1_scl),   // inout       PX_SCL
        .sns1_sda  (sns1_sda),   // inout       PX_SDA
        .sns1_ctl  (sns1_ctl),   // inout       PX_ARO/TCK
        .sns1_pg   (sns1_pg),    // inout       SENSPGM
        
`ifdef HISPI
        .sns2_dp   (sns2_dp[3:0]),    // inout[3:0]
        .sns2_dn   (sns2_dn[3:0]),    // inout[3:0]
        .sns2_dp74 (sns2_dp[7:4]),    // inout[3:0]
        .sns2_dn74 (sns2_dn[7:4]),    // inout[3:0]
`else    
//        .sns2_dp   (sns1_dp),    // inout[7:0] {PX_MRST, PXD8, PXD6, PXD4, PXD2, PXD0, PX_HACT, PX_DCLK}
//        .sns2_dn   (sns1_dn),    // inout[7:0] {PX_ARST, PXD9, PXD7, PXD5, PXD3, PXD1, PX_VACT, PX_BPF}
        .sns2_dp   (sns2_dp),    // inout[7:0] {PX_MRST, PXD8, PXD6, PXD4, PXD2, PXD0, PX_HACT, PX_DCLK}
        .sns2_dn   (sns2_dn),    // inout[7:0] {PX_ARST, PXD9, PXD7, PXD5, PXD3, PXD1, PX_VACT, PX_BPF}
`endif        
        .sns2_clkp (sns2_clkp),  // inout       CNVCLK/TDO
        .sns2_clkn (sns2_clkn),  // inout       CNVSYNC/TDI
        .sns2_scl  (sns2_scl),   // inout       PX_SCL
        .sns2_sda  (sns2_sda),   // inout       PX_SDA
        .sns2_ctl  (sns2_ctl),   // inout       PX_ARO/TCK
        .sns2_pg   (sns2_pg),    // inout       SENSPGM
        
`ifdef HISPI
        .sns3_dp   (sns3_dp[3:0]),    // inout[3:0]
        .sns3_dn   (sns3_dn[3:0]),    // inout[3:0]
        .sns3_dp74 (sns3_dp[7:4]),    // inout[3:0]
        .sns3_dn74 (sns3_dn[7:4]),    // inout[3:0]
`else    
        .sns3_dp   (sns3_dp),    // inout[7:0] {PX_MRST, PXD8, PXD6, PXD4, PXD2, PXD0, PX_HACT, PX_DCLK}
        .sns3_dn   (sns3_dn),    // inout[7:0] {PX_ARST, PXD9, PXD7, PXD5, PXD3, PXD1, PX_VACT, PX_BPF}
`endif        
        .sns3_clkp (sns3_clkp),  // inout       CNVCLK/TDO
        .sns3_clkn (sns3_clkn),  // inout       CNVSYNC/TDI
        .sns3_scl  (sns3_scl),   // inout       PX_SCL
        .sns3_sda  (sns3_sda),   // inout       PX_SDA
        .sns3_ctl  (sns3_ctl),   // inout       PX_ARO/TCK
        .sns3_pg   (sns3_pg),    // inout       SENSPGM
        
`ifdef HISPI
        .sns4_dp   (sns4_dp[3:0]),    // inout[3:0]
        .sns4_dn   (sns4_dn[3:0]),    // inout[3:0]
        .sns4_dp74 (sns4_dp[7:4]),    // inout[3:0]
        .sns4_dn74 (sns4_dn[7:4]),    // inout[3:0]
`else    
        .sns4_dp   (sns4_dp),    // inout[7:0] {PX_MRST, PXD8, PXD6, PXD4, PXD2, PXD0, PX_HACT, PX_DCLK}
        .sns4_dn   (sns4_dn),    // inout[7:0] {PX_ARST, PXD9, PXD7, PXD5, PXD3, PXD1, PX_VACT, PX_BPF}
`endif        
        .sns4_clkp (sns4_clkp),  // inout       CNVCLK/TDO
        .sns4_clkn (sns4_clkn),  // inout       CNVSYNC/TDI
        .sns4_scl  (sns4_scl),   // inout       PX_SCL
        .sns4_sda  (sns4_sda),   // inout       PX_SDA
        .sns4_ctl  (sns4_ctl),   // inout       PX_ARO/TCK
        .sns4_pg   (sns4_pg),    // inout       SENSPGM
        
        .gpio_pins (gpio_pins),  // inout[9:0] 
    
        .SDRST   (SDRST),        // DDR3 reset (active low)
        .SDCLK   (SDCLK),        // output 
        .SDNCLK  (SDNCLK),       // outputread_and_wait(BASEADDR_STATUS)
        .SDA     (SDA[14:0]),    // output[14:0] 
        .SDBA    (SDBA[2:0]),    // output[2:0] 
        .SDWE    (SDWE),         // output
        .SDRAS   (SDRAS),        // output
        .SDCAS   (SDCAS),        // output
        .SDCKE   (SDCKE),        // output
        .SDODT   (SDODT),        // output
        .SDD     (SDD[15:0]),    // inout[15:0] 
        .SDDML   (SDDML),        // inout
        .DQSL    (DQSL),         // inout
        .NDQSL   (NDQSL),        // inout
        .SDDMU   (SDDMU),        // inout
        .DQSU    (DQSU),         // inout
        .NDQSU   (NDQSU),        // inout
        .memclk  (memclk),
        .ffclk0p (ffclk0p),      // input
        .ffclk0n (ffclk0n),      // input
        .ffclk1p (ffclk1p),      // input
        .ffclk1n (ffclk1n),      // input
        .RXN     (sata_rxn),     // input
        .RXP     (sata_rxp),     // input
        .TXN     (sata_txn),          // output
        .TXP     (sata_txp),          // output
        .EXTCLK_P(sata_extclkp),     // input
        .EXTCLK_N(sata_extclkn)      // input
    );
    // just to simplify extra delays in tri-state memory bus - provide output enable
    wire WRAP_MCLK=x393_i.mclk;
    wire [7:0] WRAP_PHY_DQ_TRI=x393_i.mcntrl393_i.memctrl16_i.mcontr_sequencer_i.phy_cmd_i.phy_dq_tri[7:0] ;
    wire [7:0] WRAP_PHY_DQS_TRI=x393_i.mcntrl393_i.memctrl16_i.mcontr_sequencer_i.phy_cmd_i.phy_dqs_tri[7:0] ;    

    ddr3_wrap #(
        .ADDRESS_NUMBER     (ADDRESS_NUMBER),
        .TRISTATE_DELAY_CLK (4'h1), // total 2
        .TRISTATE_DELAY     (0),
        .CLK_DELAY          (1550),
        .CMDA_DELAY         (1550),
        .DQS_IN_DELAY       (3150),
        .DQ_IN_DELAY        (1550),
        .DQS_OUT_DELAY      (1550),
        .DQ_OUT_DELAY       (1550)
    ) ddr3_i (
        .mclk    (WRAP_MCLK), // input
        .dq_tri  ({WRAP_PHY_DQ_TRI[4],WRAP_PHY_DQ_TRI[0]}), // input[1:0] 
        .dqs_tri ({WRAP_PHY_DQS_TRI[4],WRAP_PHY_DQS_TRI[0]}), // input[1:0] 
        .SDRST   (SDRST), 
        .SDCLK   (SDCLK), 
        .SDNCLK  (SDNCLK), 
        .SDCKE   (SDCKE), 
        .SDRAS   (SDRAS), 
        .SDCAS   (SDCAS), 
        .SDWE    (SDWE), 
        .SDDMU   (SDDMU),
        .SDDML   (SDDML),
        .SDBA    (SDBA[2:0]),  
        .SDA     (SDA[ADDRESS_NUMBER-1:0]), 
        .SDD     (SDD[15:0]),  
        .DQSU    (DQSU),
        .NDQSU   (NDQSU),
        .DQSL    (DQSL),
        .NDQSL   (NDQSL),
        .SDODT   (SDODT)          // input 
    );
    
// Simulation modules    
    simul_axi_master_rdaddr #(
        .ID_WIDTH      (12),
        .ADDRESS_WIDTH (32),
        .LATENCY       (AXI_RDADDR_LATENCY),          // minimal delay between inout and output ( 0 -next cycle)
        .DEPTH         (8),            // maximal number of commands in FIFO
        .DATA_DELAY    (3.5),
        .VALID_DELAY   (4.0)
    ) simul_axi_master_rdaddr_i (
        .clk        (maxigp0aclk),//CLK),// input
        .reset      (RST),             // input
        .arid_in    (dutm0_arid_w[11:0]),   // input[11:0] 
        .araddr_in  (dutm0_araddr_w[31:0]), // input[31:0] 
        .arlen_in   (dutm0_arlen_w[3:0]),   // input[3:0] 
        .arsize_in  (dutm0_arsize_w[1:0]),  // input[1:0] 
        .arburst_in (dutm0_arburst_w[1:0]), // input[1:0] 
        .arcache_in (4'b0),            // input[3:0] 
        .arprot_in  (3'b0),            // input[2:0] 
        .arid       (maxigp0arid),     // output[11:0] 
        .araddr     (maxigp0araddr),   // output[31:0] 
        .arlen      (maxigp0arlen),    // output[3:0] 
        .arsize     (maxigp0arsize),   // output[1:0] 
        .arburst    (maxigp0arburst),  // output[1:0] 
        .arcache    (maxigp0arcache),  // output[3:0] 
        .arprot     (maxigp0arprot),   // output[2:0] 
        .arvalid    (maxigp0arvalid),  // output
        .arready    (maxigp0arready),  // input
        .set_cmd    (dut_arvalid_w),      // input // latch all other input data at posedge of clock
        .ready      (dutm0_arready)         // output // command/data FIFO can accept command
    );
// Non-implemented signals in simul_axi_master_rdaddr 
        assign maxigp0aresetn = 'bz;
        assign maxigp0arlock = 'bz;
        assign maxigp0arqos = 'bz;

    simul_axi_master_wraddr #(
        .ID_WIDTH      (12),
        .ADDRESS_WIDTH (32),
        .LATENCY       (AXI_WRADDR_LATENCY), // minimal delay between inout and output ( 0 - next cycle)
        .DEPTH         (8),                  // maximal number of commands in FIFO
        .DATA_DELAY    (3.5),
        .VALID_DELAY   (4.0)
    ) simul_axi_master_wraddr_i (
        .clk        (maxigp0aclk),     // input
        .reset      (RST),             // input
        .awid_in    (dutm0_awid_w[11:0]),   // input[11:0] 
        .awaddr_in  (dutm0_awaddr_w[31:0]), // input[31:0] 
        .awlen_in   (dutm0_awlen_w[3:0]),   // input[3:0] 
        .awsize_in  (dutm0_awsize_w[1:0]),  // input[1:0] 
        .awburst_in (dutm0_awburst_w[1:0]), // input[1:0] 
        .awcache_in (4'b0),            // input[3:0] 
        .awprot_in  (3'b0),            // input[2:0] 
        .awid       (maxigp0awid),     // output[11:0] 
        .awaddr     (maxigp0awaddr),   // output[31:0] 
        .awlen      (maxigp0awlen),    // output[3:0] 
        .awsize     (maxigp0awsize),   // output[1:0] 
        .awburst    (maxigp0awburst),  // output[1:0] 
        .awcache    (maxigp0awcache),  // output[3:0] 
        .awprot     (maxigp0awprot),   // output[2:0] 
        .awvalid    (maxigp0awvalid),  // output
        .awready    (maxigp0awready),  // input
        .set_cmd    (dutm0_awvalid_w),      // input   // latch all other input data at posedge of clock
        .ready      (dutm0_awready)         // output  // command/data FIFO can accept command
    );
// Non-implemented signals in simul_axi_master_wraddr
        assign maxigp0awlock = 'bz;
        assign maxigp0awqos =  'bz;
 
    simul_axi_master_wdata #(
        .ID_WIDTH      (12),
        .DATA_WIDTH    (32),
        .WSTB_WIDTH    (4),
        .LATENCY       (AXI_WRDATA_LATENCY), // minimal delay between inout and output ( 0 - next cycle)
        .DEPTH         (8),                  // maximal number of commands in FIFO
        .DATA_DELAY    (3.2),
        .VALID_DELAY   (3.6)
    ) simul_axi_master_wdata_i (
        .clk        (maxigp0aclk),     // input
        .reset      (RST),             // input
        .wid_in     (dutm0_wid_w[11:0]),    // input[11:0] 
        .wdata_in   (dutm0_wdata_w[31:0]),  // input[31:0] 
        .wstrb_in   (dutm0_wstb_w[3:0]),   // input[3:0] 
        .wlast_in   (dutm0_wlast_w),        // input
        .wid        (maxigp0wid),      // output[11:0] 
        .wdata      (maxigp0wdata),    // output[31:0] 
        .wstrb      (maxigp0wstrb),    // output[3:0] 
        .wlast      (maxigp0wlast),    // output
        .wvalid     (maxigp0wvalid),   // output
        .wready     (maxigp0wready),   // input
        .set_cmd    (dutm0_wvalid_w),       // input   // latch all other input data at posedge of clock
        .ready      (dutm0_wready)          // output  // command/data FIFO can accept command
    );

// These two modules generate ready (from host) as a slow response to valid (from FPGA). This functionality may be moved to Python
// Until then  dutm0_rready and dutm0_bready are outputs, not inputs
    simul_axi_slow_ready simul_axi_slow_ready_i (
        .clk        (maxigp0aclk),     // input
        .reset      (RST),             // input
        .delay      (dutm0_xtra_rdlag),          // input[3:0] 
        .valid      (maxigp0rvalid),   // input
        .ready      (maxigp0rready)    // output
    );
    
    simul_axi_slow_ready simul_axi_slow_ready_write_resp_i(
        .clk        (maxigp0aclk),     // input
        .reset      (RST),             // input
        .delay      (dutm0_xtra_blag),           // input[3:0]
        .valid      (maxigp0bvalid),   // input
        .ready      (maxigp0bready)    // output
    );

    simul_axi_read #(
        .ADDRESS_WIDTH (SIMUL_AXI_READ_WIDTH)
    ) simul_axi_read_i (
        .clk        (maxigp0aclk),                                // input
        .reset      (RST),                                        // input
        .last       (maxigp0rlast),                               // input
        .data_stb   (maxigp0rready & maxigp0rvalid),              // input
        .raddr      (dutm0_araddr_w[SIMUL_AXI_READ_WIDTH+1:2]),   // input[9:0] 
        .rlen       (dutm0_arlen_w),                              // input[3:0] 
        .rcmd       (dut_arvalid_w),                              // input
        .addr_out   (SIMUL_AXI_ADDR_W[SIMUL_AXI_READ_WIDTH-1:0]), // output[9:0] 
        .burst      (),  // output      // burst in progress - just debug
        .err_out    ()   // output reg // data last does not match predicted or FIFO over/under run - just debug
    );




simul_axi_hp_rd #(
        .HP_PORT(0)
    ) simul_axi_hp_rd_i (
        .rst            (RST),                               // input
        .aclk           (x393_i.ps7_i.SAXIHP0ACLK),          // input
        .aresetn        (),                                  // output
        .araddr         (x393_i.ps7_i.SAXIHP0ARADDR[31:0]),  // input[31:0] 
        .arvalid        (x393_i.ps7_i.SAXIHP0ARVALID),       // input
        .arready        (x393_i.ps7_i.SAXIHP0ARREADY),       // output
        .arid           (x393_i.ps7_i.SAXIHP0ARID),          // input[5:0] 
        .arlock         (x393_i.ps7_i.SAXIHP0ARLOCK),        // input[1:0] 
        .arcache        (x393_i.ps7_i.SAXIHP0ARCACHE),       // input[3:0] 
        .arprot         (x393_i.ps7_i.SAXIHP0ARPROT),        // input[2:0] 
        .arlen          (x393_i.ps7_i.SAXIHP0ARLEN),         // input[3:0] 
        .arsize         (x393_i.ps7_i.SAXIHP0ARSIZE),        // input[2:0] 
        .arburst        (x393_i.ps7_i.SAXIHP0ARBURST),       // input[1:0] 
        .arqos          (x393_i.ps7_i.SAXIHP0ARQOS),         // input[3:0] 
        .rdata          (x393_i.ps7_i.SAXIHP0RDATA),         // output[63:0] 
        .rvalid         (x393_i.ps7_i.SAXIHP0RVALID),        // output
        .rready         (x393_i.ps7_i.SAXIHP0RREADY),        // input
        .rid            (x393_i.ps7_i.SAXIHP0RID),           // output[5:0] 
        .rlast          (x393_i.ps7_i.SAXIHP0RLAST),         // output
        .rresp          (x393_i.ps7_i.SAXIHP0RRESP),         // output[1:0] 
        .rcount         (x393_i.ps7_i.SAXIHP0RCOUNT),        // output[7:0] 
        .racount        (x393_i.ps7_i.SAXIHP0RACOUNT),       // output[2:0] 
        .rdissuecap1en  (x393_i.ps7_i.SAXIHP0RDISSUECAP1EN), // input
        .sim_rd_address (saxihp0_rd_address), // output[31:0] 
        .sim_rid        (saxihp0_rid), // output[5:0] 
        .sim_rd_valid   (saxihp0_rd_valid), // input
        .sim_rd_ready   (saxihp0_rd_ready), // output
        .sim_rd_data    (saxihp0_rd_data), // input[63:0] 
        .sim_rd_cap     (saxihp0_rd_cap), // output[2:0] 
        .sim_rd_qos     (saxihp0_rd_qos), // output[3:0] 
        .sim_rd_resp    (saxihp0_rd_resp), // input[1:0] 
        .reg_addr       (ps_sbus_addr), // input[31:0] 
        .reg_wr         (ps_sbus_wr), // input
        .reg_rd         (ps_sbus_rd), // input
        .reg_din        (ps_sbus_din), // input[31:0] 
        .reg_dout       (ps_reg_dout0r), // output[31:0]
        .reg_dvalid     (ps_reg_dvalid0r) 
         
    );

simul_axi_hp_wr #(
        .HP_PORT(0)
    ) simul_axi_hp_wr_i (
        .rst            (RST),                               // input
        .aclk           (x393_i.ps7_i.SAXIHP0ACLK),          // input
        .aresetn        (),                                  // output
        .awaddr         (x393_i.ps7_i.SAXIHP0AWADDR),        // input[31:0] 
        .awvalid        (x393_i.ps7_i.SAXIHP0AWVALID),       // input
        .awready        (x393_i.ps7_i.SAXIHP0AWREADY),       // output
        .awid           (x393_i.ps7_i.SAXIHP0AWID),          // input[5:0] 
        .awlock         (x393_i.ps7_i.SAXIHP0AWLOCK),        // input[1:0] 
        .awcache        (x393_i.ps7_i.SAXIHP0AWCACHE),       // input[3:0] 
        .awprot         (x393_i.ps7_i.SAXIHP0AWPROT),        // input[2:0] 
        .awlen          (x393_i.ps7_i.SAXIHP0AWLEN),         // input[3:0] 
        .awsize         (x393_i.ps7_i.SAXIHP0AWSIZE),        // input[2:0] 
        .awburst        (x393_i.ps7_i.SAXIHP0AWBURST),       // input[1:0] 
        .awqos          (x393_i.ps7_i.SAXIHP0AWQOS),         // input[3:0] 
        .wdata          (x393_i.ps7_i.SAXIHP0WDATA),         // input[63:0] 
        .wvalid         (x393_i.ps7_i.SAXIHP0WVALID),        // input
        .wready         (x393_i.ps7_i.SAXIHP0WREADY),        // output
        .wid            (x393_i.ps7_i.SAXIHP0WID),           // input[5:0] 
        .wlast          (x393_i.ps7_i.SAXIHP0WLAST),         // input
        .wstrb          (x393_i.ps7_i.SAXIHP0WSTRB),         // input[7:0] 
        .bvalid         (x393_i.ps7_i.SAXIHP0BVALID),        // output
        .bready         (x393_i.ps7_i.SAXIHP0BREADY),        // input
        .bid            (x393_i.ps7_i.SAXIHP0BID),           // output[5:0] 
        .bresp          (x393_i.ps7_i.SAXIHP0BRESP),         // output[1:0] 
        .wcount         (x393_i.ps7_i.SAXIHP0WCOUNT),        // output[7:0] 
        .wacount        (x393_i.ps7_i.SAXIHP0WACOUNT),       // output[5:0] 
        .wrissuecap1en  (x393_i.ps7_i.SAXIHP0WRISSUECAP1EN), // input
        .sim_wr_address (saxihp0_wr_address),                // output[31:0] 
        .sim_wid        (saxihp0_wid),                       // output[5:0] 
        .sim_wr_valid   (saxihp0_wr_valid),                  // output
        .sim_wr_ready   (saxihp0_wr_ready),                  // input
        .sim_wr_data    (saxihp0_wr_data),                   // output[63:0] 
        .sim_wr_stb     (saxihp0_wr_stb),                    // output[7:0] 
        .sim_bresp_latency(saxihp0_bresp_latency),           // input[3:0] 
        .sim_wr_cap     (saxihp0_wr_cap),                    // output[2:0] 
        .sim_wr_qos     (saxihp0_wr_qos),                    // output[3:0] 
        .reg_addr       (ps_sbus_addr),                      // input[31:0] 
        .reg_wr         (ps_sbus_wr),                        // input
        .reg_rd         (ps_sbus_rd),                        // input
        .reg_din        (ps_sbus_din),                       // input[31:0] 
        .reg_dout       (ps_reg_dout0w),                     // output[31:0] 
        .reg_dvalid     (ps_reg_dvalid0w)                    // output 
    );
    // afi1 - from compressor 
simul_axi_hp_wr #(
        .HP_PORT(1)
    ) simul_axi_hp1_wr_i (
        .rst            (RST),                               // input
        .aclk           (x393_i.ps7_i.SAXIHP1ACLK),          // input
        .aresetn        (),                                  // output
        .awaddr         (x393_i.ps7_i.SAXIHP1AWADDR),        // input[31:0] 
        .awvalid        (x393_i.ps7_i.SAXIHP1AWVALID),       // input
        .awready        (x393_i.ps7_i.SAXIHP1AWREADY),       // output
        .awid           (x393_i.ps7_i.SAXIHP1AWID),          // input[5:0] 
        .awlock         (x393_i.ps7_i.SAXIHP1AWLOCK),        // input[1:0] 
        .awcache        (x393_i.ps7_i.SAXIHP1AWCACHE),       // input[3:0] 
        .awprot         (x393_i.ps7_i.SAXIHP1AWPROT),        // input[2:0] 
        .awlen          (x393_i.ps7_i.SAXIHP1AWLEN),         // input[3:0] 
        .awsize         (x393_i.ps7_i.SAXIHP1AWSIZE),        // input[2:0] 
        .awburst        (x393_i.ps7_i.SAXIHP1AWBURST),       // input[1:0] 
        .awqos          (x393_i.ps7_i.SAXIHP1AWQOS),         // input[3:0] 
        .wdata          (x393_i.ps7_i.SAXIHP1WDATA),         // input[63:0] 
        .wvalid         (x393_i.ps7_i.SAXIHP1WVALID),        // input
        .wready         (x393_i.ps7_i.SAXIHP1WREADY),        // output
        .wid            (x393_i.ps7_i.SAXIHP1WID),           // input[5:0] 
        .wlast          (x393_i.ps7_i.SAXIHP1WLAST),         // input
        .wstrb          (x393_i.ps7_i.SAXIHP1WSTRB),         // input[7:0] 
        .bvalid         (x393_i.ps7_i.SAXIHP1BVALID),        // output
        .bready         (x393_i.ps7_i.SAXIHP1BREADY),        // input
        .bid            (x393_i.ps7_i.SAXIHP1BID),           // output[5:0] 
        .bresp          (x393_i.ps7_i.SAXIHP1BRESP),         // output[1:0] 
        .wcount         (x393_i.ps7_i.SAXIHP1WCOUNT),        // output[7:0] 
        .wacount        (x393_i.ps7_i.SAXIHP1WACOUNT),       // output[5:0] 
        .wrissuecap1en  (x393_i.ps7_i.SAXIHP1WRISSUECAP1EN), // input
        .sim_wr_address (saxihp1_wr_address),                // output[31:0] 
        .sim_wid        (saxihp1_wid),                       // output[5:0] 
        .sim_wr_valid   (saxihp1_wr_valid),                  // output
        .sim_wr_ready   (saxihp1_wr_ready),                  // input
        .sim_wr_data    (saxihp1_wr_data),                   // output[63:0] 
        .sim_wr_stb     (saxihp1_wr_stb),                    // output[7:0] 
        .sim_bresp_latency(saxihp1_bresp_latency),           // input[3:0] 
        .sim_wr_cap     (saxihp1_wr_cap),                    // output[2:0] 
        .sim_wr_qos     (saxihp1_wr_qos),                    // output[3:0] 
        .reg_addr       (ps_sbus_addr),                       // input[31:0] 
        .reg_wr         (ps_sbus_wr),                         // input
        .reg_rd         (ps_sbus_rd),                         // input
        .reg_din        (ps_sbus_din),                        // input[31:0] 
        .reg_dout       (ps_reg_dout1w),                      // output[31:0]
        .reg_dvalid     (ps_reg_dvalid1w)                     // output
    );
    
    // SAXI_GP0 - histograms to system memory
    simul_saxi_gp_wr simul_saxi_gp0_wr_i (
        .rst               (RST),                         // input
        .aclk              (saxi0_aclk),                  // input
        .aresetn           (), // output
        .awaddr            (x393_i.ps7_i.SAXIGP0AWADDR),  // input[31:0] 
        .awvalid           (x393_i.ps7_i.SAXIGP0AWVALID), // input
        .awready           (x393_i.ps7_i.SAXIGP0AWREADY), // output
        .awid              (x393_i.ps7_i.SAXIGP0AWID),    // input[5:0] 
        .awlock            (x393_i.ps7_i.SAXIGP0AWLOCK),  // input[1:0] 
        .awcache           (x393_i.ps7_i.SAXIGP0AWCACHE), // input[3:0] 
        .awprot            (x393_i.ps7_i.SAXIGP0AWPROT),  // input[2:0] 
        .awlen             (x393_i.ps7_i.SAXIGP0AWLEN),   // input[3:0] 
        .awsize            (x393_i.ps7_i.SAXIGP0AWSIZE),  // input[1:0] 
        .awburst           (x393_i.ps7_i.SAXIGP0AWBURST), // input[1:0] 
        .awqos             (x393_i.ps7_i.SAXIGP0AWQOS),   // input[3:0] 
        .wdata             (x393_i.ps7_i.SAXIGP0WDATA),   // input[31:0] 
        .wvalid            (x393_i.ps7_i.SAXIGP0WVALID),  // input
        .wready            (x393_i.ps7_i.SAXIGP0WREADY),  // output
        .wid               (x393_i.ps7_i.SAXIGP0WID),     // input[5:0] 
        .wlast             (x393_i.ps7_i.SAXIGP0WLAST),   // input
        .wstrb             (x393_i.ps7_i.SAXIGP0WSTRB),   // input[3:0] 
        .bvalid            (x393_i.ps7_i.SAXIGP0BVALID),  // output
        .bready            (x393_i.ps7_i.SAXIGP0BREADY),  // input
        .bid               (x393_i.ps7_i.SAXIGP0BID),     // output[5:0] 
        .bresp             (x393_i.ps7_i.SAXIGP0BRESP),   // output[1:0] 
        .sim_wr_address    (saxigp0_wr_address),          // output[31:0] 
        .sim_wid           (saxigp0_wid),                 // output[5:0] 
        .sim_wr_valid      (saxigp0_wr_valid),            // output
        .sim_wr_ready      (saxigp0_wr_ready),            // input
        .sim_wr_data       (saxigp0_wr_data),             // output[31:0] 
        .sim_wr_stb        (saxigp0_wr_stb),              // output[3:0] 
        .sim_wr_size       (saxigp0_wr_size),             // output[1:0] 
        .sim_bresp_latency (saxigp0_bresp_latency),       // input[3:0] 
        .sim_wr_qos        (saxigp0_wr_qos)               // output[3:0] 
    );

    // SAXI_GP1 - event logger to system memory
    simul_saxi_gp_wr simul_saxi_gp1_wr_i (
        .rst               (RST),                         // input
        .aclk              (saxi0_aclk),                  // input
        .aresetn           (), // output
        .awaddr            (x393_i.ps7_i.SAXIGP1AWADDR),  // input[31:0] 
        .awvalid           (x393_i.ps7_i.SAXIGP1AWVALID), // input
        .awready           (x393_i.ps7_i.SAXIGP1AWREADY), // output
        .awid              (x393_i.ps7_i.SAXIGP1AWID),    // input[5:0] 
        .awlock            (x393_i.ps7_i.SAXIGP1AWLOCK),  // input[1:0] 
        .awcache           (x393_i.ps7_i.SAXIGP1AWCACHE), // input[3:0] 
        .awprot            (x393_i.ps7_i.SAXIGP1AWPROT),  // input[2:0] 
        .awlen             (x393_i.ps7_i.SAXIGP1AWLEN),   // input[3:0] 
        .awsize            (x393_i.ps7_i.SAXIGP1AWSIZE),  // input[1:0] 
        .awburst           (x393_i.ps7_i.SAXIGP1AWBURST), // input[1:0] 
        .awqos             (x393_i.ps7_i.SAXIGP1AWQOS),   // input[3:0] 
        .wdata             (x393_i.ps7_i.SAXIGP1WDATA),   // input[31:0] 
        .wvalid            (x393_i.ps7_i.SAXIGP1WVALID),  // input
        .wready            (x393_i.ps7_i.SAXIGP1WREADY),  // output
        .wid               (x393_i.ps7_i.SAXIGP1WID),     // input[5:0] 
        .wlast             (x393_i.ps7_i.SAXIGP1WLAST),   // input
        .wstrb             (x393_i.ps7_i.SAXIGP1WSTRB),   // input[3:0] 
        .bvalid            (x393_i.ps7_i.SAXIGP1BVALID),  // output
        .bready            (x393_i.ps7_i.SAXIGP1BREADY),  // input
        .bid               (x393_i.ps7_i.SAXIGP1BID),     // output[5:0] 
        .bresp             (x393_i.ps7_i.SAXIGP1BRESP),   // output[1:0] 
        .sim_wr_address    (saxigp1_wr_address),          // output[31:0] 
        .sim_wid           (saxigp1_wid),                 // output[5:0] 
        .sim_wr_valid      (saxigp1_wr_valid),            // output
        .sim_wr_ready      (saxigp1_wr_ready),            // input
        .sim_wr_data       (saxigp1_wr_data),             // output[31:0] 
        .sim_wr_stb        (saxigp1_wr_stb),              // output[3:0] 
        .sim_wr_size       (saxigp1_wr_size),             // output[1:0] 
        .sim_bresp_latency (saxigp1_bresp_latency),       // input[3:0] 
        .sim_wr_qos        (saxigp1_wr_qos)               // output[3:0] 
    );


// Generate all clocks
    simul_clk #(
        .CLKIN_PERIOD  (CLKIN_PERIOD),
        .MEMCLK_PERIOD (MEMCLK_PERIOD),
        .FCLK0_PERIOD  (FCLK0_PERIOD),
        .FCLK1_PERIOD  (FCLK1_PERIOD)
    ) simul_clk_i (
        .rst     (1'b0),               // input
        .clk     (CLK),                // output
        .memclk  (memclk),             // output
        .ffclk0  ({ffclk0n, ffclk0p}), // output[1:0] 
        .ffclk1  ({ffclk1n, ffclk1p})  // output[1:0] 
    );

// Testing parallel12 -> HiSPi simulation converter
 `ifdef HISPI   
    par12_hispi_psp4l #(
        .FULL_HEIGHT   (HISPI_FULL_HEIGHT),
        .CLOCK_MPY     (HISPI_CLK_MULT),
        .CLOCK_DIV     (HISPI_CLK_DIV),
        .LANE0_DLY     (1.2), // 1.3), 1.3 not stable with default delays
        .LANE1_DLY     (2.7),
        .LANE2_DLY     (0.2),
        .LANE3_DLY     (1.8),
        .CLK_DLY       (2.3),
        .EMBED_LINES   (HISPI_EMBED_LINES),
        .MSB_FIRST     (HISPI_MSB_FIRST),
        .FIFO_LOGDEPTH (HISPI_FIFO_LOGDEPTH)
    ) par12_hispi_psp4l0_i (
        .pclk    ( PX1_MCLK), // input
        .rst     (!PX1_MRST), // input
        .pxd     (PX1_D),     // input[11:0] 
        .vact    (PX1_VACT), // input
        .hact_in (PX1_HACT), // input
        .lane_p  (PX1_LANE_P), // output[3:0] 
        .lane_n  (PX1_LANE_N), // output[3:0] 
        .clk_p   (PX1_CLK_P), // output
        .clk_n   (PX1_CLK_N) // output
    );

    par12_hispi_psp4l #(
        .FULL_HEIGHT   (HISPI_FULL_HEIGHT),
        .CLOCK_MPY     (HISPI_CLK_MULT),
        .CLOCK_DIV     (HISPI_CLK_DIV),
        .LANE0_DLY     (1.2), // 1.3), 1.3 not stable with default delays
        .LANE1_DLY     (2.7),
        .LANE2_DLY     (0.2),
        .LANE3_DLY     (1.8),
        .CLK_DLY       (2.3),
        .EMBED_LINES   (HISPI_EMBED_LINES),
        .MSB_FIRST     (HISPI_MSB_FIRST),
        .FIFO_LOGDEPTH (HISPI_FIFO_LOGDEPTH)
    ) par12_hispi_psp4l1_i (
        .pclk    ( PX2_MCLK), // input
        .rst     (!PX2_MRST), // input
        .pxd     (PX2_D),     // input[11:0] 
        .vact    (PX2_VACT), // input
        .hact_in (PX2_HACT), // input
        .lane_p  (PX2_LANE_P), // output[3:0] 
        .lane_n  (PX2_LANE_N), // output[3:0] 
        .clk_p   (PX2_CLK_P), // output
        .clk_n   (PX2_CLK_N) // output
    );

    par12_hispi_psp4l #(
        .FULL_HEIGHT   (HISPI_FULL_HEIGHT),
        .CLOCK_MPY     (HISPI_CLK_MULT),
        .CLOCK_DIV     (HISPI_CLK_DIV),
        .LANE0_DLY     (1.2), // 1.3), 1.3 not stable with default delays
        .LANE1_DLY     (2.7),
        .LANE2_DLY     (0.2),
        .LANE3_DLY     (1.8),
        .CLK_DLY       (2.3),
        .EMBED_LINES   (HISPI_EMBED_LINES),
        .MSB_FIRST     (HISPI_MSB_FIRST),
        .FIFO_LOGDEPTH (HISPI_FIFO_LOGDEPTH)
    ) par12_hispi_psp4l2_i (
        .pclk    ( PX3_MCLK), // input
        .rst     (!PX3_MRST), // input
        .pxd     (PX3_D),     // input[11:0] 
        .vact    (PX3_VACT), // input
        .hact_in (PX3_HACT), // input
        .lane_p  (PX3_LANE_P), // output[3:0] 
        .lane_n  (PX3_LANE_N), // output[3:0] 
        .clk_p   (PX3_CLK_P), // output
        .clk_n   (PX3_CLK_N) // output
    );

    par12_hispi_psp4l #(
        .FULL_HEIGHT   (HISPI_FULL_HEIGHT),
        .CLOCK_MPY     (HISPI_CLK_MULT),
        .CLOCK_DIV     (HISPI_CLK_DIV),
        .LANE0_DLY     (1.2), // 1.3), 1.3 not stable with default delays
        .LANE1_DLY     (2.7),
        .LANE2_DLY     (0.2),
        .LANE3_DLY     (1.8),
        .CLK_DLY       (2.3),
        .EMBED_LINES   (HISPI_EMBED_LINES),
        .MSB_FIRST     (HISPI_MSB_FIRST),
        .FIFO_LOGDEPTH (HISPI_FIFO_LOGDEPTH)
    ) par12_hispi_psp4l3_i (
        .pclk    ( PX4_MCLK), // input
        .rst     (!PX4_MRST), // input
        .pxd     (PX4_D),     // input[11:0] 
        .vact    (PX4_VACT), // input
        .hact_in (PX4_HACT), // input
        .lane_p  (PX4_LANE_P), // output[3:0] 
        .lane_n  (PX4_LANE_N), // output[3:0] 
        .clk_p   (PX4_CLK_P), // output
        .clk_n   (PX4_CLK_N) // output
    );
`endif    

    simul_clk_mult_div #(
        .MULTIPLIER (PIX_CLK_MULT),
        .DIVISOR    (PIX_CLK_DIV),
        .SKIP_FIRST (5)
    ) simul_clk_div_mult_pix1_i (
        .clk_in     (PX1_MCLK_PRE), // input
        .en         (1'b1), // input
        .clk_out    (PX1_MCLK) // output
    );

    simul_clk_mult_div #(
        .MULTIPLIER (PIX_CLK_MULT),
        .DIVISOR    (PIX_CLK_DIV),
        .SKIP_FIRST (5)
    ) simul_clk_div_mult_pix2_i (
        .clk_in     (PX2_MCLK_PRE), // input
        .en         (1'b1), // input
        .clk_out    (PX2_MCLK) // output
    );

    simul_clk_mult_div #(
        .MULTIPLIER (PIX_CLK_MULT),
        .DIVISOR    (PIX_CLK_DIV),
        .SKIP_FIRST (5)
    ) simul_clk_div_mult_pix3_i (
        .clk_in     (PX3_MCLK_PRE), // input
        .en         (1'b1), // input
        .clk_out    (PX3_MCLK) // output
    );

    simul_clk_mult_div #(
        .MULTIPLIER (PIX_CLK_MULT),
        .DIVISOR    (PIX_CLK_DIV),
        .SKIP_FIRST (5)
    ) simul_clk_div_mult_pix4_i (
        .clk_in     (PX4_MCLK_PRE), // input
        .en         (1'b1), // input
        .clk_out    (PX4_MCLK) // output
    );



    /* Instance template for module simul_lwir160x120_vospi */
    wire lwir1_miso;
    simul_lwir160x120_vospi #(
        .DATA_FILE     ("/data_ssd/nc393/elphel393/fpga-elphel/x393/input_data/pattern_160_120_14.dat"),
        .WINDOW_WIDTH  (160),
        .WINDOW_HEIGHT (120),
        .TELEMETRY     (2), // 1),
        .FRAME_PERIOD  (946969),
        .FRAME_DELAY   (100),
        .MS_PERIOD     (25)  // 1us instead of 1 ms
    ) simul_lwir160x120_vospi_i (
        .mclk                       (x393_i.ps7_i.SAXIHP0ACLK), // PX1_MCLK),   // input temporarily made faster
        .nrst                       (    PX1_MRST),   // input
        .sck                        (    1'b0),       // input
        .ncs                        (    1'b0),       // inout
        .miso                       (    lwir1_miso), // output
        .telemetry_rev              (  16'h7654),     // input[15:0] 
        .telemetry_status           (  32'h137f1248), // input[31:0] 
        .telemetry_srev             (64'h0123456789abcdef), // input[63:0] 
        .telemetry_temp_counts      ( 16'd59000),     // input[15:0] 
        .telemetry_temp_kelvin      ( 16'd29500),     // input[15:0] 
        .telemetry_temp_last_kelvin ( 16'd29300),     // input[15:0] 
        .telemetry_time_last_ms     (  32'h12345678), // input[31:0] 
        .telemetry_agc_roi_top      (    16'd0),      // input[15:0] 
        .telemetry_agc_roi_left     (    16'd0),      // input[15:0] 
        .telemetry_agc_roi_bottom   (  16'd119),      // input[15:0] 
        .telemetry_agc_roi_right    (  16'd159),      // input[15:0] 
        .telemetry_agc_high         (16'd19200),      // input[15:0] 
        .telemetry_agc_low          (  16'd200),      // input[15:0] 
        .telemetry_video_format     (32'haaaa5555)    // input[31:0] 
    );

    simul_sensor12bits #(
        .SENSOR_IMAGE_TYPE (SENSOR_IMAGE_TYPE0),
        .lline     (VIRTUAL_WIDTH),     // SENSOR12BITS_LLINE),
        .ncols     (FULL_WIDTH),        // (SENSOR12BITS_NCOLS),
`ifdef PF
        .nrows     (PF_HEIGHT),         // SENSOR12BITS_NROWS),
`else
        .nrows     (FULL_HEIGHT),       // SENSOR12BITS_NROWS),
`endif        
        .nrowb     (BLANK_ROWS_BEFORE), // SENSOR12BITS_NROWB),
        .nrowa     (BLANK_ROWS_AFTER),  // SENSOR12BITS_NROWA),
//        .nAV(24),
        .nbpf      (0), // SENSOR12BITS_NBPF),
        .ngp1      (SENSOR12BITS_NGPL),
        .nVLO      (SENSOR12BITS_NVLO),
        .tMD       (SENSOR12BITS_TMD),
        .tDDO      (SENSOR12BITS_TDDO),
        .tDDO1     (SENSOR12BITS_TDDO1),
        .trigdly   (TRIG_LINES), // SENSOR12BITS_TRIGDLY),
        .ramp      (0), //SENSOR12BITS_RAMP),
        .new_bayer (0), // was 1 SENSOR12BITS_NEW_BAYER)
        .EXTRA_PERIOD(0)
    ) simul_sensor12bits_i (
        .MCLK  (PX1_MCLK), // input 
        .MRST  (PX1_MRST), // input 
        .ARO   (PX1_ARO),  // input 
        .ARST  (PX1_ARST), // input 
        .OE    (1'b0),     // input output enable active low
        .SCL   (sns1_scl), // input 
        .SDA   (sns1_sda), // inout 
        .OFST  (PX1_OFST), // input 
        .D     (PX1_D),    // output[11:0] 
        .DCLK  (PX1_DCLK), // output 
        .BPF   (),         // output 
        .HACT  (PX1_HACT), // output 
        .VACT  (PX1_VACT), // output 
        .VACT1 () // output 
    );


    simul_sensor12bits #(
        .SENSOR_IMAGE_TYPE (SENSOR_IMAGE_TYPE1),
        .lline     (VIRTUAL_WIDTH),     // SENSOR12BITS_LLINE),
        .ncols     (FULL_WIDTH),        // (SENSOR12BITS_NCOLS),
`ifdef PF
        .nrows     (PF_HEIGHT),         // SENSOR12BITS_NROWS),
`else
        .nrows     (FULL_HEIGHT),       // SENSOR12BITS_NROWS),
`endif        
        .nrowb     (BLANK_ROWS_BEFORE), // SENSOR12BITS_NROWB),
        .nrowa     (BLANK_ROWS_AFTER),  // SENSOR12BITS_NROWA),
//        .nAV(24),
        .nbpf      (0), // SENSOR12BITS_NBPF),
        .ngp1      (SENSOR12BITS_NGPL),
        .nVLO      (SENSOR12BITS_NVLO),
        .tMD       (SENSOR12BITS_TMD),
        .tDDO      (SENSOR12BITS_TDDO),
        .tDDO1     (SENSOR12BITS_TDDO1),
        .trigdly   (TRIG_LINES), // SENSOR12BITS_TRIGDLY),
        .ramp      (0), //SENSOR12BITS_RAMP),
        .new_bayer (0), //SENSOR12BITS_NEW_BAYER) was 1
        .EXTRA_PERIOD (50)
        
    ) simul_sensor12bits_2_i (
        .MCLK  (PX2_MCLK), // input
`ifdef DISABLE_SENSOR_2
        .MRST  (PX2_MRST & 0), // input // force reset !!!
`else 
        .MRST  (PX2_MRST), // input // force reset !!!
`endif 
        .ARO   (PX2_ARO),  // input 
        .ARST  (PX2_ARST), // input 
        .OE    (1'b0),     // input output enable active low
        .SCL   (sns2_scl), // input 
        .SDA   (sns2_sda), // inout 
        .OFST  (PX2_OFST), // input 
        .D     (PX2_D),    // output[11:0] 
        .DCLK  (PX2_DCLK), // output 
        .BPF   (),         // output 
        .HACT  (PX2_HACT), // output 
        .VACT  (PX2_VACT), // output 
        .VACT1 () // output 
    );

    simul_sensor12bits #(
        .SENSOR_IMAGE_TYPE (SENSOR_IMAGE_TYPE2),
        .lline     (VIRTUAL_WIDTH),     // SENSOR12BITS_LLINE),
        .ncols     (FULL_WIDTH),        // (SENSOR12BITS_NCOLS),
`ifdef PF
        .nrows     (PF_HEIGHT),         // SENSOR12BITS_NROWS),
`else
        .nrows     (FULL_HEIGHT),       // SENSOR12BITS_NROWS),
`endif        
        .nrowb     (BLANK_ROWS_BEFORE), // SENSOR12BITS_NROWB),
        .nrowa     (BLANK_ROWS_AFTER),  // SENSOR12BITS_NROWA),
//        .nAV(24),
        .nbpf      (0), // SENSOR12BITS_NBPF),
        .ngp1      (SENSOR12BITS_NGPL),
        .nVLO      (SENSOR12BITS_NVLO),
        .tMD       (SENSOR12BITS_TMD),
        .tDDO      (SENSOR12BITS_TDDO),
        .tDDO1     (SENSOR12BITS_TDDO1),
        .trigdly   (TRIG_LINES), // SENSOR12BITS_TRIGDLY),
        .ramp      (0), // SENSOR12BITS_RAMP),
        .new_bayer (0),  // was 1SENSOR12BITS_NEW_BAYER)
        .EXTRA_PERIOD(100)
    ) simul_sensor12bits_3_i (
        .MCLK  (PX3_MCLK), // input 
        .MRST  (PX3_MRST), // input 
        .ARO   (PX3_ARO),  // input 
        .ARST  (PX3_ARST), // input 
        .OE    (1'b0),     // input output enable active low
        .SCL   (sns3_scl), // input 
        .SDA   (sns3_sda), // inout 
        .OFST  (PX3_OFST), // input 
        .D     (PX3_D),    // output[11:0] 
        .DCLK  (PX3_DCLK), // output 
        .BPF   (),         // output 
        .HACT  (PX3_HACT), // output 
        .VACT  (PX3_VACT), // output 
        .VACT1 () // output 
    );

    simul_sensor12bits #(
        .SENSOR_IMAGE_TYPE (SENSOR_IMAGE_TYPE3),
        .lline     (VIRTUAL_WIDTH),     // SENSOR12BITS_LLINE),
        .ncols     (FULL_WIDTH),        // (SENSOR12BITS_NCOLS),
`ifdef PF
        .nrows     (PF_HEIGHT),         // SENSOR12BITS_NROWS),
`else
        .nrows     (FULL_HEIGHT),       // SENSOR12BITS_NROWS),
`endif        
        .nrowb     (BLANK_ROWS_BEFORE), // SENSOR12BITS_NROWB),
        .nrowa     (BLANK_ROWS_AFTER),  // SENSOR12BITS_NROWA),
//        .nAV(24),
        .nbpf      (0), // SENSOR12BITS_NBPF),
        .ngp1      (SENSOR12BITS_NGPL),
        .nVLO      (SENSOR12BITS_NVLO),
        .tMD       (SENSOR12BITS_TMD),
        .tDDO      (SENSOR12BITS_TDDO),
        .tDDO1     (SENSOR12BITS_TDDO1),
        .trigdly   (TRIG_LINES), // SENSOR12BITS_TRIGDLY),
        .ramp      (0),// SENSOR12BITS_RAMP),
        .new_bayer (0), // was 1SENSOR12BITS_NEW_BAYER)
        .EXTRA_PERIOD(120)
    ) simul_sensor12bits_4_i (
        .MCLK  (PX4_MCLK), // input 
        .MRST  (PX4_MRST), // input 
        .ARO   (PX4_ARO),  // input 
        .ARST  (PX4_ARST), // input 
        .OE    (1'b0),     // input output enable active low
        .SCL   (sns4_scl), // input 
        .SDA   (sns4_sda), // inout 
        .OFST  (PX4_OFST), // input 
        .D     (PX4_D),    // output[11:0] 
        .DCLK  (PX4_DCLK), // output 
        .BPF   (),         // output 
        .HACT  (PX4_HACT), // output 
        .VACT  (PX4_VACT), // output 
        .VACT1 () // output 
    );
/*
    sim_soc_interrupts #(
        .NUM_INTERRUPTS (NUM_INTERRUPTS)
    ) sim_soc_interrupts_i (
        .clk            (CLK),       // input
        .rst            (RST_CLEAN), // input
        .irq_en         (IRQ_EN),    // input
        .irqm           (IRQ_M),     // input[7:0] 
        .irq            (IRQ_R),     // input[7:0] 
        .irq_done       (IRQ_DONE),  // input[7:0] @ clk (>=1 cycle) - reset inta bits 
        .irqs           (IRQ_S),     // output[7:0] 
        .inta           (IRQ_ACKN),  // output[7:0] 
        .main_go        (MAIN_GO)    // output
    );
*/
// Initilize simulation

`ifndef ROOTPATH
    `define ROOTPATH "."
`endif
    
`define DATAPATH "input_data"
    initial begin
            $dumpfile(fstname);
          // SuppressWarnings VEditor : assigned in $readmem() system task
            $dumpvars(0,x393_dut);
        $display(`ROOTPATH);
        $display({`ROOTPATH,"/",`DATAPATH});
        
//        RST_CLEAN = 1;
        RST = 1'bx;
        $display("%t %s:%d RST=1'bx",$time,`__FILE__,`__LINE__); 
        #500;
        RST = 1'b1;
        $display("%t %s:%d RST=1'b1",$time,`__FILE__,`__LINE__); 
        #9000; // same as glbl
        repeat (20) @(posedge CLK) ;
        RST =1'b0;
        $display("%t %s:%d RST=1'b0",$time,`__FILE__,`__LINE__); 
        @(posedge CLK) ;
//        RST_CLEAN = 0;
//        $display("%t %s:%d RST_CLEAN=1'b0",$time,`__FILE__,`__LINE__); 
    // IRQ-related
    /*
        IRQ_EN = 1;
        IRQ_M = 0;
        IRQ_FRSEQ_DONE = 0;
        IRQ_CMPRS_DONE = 0;
        IRQ_SATA_DONE =  0;
    */    
        #5000;
//    Need to killall vvp      
//        $finish;
    end
//localparam file = `__FILE__;
//localparam line = `__LINE__;
assign x393_i.ps7_i.FCLKCLK=        {4{CLK}};
assign x393_i.ps7_i.FCLKRESETN=     {RST,~RST,RST,~RST};





`define TEST_IMU
`define TEST_EXT_INT

`define ODOMETER_PULSE_6
assign #10 gpio_pins[7] = gpio_pins[8];
`ifndef TEST_IMU
    assign #10 gpio_pins[9] = gpio_pins[6]; 
`endif



`ifdef TEST_IMU
//     localparam X313_WA_IOPINS_EN_IMU_OUT= 'hc0000000;
//     localparam X313_WA_IOPINS_DIS_IMU_OUT='h80000000;  //SuppressThisWarning Veditor UNUSED
//     localparam X313_WA_IMU_CTRL= 'h7f;
    
//     localparam X313_WA_IMU_DATA= 'h7e;
//     localparam X313_RA_IMU_DATA= 'h7e; // read fifo word, advance pointer (32 reads w/o ready check) 
//     localparam X313_RA_IMU_STATUS= 'h7f; // LSB==ready
//     localparam IMU_PERIOD= 'h800; // normal period
//     localparam IMU_AUTO_PERIOD= 'hffff0000; // period defined by IMU ready
 
     localparam IMU_BIT_DURATION= 'h3; // actual F(scl) will be F(xclk)/2/(IMU_BIT_DURATION+1)
     localparam IMU_READY_PERIOD=100000; //100usec
     localparam IMU_NREADY_DURATION=10000; //10usec
     localparam IMU_GPS_BIT_PERIOD='h18; // 20; // serial communication duration of a bit (in system clocks)
// use start of trigger as a timestamp (in async mode to prevent timestamp jitter)
// parameter X313_WA_DCR1_EARLYTRIGEN='hc; //OBSOLETE!
// parameter X313_WA_DCR1_EARLYTRIGDIS='h8;
`endif

`ifdef TEST_IMU

    //wire [11:0] EXT; // bidirectional
    //reg TEST_CPU_WR_OK;
    //reg TEST_CPU_RD_OK;
      reg SERIAL_BIT = 1'b1;
      reg GPS1SEC    = 1'b0;
      reg ODOMETER_PULSE= 1'b1;
      integer SERIAL_DATA_FD; // @SuppressThisWarning VEditor
      reg IMU_DATA_READY;
    
    
      wire IMU_SCL=gpio_pins[0];
      wire IMU_SDA=gpio_pins[1];
      wire IMU_MOSI=gpio_pins[2];
      wire IMU_MISO=gpio_pins[3]; // @SuppressThisWarning VEditor just for simulation
      reg  IMU_EN;
      wire IMU_ACTIVE;            // @SuppressThisWarning VEditor just for simulation
      wire IMU_NMOSI=!IMU_MOSI;
      wire [5:1] IMU_TAPS;
      reg        IMU_LATE_ACKN = 0;
      reg        IMU_SCLK =      1;
      reg        IMU_MOSI_REVA;
      reg        IMU_103695REVA = 1;
      wire       IMU_MOSI_OUT;
      wire       IMU_SCLK_OUT;
      reg        RS232_SENDING_BYTE;   // @SuppressThisWarning VEditor just for simulation
      reg        RS232_SENDING_PAUSE; // @SuppressThisWarning VEditor just for simulation
`endif
`ifdef TEST_EXT_INT      
  initial begin
      #350000;
      ODOMETER_PULSE=1'b0; // first pulse will be missed
      #5000;
      ODOMETER_PULSE=1'b1;
      #50000;
      ODOMETER_PULSE=1'b0;
      #5000;
      ODOMETER_PULSE=1'b1;
      #50000;
      ODOMETER_PULSE=1'b0;
      #5000;
      ODOMETER_PULSE=1'b1;
/*      
      #100000;
      ODOMETER_PULSE=1'b0;
      #5000;
      ODOMETER_PULSE=1'b1;
      #100000;
      ODOMETER_PULSE=1'b0;
      #5000;
      ODOMETER_PULSE=1'b1;
      */
  end
`endif



`ifdef TEST_IMU
  initial begin
    SERIAL_DATA_FD=$fopen({`ROOTPATH,"/input_data/gps_data.dat"},"r"); 
    #10000;
    while (!$feof (SERIAL_DATA_FD)) begin
      repeat (18*IMU_BIT_DURATION) begin  wait (axi_hclk); wait (~axi_hclk);  end // was 20
      send_serial_line;
      send_serial_bit('h0a);
      send_serial_pause; // was not here
      GPS1SEC=1'b1;
      send_serial_line;
      send_serial_bit('h0a);
      GPS1SEC=1'b0;
      send_serial_line;
      send_serial_bit('h0a);
      send_serial_pause;
      send_serial_pause;
      
`ifndef TEST_EXT_INT      
      ODOMETER_PULSE=1'b1;
`endif
      send_serial_pause;

`ifndef TEST_EXT_INT      
      ODOMETER_PULSE=1'b0;
`endif

    end
  end 
`endif


`ifdef TEST_IMU
    
      assign IMU_MOSI_OUT=IMU_103695REVA? IMU_MOSI_REVA : IMU_MOSI;
      assign IMU_SCLK_OUT=IMU_103695REVA?(IMU_SCLK):IMU_SCL;
      always @ (posedge IMU_SDA) begin
        IMU_EN<=IMU_MOSI;
      end
      wire IMU_CS=IMU_103695REVA?!IMU_ACTIVE:!(IMU_EN &&IMU_SDA);
      reg        IMU_MOSI_D;
      always @ (posedge IMU_SCLK_OUT) begin
    //        IMU_MOSI_D<=IMU_MOSI;
        IMU_MOSI_D<=IMU_MOSI_OUT;
      end
      reg [15:0] IMU_LOOPBACK;
      always @ (negedge IMU_SCLK_OUT) begin
        if (!IMU_CS) IMU_LOOPBACK[15:0]<={IMU_LOOPBACK[14:0],IMU_MOSI_D};
        
      end
      assign gpio_pins[3]=IMU_CS?IMU_DATA_READY: IMU_LOOPBACK[15];
      PULLUP  i_IMU_SDA   (.O(IMU_SDA));
      PULLUP  i_IMU_SCL   (.O(IMU_SCL));
      
      initial begin
//        SERIAL_DATA_FD=$fopen("gps_data.dat","r"); 
      end
      
      always begin
       #(IMU_READY_PERIOD-IMU_NREADY_DURATION) IMU_DATA_READY=1'b0;
       #(IMU_NREADY_DURATION)                  IMU_DATA_READY=1'b1;
      end
      assign gpio_pins[4]=SERIAL_BIT;
      assign gpio_pins[5]=GPS1SEC;
`ifdef ODOMETER_PULSE_6
      assign gpio_pins[6]=ODOMETER_PULSE;
`endif
      assign gpio_pins[9]=ODOMETER_PULSE;
      oneshot i_oneshot  (.trigger(IMU_NMOSI),
                          .out(IMU_ACTIVE));
                          
      dly5taps i_dly5taps (.dly_in(IMU_NMOSI),
                           .dly_out(IMU_TAPS[5:1]));
      always @ (negedge IMU_ACTIVE or posedge IMU_TAPS[5])    if (!IMU_ACTIVE)    IMU_LATE_ACKN<= 1'b0; else IMU_LATE_ACKN<= 1'b1;
      always @ (negedge IMU_LATE_ACKN or posedge IMU_TAPS[4]) if (!IMU_LATE_ACKN) IMU_SCLK<= 1'b1;      else IMU_SCLK<= ~IMU_SCLK;
      always @ (negedge IMU_SCLK)  IMU_MOSI_REVA <= IMU_NMOSI;
    
    task send_serial_bit;
      input [7:0] data_byte;
      reg   [7:0] d;
      begin
        RS232_SENDING_BYTE <= 1;
        d <= data_byte;
        wait (axi_hclk); wait (~axi_hclk); 
    // SERIAL_BIT should be 1 here
    // Send start bit    
        SERIAL_BIT <= 1'b0;
        repeat (IMU_GPS_BIT_PERIOD) begin  wait (axi_hclk); wait (~axi_hclk);  end
        // Send 8 data bits, LSB first    
        repeat (8) begin
          SERIAL_BIT <= d[0];
          #1 d[7:0] <= {1'b0,d[7:1]};
          repeat (IMU_GPS_BIT_PERIOD) begin  wait (axi_hclk); wait (~axi_hclk);  end
        end
    // Send stop bit    
        SERIAL_BIT <= 1'b1;
        RS232_SENDING_BYTE <= 0; // before stop bit
        repeat (IMU_GPS_BIT_PERIOD) begin  wait (axi_hclk); wait (~axi_hclk);  end
      end
    endtask  
    
    task send_serial_pause;
      begin
        RS232_SENDING_PAUSE <= 1;
        wait (axi_hclk); wait (~axi_hclk); 
        SERIAL_BIT <= 1'b1;
        repeat (16) begin
          repeat (IMU_GPS_BIT_PERIOD) begin  wait (axi_hclk); wait (~axi_hclk);  end
        end  
        RS232_SENDING_PAUSE <= 0;
      end
    endtask  
    
    //        SERIAL_DATA_FD=$fopen("gps_data.dat","r"); 
    
    task send_serial_line;
      integer char;
      begin
        char=0;
        while (!$feof (SERIAL_DATA_FD) && (char != 'h0a)) begin
          char=$fgetc(SERIAL_DATA_FD);
          send_serial_bit(char);
        end
      end  
    endtask


`endif




endmodule

module oneshot(trigger,
               out);
  input  trigger;
  output out;
  reg    out;
  event  start;
  parameter duration=4000;
  initial out= 0;
  always @ (posedge trigger) begin
    disable timeout;
    #0 -> start;
  end
  always @start
    begin : timeout
      out = 1;
      # duration out = 0;
    end
endmodule

module dly5taps (dly_in,
                dly_out);
  input        dly_in;
  output [5:1] dly_out;
  reg    [5:1] dly_out;
  parameter dly=6; // delay per tap, ns
  always @ (dly_in)     # dly dly_out[1] <= dly_in;
  always @ (dly_out[1]) # dly dly_out[2] <= dly_out[1];
  always @ (dly_out[2]) # dly dly_out[3] <= dly_out[2];
  always @ (dly_out[3]) # dly dly_out[4] <= dly_out[3];
  always @ (dly_out[4]) # dly dly_out[5] <= dly_out[4];
endmodule

//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2010-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2011-04-01 17:11:28 +0100 (Fri, 01 Apr 2011) $
//
//      Revision            : $Revision: 166647 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-------------------------------------------------------------------------
//  Abstract            : Example for File Reader Bus Master
//                         Testbench for the example AHB Lite slave.
//=========================================================================--

`timescale 1ns/1ps

module tb_frbm_example;

parameter CLK_PERIOD = 10;
parameter ADDRWIDTH = 12;

parameter InputFileName = "frbm_example.out";
parameter MessageTag = "FileReader:";
parameter StimArraySize = 5000;


//********************************************************************************
// Internal Wires
//********************************************************************************

// AHB Lite BUS SIGNALS
wire             hready;
wire             hresp;
wire [31:0]      hrdata;

wire [1:0]       htrans;
wire [2:0]       hburst;
wire [3:0]       hprot;
wire [2:0]       hsize;
wire             hwrite;
wire             hmastlock;
wire [31:0]      haddr;
wire [31:0]      hwdata;

// AHB Multiplexor signals, currently 3 slaves : example AHB slave, SRAM and default slave
wire             hsel0;
wire             hreadyout0;
wire             hresp0;
wire [31:0]      hrdata0;

wire             hsel1;
wire             hreadyout1;
wire             hresp1;
wire [31:0]      hrdata1;

wire             hsel2;
wire             hreadyout2;
wire             hresp2;
wire [31:0]      hrdata2;

reg              HCLK;
reg              HRESETn;

//********************************************************************************
// Clock and reset generation
//********************************************************************************

initial
  begin
    HRESETn = 1'b0;
    HCLK    = 1'b0;
    # (10*CLK_PERIOD);
    HRESETn = 1'b1;
  end

always
  begin
    HCLK = #(CLK_PERIOD/2) ~HCLK;
  end


//********************************************************************************
// Address decoder, need to be changed for other configuration
//********************************************************************************
// 0x10000000 - 0x10000FFF : HSEL #0 - Example AHB slave
// 0x11000000 - 0x11000FFF : HSEL #1 - SRAM
// Other addresses         : HSEL #2 - Default slave

  assign hsel0 = (haddr[31:12] == 20'h10000)? 1'b1:1'b0;
  assign hsel1 = (haddr[31:12] == 20'h11000)? 1'b1:1'b0;
  assign hsel2 = (hsel0|hsel1)? 1'b0:1'b1;

//********************************************************************************
// File read bus master:
// generate AHB Master signal by reading a file which store the AHB Operations
//********************************************************************************

ahb_fileread_master32
  #(.InputFileName(InputFileName), .MessageTag(MessageTag),.StimArraySize(StimArraySize))
  u_ahb_fileread_master32(

  .HCLK            (HCLK),
  .HRESETn         (HRESETn),

  .HREADY          (hready),
  .HRESP           ({hresp}),  //AHB Lite response to AHB response
  .HRDATA          (hrdata),
  .EXRESP          (1'b0),     //  Exclusive response (tie low if not used)


  .HTRANS          (htrans),
  .HBURST          (hburst),
  .HPROT           (hprot),
  .EXREQ           (),        //  Exclusive access request (not used)
  .MEMATTR         (),        //  Memory attribute (not used)
  .HSIZE           (hsize),
  .HWRITE          (hwrite),
  .HMASTLOCK       (hmastlock),
  .HADDR           (haddr),
  .HWDATA          (hwdata),

  .LINENUM         ()

  );


//********************************************************************************
// Slave multiplexer module:
//  multiplex the slave signals to master, three ports are enabled
//********************************************************************************

 ahb_slave_mux  #(
   .PORT0_ENABLE(1),
   .PORT1_ENABLE(1),
   .PORT2_ENABLE(1),
   .PORT3_ENABLE(0),
   .PORT4_ENABLE(0),
   .PORT5_ENABLE(0),
   .PORT6_ENABLE(0),
   .PORT7_ENABLE(0)
  )
 u_ahb_slave_mux (
  .HCLK        (HCLK),
  .HRESETn     (HRESETn),
  .HREADY      (hready),
  .HSEL0       (hsel0),      // Input Port 0
  .HREADYOUT0  (hreadyout0),
  .HRESP0      (hresp0),
  .HRDATA0     (hrdata0),
  .HSEL1       (hsel1),      // Input Port 1
  .HREADYOUT1  (hreadyout1),
  .HRESP1      (hresp1),
  .HRDATA1     (hrdata1),
  .HSEL2       (hsel2),      // Input Port 2
  .HREADYOUT2  (hreadyout2),
  .HRESP2      (hresp2),
  .HRDATA2     (hrdata2),
  .HSEL3       (1'b0),      // Input Port 3
  .HREADYOUT3  (),
  .HRESP3      (),
  .HRDATA3     (),
  .HSEL4       (1'b0),      // Input Port 4
  .HREADYOUT4  (),
  .HRESP4      (),
  .HRDATA4     (),
  .HSEL5       (1'b0),      // Input Port 5
  .HREADYOUT5  (),
  .HRESP5      (),
  .HRDATA5     (),
  .HSEL6       (1'b0),      // Input Port 6
  .HREADYOUT6  (),
  .HRESP6      (),
  .HRDATA6     (),
  .HSEL7       (1'b0),      // Input Port 7
  .HREADYOUT7  (),
  .HRESP7      (),
  .HRDATA7     (),

  .HREADYOUT   (hready),     // Outputs
  .HRESP       (hresp),
  .HRDATA      (hrdata)
  );


//********************************************************************************
// Slave module 1: example AHB slave module
//********************************************************************************
  ahb_eg_slave #(.ADDRWIDTH(ADDRWIDTH))
  u_ahb_eg_slave(
  .HCLK        (HCLK),
  .HRESETn     (HRESETn),

  //  Input slave port: 32 bit data bus interface
  .HSELS       (hsel0),
  .HADDRS      (haddr[ADDRWIDTH-1:0]),
  .HTRANSS     (htrans),
  .HSIZES      (hsize),
  .HWRITES     (hwrite),
  .HREADYS     (hready),
  .HWDATAS     (hwdata),
  .ECOREVNUM   (4'h0),

  .HREADYOUTS  (hreadyout0),
  .HRESPS      (hresp0),
  .HRDATAS     (hrdata0)

  );

//********************************************************************************
// Slave module 2: Behaviour AHB SRAM slave module
//********************************************************************************

   // Behavioral SRAM model
  ahb_ram_beh
  #(.AW(20),
    .filename(""),
    .WS_N(5), // First access wait state
    .WS_S(5)  // Subsequent access wait state
    )
  u_ahb_ram_beh (
    .HCLK       (HCLK),
    .HRESETn    (HRESETn),
    .HSEL       (hsel1),  // AHB inputs
    .HADDR      (haddr[19:0]),
    .HTRANS     (htrans),
    .HSIZE      (hsize),
    .HWRITE     (hwrite),
    .HWDATA     (hwdata),
    .HREADY     (hready),

    .HREADYOUT  (hreadyout1), // Outputs
    .HRDATA     (hrdata1),
    .HRESP      (hresp1)
  );


//********************************************************************************
// Slave module 3: AHB default slave module
//********************************************************************************
 ahb_default_slave  u_ahb_default_slave(
  .HCLK         (HCLK),
  .HRESETn      (HRESETn),
  .HSEL         (hsel2),
  .HTRANS       (htrans),
  .HREADY       (hready),
  .HREADYOUT    (hreadyout2),
  .HRESP        (hresp2)
  );

 assign hrdata2 = {32{1'b0}}; // Default slave don't have data

 endmodule




// This program was cloned from: https://github.com/sam210723/fpga
// License: MIT License

////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: top_synthesis.v
// /___/   /\     Timestamp: Tue Jul 21 21:18:46 2020
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim top.ngc top_synthesis.v 
// Device	: xc6slx9-2-csg324
// Input file	: top.ngc
// Output file	: \\vmware-host\shared folders\Shared\ISE Projects\sfp\netgen\synthesis\top_synthesis.v
// # of Modules	: 1
// Design Name	: top
// Xilinx        : C:\Xilinx\14.7\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module top (
  SFP0_DETECT, SFP0_LOS, LED, SevenSegmentEnable
);
  input SFP0_DETECT;
  input SFP0_LOS;
  output [7 : 0] LED;
  output [2 : 0] SevenSegmentEnable;
  wire SFP0_DETECT_IBUF_0;
  wire LED_6_OBUF_1;
  wire LED_7_OBUF_2;
  wire SevenSegmentEnable_0_OBUF_3;
  wire LED_0_OBUF_4;
  VCC   XST_VCC (
    .P(SevenSegmentEnable_0_OBUF_3)
  );
  GND   XST_GND (
    .G(LED_0_OBUF_4)
  );
  IBUF   SFP0_DETECT_IBUF (
    .I(SFP0_DETECT),
    .O(SFP0_DETECT_IBUF_0)
  );
  IBUF   SFP0_LOS_IBUF (
    .I(SFP0_LOS),
    .O(LED_6_OBUF_1)
  );
  OBUF   LED_7_OBUF (
    .I(LED_7_OBUF_2),
    .O(LED[7])
  );
  OBUF   LED_6_OBUF (
    .I(LED_6_OBUF_1),
    .O(LED[6])
  );
  OBUF   LED_5_OBUF (
    .I(LED_0_OBUF_4),
    .O(LED[5])
  );
  OBUF   LED_4_OBUF (
    .I(LED_0_OBUF_4),
    .O(LED[4])
  );
  OBUF   LED_3_OBUF (
    .I(LED_0_OBUF_4),
    .O(LED[3])
  );
  OBUF   LED_2_OBUF (
    .I(LED_0_OBUF_4),
    .O(LED[2])
  );
  OBUF   LED_1_OBUF (
    .I(LED_0_OBUF_4),
    .O(LED[1])
  );
  OBUF   LED_0_OBUF (
    .I(LED_0_OBUF_4),
    .O(LED[0])
  );
  OBUF   SevenSegmentEnable_2_OBUF (
    .I(SevenSegmentEnable_0_OBUF_3),
    .O(SevenSegmentEnable[2])
  );
  OBUF   SevenSegmentEnable_1_OBUF (
    .I(SevenSegmentEnable_0_OBUF_3),
    .O(SevenSegmentEnable[1])
  );
  OBUF   SevenSegmentEnable_0_OBUF (
    .I(SevenSegmentEnable_0_OBUF_3),
    .O(SevenSegmentEnable[0])
  );
  INV   \LED<7>1_INV_0  (
    .I(SFP0_DETECT_IBUF_0),
    .O(LED_7_OBUF_2)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif


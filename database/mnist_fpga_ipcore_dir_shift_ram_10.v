////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: shift_ram_10.v
// /___/   /\     Timestamp: Mon Jul 17 09:45:19 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/zd/Desktop/mnist_fpga/sd_ddr_vga/ipcore_dir/tmp/_cg/shift_ram_10.ngc C:/Users/zd/Desktop/mnist_fpga/sd_ddr_vga/ipcore_dir/tmp/_cg/shift_ram_10.v 
// Device	: 6slx45csg324-2
// Input file	: C:/Users/zd/Desktop/mnist_fpga/sd_ddr_vga/ipcore_dir/tmp/_cg/shift_ram_10.ngc
// Output file	: C:/Users/zd/Desktop/mnist_fpga/sd_ddr_vga/ipcore_dir/tmp/_cg/shift_ram_10.v
// # of Modules	: 1
// Design Name	: shift_ram_10
// Xilinx        : D:\Xilinx\14.7\ISE_DS\ISE\
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

module shift_ram_10 (
  clk, d, q
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input [8 : 0] d;
  output [8 : 0] q;
  
  // synthesis translate_off
  
  wire \blk00000001/blk00000002/sig00000031 ;
  wire \blk00000001/blk00000002/sig00000030 ;
  wire \blk00000001/blk00000002/sig0000002f ;
  wire \blk00000001/blk00000002/sig0000002e ;
  wire \blk00000001/blk00000002/sig0000002d ;
  wire \blk00000001/blk00000002/sig0000002c ;
  wire \blk00000001/blk00000002/sig0000002b ;
  wire \blk00000001/blk00000002/sig0000002a ;
  wire \blk00000001/blk00000002/sig00000029 ;
  wire \blk00000001/blk00000002/sig00000028 ;
  wire \blk00000001/blk00000002/sig00000027 ;
  wire \NLW_blk00000001/blk00000002/blk00000015_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000002/blk00000013_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000002/blk00000011_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000002/blk0000000f_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000002/blk0000000d_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000002/blk0000000b_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000002/blk00000009_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000002/blk00000007_Q15_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000002/blk00000005_Q15_UNCONNECTED ;
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk00000016  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig00000031 ),
    .Q(q[8])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000002/blk00000015  (
    .A0(\blk00000001/blk00000002/sig00000027 ),
    .A1(\blk00000001/blk00000002/sig00000027 ),
    .A2(\blk00000001/blk00000002/sig00000027 ),
    .A3(\blk00000001/blk00000002/sig00000028 ),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .CLK(clk),
    .D(d[8]),
    .Q(\blk00000001/blk00000002/sig00000031 ),
    .Q15(\NLW_blk00000001/blk00000002/blk00000015_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk00000014  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig00000030 ),
    .Q(q[7])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000002/blk00000013  (
    .A0(\blk00000001/blk00000002/sig00000027 ),
    .A1(\blk00000001/blk00000002/sig00000027 ),
    .A2(\blk00000001/blk00000002/sig00000027 ),
    .A3(\blk00000001/blk00000002/sig00000028 ),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .CLK(clk),
    .D(d[7]),
    .Q(\blk00000001/blk00000002/sig00000030 ),
    .Q15(\NLW_blk00000001/blk00000002/blk00000013_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk00000012  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig0000002f ),
    .Q(q[6])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000002/blk00000011  (
    .A0(\blk00000001/blk00000002/sig00000027 ),
    .A1(\blk00000001/blk00000002/sig00000027 ),
    .A2(\blk00000001/blk00000002/sig00000027 ),
    .A3(\blk00000001/blk00000002/sig00000028 ),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .CLK(clk),
    .D(d[6]),
    .Q(\blk00000001/blk00000002/sig0000002f ),
    .Q15(\NLW_blk00000001/blk00000002/blk00000011_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk00000010  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig0000002e ),
    .Q(q[5])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000002/blk0000000f  (
    .A0(\blk00000001/blk00000002/sig00000027 ),
    .A1(\blk00000001/blk00000002/sig00000027 ),
    .A2(\blk00000001/blk00000002/sig00000027 ),
    .A3(\blk00000001/blk00000002/sig00000028 ),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .CLK(clk),
    .D(d[5]),
    .Q(\blk00000001/blk00000002/sig0000002e ),
    .Q15(\NLW_blk00000001/blk00000002/blk0000000f_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk0000000e  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig0000002d ),
    .Q(q[4])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000002/blk0000000d  (
    .A0(\blk00000001/blk00000002/sig00000027 ),
    .A1(\blk00000001/blk00000002/sig00000027 ),
    .A2(\blk00000001/blk00000002/sig00000027 ),
    .A3(\blk00000001/blk00000002/sig00000028 ),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .CLK(clk),
    .D(d[4]),
    .Q(\blk00000001/blk00000002/sig0000002d ),
    .Q15(\NLW_blk00000001/blk00000002/blk0000000d_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk0000000c  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig0000002c ),
    .Q(q[3])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000002/blk0000000b  (
    .A0(\blk00000001/blk00000002/sig00000027 ),
    .A1(\blk00000001/blk00000002/sig00000027 ),
    .A2(\blk00000001/blk00000002/sig00000027 ),
    .A3(\blk00000001/blk00000002/sig00000028 ),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .CLK(clk),
    .D(d[3]),
    .Q(\blk00000001/blk00000002/sig0000002c ),
    .Q15(\NLW_blk00000001/blk00000002/blk0000000b_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk0000000a  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig0000002b ),
    .Q(q[1])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000002/blk00000009  (
    .A0(\blk00000001/blk00000002/sig00000027 ),
    .A1(\blk00000001/blk00000002/sig00000027 ),
    .A2(\blk00000001/blk00000002/sig00000027 ),
    .A3(\blk00000001/blk00000002/sig00000028 ),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .CLK(clk),
    .D(d[1]),
    .Q(\blk00000001/blk00000002/sig0000002b ),
    .Q15(\NLW_blk00000001/blk00000002/blk00000009_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk00000008  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig0000002a ),
    .Q(q[0])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000002/blk00000007  (
    .A0(\blk00000001/blk00000002/sig00000027 ),
    .A1(\blk00000001/blk00000002/sig00000027 ),
    .A2(\blk00000001/blk00000002/sig00000027 ),
    .A3(\blk00000001/blk00000002/sig00000028 ),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .CLK(clk),
    .D(d[0]),
    .Q(\blk00000001/blk00000002/sig0000002a ),
    .Q15(\NLW_blk00000001/blk00000002/blk00000007_Q15_UNCONNECTED )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk00000006  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig00000029 ),
    .Q(q[2])
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  \blk00000001/blk00000002/blk00000005  (
    .A0(\blk00000001/blk00000002/sig00000027 ),
    .A1(\blk00000001/blk00000002/sig00000027 ),
    .A2(\blk00000001/blk00000002/sig00000027 ),
    .A3(\blk00000001/blk00000002/sig00000028 ),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .CLK(clk),
    .D(d[2]),
    .Q(\blk00000001/blk00000002/sig00000029 ),
    .Q15(\NLW_blk00000001/blk00000002/blk00000005_Q15_UNCONNECTED )
  );
  VCC   \blk00000001/blk00000002/blk00000004  (
    .P(\blk00000001/blk00000002/sig00000028 )
  );
  GND   \blk00000001/blk00000002/blk00000003  (
    .G(\blk00000001/blk00000002/sig00000027 )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

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

// synthesis translate_on

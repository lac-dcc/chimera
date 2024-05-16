////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: shift_ram_24.v
// /___/   /\     Timestamp: Thu Jul 13 10:08:45 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/zd/Desktop/mnist_fpga/sd_ddr_vga/ipcore_dir/tmp/_cg/shift_ram_24.ngc C:/Users/zd/Desktop/mnist_fpga/sd_ddr_vga/ipcore_dir/tmp/_cg/shift_ram_24.v 
// Device	: 6slx45csg324-2
// Input file	: C:/Users/zd/Desktop/mnist_fpga/sd_ddr_vga/ipcore_dir/tmp/_cg/shift_ram_24.ngc
// Output file	: C:/Users/zd/Desktop/mnist_fpga/sd_ddr_vga/ipcore_dir/tmp/_cg/shift_ram_24.v
// # of Modules	: 1
// Design Name	: shift_ram_24
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

module shift_ram_24 (
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
  wire \NLW_blk00000001/blk00000002/blk00000015_Q31_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000002/blk00000013_Q31_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000002/blk00000011_Q31_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000002/blk0000000f_Q31_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000002/blk0000000d_Q31_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000002/blk0000000b_Q31_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000002/blk00000009_Q31_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000002/blk00000007_Q31_UNCONNECTED ;
  wire \NLW_blk00000001/blk00000002/blk00000005_Q31_UNCONNECTED ;
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk00000016  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig00000031 ),
    .Q(q[8])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \blk00000001/blk00000002/blk00000015  (
    .CLK(clk),
    .D(d[8]),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .Q(\blk00000001/blk00000002/sig00000031 ),
    .Q31(\NLW_blk00000001/blk00000002/blk00000015_Q31_UNCONNECTED ),
    .A({\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 , \blk00000001/blk00000002/sig00000028 , 
\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk00000014  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig00000030 ),
    .Q(q[7])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \blk00000001/blk00000002/blk00000013  (
    .CLK(clk),
    .D(d[7]),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .Q(\blk00000001/blk00000002/sig00000030 ),
    .Q31(\NLW_blk00000001/blk00000002/blk00000013_Q31_UNCONNECTED ),
    .A({\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 , \blk00000001/blk00000002/sig00000028 , 
\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk00000012  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig0000002f ),
    .Q(q[6])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \blk00000001/blk00000002/blk00000011  (
    .CLK(clk),
    .D(d[6]),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .Q(\blk00000001/blk00000002/sig0000002f ),
    .Q31(\NLW_blk00000001/blk00000002/blk00000011_Q31_UNCONNECTED ),
    .A({\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 , \blk00000001/blk00000002/sig00000028 , 
\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk00000010  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig0000002e ),
    .Q(q[5])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \blk00000001/blk00000002/blk0000000f  (
    .CLK(clk),
    .D(d[5]),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .Q(\blk00000001/blk00000002/sig0000002e ),
    .Q31(\NLW_blk00000001/blk00000002/blk0000000f_Q31_UNCONNECTED ),
    .A({\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 , \blk00000001/blk00000002/sig00000028 , 
\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk0000000e  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig0000002d ),
    .Q(q[4])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \blk00000001/blk00000002/blk0000000d  (
    .CLK(clk),
    .D(d[4]),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .Q(\blk00000001/blk00000002/sig0000002d ),
    .Q31(\NLW_blk00000001/blk00000002/blk0000000d_Q31_UNCONNECTED ),
    .A({\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 , \blk00000001/blk00000002/sig00000028 , 
\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk0000000c  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig0000002c ),
    .Q(q[3])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \blk00000001/blk00000002/blk0000000b  (
    .CLK(clk),
    .D(d[3]),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .Q(\blk00000001/blk00000002/sig0000002c ),
    .Q31(\NLW_blk00000001/blk00000002/blk0000000b_Q31_UNCONNECTED ),
    .A({\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 , \blk00000001/blk00000002/sig00000028 , 
\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk0000000a  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig0000002b ),
    .Q(q[1])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \blk00000001/blk00000002/blk00000009  (
    .CLK(clk),
    .D(d[1]),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .Q(\blk00000001/blk00000002/sig0000002b ),
    .Q31(\NLW_blk00000001/blk00000002/blk00000009_Q31_UNCONNECTED ),
    .A({\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 , \blk00000001/blk00000002/sig00000028 , 
\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk00000008  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig0000002a ),
    .Q(q[0])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \blk00000001/blk00000002/blk00000007  (
    .CLK(clk),
    .D(d[0]),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .Q(\blk00000001/blk00000002/sig0000002a ),
    .Q31(\NLW_blk00000001/blk00000002/blk00000007_Q31_UNCONNECTED ),
    .A({\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 , \blk00000001/blk00000002/sig00000028 , 
\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 })
  );
  FDE #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000002/blk00000006  (
    .C(clk),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .D(\blk00000001/blk00000002/sig00000029 ),
    .Q(q[2])
  );
  SRLC32E #(
    .INIT ( 32'h00000000 ))
  \blk00000001/blk00000002/blk00000005  (
    .CLK(clk),
    .D(d[2]),
    .CE(\blk00000001/blk00000002/sig00000028 ),
    .Q(\blk00000001/blk00000002/sig00000029 ),
    .Q31(\NLW_blk00000001/blk00000002/blk00000005_Q31_UNCONNECTED ),
    .A({\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 , \blk00000001/blk00000002/sig00000028 , 
\blk00000001/blk00000002/sig00000028 , \blk00000001/blk00000002/sig00000027 })
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

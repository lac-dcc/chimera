////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.20131013
//  \   \         Application: netgen
//  /   /         Filename: dsp.v
// /___/   /\     Timestamp: Tue Jul 11 20:45:34 2017
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog C:/Users/zd/Desktop/mnist_fpga/sd_ddr_vga/ipcore_dir/tmp/_cg/dsp.ngc C:/Users/zd/Desktop/mnist_fpga/sd_ddr_vga/ipcore_dir/tmp/_cg/dsp.v 
// Device	: 6slx45csg324-2
// Input file	: C:/Users/zd/Desktop/mnist_fpga/sd_ddr_vga/ipcore_dir/tmp/_cg/dsp.ngc
// Output file	: C:/Users/zd/Desktop/mnist_fpga/sd_ddr_vga/ipcore_dir/tmp/_cg/dsp.v
// # of Modules	: 1
// Design Name	: dsp
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

module dsp (
  clk, a, b, c, p
)/* synthesis syn_black_box syn_noprune=1 */;
  input clk;
  input [17 : 0] a;
  input [17 : 0] b;
  input [47 : 0] c;
  output [47 : 0] p;
  
  // synthesis translate_off
  
  wire \blk00000001/sig00000142 ;
  wire \blk00000001/sig00000141 ;
  wire \blk00000001/sig00000140 ;
  wire \blk00000001/sig0000013f ;
  wire \blk00000001/sig0000013e ;
  wire \blk00000001/sig0000013d ;
  wire \blk00000001/sig0000013c ;
  wire \blk00000001/sig0000013b ;
  wire \blk00000001/sig0000013a ;
  wire \blk00000001/sig00000139 ;
  wire \blk00000001/sig00000138 ;
  wire \blk00000001/sig00000137 ;
  wire \blk00000001/sig00000136 ;
  wire \blk00000001/sig00000135 ;
  wire \blk00000001/sig00000134 ;
  wire \blk00000001/sig00000133 ;
  wire \blk00000001/sig00000132 ;
  wire \blk00000001/sig00000131 ;
  wire \blk00000001/sig00000130 ;
  wire \blk00000001/sig0000012f ;
  wire \blk00000001/sig0000012e ;
  wire \blk00000001/sig0000012d ;
  wire \blk00000001/sig0000012c ;
  wire \blk00000001/sig0000012b ;
  wire \blk00000001/sig0000012a ;
  wire \blk00000001/sig00000129 ;
  wire \blk00000001/sig00000128 ;
  wire \blk00000001/sig00000127 ;
  wire \blk00000001/sig00000126 ;
  wire \blk00000001/sig00000125 ;
  wire \blk00000001/sig00000124 ;
  wire \blk00000001/sig00000123 ;
  wire \blk00000001/sig00000122 ;
  wire \blk00000001/sig00000121 ;
  wire \blk00000001/sig00000120 ;
  wire \blk00000001/sig0000011f ;
  wire \blk00000001/sig0000011e ;
  wire \blk00000001/sig0000011d ;
  wire \blk00000001/sig0000011c ;
  wire \blk00000001/sig0000011b ;
  wire \blk00000001/sig0000011a ;
  wire \blk00000001/sig00000119 ;
  wire \blk00000001/sig00000118 ;
  wire \blk00000001/sig00000117 ;
  wire \blk00000001/sig00000116 ;
  wire \blk00000001/sig00000115 ;
  wire \blk00000001/sig00000114 ;
  wire \blk00000001/sig00000113 ;
  wire \blk00000001/sig00000112 ;
  wire \blk00000001/sig00000111 ;
  wire \blk00000001/sig00000110 ;
  wire \blk00000001/sig0000010f ;
  wire \blk00000001/sig0000010e ;
  wire \blk00000001/sig0000010d ;
  wire \blk00000001/sig0000010c ;
  wire \blk00000001/sig0000010b ;
  wire \blk00000001/sig0000010a ;
  wire \blk00000001/sig00000109 ;
  wire \blk00000001/sig00000108 ;
  wire \blk00000001/sig00000107 ;
  wire \blk00000001/sig00000106 ;
  wire \blk00000001/sig00000105 ;
  wire \blk00000001/sig00000104 ;
  wire \blk00000001/sig00000103 ;
  wire \blk00000001/sig00000102 ;
  wire \blk00000001/sig00000101 ;
  wire \blk00000001/sig00000100 ;
  wire \blk00000001/sig000000ff ;
  wire \blk00000001/sig000000fe ;
  wire \blk00000001/sig000000fd ;
  wire \blk00000001/sig000000fc ;
  wire \blk00000001/sig000000fb ;
  wire \blk00000001/sig000000fa ;
  wire \blk00000001/sig000000f9 ;
  wire \blk00000001/sig000000f8 ;
  wire \blk00000001/sig000000f7 ;
  wire \blk00000001/sig000000f6 ;
  wire \blk00000001/sig000000f5 ;
  wire \blk00000001/sig000000f4 ;
  wire \blk00000001/sig000000f3 ;
  wire \blk00000001/sig000000f2 ;
  wire \blk00000001/sig000000f1 ;
  wire \blk00000001/sig000000f0 ;
  wire \blk00000001/sig000000ef ;
  wire \blk00000001/sig000000ee ;
  wire \blk00000001/sig000000ed ;
  wire \blk00000001/sig000000ec ;
  wire \blk00000001/sig000000eb ;
  wire \blk00000001/sig000000ea ;
  wire \blk00000001/sig000000e9 ;
  wire \blk00000001/sig000000e8 ;
  wire \blk00000001/sig000000e7 ;
  wire \blk00000001/sig000000e6 ;
  wire \blk00000001/sig000000e5 ;
  wire \blk00000001/sig000000e4 ;
  wire \blk00000001/sig000000e3 ;
  wire \blk00000001/sig000000e2 ;
  wire \blk00000001/sig000000e1 ;
  wire \blk00000001/sig000000e0 ;
  wire \blk00000001/sig000000df ;
  wire \blk00000001/sig000000de ;
  wire \blk00000001/sig000000dd ;
  wire \blk00000001/sig000000dc ;
  wire \blk00000001/sig000000db ;
  wire \blk00000001/sig000000da ;
  wire \blk00000001/sig000000d9 ;
  wire \blk00000001/sig000000d8 ;
  wire \blk00000001/sig000000d7 ;
  wire \blk00000001/sig000000d6 ;
  wire \blk00000001/sig000000d5 ;
  wire \blk00000001/sig000000d4 ;
  wire \blk00000001/sig000000d3 ;
  wire \blk00000001/sig000000d2 ;
  wire \blk00000001/sig000000d1 ;
  wire \blk00000001/sig000000d0 ;
  wire \blk00000001/sig000000cf ;
  wire \blk00000001/sig000000ce ;
  wire \blk00000001/sig000000cd ;
  wire \blk00000001/sig000000cc ;
  wire \blk00000001/sig000000cb ;
  wire \blk00000001/sig000000ca ;
  wire \blk00000001/sig000000c9 ;
  wire \blk00000001/sig000000c8 ;
  wire \blk00000001/sig00000097 ;
  wire \blk00000001/sig00000096 ;
  wire \blk00000001/sig00000095 ;
  wire \blk00000001/sig00000094 ;
  wire \blk00000001/sig00000093 ;
  wire \blk00000001/sig00000092 ;
  wire \blk00000001/sig00000091 ;
  wire \blk00000001/sig00000090 ;
  wire \blk00000001/sig0000008f ;
  wire \blk00000001/sig0000008e ;
  wire \blk00000001/sig0000008d ;
  wire \blk00000001/sig0000008c ;
  wire \blk00000001/sig0000008b ;
  wire \blk00000001/sig0000008a ;
  wire \blk00000001/sig00000089 ;
  wire \blk00000001/sig00000088 ;
  wire \blk00000001/sig00000087 ;
  wire \blk00000001/sig00000086 ;
  wire \blk00000001/sig00000085 ;
  wire \blk00000001/sig00000084 ;
  wire \blk00000001/sig00000083 ;
  wire \blk00000001/sig00000082 ;
  wire \blk00000001/sig00000081 ;
  wire \blk00000001/sig00000080 ;
  wire \blk00000001/sig0000007f ;
  wire \blk00000001/sig0000007e ;
  wire \blk00000001/sig0000007d ;
  wire \blk00000001/sig0000007c ;
  wire \blk00000001/sig0000007b ;
  wire \blk00000001/sig0000007a ;
  wire \blk00000001/sig00000079 ;
  wire \blk00000001/sig00000078 ;
  wire \blk00000001/sig00000077 ;
  wire \blk00000001/sig00000076 ;
  wire \blk00000001/sig00000075 ;
  wire \blk00000001/sig00000074 ;
  wire \blk00000001/sig00000073 ;
  wire \blk00000001/sig00000072 ;
  wire \blk00000001/sig00000071 ;
  wire \blk00000001/sig00000070 ;
  wire \blk00000001/sig0000006f ;
  wire \blk00000001/sig0000006e ;
  wire \blk00000001/sig0000006d ;
  wire \blk00000001/sig0000006c ;
  wire \blk00000001/sig0000006b ;
  wire \blk00000001/sig0000006a ;
  wire \blk00000001/sig00000069 ;
  wire \blk00000001/sig00000068 ;
  wire \blk00000001/sig00000067 ;
  wire \blk00000001/sig00000066 ;
  wire \blk00000001/sig00000065 ;
  wire \blk00000001/sig00000064 ;
  wire \blk00000001/sig00000063 ;
  wire \blk00000001/sig00000062 ;
  wire \blk00000001/sig00000061 ;
  wire \blk00000001/sig00000060 ;
  wire \blk00000001/sig0000005f ;
  wire \blk00000001/sig0000005e ;
  wire \blk00000001/sig0000005d ;
  wire \blk00000001/sig0000005c ;
  wire \blk00000001/sig0000005b ;
  wire \blk00000001/sig0000005a ;
  wire \blk00000001/sig00000059 ;
  wire \blk00000001/sig00000058 ;
  wire \blk00000001/sig00000057 ;
  wire \blk00000001/sig00000056 ;
  wire \NLW_blk00000001/blk0000007b_M<35>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<34>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<33>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<32>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<31>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<30>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<29>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<28>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<27>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<26>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<25>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<24>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<23>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<22>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<21>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<20>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<19>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<18>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<17>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<16>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<15>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<14>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<13>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<12>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<11>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<10>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<9>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<8>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<7>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<6>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<5>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<4>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<3>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<2>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<1>_UNCONNECTED ;
  wire \NLW_blk00000001/blk0000007b_M<0>_UNCONNECTED ;
  DSP48A1 #(
    .A0REG ( 1 ),
    .A1REG ( 1 ),
    .B0REG ( 1 ),
    .B1REG ( 1 ),
    .CARRYINREG ( 1 ),
    .CARRYINSEL ( "OPMODE5" ),
    .CARRYOUTREG ( 1 ),
    .CREG ( 1 ),
    .DREG ( 1 ),
    .MREG ( 1 ),
    .OPMODEREG ( 0 ),
    .PREG ( 1 ),
    .RSTTYPE ( "SYNC" ))
  \blk00000001/blk0000007b  (
    .CECARRYIN(\blk00000001/sig000000ca ),
    .RSTC(\blk00000001/sig000000cc ),
    .RSTCARRYIN(\blk00000001/sig000000cc ),
    .CED(\blk00000001/sig000000ca ),
    .RSTD(\blk00000001/sig000000cc ),
    .CEOPMODE(\blk00000001/sig000000cc ),
    .CEC(\blk00000001/sig000000ca ),
    .CARRYOUTF(\blk00000001/sig000000c8 ),
    .RSTOPMODE(\blk00000001/sig000000cc ),
    .RSTM(\blk00000001/sig000000cc ),
    .CLK(clk),
    .RSTB(\blk00000001/sig000000cc ),
    .CEM(\blk00000001/sig000000ca ),
    .CEB(\blk00000001/sig000000ca ),
    .CARRYIN(\blk00000001/sig000000cc ),
    .CEP(\blk00000001/sig000000ca ),
    .CEA(\blk00000001/sig000000ca ),
    .CARRYOUT(\blk00000001/sig000000c9 ),
    .RSTA(\blk00000001/sig000000cc ),
    .RSTP(\blk00000001/sig000000cc ),
    .B({a[17], a[16], a[15], a[14], a[13], a[12], a[11], a[10], a[9], a[8], a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0]}),
    .BCOUT({\blk00000001/sig00000056 , \blk00000001/sig00000057 , \blk00000001/sig00000058 , \blk00000001/sig00000059 , \blk00000001/sig0000005a , 
\blk00000001/sig0000005b , \blk00000001/sig0000005c , \blk00000001/sig0000005d , \blk00000001/sig0000005e , \blk00000001/sig0000005f , 
\blk00000001/sig00000060 , \blk00000001/sig00000061 , \blk00000001/sig00000062 , \blk00000001/sig00000063 , \blk00000001/sig00000064 , 
\blk00000001/sig00000065 , \blk00000001/sig00000066 , \blk00000001/sig00000067 }),
    .PCIN({\blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , 
\blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , 
\blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , 
\blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , 
\blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , 
\blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , 
\blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , 
\blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , 
\blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , 
\blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc }),
    .C({\blk00000001/sig00000104 , \blk00000001/sig00000103 , \blk00000001/sig00000102 , \blk00000001/sig00000101 , \blk00000001/sig00000100 , 
\blk00000001/sig000000ff , \blk00000001/sig000000fe , \blk00000001/sig000000fd , \blk00000001/sig000000fc , \blk00000001/sig000000fb , 
\blk00000001/sig000000fa , \blk00000001/sig000000f9 , \blk00000001/sig000000f8 , \blk00000001/sig000000f7 , \blk00000001/sig000000f6 , 
\blk00000001/sig000000f5 , \blk00000001/sig000000f4 , \blk00000001/sig000000f3 , \blk00000001/sig000000f2 , \blk00000001/sig000000f1 , 
\blk00000001/sig000000f0 , \blk00000001/sig000000ef , \blk00000001/sig000000ee , \blk00000001/sig000000ed , \blk00000001/sig000000ec , 
\blk00000001/sig000000eb , \blk00000001/sig000000ea , \blk00000001/sig000000e9 , \blk00000001/sig000000e8 , \blk00000001/sig000000e7 , 
\blk00000001/sig000000e6 , \blk00000001/sig000000e5 , \blk00000001/sig000000e4 , \blk00000001/sig000000e3 , \blk00000001/sig000000e2 , 
\blk00000001/sig000000e1 , \blk00000001/sig000000e0 , \blk00000001/sig000000df , \blk00000001/sig000000de , \blk00000001/sig000000dd , 
\blk00000001/sig000000dc , \blk00000001/sig000000db , \blk00000001/sig000000da , \blk00000001/sig000000d9 , \blk00000001/sig000000d8 , 
\blk00000001/sig000000d7 , \blk00000001/sig000000d6 , \blk00000001/sig000000d5 }),
    .P({p[47], p[46], p[45], p[44], p[43], p[42], p[41], p[40], p[39], p[38], p[37], p[36], p[35], p[34], p[33], p[32], p[31], p[30], p[29], p[28], 
p[27], p[26], p[25], p[24], p[23], p[22], p[21], p[20], p[19], p[18], p[17], p[16], p[15], p[14], p[13], p[12], p[11], p[10], p[9], p[8], p[7], p[6], 
p[5], p[4], p[3], p[2], p[1], p[0]}),
    .OPMODE({\blk00000001/sig000000d1 , \blk00000001/sig000000cc , \blk00000001/sig000000cb , \blk00000001/sig000000cc , \blk00000001/sig000000d0 , 
\blk00000001/sig000000cf , \blk00000001/sig000000ce , \blk00000001/sig000000cd }),
    .D({\blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , 
\blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , 
\blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc , 
\blk00000001/sig000000cc , \blk00000001/sig000000cc , \blk00000001/sig000000cc }),
    .PCOUT({\blk00000001/sig00000068 , \blk00000001/sig00000069 , \blk00000001/sig0000006a , \blk00000001/sig0000006b , \blk00000001/sig0000006c , 
\blk00000001/sig0000006d , \blk00000001/sig0000006e , \blk00000001/sig0000006f , \blk00000001/sig00000070 , \blk00000001/sig00000071 , 
\blk00000001/sig00000072 , \blk00000001/sig00000073 , \blk00000001/sig00000074 , \blk00000001/sig00000075 , \blk00000001/sig00000076 , 
\blk00000001/sig00000077 , \blk00000001/sig00000078 , \blk00000001/sig00000079 , \blk00000001/sig0000007a , \blk00000001/sig0000007b , 
\blk00000001/sig0000007c , \blk00000001/sig0000007d , \blk00000001/sig0000007e , \blk00000001/sig0000007f , \blk00000001/sig00000080 , 
\blk00000001/sig00000081 , \blk00000001/sig00000082 , \blk00000001/sig00000083 , \blk00000001/sig00000084 , \blk00000001/sig00000085 , 
\blk00000001/sig00000086 , \blk00000001/sig00000087 , \blk00000001/sig00000088 , \blk00000001/sig00000089 , \blk00000001/sig0000008a , 
\blk00000001/sig0000008b , \blk00000001/sig0000008c , \blk00000001/sig0000008d , \blk00000001/sig0000008e , \blk00000001/sig0000008f , 
\blk00000001/sig00000090 , \blk00000001/sig00000091 , \blk00000001/sig00000092 , \blk00000001/sig00000093 , \blk00000001/sig00000094 , 
\blk00000001/sig00000095 , \blk00000001/sig00000096 , \blk00000001/sig00000097 }),
    .A({b[17], b[16], b[15], b[14], b[13], b[12], b[11], b[10], b[9], b[8], b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0]}),
    .M({\NLW_blk00000001/blk0000007b_M<35>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<34>_UNCONNECTED , 
\NLW_blk00000001/blk0000007b_M<33>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<32>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<31>_UNCONNECTED , 
\NLW_blk00000001/blk0000007b_M<30>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<29>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<28>_UNCONNECTED , 
\NLW_blk00000001/blk0000007b_M<27>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<26>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<25>_UNCONNECTED , 
\NLW_blk00000001/blk0000007b_M<24>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<23>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<22>_UNCONNECTED , 
\NLW_blk00000001/blk0000007b_M<21>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<20>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<19>_UNCONNECTED , 
\NLW_blk00000001/blk0000007b_M<18>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<17>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<16>_UNCONNECTED , 
\NLW_blk00000001/blk0000007b_M<15>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<14>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<13>_UNCONNECTED , 
\NLW_blk00000001/blk0000007b_M<12>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<11>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<10>_UNCONNECTED , 
\NLW_blk00000001/blk0000007b_M<9>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<8>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<7>_UNCONNECTED , 
\NLW_blk00000001/blk0000007b_M<6>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<5>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<4>_UNCONNECTED , 
\NLW_blk00000001/blk0000007b_M<3>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<2>_UNCONNECTED , \NLW_blk00000001/blk0000007b_M<1>_UNCONNECTED , 
\NLW_blk00000001/blk0000007b_M<0>_UNCONNECTED })
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000007a  (
    .C(clk),
    .D(\blk00000001/sig000000cc ),
    .Q(\blk00000001/sig000000cb )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000079  (
    .C(clk),
    .D(\blk00000001/sig000000ca ),
    .Q(\blk00000001/sig000000d2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000078  (
    .C(clk),
    .D(\blk00000001/sig000000ca ),
    .Q(\blk00000001/sig000000d3 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000077  (
    .C(clk),
    .D(\blk00000001/sig000000ca ),
    .Q(\blk00000001/sig000000d4 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000076  (
    .C(clk),
    .D(\blk00000001/sig000000cc ),
    .Q(\blk00000001/sig00000135 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000075  (
    .C(clk),
    .D(\blk00000001/sig000000cc ),
    .Q(\blk00000001/sig00000136 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000074  (
    .C(clk),
    .D(\blk00000001/sig000000cc ),
    .Q(\blk00000001/sig00000137 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000073  (
    .C(clk),
    .D(\blk00000001/sig000000cc ),
    .Q(\blk00000001/sig00000138 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000072  (
    .C(clk),
    .D(\blk00000001/sig000000cc ),
    .Q(\blk00000001/sig00000139 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000071  (
    .C(clk),
    .D(\blk00000001/sig000000cc ),
    .Q(\blk00000001/sig0000013a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000070  (
    .C(clk),
    .D(\blk00000001/sig000000cc ),
    .Q(\blk00000001/sig0000013b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006f  (
    .C(clk),
    .D(\blk00000001/sig000000d2 ),
    .Q(\blk00000001/sig000000cd )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006e  (
    .C(clk),
    .D(\blk00000001/sig000000cc ),
    .Q(\blk00000001/sig000000ce )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006d  (
    .C(clk),
    .D(\blk00000001/sig000000cc ),
    .Q(\blk00000001/sig0000013c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006c  (
    .C(clk),
    .D(\blk00000001/sig000000cc ),
    .Q(\blk00000001/sig0000013d )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006b  (
    .C(clk),
    .D(\blk00000001/sig000000d3 ),
    .Q(\blk00000001/sig000000cf )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000006a  (
    .C(clk),
    .D(\blk00000001/sig000000d4 ),
    .Q(\blk00000001/sig000000d0 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000069  (
    .C(clk),
    .D(\blk00000001/sig000000cc ),
    .Q(\blk00000001/sig0000013e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000068  (
    .C(clk),
    .D(\blk00000001/sig000000cc ),
    .Q(\blk00000001/sig000000d1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000067  (
    .C(clk),
    .D(\blk00000001/sig000000cc ),
    .Q(\blk00000001/sig0000013f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000066  (
    .C(clk),
    .D(\blk00000001/sig000000cc ),
    .Q(\blk00000001/sig00000140 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000065  (
    .C(clk),
    .D(\blk00000001/sig000000cc ),
    .Q(\blk00000001/sig00000141 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000064  (
    .C(clk),
    .D(\blk00000001/sig000000cc ),
    .Q(\blk00000001/sig00000142 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000063  (
    .C(clk),
    .D(c[0]),
    .Q(\blk00000001/sig00000105 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000062  (
    .C(clk),
    .D(c[1]),
    .Q(\blk00000001/sig00000106 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000061  (
    .C(clk),
    .D(c[2]),
    .Q(\blk00000001/sig00000107 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000060  (
    .C(clk),
    .D(c[3]),
    .Q(\blk00000001/sig00000108 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005f  (
    .C(clk),
    .D(c[4]),
    .Q(\blk00000001/sig00000109 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005e  (
    .C(clk),
    .D(c[5]),
    .Q(\blk00000001/sig0000010a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005d  (
    .C(clk),
    .D(c[6]),
    .Q(\blk00000001/sig0000010b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005c  (
    .C(clk),
    .D(c[7]),
    .Q(\blk00000001/sig0000010c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005b  (
    .C(clk),
    .D(c[8]),
    .Q(\blk00000001/sig0000010d )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000005a  (
    .C(clk),
    .D(c[9]),
    .Q(\blk00000001/sig0000010e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000059  (
    .C(clk),
    .D(c[10]),
    .Q(\blk00000001/sig0000010f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000058  (
    .C(clk),
    .D(c[11]),
    .Q(\blk00000001/sig00000110 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000057  (
    .C(clk),
    .D(c[12]),
    .Q(\blk00000001/sig00000111 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000056  (
    .C(clk),
    .D(c[13]),
    .Q(\blk00000001/sig00000112 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000055  (
    .C(clk),
    .D(c[14]),
    .Q(\blk00000001/sig00000113 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000054  (
    .C(clk),
    .D(c[15]),
    .Q(\blk00000001/sig00000114 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000053  (
    .C(clk),
    .D(c[16]),
    .Q(\blk00000001/sig00000115 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000052  (
    .C(clk),
    .D(c[17]),
    .Q(\blk00000001/sig00000116 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000051  (
    .C(clk),
    .D(c[18]),
    .Q(\blk00000001/sig00000117 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000050  (
    .C(clk),
    .D(c[19]),
    .Q(\blk00000001/sig00000118 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004f  (
    .C(clk),
    .D(c[20]),
    .Q(\blk00000001/sig00000119 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004e  (
    .C(clk),
    .D(c[21]),
    .Q(\blk00000001/sig0000011a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004d  (
    .C(clk),
    .D(c[22]),
    .Q(\blk00000001/sig0000011b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004c  (
    .C(clk),
    .D(c[23]),
    .Q(\blk00000001/sig0000011c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004b  (
    .C(clk),
    .D(c[24]),
    .Q(\blk00000001/sig0000011d )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000004a  (
    .C(clk),
    .D(c[25]),
    .Q(\blk00000001/sig0000011e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000049  (
    .C(clk),
    .D(c[26]),
    .Q(\blk00000001/sig0000011f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000048  (
    .C(clk),
    .D(c[27]),
    .Q(\blk00000001/sig00000120 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000047  (
    .C(clk),
    .D(c[28]),
    .Q(\blk00000001/sig00000121 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000046  (
    .C(clk),
    .D(c[29]),
    .Q(\blk00000001/sig00000122 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000045  (
    .C(clk),
    .D(c[30]),
    .Q(\blk00000001/sig00000123 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000044  (
    .C(clk),
    .D(c[31]),
    .Q(\blk00000001/sig00000124 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000043  (
    .C(clk),
    .D(c[32]),
    .Q(\blk00000001/sig00000125 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000042  (
    .C(clk),
    .D(c[33]),
    .Q(\blk00000001/sig00000126 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000041  (
    .C(clk),
    .D(c[34]),
    .Q(\blk00000001/sig00000127 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000040  (
    .C(clk),
    .D(c[35]),
    .Q(\blk00000001/sig00000128 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003f  (
    .C(clk),
    .D(c[36]),
    .Q(\blk00000001/sig00000129 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003e  (
    .C(clk),
    .D(c[37]),
    .Q(\blk00000001/sig0000012a )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003d  (
    .C(clk),
    .D(c[38]),
    .Q(\blk00000001/sig0000012b )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003c  (
    .C(clk),
    .D(c[39]),
    .Q(\blk00000001/sig0000012c )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003b  (
    .C(clk),
    .D(c[40]),
    .Q(\blk00000001/sig0000012d )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000003a  (
    .C(clk),
    .D(c[41]),
    .Q(\blk00000001/sig0000012e )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000039  (
    .C(clk),
    .D(c[42]),
    .Q(\blk00000001/sig0000012f )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000038  (
    .C(clk),
    .D(c[43]),
    .Q(\blk00000001/sig00000130 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000037  (
    .C(clk),
    .D(c[44]),
    .Q(\blk00000001/sig00000131 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000036  (
    .C(clk),
    .D(c[45]),
    .Q(\blk00000001/sig00000132 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000035  (
    .C(clk),
    .D(c[46]),
    .Q(\blk00000001/sig00000133 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000034  (
    .C(clk),
    .D(c[47]),
    .Q(\blk00000001/sig00000134 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000033  (
    .C(clk),
    .D(\blk00000001/sig00000105 ),
    .Q(\blk00000001/sig000000d5 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000032  (
    .C(clk),
    .D(\blk00000001/sig00000106 ),
    .Q(\blk00000001/sig000000d6 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000031  (
    .C(clk),
    .D(\blk00000001/sig00000107 ),
    .Q(\blk00000001/sig000000d7 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000030  (
    .C(clk),
    .D(\blk00000001/sig00000108 ),
    .Q(\blk00000001/sig000000d8 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002f  (
    .C(clk),
    .D(\blk00000001/sig00000109 ),
    .Q(\blk00000001/sig000000d9 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002e  (
    .C(clk),
    .D(\blk00000001/sig0000010a ),
    .Q(\blk00000001/sig000000da )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002d  (
    .C(clk),
    .D(\blk00000001/sig0000010b ),
    .Q(\blk00000001/sig000000db )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002c  (
    .C(clk),
    .D(\blk00000001/sig0000010c ),
    .Q(\blk00000001/sig000000dc )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002b  (
    .C(clk),
    .D(\blk00000001/sig0000010d ),
    .Q(\blk00000001/sig000000dd )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000002a  (
    .C(clk),
    .D(\blk00000001/sig0000010e ),
    .Q(\blk00000001/sig000000de )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000029  (
    .C(clk),
    .D(\blk00000001/sig0000010f ),
    .Q(\blk00000001/sig000000df )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000028  (
    .C(clk),
    .D(\blk00000001/sig00000110 ),
    .Q(\blk00000001/sig000000e0 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000027  (
    .C(clk),
    .D(\blk00000001/sig00000111 ),
    .Q(\blk00000001/sig000000e1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000026  (
    .C(clk),
    .D(\blk00000001/sig00000112 ),
    .Q(\blk00000001/sig000000e2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000025  (
    .C(clk),
    .D(\blk00000001/sig00000113 ),
    .Q(\blk00000001/sig000000e3 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000024  (
    .C(clk),
    .D(\blk00000001/sig00000114 ),
    .Q(\blk00000001/sig000000e4 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000023  (
    .C(clk),
    .D(\blk00000001/sig00000115 ),
    .Q(\blk00000001/sig000000e5 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000022  (
    .C(clk),
    .D(\blk00000001/sig00000116 ),
    .Q(\blk00000001/sig000000e6 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000021  (
    .C(clk),
    .D(\blk00000001/sig00000117 ),
    .Q(\blk00000001/sig000000e7 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000020  (
    .C(clk),
    .D(\blk00000001/sig00000118 ),
    .Q(\blk00000001/sig000000e8 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001f  (
    .C(clk),
    .D(\blk00000001/sig00000119 ),
    .Q(\blk00000001/sig000000e9 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001e  (
    .C(clk),
    .D(\blk00000001/sig0000011a ),
    .Q(\blk00000001/sig000000ea )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001d  (
    .C(clk),
    .D(\blk00000001/sig0000011b ),
    .Q(\blk00000001/sig000000eb )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001c  (
    .C(clk),
    .D(\blk00000001/sig0000011c ),
    .Q(\blk00000001/sig000000ec )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001b  (
    .C(clk),
    .D(\blk00000001/sig0000011d ),
    .Q(\blk00000001/sig000000ed )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000001a  (
    .C(clk),
    .D(\blk00000001/sig0000011e ),
    .Q(\blk00000001/sig000000ee )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000019  (
    .C(clk),
    .D(\blk00000001/sig0000011f ),
    .Q(\blk00000001/sig000000ef )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000018  (
    .C(clk),
    .D(\blk00000001/sig00000120 ),
    .Q(\blk00000001/sig000000f0 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000017  (
    .C(clk),
    .D(\blk00000001/sig00000121 ),
    .Q(\blk00000001/sig000000f1 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000016  (
    .C(clk),
    .D(\blk00000001/sig00000122 ),
    .Q(\blk00000001/sig000000f2 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000015  (
    .C(clk),
    .D(\blk00000001/sig00000123 ),
    .Q(\blk00000001/sig000000f3 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000014  (
    .C(clk),
    .D(\blk00000001/sig00000124 ),
    .Q(\blk00000001/sig000000f4 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000013  (
    .C(clk),
    .D(\blk00000001/sig00000125 ),
    .Q(\blk00000001/sig000000f5 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000012  (
    .C(clk),
    .D(\blk00000001/sig00000126 ),
    .Q(\blk00000001/sig000000f6 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000011  (
    .C(clk),
    .D(\blk00000001/sig00000127 ),
    .Q(\blk00000001/sig000000f7 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000010  (
    .C(clk),
    .D(\blk00000001/sig00000128 ),
    .Q(\blk00000001/sig000000f8 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000f  (
    .C(clk),
    .D(\blk00000001/sig00000129 ),
    .Q(\blk00000001/sig000000f9 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000e  (
    .C(clk),
    .D(\blk00000001/sig0000012a ),
    .Q(\blk00000001/sig000000fa )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000d  (
    .C(clk),
    .D(\blk00000001/sig0000012b ),
    .Q(\blk00000001/sig000000fb )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000c  (
    .C(clk),
    .D(\blk00000001/sig0000012c ),
    .Q(\blk00000001/sig000000fc )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000b  (
    .C(clk),
    .D(\blk00000001/sig0000012d ),
    .Q(\blk00000001/sig000000fd )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk0000000a  (
    .C(clk),
    .D(\blk00000001/sig0000012e ),
    .Q(\blk00000001/sig000000fe )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000009  (
    .C(clk),
    .D(\blk00000001/sig0000012f ),
    .Q(\blk00000001/sig000000ff )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000008  (
    .C(clk),
    .D(\blk00000001/sig00000130 ),
    .Q(\blk00000001/sig00000100 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000007  (
    .C(clk),
    .D(\blk00000001/sig00000131 ),
    .Q(\blk00000001/sig00000101 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000006  (
    .C(clk),
    .D(\blk00000001/sig00000132 ),
    .Q(\blk00000001/sig00000102 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000005  (
    .C(clk),
    .D(\blk00000001/sig00000133 ),
    .Q(\blk00000001/sig00000103 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \blk00000001/blk00000004  (
    .C(clk),
    .D(\blk00000001/sig00000134 ),
    .Q(\blk00000001/sig00000104 )
  );
  GND   \blk00000001/blk00000003  (
    .G(\blk00000001/sig000000cc )
  );
  VCC   \blk00000001/blk00000002  (
    .P(\blk00000001/sig000000ca )
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

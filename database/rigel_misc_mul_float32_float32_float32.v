// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License

////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: P.58f
//  \   \         Application: netgen
//  /   /         Filename: mul_float_float_float.v
// /___/   /\     Timestamp: Wed Jan 27 14:50:49 2016
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog /home/jhegarty/lol/ipcore_dir/tmp/_cg/mul_float_float_float.ngc /home/jhegarty/lol/ipcore_dir/tmp/_cg/mul_float_float_float.v 
// Device	: 7z100ffg900-2
// Input file	: /home/jhegarty/lol/ipcore_dir/tmp/_cg/mul_float_float_float.ngc
// Output file	: /home/jhegarty/lol/ipcore_dir/tmp/_cg/mul_float_float_float.v
// # of Modules	: 1
// Design Name	: mul_float_float_float
// Xilinx        : /opt/Xilinx/14.5/ISE_DS/ISE/
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

module mul_float32_float32_float32 (
  CLK, ce, inp, out
);
         parameter INSTANCE_NAME="INST";
   
  input wire CLK;
  input wire ce;
  input [63 : 0] inp;
  output [31 : 0] out;
  
   wire           clk;
   assign clk=CLK;

   wire [31:0]    a;
   wire [31:0]    b;
   wire [31:0]    result;

   assign a = inp[31:0];
   assign b = inp[63:32];
   assign out = result;
   
   
  
  wire \U0/op_inst/FLT_PT_OP/MULT.OP/OP/sign_op ;
  wire sig00000001;
  wire sig00000002;
  wire sig00000003;
  wire sig00000004;
  wire sig00000005;
  wire sig00000006;
  wire sig00000007;
  wire sig00000008;
  wire sig00000009;
  wire sig0000000a;
  wire sig0000000b;
  wire sig0000000c;
  wire sig0000000d;
  wire sig0000000e;
  wire sig0000000f;
  wire sig00000010;
  wire sig00000011;
  wire sig00000012;
  wire sig00000013;
  wire sig00000014;
  wire sig00000015;
  wire sig00000016;
  wire sig00000017;
  wire sig00000018;
  wire sig00000019;
  wire sig0000001a;
  wire sig0000001b;
  wire sig0000001c;
  wire sig0000001d;
  wire sig0000001e;
  wire sig0000001f;
  wire sig00000020;
  wire sig00000021;
  wire sig00000022;
  wire sig00000023;
  wire sig00000024;
  wire sig00000025;
  wire sig00000026;
  wire sig00000027;
  wire sig00000028;
  wire sig00000029;
  wire sig0000002a;
  wire sig0000002b;
  wire sig0000002c;
  wire sig0000002d;
  wire sig0000002e;
  wire sig0000002f;
  wire sig00000030;
  wire sig00000031;
  wire sig00000032;
  wire sig00000033;
  wire sig00000034;
  wire sig00000035;
  wire sig00000036;
  wire sig00000037;
  wire sig00000038;
  wire sig00000039;
  wire sig0000003a;
  wire sig0000003b;
  wire sig0000003c;
  wire sig0000003d;
  wire sig0000003e;
  wire sig0000003f;
  wire sig00000040;
  wire sig00000041;
  wire sig00000042;
  wire sig00000043;
  wire sig00000044;
  wire sig00000045;
  wire sig00000046;
  wire sig00000047;
  wire sig00000048;
  wire sig00000049;
  wire sig0000004a;
  wire sig0000004b;
  wire sig0000004c;
  wire sig0000004d;
  wire sig0000004e;
  wire sig0000004f;
  wire sig00000050;
  wire sig00000051;
  wire sig00000052;
  wire sig00000053;
  wire sig00000054;
  wire sig00000055;
  wire sig00000056;
  wire sig00000057;
  wire sig00000058;
  wire sig00000059;
  wire sig0000005a;
  wire sig0000005b;
  wire sig0000005c;
  wire sig0000005d;
  wire sig0000005e;
  wire sig0000005f;
  wire sig00000060;
  wire sig00000061;
  wire sig00000062;
  wire sig00000063;
  wire sig00000064;
  wire sig00000065;
  wire sig00000066;
  wire sig00000067;
  wire sig00000068;
  wire sig00000069;
  wire sig0000006a;
  wire sig0000006b;
  wire sig0000006c;
  wire sig0000006d;
  wire sig0000006e;
  wire sig0000006f;
  wire sig00000070;
  wire sig00000071;
  wire sig00000072;
  wire sig00000073;
  wire sig00000074;
  wire sig00000075;
  wire sig00000076;
  wire sig00000077;
  wire sig00000078;
  wire sig00000079;
  wire sig0000007a;
  wire sig0000007b;
  wire sig0000007c;
  wire sig0000007d;
  wire sig0000007e;
  wire sig0000007f;
  wire sig00000080;
  wire sig00000081;
  wire sig00000082;
  wire sig00000083;
  wire sig00000084;
  wire sig00000085;
  wire sig00000086;
  wire sig00000087;
  wire sig00000088;
  wire sig00000089;
  wire sig0000008a;
  wire sig0000008b;
  wire sig0000008c;
  wire sig0000008d;
  wire sig0000008e;
  wire sig0000008f;
  wire sig00000090;
  wire sig00000091;
  wire sig00000092;
  wire sig00000093;
  wire sig00000094;
  wire sig00000095;
  wire sig00000096;
  wire sig00000097;
  wire sig00000098;
  wire sig00000099;
  wire sig0000009a;
  wire sig0000009b;
  wire sig0000009c;
  wire sig0000009d;
  wire sig0000009e;
  wire sig0000009f;
  wire sig000000a0;
  wire sig000000a1;
  wire sig000000a2;
  wire sig000000a3;
  wire sig000000a4;
  wire sig000000a5;
  wire sig000000a6;
  wire sig000000a7;
  wire sig000000a8;
  wire sig000000a9;
  wire sig000000aa;
  wire sig000000ab;
  wire sig000000ac;
  wire sig000000ad;
  wire sig000000ae;
  wire sig000000af;
  wire sig000000b0;
  wire sig000000b1;
  wire sig000000b2;
  wire sig000000b3;
  wire sig000000b4;
  wire sig000000b5;
  wire sig000000b6;
  wire sig000000b7;
  wire sig000000b8;
  wire sig000000b9;
  wire sig000000ba;
  wire sig000000bb;
  wire sig000000bc;
  wire sig000000bd;
  wire sig000000be;
  wire sig000000bf;
  wire sig000000c0;
  wire sig000000c1;
  wire sig000000c2;
  wire sig000000c3;
  wire sig000000c4;
  wire sig000000c5;
  wire sig000000c6;
  wire sig000000c7;
  wire sig000000c8;
  wire sig000000c9;
  wire sig000000ca;
  wire sig000000cb;
  wire sig000000cc;
  wire sig000000cd;
  wire sig000000ce;
  wire sig000000cf;
  wire sig000000d0;
  wire sig000000d1;
  wire sig000000d2;
  wire sig000000d3;
  wire sig000000d4;
  wire sig000000d5;
  wire sig000000d6;
  wire sig000000d7;
  wire sig000000d8;
  wire sig000000d9;
  wire sig000000da;
  wire sig000000db;
  wire sig000000dc;
  wire sig000000dd;
  wire sig000000de;
  wire sig000000df;
  wire sig000000e0;
  wire sig000000e1;
  wire sig000000e2;
  wire sig000000e3;
  wire sig000000e4;
  wire sig000000e5;
  wire sig000000e6;
  wire sig000000e7;
  wire sig000000e8;
  wire sig000000e9;
  wire sig000000ea;
  wire sig000000eb;
  wire sig000000ec;
  wire sig000000ed;
  wire sig000000ee;
  wire sig000000ef;
  wire sig000000f0;
  wire sig000000f1;
  wire sig000000f2;
  wire sig000000f3;
  wire sig000000f4;
  wire sig000000f5;
  wire sig000000f6;
  wire sig000000f7;
  wire sig000000f8;
  wire sig000000f9;
  wire sig000000fa;
  wire sig000000fb;
  wire sig000000fc;
  wire sig000000fd;
  wire sig000000fe;
  wire sig000000ff;
  wire sig00000100;
  wire sig00000101;
  wire sig00000102;
  wire sig00000103;
  wire sig00000104;
  wire sig00000105;
  wire sig00000106;
  wire sig00000107;
  wire sig00000108;
  wire sig00000109;
  wire sig0000010a;
  wire sig0000010b;
  wire sig0000010c;
  wire sig0000010d;
  wire sig0000010e;
  wire sig0000010f;
  wire sig00000110;
  wire sig00000111;
  wire sig00000112;
  wire sig00000113;
  wire sig00000114;
  wire sig00000115;
  wire sig00000116;
  wire sig00000117;
  wire sig00000118;
  wire sig00000119;
  wire sig0000011a;
  wire sig0000011b;
  wire sig0000011c;
  wire sig0000011d;
  wire sig0000011e;
  wire sig0000011f;
  wire sig00000120;
  wire sig00000121;
  wire sig00000122;
  wire sig00000123;
  wire sig00000124;
  wire sig00000125;
  wire sig00000126;
  wire sig00000127;
  wire sig00000128;
  wire sig00000129;
  wire sig0000012a;
  wire sig0000012b;
  wire sig0000012c;
  wire sig0000012d;
  wire sig0000012e;
  wire sig0000012f;
  wire sig00000130;
  wire sig00000131;
  wire sig00000132;
  wire sig00000133;
  wire sig00000134;
  wire sig00000135;
  wire sig00000136;
  wire sig00000137;
  wire sig00000138;
  wire sig00000139;
  wire sig0000013a;
  wire sig0000013b;
  wire sig0000013c;
  wire sig0000013d;
  wire sig0000013e;
  wire sig0000013f;
  wire sig00000140;
  wire sig00000141;
  wire sig00000142;
  wire sig00000143;
  wire sig00000144;
  wire sig00000145;
  wire sig00000146;
  wire sig00000147;
  wire sig00000148;
  wire sig00000149;
  wire sig0000014a;
  wire sig0000014b;
  wire sig0000014c;
  wire sig0000014d;
  wire sig0000014e;
  wire sig0000014f;
  wire sig00000150;
  wire sig00000151;
  wire sig00000152;
  wire sig00000153;
  wire sig00000154;
  wire sig00000155;
  wire sig00000156;
  wire sig00000157;
  wire sig00000158;
  wire sig00000159;
  wire sig0000015a;
  wire sig0000015b;
  wire sig0000015c;
  wire sig0000015d;
  wire sig0000015e;
  wire sig0000015f;
  wire sig00000160;
  wire sig00000161;
  wire sig00000162;
  wire sig00000163;
  wire sig00000164;
  wire sig00000165;
  wire sig00000166;
  wire sig00000167;
  wire sig00000168;
  wire sig00000169;
  wire sig0000016a;
  wire sig0000016b;
  wire sig0000016c;
  wire sig0000016d;
  wire sig0000016e;
  wire sig0000016f;
  wire sig00000170;
  wire sig00000171;
  wire sig00000172;
  wire sig00000173;
  wire sig00000174;
  wire sig00000175;
  wire sig00000176;
  wire sig00000177;
  wire sig00000178;
  wire sig00000179;
  wire sig0000017a;
  wire sig0000017b;
  wire sig0000017c;
  wire sig0000017d;
  wire sig0000017e;
  wire sig0000017f;
  wire sig00000180;
  wire sig00000181;
  wire sig00000182;
  wire sig00000183;
  wire sig00000184;
  wire sig00000185;
  wire sig00000186;
  wire sig00000187;
  wire sig00000188;
  wire sig00000189;
  wire sig0000018a;
  wire sig0000018b;
  wire sig0000018c;
  wire sig0000018d;
  wire sig0000018e;
  wire sig0000018f;
  wire sig00000190;
  wire sig00000191;
  wire sig00000192;
  wire sig00000193;
  wire sig00000194;
  wire sig00000195;
  wire sig00000196;
  wire sig00000197;
  wire sig00000198;
  wire sig00000199;
  wire sig0000019a;
  wire sig0000019b;
  wire sig0000019c;
  wire sig0000019d;
  wire sig0000019e;
  wire sig0000019f;
  wire sig000001a0;
  wire sig000001a1;
  wire sig000001a2;
  wire sig000001a3;
  wire sig000001a4;
  wire NLW_blk000000e5_Q15_UNCONNECTED;
  wire NLW_blk000000e7_Q15_UNCONNECTED;
  wire NLW_blk000000e9_Q15_UNCONNECTED;
  wire NLW_blk000000eb_Q15_UNCONNECTED;
  wire NLW_blk000000ed_Q15_UNCONNECTED;
  wire NLW_blk000000ef_Q15_UNCONNECTED;
  wire NLW_blk000000f1_Q15_UNCONNECTED;
  wire NLW_blk000000f3_Q15_UNCONNECTED;
  wire NLW_blk000000f5_Q15_UNCONNECTED;
  wire NLW_blk000000f7_Q15_UNCONNECTED;
  wire NLW_blk000000f9_Q15_UNCONNECTED;
  wire NLW_blk000000fb_Q15_UNCONNECTED;
  wire NLW_blk000000fd_Q15_UNCONNECTED;
  wire NLW_blk000000ff_Q15_UNCONNECTED;
  wire NLW_blk00000101_Q15_UNCONNECTED;
  wire NLW_blk00000103_PATTERNBDETECT_UNCONNECTED;
  wire NLW_blk00000103_MULTSIGNOUT_UNCONNECTED;
  wire NLW_blk00000103_CARRYCASCOUT_UNCONNECTED;
  wire NLW_blk00000103_UNDERFLOW_UNCONNECTED;
  wire NLW_blk00000103_OVERFLOW_UNCONNECTED;
  wire \NLW_blk00000103_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000103_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000103_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000103_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000103_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000103_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000103_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000103_P<47>_UNCONNECTED ;
  wire \NLW_blk00000103_P<46>_UNCONNECTED ;
  wire \NLW_blk00000103_P<45>_UNCONNECTED ;
  wire \NLW_blk00000103_P<44>_UNCONNECTED ;
  wire \NLW_blk00000103_P<43>_UNCONNECTED ;
  wire \NLW_blk00000103_P<42>_UNCONNECTED ;
  wire \NLW_blk00000103_P<41>_UNCONNECTED ;
  wire \NLW_blk00000103_P<40>_UNCONNECTED ;
  wire \NLW_blk00000103_P<39>_UNCONNECTED ;
  wire \NLW_blk00000103_P<38>_UNCONNECTED ;
  wire \NLW_blk00000103_P<37>_UNCONNECTED ;
  wire \NLW_blk00000103_P<36>_UNCONNECTED ;
  wire \NLW_blk00000103_P<35>_UNCONNECTED ;
  wire \NLW_blk00000103_P<34>_UNCONNECTED ;
  wire \NLW_blk00000103_P<33>_UNCONNECTED ;
  wire \NLW_blk00000103_P<32>_UNCONNECTED ;
  wire \NLW_blk00000103_P<31>_UNCONNECTED ;
  wire \NLW_blk00000103_P<4>_UNCONNECTED ;
  wire \NLW_blk00000103_P<3>_UNCONNECTED ;
  wire \NLW_blk00000103_P<2>_UNCONNECTED ;
  wire \NLW_blk00000103_P<1>_UNCONNECTED ;
  wire \NLW_blk00000103_P<0>_UNCONNECTED ;
  wire NLW_blk00000104_PATTERNBDETECT_UNCONNECTED;
  wire NLW_blk00000104_MULTSIGNOUT_UNCONNECTED;
  wire NLW_blk00000104_CARRYCASCOUT_UNCONNECTED;
  wire NLW_blk00000104_UNDERFLOW_UNCONNECTED;
  wire NLW_blk00000104_OVERFLOW_UNCONNECTED;
  wire \NLW_blk00000104_CARRYOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000104_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000104_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000104_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000104_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000104_P<47>_UNCONNECTED ;
  wire \NLW_blk00000104_P<46>_UNCONNECTED ;
  wire \NLW_blk00000104_P<45>_UNCONNECTED ;
  wire \NLW_blk00000104_P<44>_UNCONNECTED ;
  wire \NLW_blk00000104_P<43>_UNCONNECTED ;
  wire \NLW_blk00000104_P<42>_UNCONNECTED ;
  wire \NLW_blk00000104_P<41>_UNCONNECTED ;
  wire \NLW_blk00000104_P<40>_UNCONNECTED ;
  wire \NLW_blk00000104_P<39>_UNCONNECTED ;
  wire \NLW_blk00000104_P<38>_UNCONNECTED ;
  wire \NLW_blk00000104_P<37>_UNCONNECTED ;
  wire \NLW_blk00000104_P<36>_UNCONNECTED ;
  wire \NLW_blk00000104_P<35>_UNCONNECTED ;
  wire \NLW_blk00000104_P<34>_UNCONNECTED ;
  wire \NLW_blk00000104_P<33>_UNCONNECTED ;
  wire \NLW_blk00000104_P<32>_UNCONNECTED ;
  wire \NLW_blk00000104_P<31>_UNCONNECTED ;
  wire \NLW_blk00000104_P<30>_UNCONNECTED ;
  wire \NLW_blk00000104_P<29>_UNCONNECTED ;
  wire \NLW_blk00000104_P<28>_UNCONNECTED ;
  wire \NLW_blk00000104_P<27>_UNCONNECTED ;
  wire \NLW_blk00000104_P<26>_UNCONNECTED ;
  wire \NLW_blk00000104_P<25>_UNCONNECTED ;
  wire \NLW_blk00000104_P<24>_UNCONNECTED ;
  wire \NLW_blk00000104_P<23>_UNCONNECTED ;
  wire \NLW_blk00000104_P<22>_UNCONNECTED ;
  wire \NLW_blk00000104_P<21>_UNCONNECTED ;
  wire \NLW_blk00000104_P<20>_UNCONNECTED ;
  wire \NLW_blk00000104_P<19>_UNCONNECTED ;
  wire \NLW_blk00000104_P<18>_UNCONNECTED ;
  wire \NLW_blk00000104_P<17>_UNCONNECTED ;
  wire \NLW_blk00000104_P<16>_UNCONNECTED ;
  wire \NLW_blk00000104_P<15>_UNCONNECTED ;
  wire \NLW_blk00000104_P<14>_UNCONNECTED ;
  wire \NLW_blk00000104_P<13>_UNCONNECTED ;
  wire \NLW_blk00000104_P<12>_UNCONNECTED ;
  wire \NLW_blk00000104_P<11>_UNCONNECTED ;
  wire \NLW_blk00000104_P<10>_UNCONNECTED ;
  wire \NLW_blk00000104_P<9>_UNCONNECTED ;
  wire \NLW_blk00000104_P<8>_UNCONNECTED ;
  wire \NLW_blk00000104_P<7>_UNCONNECTED ;
  wire \NLW_blk00000104_P<6>_UNCONNECTED ;
  wire \NLW_blk00000104_P<5>_UNCONNECTED ;
  wire \NLW_blk00000104_P<4>_UNCONNECTED ;
  wire \NLW_blk00000104_P<3>_UNCONNECTED ;
  wire \NLW_blk00000104_P<2>_UNCONNECTED ;
  wire \NLW_blk00000104_P<1>_UNCONNECTED ;
  wire \NLW_blk00000104_P<0>_UNCONNECTED ;
  wire NLW_blk00000105_PATTERNBDETECT_UNCONNECTED;
  wire NLW_blk00000105_MULTSIGNOUT_UNCONNECTED;
  wire NLW_blk00000105_CARRYCASCOUT_UNCONNECTED;
  wire NLW_blk00000105_UNDERFLOW_UNCONNECTED;
  wire NLW_blk00000105_PATTERNDETECT_UNCONNECTED;
  wire NLW_blk00000105_OVERFLOW_UNCONNECTED;
  wire \NLW_blk00000105_ACOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000105_ACOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000105_CARRYOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000105_CARRYOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000105_CARRYOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000105_BCOUT<0>_UNCONNECTED ;
  wire \NLW_blk00000105_P<40>_UNCONNECTED ;
  wire \NLW_blk00000105_P<31>_UNCONNECTED ;
  wire \NLW_blk00000105_P<6>_UNCONNECTED ;
  wire \NLW_blk00000105_P<5>_UNCONNECTED ;
  wire \NLW_blk00000105_P<4>_UNCONNECTED ;
  wire \NLW_blk00000105_P<3>_UNCONNECTED ;
  wire \NLW_blk00000105_P<2>_UNCONNECTED ;
  wire \NLW_blk00000105_P<1>_UNCONNECTED ;
  wire \NLW_blk00000105_P<0>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<47>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<46>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<45>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<44>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<43>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<42>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<41>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<40>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<39>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<38>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<37>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<36>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<35>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<34>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<33>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<32>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<31>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<30>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<29>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<28>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<27>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<26>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<25>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<24>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<23>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<22>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<21>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<20>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<19>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<18>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<17>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<16>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<15>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<14>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<13>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<12>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<11>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<10>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<9>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<8>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<7>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<6>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<5>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<4>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<3>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<2>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<1>_UNCONNECTED ;
  wire \NLW_blk00000105_PCOUT<0>_UNCONNECTED ;
  wire [7 : 0] \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op ;
  wire [22 : 0] \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op ;
  assign
    result[31] = \U0/op_inst/FLT_PT_OP/MULT.OP/OP/sign_op ,
    result[30] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [7],
    result[29] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [6],
    result[28] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [5],
    result[27] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [4],
    result[26] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [3],
    result[25] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [2],
    result[24] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [1],
    result[23] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [0],
    result[22] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [22],
    result[21] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [21],
    result[20] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [20],
    result[19] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [19],
    result[18] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [18],
    result[17] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [17],
    result[16] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [16],
    result[15] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [15],
    result[14] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [14],
    result[13] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [13],
    result[12] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [12],
    result[11] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [11],
    result[10] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [10],
    result[9] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [9],
    result[8] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [8],
    result[7] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [7],
    result[6] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [6],
    result[5] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [5],
    result[4] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [4],
    result[3] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [3],
    result[2] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [2],
    result[1] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [1],
    result[0] = \NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [0];
  VCC   blk00000001 (
    .P(sig00000001)
  );
  GND   blk00000002 (
    .G(sig00000002)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000003 (
    .C(clk),
    .CE(ce),
    .D(sig00000051),
    .Q(sig000000ab)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000004 (
    .C(clk),
    .CE(ce),
    .D(sig000000c9),
    .Q(sig000000b2)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000005 (
    .C(clk),
    .CE(ce),
    .D(sig000000b2),
    .Q(sig000000b3)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000006 (
    .C(clk),
    .CE(ce),
    .D(sig000000b3),
    .Q(sig000000cf)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000007 (
    .C(clk),
    .CE(ce),
    .D(sig000000c7),
    .Q(sig000000b5)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000008 (
    .C(clk),
    .CE(ce),
    .D(sig000000c8),
    .Q(sig000000b4)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000009 (
    .C(clk),
    .CE(ce),
    .D(sig000000c2),
    .Q(sig000000d2)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000000a (
    .C(clk),
    .CE(ce),
    .D(sig000000cf),
    .Q(sig0000005f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000000b (
    .C(clk),
    .CE(ce),
    .D(sig000000b9),
    .Q(sig000000d3)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000000c (
    .C(clk),
    .CE(ce),
    .D(sig000000b8),
    .Q(sig000000d4)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000000d (
    .C(clk),
    .CE(ce),
    .D(sig000000b7),
    .Q(sig000000d6)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000000e (
    .C(clk),
    .CE(ce),
    .D(sig000000b6),
    .Q(sig000000d7)
  );
  XORCY   blk0000000f (
    .CI(sig000000e4),
    .LI(sig00000002),
    .O(sig000000e2)
  );
  XORCY   blk00000010 (
    .CI(sig000000e6),
    .LI(sig000000c1),
    .O(sig000000e3)
  );
  MUXCY   blk00000011 (
    .CI(sig000000e6),
    .DI(b[30]),
    .S(sig000000c1),
    .O(sig000000e4)
  );
  XORCY   blk00000012 (
    .CI(sig000000e8),
    .LI(sig000000c0),
    .O(sig000000e5)
  );
  MUXCY   blk00000013 (
    .CI(sig000000e8),
    .DI(b[29]),
    .S(sig000000c0),
    .O(sig000000e6)
  );
  XORCY   blk00000014 (
    .CI(sig000000ea),
    .LI(sig000000bf),
    .O(sig000000e7)
  );
  MUXCY   blk00000015 (
    .CI(sig000000ea),
    .DI(b[28]),
    .S(sig000000bf),
    .O(sig000000e8)
  );
  XORCY   blk00000016 (
    .CI(sig000000ec),
    .LI(sig000000be),
    .O(sig000000e9)
  );
  MUXCY   blk00000017 (
    .CI(sig000000ec),
    .DI(b[27]),
    .S(sig000000be),
    .O(sig000000ea)
  );
  XORCY   blk00000018 (
    .CI(sig000000ee),
    .LI(sig000000bd),
    .O(sig000000eb)
  );
  MUXCY   blk00000019 (
    .CI(sig000000ee),
    .DI(b[26]),
    .S(sig000000bd),
    .O(sig000000ec)
  );
  XORCY   blk0000001a (
    .CI(sig000000f0),
    .LI(sig000000bc),
    .O(sig000000ed)
  );
  MUXCY   blk0000001b (
    .CI(sig000000f0),
    .DI(b[25]),
    .S(sig000000bc),
    .O(sig000000ee)
  );
  XORCY   blk0000001c (
    .CI(sig000000f2),
    .LI(sig000000bb),
    .O(sig000000ef)
  );
  MUXCY   blk0000001d (
    .CI(sig000000f2),
    .DI(b[24]),
    .S(sig000000bb),
    .O(sig000000f0)
  );
  XORCY   blk0000001e (
    .CI(sig00000001),
    .LI(sig000000ba),
    .O(sig000000f1)
  );
  MUXCY   blk0000001f (
    .CI(sig00000001),
    .DI(b[23]),
    .S(sig000000ba),
    .O(sig000000f2)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000020 (
    .C(clk),
    .CE(ce),
    .D(sig000000e2),
    .Q(sig000000d9)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000021 (
    .C(clk),
    .CE(ce),
    .D(sig000000e3),
    .Q(sig000000e1)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000022 (
    .C(clk),
    .CE(ce),
    .D(sig000000e5),
    .Q(sig000000e0)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000023 (
    .C(clk),
    .CE(ce),
    .D(sig000000e7),
    .Q(sig000000df)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000024 (
    .C(clk),
    .CE(ce),
    .D(sig000000e9),
    .Q(sig000000de)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000025 (
    .C(clk),
    .CE(ce),
    .D(sig000000eb),
    .Q(sig000000dd)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000026 (
    .C(clk),
    .CE(ce),
    .D(sig000000ed),
    .Q(sig000000dc)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000027 (
    .C(clk),
    .CE(ce),
    .D(sig000000ef),
    .Q(sig000000db)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000028 (
    .C(clk),
    .CE(ce),
    .D(sig000000f1),
    .Q(sig000000da)
  );
  MUXCY   blk00000029 (
    .CI(sig00000001),
    .DI(sig00000002),
    .S(sig000000f9),
    .O(sig000000f3)
  );
  MUXCY   blk0000002a (
    .CI(sig000000f3),
    .DI(sig00000002),
    .S(sig000000f8),
    .O(sig000000f4)
  );
  MUXCY   blk0000002b (
    .CI(sig000000f4),
    .DI(sig00000002),
    .S(sig000000f7),
    .O(sig000000f5)
  );
  MUXCY   blk0000002c (
    .CI(sig000000f5),
    .DI(sig00000002),
    .S(sig000000fa),
    .O(sig000000f6)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000002d (
    .C(clk),
    .CE(ce),
    .D(sig000000f6),
    .Q(sig000000d8)
  );
  MUXCY   blk0000002e (
    .CI(sig00000001),
    .DI(sig00000002),
    .S(sig00000101),
    .O(sig000000fb)
  );
  MUXCY   blk0000002f (
    .CI(sig000000fb),
    .DI(sig00000002),
    .S(sig00000100),
    .O(sig000000fc)
  );
  MUXCY   blk00000030 (
    .CI(sig000000fc),
    .DI(sig00000002),
    .S(sig000000ff),
    .O(sig000000fd)
  );
  MUXCY   blk00000031 (
    .CI(sig000000fd),
    .DI(sig00000002),
    .S(sig00000102),
    .O(sig000000fe)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000032 (
    .C(clk),
    .CE(ce),
    .D(sig000000fe),
    .Q(sig000000d5)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000033 (
    .C(clk),
    .CE(ce),
    .D(sig000000c6),
    .Q(sig00000106)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000034 (
    .C(clk),
    .CE(ce),
    .D(sig000000ca),
    .Q(sig00000105)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000035 (
    .C(clk),
    .CE(ce),
    .D(sig000000c4),
    .Q(sig00000104)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000036 (
    .C(clk),
    .CE(ce),
    .D(sig000000c5),
    .Q(sig00000103)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000037 (
    .C(clk),
    .CE(ce),
    .D(sig000000b0),
    .Q(sig0000005e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000038 (
    .C(clk),
    .CE(ce),
    .D(sig000000b1),
    .Q(sig0000005c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000039 (
    .C(clk),
    .CE(ce),
    .D(sig000000c3),
    .Q(sig0000005a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003a (
    .C(clk),
    .CE(ce),
    .D(sig000000ae),
    .Q(sig0000005b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003b (
    .C(clk),
    .CE(ce),
    .D(sig000000af),
    .Q(sig0000005d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003c (
    .C(clk),
    .CE(ce),
    .D(sig00000107),
    .Q(sig0000010c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003d (
    .C(clk),
    .CE(ce),
    .D(sig00000108),
    .Q(sig0000010b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003e (
    .C(clk),
    .CE(ce),
    .D(sig00000060),
    .Q(sig0000010a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000003f (
    .C(clk),
    .CE(ce),
    .D(sig00000061),
    .Q(sig0000010d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000040 (
    .C(clk),
    .CE(ce),
    .D(sig00000062),
    .Q(sig00000124)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000041 (
    .C(clk),
    .CE(ce),
    .D(sig00000063),
    .Q(sig00000123)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000042 (
    .C(clk),
    .CE(ce),
    .D(sig00000064),
    .Q(sig00000122)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000043 (
    .C(clk),
    .CE(ce),
    .D(sig00000065),
    .Q(sig00000121)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000044 (
    .C(clk),
    .CE(ce),
    .D(sig00000066),
    .Q(sig00000120)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000045 (
    .C(clk),
    .CE(ce),
    .D(sig00000067),
    .Q(sig0000011f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000046 (
    .C(clk),
    .CE(ce),
    .D(sig00000068),
    .Q(sig0000011e)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000047 (
    .C(clk),
    .CE(ce),
    .D(sig00000069),
    .Q(sig0000011d)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000048 (
    .C(clk),
    .CE(ce),
    .D(sig0000006a),
    .Q(sig0000011c)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000049 (
    .C(clk),
    .CE(ce),
    .D(sig0000006b),
    .Q(sig0000011b)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004a (
    .C(clk),
    .CE(ce),
    .D(sig0000006c),
    .Q(sig0000011a)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004b (
    .C(clk),
    .CE(ce),
    .D(sig0000006d),
    .Q(sig00000119)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004c (
    .C(clk),
    .CE(ce),
    .D(sig0000006e),
    .Q(sig00000118)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004d (
    .C(clk),
    .CE(ce),
    .D(sig0000006f),
    .Q(sig00000117)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004e (
    .C(clk),
    .CE(ce),
    .D(sig00000070),
    .Q(sig00000116)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk0000004f (
    .C(clk),
    .CE(ce),
    .D(sig00000071),
    .Q(sig00000115)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000050 (
    .C(clk),
    .CE(ce),
    .D(sig00000072),
    .Q(sig00000114)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000051 (
    .C(clk),
    .CE(ce),
    .D(sig00000073),
    .Q(sig00000113)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000052 (
    .C(clk),
    .CE(ce),
    .D(sig00000074),
    .Q(sig00000112)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000053 (
    .C(clk),
    .CE(ce),
    .D(sig00000075),
    .Q(sig00000111)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000054 (
    .C(clk),
    .CE(ce),
    .D(sig00000076),
    .Q(sig00000110)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000055 (
    .C(clk),
    .CE(ce),
    .D(sig00000077),
    .Q(sig0000010f)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000056 (
    .C(clk),
    .CE(ce),
    .D(sig00000109),
    .Q(sig0000010e)
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000057 (
    .C(clk),
    .D(sig00000164),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [22])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000058 (
    .C(clk),
    .D(sig00000163),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [21])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000059 (
    .C(clk),
    .D(sig00000162),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [20])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000005a (
    .C(clk),
    .D(sig00000161),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [19])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000005b (
    .C(clk),
    .D(sig00000160),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [18])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000005c (
    .C(clk),
    .D(sig0000015f),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [17])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000005d (
    .C(clk),
    .D(sig0000015e),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [16])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000005e (
    .C(clk),
    .D(sig0000015d),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [15])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000005f (
    .C(clk),
    .D(sig0000015c),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [14])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000060 (
    .C(clk),
    .D(sig0000015b),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [13])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000061 (
    .C(clk),
    .D(sig0000015a),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [12])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000062 (
    .C(clk),
    .D(sig00000159),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [11])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000063 (
    .C(clk),
    .D(sig00000158),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [10])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000064 (
    .C(clk),
    .D(sig00000157),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [9])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000065 (
    .C(clk),
    .D(sig00000156),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [8])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000066 (
    .C(clk),
    .D(sig00000155),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000067 (
    .C(clk),
    .D(sig00000154),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000068 (
    .C(clk),
    .D(sig00000153),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000069 (
    .C(clk),
    .D(sig00000152),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000006a (
    .C(clk),
    .D(sig00000151),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000006b (
    .C(clk),
    .D(sig00000150),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000006c (
    .C(clk),
    .D(sig0000014f),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000006d (
    .C(clk),
    .D(sig0000014e),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [0])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000006e (
    .C(clk),
    .D(sig0000016c),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [7])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk0000006f (
    .C(clk),
    .D(sig0000016b),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [6])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000070 (
    .C(clk),
    .D(sig0000016a),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [5])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000071 (
    .C(clk),
    .D(sig00000169),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [4])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000072 (
    .C(clk),
    .D(sig00000168),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [3])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000073 (
    .C(clk),
    .D(sig00000167),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [2])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000074 (
    .C(clk),
    .D(sig00000166),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [1])
  );
  FD #(
    .INIT ( 1'b0 ))
  blk00000075 (
    .C(clk),
    .D(sig00000165),
    .Q(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [0])
  );
  LUT6 #(
    .INIT ( 64'h153E113215141110 ))
  blk00000076 (
    .I0(sig000000d4),
    .I1(sig000000d7),
    .I2(sig000000d3),
    .I3(sig000000d6),
    .I4(sig000000d8),
    .I5(sig000000d5),
    .O(sig000000c8)
  );
  LUT3 #(
    .INIT ( 8'hEA ))
  blk00000077 (
    .I0(sig000000cc),
    .I1(sig000000ce),
    .I2(sig00000060),
    .O(sig000000ad)
  );
  LUT6 #(
    .INIT ( 64'hF0FFF0FFF0FCF0FE ))
  blk00000078 (
    .I0(sig000000cd),
    .I1(sig000000cb),
    .I2(sig000000d1),
    .I3(sig000000d0),
    .I4(sig00000060),
    .I5(sig000000ad),
    .O(sig000000b1)
  );
  LUT2 #(
    .INIT ( 4'hE ))
  blk00000079 (
    .I0(sig000000d4),
    .I1(sig000000d7),
    .O(sig000000c7)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000007a (
    .I0(a[31]),
    .I1(b[31]),
    .O(sig000000c2)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000007b (
    .I0(a[23]),
    .I1(b[23]),
    .O(sig000000ba)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000007c (
    .I0(a[24]),
    .I1(b[24]),
    .O(sig000000bb)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000007d (
    .I0(a[25]),
    .I1(b[25]),
    .O(sig000000bc)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000007e (
    .I0(a[26]),
    .I1(b[26]),
    .O(sig000000bd)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk0000007f (
    .I0(a[27]),
    .I1(b[27]),
    .O(sig000000be)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000080 (
    .I0(a[28]),
    .I1(b[28]),
    .O(sig000000bf)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000081 (
    .I0(a[29]),
    .I1(b[29]),
    .O(sig000000c0)
  );
  LUT2 #(
    .INIT ( 4'h6 ))
  blk00000082 (
    .I0(a[30]),
    .I1(b[30]),
    .O(sig000000c1)
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  blk00000083 (
    .I0(sig000000d9),
    .I1(sig000000e1),
    .O(sig000000c4)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000084 (
    .I0(a[12]),
    .I1(a[13]),
    .I2(a[14]),
    .I3(a[15]),
    .I4(a[16]),
    .I5(a[17]),
    .O(sig000000f7)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000085 (
    .I0(a[6]),
    .I1(a[7]),
    .I2(a[8]),
    .I3(a[9]),
    .I4(a[10]),
    .I5(a[11]),
    .O(sig000000f8)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000086 (
    .I0(a[0]),
    .I1(a[1]),
    .I2(a[2]),
    .I3(a[3]),
    .I4(a[4]),
    .I5(a[5]),
    .O(sig000000f9)
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  blk00000087 (
    .I0(a[18]),
    .I1(a[19]),
    .I2(a[20]),
    .I3(a[21]),
    .I4(a[22]),
    .O(sig000000fa)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000088 (
    .I0(b[12]),
    .I1(b[13]),
    .I2(b[14]),
    .I3(b[15]),
    .I4(b[16]),
    .I5(b[17]),
    .O(sig000000ff)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000089 (
    .I0(b[6]),
    .I1(b[7]),
    .I2(b[8]),
    .I3(b[9]),
    .I4(b[10]),
    .I5(b[11]),
    .O(sig00000100)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk0000008a (
    .I0(b[0]),
    .I1(b[1]),
    .I2(b[2]),
    .I3(b[3]),
    .I4(b[4]),
    .I5(b[5]),
    .O(sig00000101)
  );
  LUT5 #(
    .INIT ( 32'h00000001 ))
  blk0000008b (
    .I0(b[18]),
    .I1(b[19]),
    .I2(b[20]),
    .I3(b[21]),
    .I4(b[22]),
    .O(sig00000102)
  );
  LUT3 #(
    .INIT ( 8'hEC ))
  blk0000008c (
    .I0(sig0000010b),
    .I1(sig0000010a),
    .I2(sig00000146),
    .O(sig000000ac)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk0000008d (
    .I0(sig000000df),
    .I1(sig000000de),
    .I2(sig000000dd),
    .I3(sig000000e0),
    .O(sig0000016d)
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAA80000000 ))
  blk0000008e (
    .I0(sig000000d9),
    .I1(sig000000dc),
    .I2(sig000000db),
    .I3(sig000000da),
    .I4(sig0000016d),
    .I5(sig000000e1),
    .O(sig000000c5)
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  blk0000008f (
    .I0(sig000000de),
    .I1(sig000000dd),
    .I2(sig000000e0),
    .I3(sig000000d9),
    .O(sig0000016e)
  );
  LUT6 #(
    .INIT ( 64'h0040000000000000 ))
  blk00000090 (
    .I0(sig000000e1),
    .I1(sig000000dc),
    .I2(sig000000db),
    .I3(sig000000da),
    .I4(sig000000df),
    .I5(sig0000016e),
    .O(sig000000ca)
  );
  LUT2 #(
    .INIT ( 4'hB ))
  blk00000091 (
    .I0(sig000000d6),
    .I1(sig000000d5),
    .O(sig0000016f)
  );
  LUT6 #(
    .INIT ( 64'h0020202000AAAAAA ))
  blk00000092 (
    .I0(sig000000d2),
    .I1(sig000000d3),
    .I2(sig000000d8),
    .I3(sig0000016f),
    .I4(sig000000d4),
    .I5(sig000000d7),
    .O(sig000000c9)
  );
  LUT6 #(
    .INIT ( 64'h00F700F400000000 ))
  blk00000093 (
    .I0(sig000000cd),
    .I1(sig000000cb),
    .I2(sig000000d1),
    .I3(sig000000d0),
    .I4(sig00000170),
    .I5(sig000000b1),
    .O(sig000000c3)
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  blk00000094 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[23]),
    .O(sig00000171)
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  blk00000095 (
    .I0(a[30]),
    .I1(a[29]),
    .I2(a[28]),
    .I3(a[27]),
    .I4(a[26]),
    .I5(sig00000171),
    .O(sig000000b6)
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  blk00000096 (
    .I0(a[25]),
    .I1(a[24]),
    .I2(a[23]),
    .O(sig00000172)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk00000097 (
    .I0(a[30]),
    .I1(a[29]),
    .I2(a[28]),
    .I3(a[27]),
    .I4(a[26]),
    .I5(sig00000172),
    .O(sig000000b7)
  );
  LUT3 #(
    .INIT ( 8'h80 ))
  blk00000098 (
    .I0(b[25]),
    .I1(b[24]),
    .I2(b[23]),
    .O(sig00000173)
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  blk00000099 (
    .I0(b[30]),
    .I1(b[29]),
    .I2(b[28]),
    .I3(b[27]),
    .I4(b[26]),
    .I5(sig00000173),
    .O(sig000000b8)
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  blk0000009a (
    .I0(b[25]),
    .I1(b[24]),
    .I2(b[23]),
    .O(sig00000174)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  blk0000009b (
    .I0(b[30]),
    .I1(b[29]),
    .I2(b[28]),
    .I3(b[27]),
    .I4(b[26]),
    .I5(sig00000174),
    .O(sig000000b9)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  blk0000009c (
    .I0(sig000000de),
    .I1(sig000000dd),
    .I2(sig000000e0),
    .I3(sig000000d9),
    .O(sig00000175)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000002 ))
  blk0000009d (
    .I0(sig000000e1),
    .I1(sig000000dc),
    .I2(sig000000db),
    .I3(sig000000da),
    .I4(sig000000df),
    .I5(sig00000175),
    .O(sig000000c6)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk0000009e (
    .I0(ce),
    .I1(sig00000176),
    .I2(sig0000005a),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [1]),
    .O(sig00000166)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk0000009f (
    .I0(ce),
    .I1(sig00000177),
    .I2(sig0000005a),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [3]),
    .O(sig00000168)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000a0 (
    .I0(ce),
    .I1(sig00000178),
    .I2(sig0000005a),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [2]),
    .O(sig00000167)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000a1 (
    .I0(ce),
    .I1(sig00000179),
    .I2(sig0000005a),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [6]),
    .O(sig0000016b)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000a2 (
    .I0(ce),
    .I1(sig0000017a),
    .I2(sig0000005a),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [4]),
    .O(sig00000169)
  );
  LUT5 #(
    .INIT ( 32'hFFCCEDED ))
  blk000000a3 (
    .I0(sig00000125),
    .I1(sig0000005e),
    .I2(sig00000126),
    .I3(sig00000145),
    .I4(sig000000ac),
    .O(sig0000017b)
  );
  LUT4 #(
    .INIT ( 16'h4E44 ))
  blk000000a4 (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [7]),
    .I2(sig0000005a),
    .I3(sig0000017b),
    .O(sig0000016c)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000a5 (
    .I0(ce),
    .I1(sig0000017c),
    .I2(sig0000005a),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [5]),
    .O(sig0000016a)
  );
  LUT5 #(
    .INIT ( 32'hB931A820 ))
  blk000000a6 (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig0000010f),
    .I3(sig00000128),
    .I4(sig0000010e),
    .O(sig0000017d)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000a7 (
    .I0(ce),
    .I1(sig0000017d),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [0]),
    .O(sig0000014e)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000a8 (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig00000111),
    .I3(sig0000012a),
    .I4(sig00000129),
    .I5(sig00000110),
    .O(sig0000017e)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000a9 (
    .I0(ce),
    .I1(sig0000017e),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [2]),
    .O(sig00000150)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000aa (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig00000112),
    .I3(sig0000012b),
    .I4(sig0000012a),
    .I5(sig00000111),
    .O(sig0000017f)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000ab (
    .I0(ce),
    .I1(sig0000017f),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [3]),
    .O(sig00000151)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000ac (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig00000110),
    .I3(sig00000129),
    .I4(sig00000128),
    .I5(sig0000010f),
    .O(sig00000180)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000ad (
    .I0(ce),
    .I1(sig00000180),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [1]),
    .O(sig0000014f)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000ae (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig00000115),
    .I3(sig0000012e),
    .I4(sig0000012d),
    .I5(sig00000114),
    .O(sig00000181)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000af (
    .I0(ce),
    .I1(sig00000181),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [6]),
    .O(sig00000154)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000b0 (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig00000113),
    .I3(sig0000012c),
    .I4(sig0000012b),
    .I5(sig00000112),
    .O(sig00000182)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000b1 (
    .I0(ce),
    .I1(sig00000182),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [4]),
    .O(sig00000152)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000b2 (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig00000114),
    .I3(sig0000012d),
    .I4(sig0000012c),
    .I5(sig00000113),
    .O(sig00000183)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000b3 (
    .I0(ce),
    .I1(sig00000183),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [5]),
    .O(sig00000153)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000b4 (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig00000117),
    .I3(sig00000130),
    .I4(sig0000012f),
    .I5(sig00000116),
    .O(sig00000184)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000b5 (
    .I0(ce),
    .I1(sig00000184),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [8]),
    .O(sig00000156)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000b6 (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig00000118),
    .I3(sig00000131),
    .I4(sig00000130),
    .I5(sig00000117),
    .O(sig00000185)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000b7 (
    .I0(ce),
    .I1(sig00000185),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [9]),
    .O(sig00000157)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000b8 (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig0000011a),
    .I3(sig00000133),
    .I4(sig00000132),
    .I5(sig00000119),
    .O(sig00000186)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000b9 (
    .I0(ce),
    .I1(sig00000186),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [11]),
    .O(sig00000159)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000ba (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig0000011b),
    .I3(sig00000134),
    .I4(sig00000133),
    .I5(sig0000011a),
    .O(sig00000187)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000bb (
    .I0(ce),
    .I1(sig00000187),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [12]),
    .O(sig0000015a)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000bc (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig00000116),
    .I3(sig0000012f),
    .I4(sig0000012e),
    .I5(sig00000115),
    .O(sig00000188)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000bd (
    .I0(ce),
    .I1(sig00000188),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [7]),
    .O(sig00000155)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000be (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig00000119),
    .I3(sig00000132),
    .I4(sig00000131),
    .I5(sig00000118),
    .O(sig00000189)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000bf (
    .I0(ce),
    .I1(sig00000189),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [10]),
    .O(sig00000158)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000c0 (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig0000011d),
    .I3(sig00000136),
    .I4(sig00000135),
    .I5(sig0000011c),
    .O(sig0000018a)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000c1 (
    .I0(ce),
    .I1(sig0000018a),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [14]),
    .O(sig0000015c)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000c2 (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig0000011c),
    .I3(sig00000135),
    .I4(sig00000134),
    .I5(sig0000011b),
    .O(sig0000018b)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000c3 (
    .I0(ce),
    .I1(sig0000018b),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [13]),
    .O(sig0000015b)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000c4 (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig00000120),
    .I3(sig00000139),
    .I4(sig00000138),
    .I5(sig0000011f),
    .O(sig0000018c)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000c5 (
    .I0(ce),
    .I1(sig0000018c),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [17]),
    .O(sig0000015f)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000c6 (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig0000011e),
    .I3(sig00000137),
    .I4(sig00000136),
    .I5(sig0000011d),
    .O(sig0000018d)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000c7 (
    .I0(ce),
    .I1(sig0000018d),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [15]),
    .O(sig0000015d)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000c8 (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig00000121),
    .I3(sig0000013a),
    .I4(sig00000139),
    .I5(sig00000120),
    .O(sig0000018e)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000c9 (
    .I0(ce),
    .I1(sig0000018e),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [18]),
    .O(sig00000160)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000ca (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig0000011f),
    .I3(sig00000138),
    .I4(sig00000137),
    .I5(sig0000011e),
    .O(sig0000018f)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000cb (
    .I0(ce),
    .I1(sig0000018f),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [16]),
    .O(sig0000015e)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000cc (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig00000124),
    .I3(sig0000013d),
    .I4(sig0000013c),
    .I5(sig00000123),
    .O(sig00000190)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000cd (
    .I0(ce),
    .I1(sig00000190),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [21]),
    .O(sig00000163)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000ce (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig00000122),
    .I3(sig0000013b),
    .I4(sig0000013a),
    .I5(sig00000121),
    .O(sig00000191)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000cf (
    .I0(ce),
    .I1(sig00000191),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [19]),
    .O(sig00000161)
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  blk000000d0 (
    .I0(sig0000010a),
    .I1(sig0000010c),
    .I2(sig00000123),
    .I3(sig0000013c),
    .I4(sig0000013b),
    .I5(sig00000122),
    .O(sig00000192)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000d1 (
    .I0(ce),
    .I1(sig00000192),
    .I2(sig0000005b),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [20]),
    .O(sig00000162)
  );
  LUT4 #(
    .INIT ( 16'h5D08 ))
  blk000000d2 (
    .I0(ce),
    .I1(sig00000193),
    .I2(sig0000005a),
    .I3(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/exp_op [0]),
    .O(sig00000165)
  );
  LUT3 #(
    .INIT ( 8'hE2 ))
  blk000000d3 (
    .I0(sig0000010d),
    .I1(sig0000010c),
    .I2(sig00000127),
    .O(sig00000194)
  );
  LUT6 #(
    .INIT ( 64'hFFFFEFEAFFFF4540 ))
  blk000000d4 (
    .I0(sig0000010a),
    .I1(sig0000013d),
    .I2(sig0000010c),
    .I3(sig00000124),
    .I4(sig0000005d),
    .I5(sig00000194),
    .O(sig00000195)
  );
  LUT4 #(
    .INIT ( 16'h4E44 ))
  blk000000d5 (
    .I0(ce),
    .I1(\NlwRenamedSig_OI_U0/op_inst/FLT_PT_OP/MULT.OP/OP/mant_op [22]),
    .I2(sig0000005c),
    .I3(sig00000195),
    .O(sig00000164)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000d6 (
    .C(clk),
    .CE(ce),
    .D(sig0000005f),
    .Q(\U0/op_inst/FLT_PT_OP/MULT.OP/OP/sign_op )
  );
  LUT2 #(
    .INIT ( 4'h2 ))
  blk000000d7 (
    .I0(sig000000d0),
    .I1(sig000000d1),
    .O(sig000000af)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFEEFE ))
  blk000000d8 (
    .I0(sig000000ad),
    .I1(sig000000d0),
    .I2(sig000000cd),
    .I3(sig00000060),
    .I4(sig000000cb),
    .I5(sig000000d1),
    .O(sig000000ae)
  );
  LUT4 #(
    .INIT ( 16'h0145 ))
  blk000000d9 (
    .I0(sig000000cc),
    .I1(sig00000060),
    .I2(sig000000cd),
    .I3(sig000000ce),
    .O(sig00000170)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFEEE0444 ))
  blk000000da (
    .I0(sig0000010a),
    .I1(sig00000148),
    .I2(sig00000146),
    .I3(sig0000010b),
    .I4(sig0000013f),
    .I5(sig0000005e),
    .O(sig00000176)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFEEE0444 ))
  blk000000db (
    .I0(sig0000010a),
    .I1(sig0000014a),
    .I2(sig00000146),
    .I3(sig0000010b),
    .I4(sig00000141),
    .I5(sig0000005e),
    .O(sig00000177)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFEEE0444 ))
  blk000000dc (
    .I0(sig0000010a),
    .I1(sig00000149),
    .I2(sig00000146),
    .I3(sig0000010b),
    .I4(sig00000140),
    .I5(sig0000005e),
    .O(sig00000178)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFEEE0444 ))
  blk000000dd (
    .I0(sig0000010a),
    .I1(sig0000014d),
    .I2(sig00000146),
    .I3(sig0000010b),
    .I4(sig00000144),
    .I5(sig0000005e),
    .O(sig00000179)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFEEE0444 ))
  blk000000de (
    .I0(sig0000010a),
    .I1(sig0000014b),
    .I2(sig00000146),
    .I3(sig0000010b),
    .I4(sig00000142),
    .I5(sig0000005e),
    .O(sig0000017a)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFEEE0444 ))
  blk000000df (
    .I0(sig0000010a),
    .I1(sig0000014c),
    .I2(sig00000146),
    .I3(sig0000010b),
    .I4(sig00000143),
    .I5(sig0000005e),
    .O(sig0000017c)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFEEE0444 ))
  blk000000e0 (
    .I0(sig0000010a),
    .I1(sig00000147),
    .I2(sig00000146),
    .I3(sig0000010b),
    .I4(sig0000013e),
    .I5(sig0000005e),
    .O(sig00000193)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF11101010 ))
  blk000000e1 (
    .I0(sig000000cb),
    .I1(sig000000d1),
    .I2(sig000000cc),
    .I3(sig000000ce),
    .I4(sig00000060),
    .I5(sig000000d0),
    .O(sig000000b0)
  );
  LUT3 #(
    .INIT ( 8'h20 ))
  blk000000e2 (
    .I0(sig00000078),
    .I1(sig00000060),
    .I2(sig00000079),
    .O(sig00000108)
  );
  LUT6 #(
    .INIT ( 64'hAAAAAAAA88088888 ))
  blk000000e3 (
    .I0(sig00000078),
    .I1(sig00000060),
    .I2(sig000000ab),
    .I3(sig00000077),
    .I4(sig000000aa),
    .I5(sig00000079),
    .O(sig00000107)
  );
  LUT5 #(
    .INIT ( 32'hFFFF0444 ))
  blk000000e4 (
    .I0(sig00000060),
    .I1(sig00000079),
    .I2(sig000000ab),
    .I3(sig000000aa),
    .I4(sig00000078),
    .O(sig00000109)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000000e5 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig000000b5),
    .Q(sig00000196),
    .Q15(NLW_blk000000e5_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000e6 (
    .C(clk),
    .CE(ce),
    .D(sig00000196),
    .Q(sig000000d0)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000000e7 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig000000b4),
    .Q(sig00000197),
    .Q15(NLW_blk000000e7_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000e8 (
    .C(clk),
    .CE(ce),
    .D(sig00000197),
    .Q(sig000000d1)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000000e9 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig00000106),
    .Q(sig00000198),
    .Q15(NLW_blk000000e9_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000ea (
    .C(clk),
    .CE(ce),
    .D(sig00000198),
    .Q(sig000000cd)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000000eb (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig00000105),
    .Q(sig00000199),
    .Q15(NLW_blk000000eb_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000ec (
    .C(clk),
    .CE(ce),
    .D(sig00000199),
    .Q(sig000000ce)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000000ed (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig00000104),
    .Q(sig0000019a),
    .Q15(NLW_blk000000ed_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000ee (
    .C(clk),
    .CE(ce),
    .D(sig0000019a),
    .Q(sig000000cb)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000000ef (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig00000103),
    .Q(sig0000019b),
    .Q15(NLW_blk000000ef_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000f0 (
    .C(clk),
    .CE(ce),
    .D(sig0000019b),
    .Q(sig000000cc)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000000f1 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig000000e1),
    .Q(sig0000019c),
    .Q15(NLW_blk000000f1_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000f2 (
    .C(clk),
    .CE(ce),
    .D(sig0000019c),
    .Q(sig00000052)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000000f3 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig000000e0),
    .Q(sig0000019d),
    .Q15(NLW_blk000000f3_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000f4 (
    .C(clk),
    .CE(ce),
    .D(sig0000019d),
    .Q(sig00000053)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000000f5 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig000000df),
    .Q(sig0000019e),
    .Q15(NLW_blk000000f5_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000f6 (
    .C(clk),
    .CE(ce),
    .D(sig0000019e),
    .Q(sig00000054)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000000f7 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig000000de),
    .Q(sig0000019f),
    .Q15(NLW_blk000000f7_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000f8 (
    .C(clk),
    .CE(ce),
    .D(sig0000019f),
    .Q(sig00000055)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000000f9 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig000000dd),
    .Q(sig000001a0),
    .Q15(NLW_blk000000f9_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000fa (
    .C(clk),
    .CE(ce),
    .D(sig000001a0),
    .Q(sig00000056)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000000fb (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig000000dc),
    .Q(sig000001a1),
    .Q15(NLW_blk000000fb_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000fc (
    .C(clk),
    .CE(ce),
    .D(sig000001a1),
    .Q(sig00000057)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000000fd (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig000000db),
    .Q(sig000001a2),
    .Q15(NLW_blk000000fd_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk000000fe (
    .C(clk),
    .CE(ce),
    .D(sig000001a2),
    .Q(sig00000058)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk000000ff (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig000000da),
    .Q(sig000001a3),
    .Q15(NLW_blk000000ff_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000100 (
    .C(clk),
    .CE(ce),
    .D(sig000001a3),
    .Q(sig00000059)
  );
  SRLC16E #(
    .INIT ( 16'h0000 ))
  blk00000101 (
    .A0(sig00000002),
    .A1(sig00000002),
    .A2(sig00000002),
    .A3(sig00000002),
    .CE(ce),
    .CLK(clk),
    .D(sig00000052),
    .Q(sig000001a4),
    .Q15(NLW_blk00000101_Q15_UNCONNECTED)
  );
  FDE #(
    .INIT ( 1'b0 ))
  blk00000102 (
    .C(clk),
    .CE(ce),
    .D(sig000001a4),
    .Q(sig00000125)
  );
  DSP48E #(
    .ACASCREG ( 1 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 1 ),
    .AUTORESET_PATTERN_DETECT ( 0 ),
    .AUTORESET_PATTERN_DETECT_OPTINV ( "MATCH" ),
    .A_INPUT ( "CASCADE" ),
    .BCASCREG ( 2 ),
    .BREG ( 2 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .MASK ( 48'hFFFFFFFFFFE0 ),
    .MREG ( 1 ),
    .MULTCARRYINREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 1 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .SEL_ROUNDING_MASK ( "SEL_MASK" ),
    .SIM_MODE ( "SAFE" ),
    .USE_MULT ( "MULT_S" ),
    .USE_PATTERN_DETECT ( "PATDET" ),
    .USE_SIMD ( "ONE48" ))
  blk00000103 (
    .CEM(ce),
    .PATTERNDETECT(sig000000aa),
    .CLK(clk),
    .PATTERNBDETECT(NLW_blk00000103_PATTERNBDETECT_UNCONNECTED),
    .RSTC(sig00000002),
    .CEB1(ce),
    .MULTSIGNOUT(NLW_blk00000103_MULTSIGNOUT_UNCONNECTED),
    .CEC(sig00000002),
    .RSTM(sig00000002),
    .MULTSIGNIN(sig00000002),
    .CEB2(ce),
    .RSTCTRL(sig00000002),
    .CEP(ce),
    .CARRYCASCOUT(NLW_blk00000103_CARRYCASCOUT_UNCONNECTED),
    .RSTA(sig00000002),
    .CECARRYIN(sig00000002),
    .UNDERFLOW(NLW_blk00000103_UNDERFLOW_UNCONNECTED),
    .RSTALUMODE(sig00000002),
    .RSTALLCARRYIN(sig00000002),
    .CEALUMODE(sig00000002),
    .CEA2(ce),
    .CEA1(sig00000002),
    .RSTB(sig00000002),
    .CEMULTCARRYIN(sig00000002),
    .OVERFLOW(NLW_blk00000103_OVERFLOW_UNCONNECTED),
    .CECTRL(sig00000002),
    .CARRYIN(sig00000002),
    .CARRYCASCIN(sig00000002),
    .RSTP(sig00000002),
    .CARRYINSEL({sig00000002, sig00000002, sig00000002}),
    .B({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000001, b[22], b[21], b[20], b[19], b[18], b[17]}),
    .PCIN({sig00000021, sig00000022, sig00000023, sig00000024, sig00000025, sig00000026, sig00000027, sig00000028, sig00000029, sig0000002a, 
sig0000002b, sig0000002c, sig0000002d, sig0000002e, sig0000002f, sig00000030, sig00000031, sig00000032, sig00000033, sig00000034, sig00000035, 
sig00000036, sig00000037, sig00000038, sig00000039, sig0000003a, sig0000003b, sig0000003c, sig0000003d, sig0000003e, sig0000003f, sig00000040, 
sig00000041, sig00000042, sig00000043, sig00000044, sig00000045, sig00000046, sig00000047, sig00000048, sig00000049, sig0000004a, sig0000004b, 
sig0000004c, sig0000004d, sig0000004e, sig0000004f, sig00000050}),
    .P({\NLW_blk00000103_P<47>_UNCONNECTED , \NLW_blk00000103_P<46>_UNCONNECTED , \NLW_blk00000103_P<45>_UNCONNECTED , 
\NLW_blk00000103_P<44>_UNCONNECTED , \NLW_blk00000103_P<43>_UNCONNECTED , \NLW_blk00000103_P<42>_UNCONNECTED , \NLW_blk00000103_P<41>_UNCONNECTED , 
\NLW_blk00000103_P<40>_UNCONNECTED , \NLW_blk00000103_P<39>_UNCONNECTED , \NLW_blk00000103_P<38>_UNCONNECTED , \NLW_blk00000103_P<37>_UNCONNECTED , 
\NLW_blk00000103_P<36>_UNCONNECTED , \NLW_blk00000103_P<35>_UNCONNECTED , \NLW_blk00000103_P<34>_UNCONNECTED , \NLW_blk00000103_P<33>_UNCONNECTED , 
\NLW_blk00000103_P<32>_UNCONNECTED , \NLW_blk00000103_P<31>_UNCONNECTED , sig00000060, sig00000061, sig00000062, sig00000063, sig00000064, sig00000065
, sig00000066, sig00000067, sig00000068, sig00000069, sig0000006a, sig0000006b, sig0000006c, sig0000006d, sig0000006e, sig0000006f, sig00000070, 
sig00000071, sig00000072, sig00000073, sig00000074, sig00000075, sig00000076, sig00000077, sig00000078, sig00000079, 
\NLW_blk00000103_P<4>_UNCONNECTED , \NLW_blk00000103_P<3>_UNCONNECTED , \NLW_blk00000103_P<2>_UNCONNECTED , \NLW_blk00000103_P<1>_UNCONNECTED , 
\NLW_blk00000103_P<0>_UNCONNECTED }),
    .PCOUT({sig0000007a, sig0000007b, sig0000007c, sig0000007d, sig0000007e, sig0000007f, sig00000080, sig00000081, sig00000082, sig00000083, 
sig00000084, sig00000085, sig00000086, sig00000087, sig00000088, sig00000089, sig0000008a, sig0000008b, sig0000008c, sig0000008d, sig0000008e, 
sig0000008f, sig00000090, sig00000091, sig00000092, sig00000093, sig00000094, sig00000095, sig00000096, sig00000097, sig00000098, sig00000099, 
sig0000009a, sig0000009b, sig0000009c, sig0000009d, sig0000009e, sig0000009f, sig000000a0, sig000000a1, sig000000a2, sig000000a3, sig000000a4, 
sig000000a5, sig000000a6, sig000000a7, sig000000a8, sig000000a9}),
    .ACIN({sig00000003, sig00000004, sig00000005, sig00000006, sig00000007, sig00000008, sig00000009, sig0000000a, sig0000000b, sig0000000c, 
sig0000000d, sig0000000e, sig0000000f, sig00000010, sig00000011, sig00000012, sig00000013, sig00000014, sig00000015, sig00000016, sig00000017, 
sig00000018, sig00000019, sig0000001a, sig0000001b, sig0000001c, sig0000001d, sig0000001e, sig0000001f, sig00000020}),
    .ACOUT({\NLW_blk00000103_ACOUT<29>_UNCONNECTED , \NLW_blk00000103_ACOUT<28>_UNCONNECTED , \NLW_blk00000103_ACOUT<27>_UNCONNECTED , 
\NLW_blk00000103_ACOUT<26>_UNCONNECTED , \NLW_blk00000103_ACOUT<25>_UNCONNECTED , \NLW_blk00000103_ACOUT<24>_UNCONNECTED , 
\NLW_blk00000103_ACOUT<23>_UNCONNECTED , \NLW_blk00000103_ACOUT<22>_UNCONNECTED , \NLW_blk00000103_ACOUT<21>_UNCONNECTED , 
\NLW_blk00000103_ACOUT<20>_UNCONNECTED , \NLW_blk00000103_ACOUT<19>_UNCONNECTED , \NLW_blk00000103_ACOUT<18>_UNCONNECTED , 
\NLW_blk00000103_ACOUT<17>_UNCONNECTED , \NLW_blk00000103_ACOUT<16>_UNCONNECTED , \NLW_blk00000103_ACOUT<15>_UNCONNECTED , 
\NLW_blk00000103_ACOUT<14>_UNCONNECTED , \NLW_blk00000103_ACOUT<13>_UNCONNECTED , \NLW_blk00000103_ACOUT<12>_UNCONNECTED , 
\NLW_blk00000103_ACOUT<11>_UNCONNECTED , \NLW_blk00000103_ACOUT<10>_UNCONNECTED , \NLW_blk00000103_ACOUT<9>_UNCONNECTED , 
\NLW_blk00000103_ACOUT<8>_UNCONNECTED , \NLW_blk00000103_ACOUT<7>_UNCONNECTED , \NLW_blk00000103_ACOUT<6>_UNCONNECTED , 
\NLW_blk00000103_ACOUT<5>_UNCONNECTED , \NLW_blk00000103_ACOUT<4>_UNCONNECTED , \NLW_blk00000103_ACOUT<3>_UNCONNECTED , 
\NLW_blk00000103_ACOUT<2>_UNCONNECTED , \NLW_blk00000103_ACOUT<1>_UNCONNECTED , \NLW_blk00000103_ACOUT<0>_UNCONNECTED }),
    .OPMODE({sig00000001, sig00000002, sig00000001, sig00000002, sig00000001, sig00000002, sig00000001}),
    .ALUMODE({sig00000002, sig00000002, sig00000002, sig00000002}),
    .C({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYOUT({\NLW_blk00000103_CARRYOUT<3>_UNCONNECTED , \NLW_blk00000103_CARRYOUT<2>_UNCONNECTED , \NLW_blk00000103_CARRYOUT<1>_UNCONNECTED , 
\NLW_blk00000103_CARRYOUT<0>_UNCONNECTED }),
    .BCIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .BCOUT({\NLW_blk00000103_BCOUT<17>_UNCONNECTED , \NLW_blk00000103_BCOUT<16>_UNCONNECTED , \NLW_blk00000103_BCOUT<15>_UNCONNECTED , 
\NLW_blk00000103_BCOUT<14>_UNCONNECTED , \NLW_blk00000103_BCOUT<13>_UNCONNECTED , \NLW_blk00000103_BCOUT<12>_UNCONNECTED , 
\NLW_blk00000103_BCOUT<11>_UNCONNECTED , \NLW_blk00000103_BCOUT<10>_UNCONNECTED , \NLW_blk00000103_BCOUT<9>_UNCONNECTED , 
\NLW_blk00000103_BCOUT<8>_UNCONNECTED , \NLW_blk00000103_BCOUT<7>_UNCONNECTED , \NLW_blk00000103_BCOUT<6>_UNCONNECTED , 
\NLW_blk00000103_BCOUT<5>_UNCONNECTED , \NLW_blk00000103_BCOUT<4>_UNCONNECTED , \NLW_blk00000103_BCOUT<3>_UNCONNECTED , 
\NLW_blk00000103_BCOUT<2>_UNCONNECTED , \NLW_blk00000103_BCOUT<1>_UNCONNECTED , \NLW_blk00000103_BCOUT<0>_UNCONNECTED }),
    .A({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002})
  );
  DSP48E #(
    .ACASCREG ( 1 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 1 ),
    .AUTORESET_PATTERN_DETECT ( 0 ),
    .AUTORESET_PATTERN_DETECT_OPTINV ( "MATCH" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 1 ),
    .BREG ( 1 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 0 ),
    .MASK ( 48'hFFFFFFFE0000 ),
    .MREG ( 1 ),
    .MULTCARRYINREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 1 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .SEL_ROUNDING_MASK ( "SEL_MASK" ),
    .SIM_MODE ( "SAFE" ),
    .USE_MULT ( "MULT_S" ),
    .USE_PATTERN_DETECT ( "PATDET" ),
    .USE_SIMD ( "ONE48" ))
  blk00000104 (
    .CEM(ce),
    .PATTERNDETECT(sig00000051),
    .CLK(clk),
    .PATTERNBDETECT(NLW_blk00000104_PATTERNBDETECT_UNCONNECTED),
    .RSTC(sig00000002),
    .CEB1(sig00000002),
    .MULTSIGNOUT(NLW_blk00000104_MULTSIGNOUT_UNCONNECTED),
    .CEC(sig00000002),
    .RSTM(sig00000002),
    .MULTSIGNIN(sig00000002),
    .CEB2(ce),
    .RSTCTRL(sig00000002),
    .CEP(ce),
    .CARRYCASCOUT(NLW_blk00000104_CARRYCASCOUT_UNCONNECTED),
    .RSTA(sig00000002),
    .CECARRYIN(sig00000002),
    .UNDERFLOW(NLW_blk00000104_UNDERFLOW_UNCONNECTED),
    .RSTALUMODE(sig00000002),
    .RSTALLCARRYIN(sig00000002),
    .CEALUMODE(sig00000002),
    .CEA2(ce),
    .CEA1(sig00000002),
    .RSTB(sig00000002),
    .CEMULTCARRYIN(sig00000002),
    .OVERFLOW(NLW_blk00000104_OVERFLOW_UNCONNECTED),
    .CECTRL(sig00000002),
    .CARRYIN(sig00000002),
    .CARRYCASCIN(sig00000002),
    .RSTP(sig00000002),
    .CARRYINSEL({sig00000002, sig00000002, sig00000002}),
    .ACOUT({sig00000003, sig00000004, sig00000005, sig00000006, sig00000007, sig00000008, sig00000009, sig0000000a, sig0000000b, sig0000000c, 
sig0000000d, sig0000000e, sig0000000f, sig00000010, sig00000011, sig00000012, sig00000013, sig00000014, sig00000015, sig00000016, sig00000017, 
sig00000018, sig00000019, sig0000001a, sig0000001b, sig0000001c, sig0000001d, sig0000001e, sig0000001f, sig00000020}),
    .A({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000001, a[22], a[21], a[20], a[19], a[18], a[17], a[16], 
a[15], a[14], a[13], a[12], a[11], a[10], a[9], a[8], a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0]}),
    .B({sig00000002, b[16], b[15], b[14], b[13], b[12], b[11], b[10], b[9], b[8], b[7], b[6], b[5], b[4], b[3], b[2], b[1], b[0]}),
    .PCOUT({sig00000021, sig00000022, sig00000023, sig00000024, sig00000025, sig00000026, sig00000027, sig00000028, sig00000029, sig0000002a, 
sig0000002b, sig0000002c, sig0000002d, sig0000002e, sig0000002f, sig00000030, sig00000031, sig00000032, sig00000033, sig00000034, sig00000035, 
sig00000036, sig00000037, sig00000038, sig00000039, sig0000003a, sig0000003b, sig0000003c, sig0000003d, sig0000003e, sig0000003f, sig00000040, 
sig00000041, sig00000042, sig00000043, sig00000044, sig00000045, sig00000046, sig00000047, sig00000048, sig00000049, sig0000004a, sig0000004b, 
sig0000004c, sig0000004d, sig0000004e, sig0000004f, sig00000050}),
    .OPMODE({sig00000002, sig00000002, sig00000002, sig00000002, sig00000001, sig00000002, sig00000001}),
    .PCIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .ALUMODE({sig00000002, sig00000002, sig00000002, sig00000002}),
    .C({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYOUT({\NLW_blk00000104_CARRYOUT<3>_UNCONNECTED , \NLW_blk00000104_CARRYOUT<2>_UNCONNECTED , \NLW_blk00000104_CARRYOUT<1>_UNCONNECTED , 
\NLW_blk00000104_CARRYOUT<0>_UNCONNECTED }),
    .BCIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .BCOUT({\NLW_blk00000104_BCOUT<17>_UNCONNECTED , \NLW_blk00000104_BCOUT<16>_UNCONNECTED , \NLW_blk00000104_BCOUT<15>_UNCONNECTED , 
\NLW_blk00000104_BCOUT<14>_UNCONNECTED , \NLW_blk00000104_BCOUT<13>_UNCONNECTED , \NLW_blk00000104_BCOUT<12>_UNCONNECTED , 
\NLW_blk00000104_BCOUT<11>_UNCONNECTED , \NLW_blk00000104_BCOUT<10>_UNCONNECTED , \NLW_blk00000104_BCOUT<9>_UNCONNECTED , 
\NLW_blk00000104_BCOUT<8>_UNCONNECTED , \NLW_blk00000104_BCOUT<7>_UNCONNECTED , \NLW_blk00000104_BCOUT<6>_UNCONNECTED , 
\NLW_blk00000104_BCOUT<5>_UNCONNECTED , \NLW_blk00000104_BCOUT<4>_UNCONNECTED , \NLW_blk00000104_BCOUT<3>_UNCONNECTED , 
\NLW_blk00000104_BCOUT<2>_UNCONNECTED , \NLW_blk00000104_BCOUT<1>_UNCONNECTED , \NLW_blk00000104_BCOUT<0>_UNCONNECTED }),
    .P({\NLW_blk00000104_P<47>_UNCONNECTED , \NLW_blk00000104_P<46>_UNCONNECTED , \NLW_blk00000104_P<45>_UNCONNECTED , 
\NLW_blk00000104_P<44>_UNCONNECTED , \NLW_blk00000104_P<43>_UNCONNECTED , \NLW_blk00000104_P<42>_UNCONNECTED , \NLW_blk00000104_P<41>_UNCONNECTED , 
\NLW_blk00000104_P<40>_UNCONNECTED , \NLW_blk00000104_P<39>_UNCONNECTED , \NLW_blk00000104_P<38>_UNCONNECTED , \NLW_blk00000104_P<37>_UNCONNECTED , 
\NLW_blk00000104_P<36>_UNCONNECTED , \NLW_blk00000104_P<35>_UNCONNECTED , \NLW_blk00000104_P<34>_UNCONNECTED , \NLW_blk00000104_P<33>_UNCONNECTED , 
\NLW_blk00000104_P<32>_UNCONNECTED , \NLW_blk00000104_P<31>_UNCONNECTED , \NLW_blk00000104_P<30>_UNCONNECTED , \NLW_blk00000104_P<29>_UNCONNECTED , 
\NLW_blk00000104_P<28>_UNCONNECTED , \NLW_blk00000104_P<27>_UNCONNECTED , \NLW_blk00000104_P<26>_UNCONNECTED , \NLW_blk00000104_P<25>_UNCONNECTED , 
\NLW_blk00000104_P<24>_UNCONNECTED , \NLW_blk00000104_P<23>_UNCONNECTED , \NLW_blk00000104_P<22>_UNCONNECTED , \NLW_blk00000104_P<21>_UNCONNECTED , 
\NLW_blk00000104_P<20>_UNCONNECTED , \NLW_blk00000104_P<19>_UNCONNECTED , \NLW_blk00000104_P<18>_UNCONNECTED , \NLW_blk00000104_P<17>_UNCONNECTED , 
\NLW_blk00000104_P<16>_UNCONNECTED , \NLW_blk00000104_P<15>_UNCONNECTED , \NLW_blk00000104_P<14>_UNCONNECTED , \NLW_blk00000104_P<13>_UNCONNECTED , 
\NLW_blk00000104_P<12>_UNCONNECTED , \NLW_blk00000104_P<11>_UNCONNECTED , \NLW_blk00000104_P<10>_UNCONNECTED , \NLW_blk00000104_P<9>_UNCONNECTED , 
\NLW_blk00000104_P<8>_UNCONNECTED , \NLW_blk00000104_P<7>_UNCONNECTED , \NLW_blk00000104_P<6>_UNCONNECTED , \NLW_blk00000104_P<5>_UNCONNECTED , 
\NLW_blk00000104_P<4>_UNCONNECTED , \NLW_blk00000104_P<3>_UNCONNECTED , \NLW_blk00000104_P<2>_UNCONNECTED , \NLW_blk00000104_P<1>_UNCONNECTED , 
\NLW_blk00000104_P<0>_UNCONNECTED }),
    .ACIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002})
  );
  DSP48E #(
    .ACASCREG ( 0 ),
    .ALUMODEREG ( 0 ),
    .AREG ( 0 ),
    .AUTORESET_PATTERN_DETECT ( 0 ),
    .AUTORESET_PATTERN_DETECT_OPTINV ( "MATCH" ),
    .A_INPUT ( "DIRECT" ),
    .BCASCREG ( 0 ),
    .BREG ( 0 ),
    .B_INPUT ( "DIRECT" ),
    .CARRYINREG ( 0 ),
    .CARRYINSELREG ( 0 ),
    .CREG ( 1 ),
    .MASK ( 48'h3FFFFFFFFFFF ),
    .MREG ( 0 ),
    .MULTCARRYINREG ( 0 ),
    .OPMODEREG ( 0 ),
    .PATTERN ( 48'h000000000000 ),
    .PREG ( 1 ),
    .SEL_MASK ( "MASK" ),
    .SEL_PATTERN ( "PATTERN" ),
    .SEL_ROUNDING_MASK ( "SEL_MASK" ),
    .SIM_MODE ( "SAFE" ),
    .USE_MULT ( "NONE" ),
    .USE_PATTERN_DETECT ( "NO_PATDET" ),
    .USE_SIMD ( "ONE48" ))
  blk00000105 (
    .CEP(ce),
    .CLK(clk),
    .PATTERNBDETECT(NLW_blk00000105_PATTERNBDETECT_UNCONNECTED),
    .RSTC(sig00000002),
    .CEB1(sig00000002),
    .MULTSIGNOUT(NLW_blk00000105_MULTSIGNOUT_UNCONNECTED),
    .CEC(ce),
    .RSTM(sig00000002),
    .MULTSIGNIN(sig00000002),
    .CEB2(sig00000002),
    .RSTCTRL(sig00000002),
    .CARRYCASCOUT(NLW_blk00000105_CARRYCASCOUT_UNCONNECTED),
    .RSTA(sig00000002),
    .CECARRYIN(sig00000002),
    .UNDERFLOW(NLW_blk00000105_UNDERFLOW_UNCONNECTED),
    .PATTERNDETECT(NLW_blk00000105_PATTERNDETECT_UNCONNECTED),
    .RSTALUMODE(sig00000002),
    .RSTALLCARRYIN(sig00000002),
    .CEALUMODE(sig00000002),
    .CEA2(sig00000002),
    .CEA1(sig00000002),
    .RSTB(sig00000002),
    .CEMULTCARRYIN(sig00000002),
    .OVERFLOW(NLW_blk00000105_OVERFLOW_UNCONNECTED),
    .CECTRL(sig00000002),
    .CEM(sig00000002),
    .CARRYIN(sig00000002),
    .CARRYCASCIN(sig00000002),
    .RSTP(sig00000002),
    .CARRYINSEL({sig00000002, sig00000002, sig00000002}),
    .A({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000001, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000001, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .PCIN({sig0000007a, sig0000007b, sig0000007c, sig0000007d, sig0000007e, sig0000007f, sig00000080, sig00000081, sig00000082, sig00000083, 
sig00000084, sig00000085, sig00000086, sig00000087, sig00000088, sig00000089, sig0000008a, sig0000008b, sig0000008c, sig0000008d, sig0000008e, 
sig0000008f, sig00000090, sig00000091, sig00000092, sig00000093, sig00000094, sig00000095, sig00000096, sig00000097, sig00000098, sig00000099, 
sig0000009a, sig0000009b, sig0000009c, sig0000009d, sig0000009e, sig0000009f, sig000000a0, sig000000a1, sig000000a2, sig000000a3, sig000000a4, 
sig000000a5, sig000000a6, sig000000a7, sig000000a8, sig000000a9}),
    .C({sig00000053, sig00000054, sig00000055, sig00000056, sig00000057, sig00000058, sig00000059, sig00000002, sig00000052, sig00000053, sig00000054
, sig00000055, sig00000056, sig00000057, sig00000058, sig00000059, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000001, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002}),
    .CARRYOUT({sig00000126, \NLW_blk00000105_CARRYOUT<2>_UNCONNECTED , \NLW_blk00000105_CARRYOUT<1>_UNCONNECTED , 
\NLW_blk00000105_CARRYOUT<0>_UNCONNECTED }),
    .P({sig0000014d, sig0000014c, sig0000014b, sig0000014a, sig00000149, sig00000148, sig00000147, \NLW_blk00000105_P<40>_UNCONNECTED , sig00000145, 
sig00000144, sig00000143, sig00000142, sig00000141, sig00000140, sig0000013f, sig0000013e, \NLW_blk00000105_P<31>_UNCONNECTED , sig00000146, 
sig00000127, sig0000013d, sig0000013c, sig0000013b, sig0000013a, sig00000139, sig00000138, sig00000137, sig00000136, sig00000135, sig00000134, 
sig00000133, sig00000132, sig00000131, sig00000130, sig0000012f, sig0000012e, sig0000012d, sig0000012c, sig0000012b, sig0000012a, sig00000129, 
sig00000128, \NLW_blk00000105_P<6>_UNCONNECTED , \NLW_blk00000105_P<5>_UNCONNECTED , \NLW_blk00000105_P<4>_UNCONNECTED , 
\NLW_blk00000105_P<3>_UNCONNECTED , \NLW_blk00000105_P<2>_UNCONNECTED , \NLW_blk00000105_P<1>_UNCONNECTED , \NLW_blk00000105_P<0>_UNCONNECTED }),
    .ACOUT({\NLW_blk00000105_ACOUT<29>_UNCONNECTED , \NLW_blk00000105_ACOUT<28>_UNCONNECTED , \NLW_blk00000105_ACOUT<27>_UNCONNECTED , 
\NLW_blk00000105_ACOUT<26>_UNCONNECTED , \NLW_blk00000105_ACOUT<25>_UNCONNECTED , \NLW_blk00000105_ACOUT<24>_UNCONNECTED , 
\NLW_blk00000105_ACOUT<23>_UNCONNECTED , \NLW_blk00000105_ACOUT<22>_UNCONNECTED , \NLW_blk00000105_ACOUT<21>_UNCONNECTED , 
\NLW_blk00000105_ACOUT<20>_UNCONNECTED , \NLW_blk00000105_ACOUT<19>_UNCONNECTED , \NLW_blk00000105_ACOUT<18>_UNCONNECTED , 
\NLW_blk00000105_ACOUT<17>_UNCONNECTED , \NLW_blk00000105_ACOUT<16>_UNCONNECTED , \NLW_blk00000105_ACOUT<15>_UNCONNECTED , 
\NLW_blk00000105_ACOUT<14>_UNCONNECTED , \NLW_blk00000105_ACOUT<13>_UNCONNECTED , \NLW_blk00000105_ACOUT<12>_UNCONNECTED , 
\NLW_blk00000105_ACOUT<11>_UNCONNECTED , \NLW_blk00000105_ACOUT<10>_UNCONNECTED , \NLW_blk00000105_ACOUT<9>_UNCONNECTED , 
\NLW_blk00000105_ACOUT<8>_UNCONNECTED , \NLW_blk00000105_ACOUT<7>_UNCONNECTED , \NLW_blk00000105_ACOUT<6>_UNCONNECTED , 
\NLW_blk00000105_ACOUT<5>_UNCONNECTED , \NLW_blk00000105_ACOUT<4>_UNCONNECTED , \NLW_blk00000105_ACOUT<3>_UNCONNECTED , 
\NLW_blk00000105_ACOUT<2>_UNCONNECTED , \NLW_blk00000105_ACOUT<1>_UNCONNECTED , \NLW_blk00000105_ACOUT<0>_UNCONNECTED }),
    .OPMODE({sig00000002, sig00000002, sig00000001, sig00000001, sig00000001, sig00000001, sig00000001}),
    .ALUMODE({sig00000002, sig00000002, sig00000002, sig00000002}),
    .BCIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .B({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002
, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002}),
    .BCOUT({\NLW_blk00000105_BCOUT<17>_UNCONNECTED , \NLW_blk00000105_BCOUT<16>_UNCONNECTED , \NLW_blk00000105_BCOUT<15>_UNCONNECTED , 
\NLW_blk00000105_BCOUT<14>_UNCONNECTED , \NLW_blk00000105_BCOUT<13>_UNCONNECTED , \NLW_blk00000105_BCOUT<12>_UNCONNECTED , 
\NLW_blk00000105_BCOUT<11>_UNCONNECTED , \NLW_blk00000105_BCOUT<10>_UNCONNECTED , \NLW_blk00000105_BCOUT<9>_UNCONNECTED , 
\NLW_blk00000105_BCOUT<8>_UNCONNECTED , \NLW_blk00000105_BCOUT<7>_UNCONNECTED , \NLW_blk00000105_BCOUT<6>_UNCONNECTED , 
\NLW_blk00000105_BCOUT<5>_UNCONNECTED , \NLW_blk00000105_BCOUT<4>_UNCONNECTED , \NLW_blk00000105_BCOUT<3>_UNCONNECTED , 
\NLW_blk00000105_BCOUT<2>_UNCONNECTED , \NLW_blk00000105_BCOUT<1>_UNCONNECTED , \NLW_blk00000105_BCOUT<0>_UNCONNECTED }),
    .PCOUT({\NLW_blk00000105_PCOUT<47>_UNCONNECTED , \NLW_blk00000105_PCOUT<46>_UNCONNECTED , \NLW_blk00000105_PCOUT<45>_UNCONNECTED , 
\NLW_blk00000105_PCOUT<44>_UNCONNECTED , \NLW_blk00000105_PCOUT<43>_UNCONNECTED , \NLW_blk00000105_PCOUT<42>_UNCONNECTED , 
\NLW_blk00000105_PCOUT<41>_UNCONNECTED , \NLW_blk00000105_PCOUT<40>_UNCONNECTED , \NLW_blk00000105_PCOUT<39>_UNCONNECTED , 
\NLW_blk00000105_PCOUT<38>_UNCONNECTED , \NLW_blk00000105_PCOUT<37>_UNCONNECTED , \NLW_blk00000105_PCOUT<36>_UNCONNECTED , 
\NLW_blk00000105_PCOUT<35>_UNCONNECTED , \NLW_blk00000105_PCOUT<34>_UNCONNECTED , \NLW_blk00000105_PCOUT<33>_UNCONNECTED , 
\NLW_blk00000105_PCOUT<32>_UNCONNECTED , \NLW_blk00000105_PCOUT<31>_UNCONNECTED , \NLW_blk00000105_PCOUT<30>_UNCONNECTED , 
\NLW_blk00000105_PCOUT<29>_UNCONNECTED , \NLW_blk00000105_PCOUT<28>_UNCONNECTED , \NLW_blk00000105_PCOUT<27>_UNCONNECTED , 
\NLW_blk00000105_PCOUT<26>_UNCONNECTED , \NLW_blk00000105_PCOUT<25>_UNCONNECTED , \NLW_blk00000105_PCOUT<24>_UNCONNECTED , 
\NLW_blk00000105_PCOUT<23>_UNCONNECTED , \NLW_blk00000105_PCOUT<22>_UNCONNECTED , \NLW_blk00000105_PCOUT<21>_UNCONNECTED , 
\NLW_blk00000105_PCOUT<20>_UNCONNECTED , \NLW_blk00000105_PCOUT<19>_UNCONNECTED , \NLW_blk00000105_PCOUT<18>_UNCONNECTED , 
\NLW_blk00000105_PCOUT<17>_UNCONNECTED , \NLW_blk00000105_PCOUT<16>_UNCONNECTED , \NLW_blk00000105_PCOUT<15>_UNCONNECTED , 
\NLW_blk00000105_PCOUT<14>_UNCONNECTED , \NLW_blk00000105_PCOUT<13>_UNCONNECTED , \NLW_blk00000105_PCOUT<12>_UNCONNECTED , 
\NLW_blk00000105_PCOUT<11>_UNCONNECTED , \NLW_blk00000105_PCOUT<10>_UNCONNECTED , \NLW_blk00000105_PCOUT<9>_UNCONNECTED , 
\NLW_blk00000105_PCOUT<8>_UNCONNECTED , \NLW_blk00000105_PCOUT<7>_UNCONNECTED , \NLW_blk00000105_PCOUT<6>_UNCONNECTED , 
\NLW_blk00000105_PCOUT<5>_UNCONNECTED , \NLW_blk00000105_PCOUT<4>_UNCONNECTED , \NLW_blk00000105_PCOUT<3>_UNCONNECTED , 
\NLW_blk00000105_PCOUT<2>_UNCONNECTED , \NLW_blk00000105_PCOUT<1>_UNCONNECTED , \NLW_blk00000105_PCOUT<0>_UNCONNECTED }),
    .ACIN({sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, 
sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002, sig00000002})
  );



endmodule


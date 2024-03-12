/*

    i0   i1   i2   i3  i4   i5   i6   i7   i8   i9   i10  i11  i12  i13  i14  i15
0    4   13   22   31  38   46   54   61   67   73   78   82   85   88   90   90    i0
1  -13  -38  -61  -78 -88  -90  -85  -73  -54  -31   -4   22   46   67   82   90    i1 
2   22   61   85   90  73   38   -4  -46  -78  -90  -82  -54  -13   31   67   88    i2
3  -31  -78  -90  -61  -4   54   88   82   38  -22  -73  -90  -67  -13   46   85    i3
4   38   88   73    4 -67  -90  -46   31   85   78   13  -61  -90  -54   22   82    i4
5  -46  -90  -38   54  90   31  -61  -88  -22   67   85   13  -73  -82   -4   78    i5
6   54   85   -4  -88 -46   61   82  -13  -90  -38   67   78  -22  -90  -31   73    i6
7  -61  -73   46   82 -31  -88   13   90    4  -90  -22   85   38  -78  -54   67    i7
8   67   54  -78  -38  85   22  -90   -4   90  -13  -88   31   82  -46  -73   61    i8
9  -73  -31   90  -22 -78   67   38  -90   13   82  -61  -46   88   -4  -85   54    i9
10  78    4  -82   73  13  -85   67   22  -88   61   31  -90   54   38  -90   46    i10
11 -82   22   54  -90  61   13  -78   85  -31  -46   90  -67   -4   73  -88   38    i11
12  85  -46  -13   67 -90   73  -22  -38   82  -88   54    4  -61   90  -78   31    i12
13 -88   67  -31  -13  54  -82   90  -78   46   -4  -38   73  -90   85  -61   22    i13
14  90  -82   67  -46  22    4  -31   54  -73   85  -90   88  -78   61  -38   13    i14
15 -90   90  -88   85 -82   78  -73   67  -61   54  -46   38  -31   22  -13    4    i15
*/
module mcm_16(
           clk,
           rst,
       inverse,
   
           i_0,
           i_1,
           i_2,
           i_3,
           i_4,
           i_5,
           i_6,
           i_7,
           i_8,
           i_9,
          i_10,
          i_11,
          i_12,
          i_13,
          i_14,
          i_15,
          
          m3_0,
          m3_1,
          m3_2,
          m3_3,
          m3_4,
          m3_5,
          m3_6,
          m3_7,
          m3_8,
          m3_9,
         m3_10,
         m3_11,
         m3_12,
         m3_13,
         m3_14,
         m3_15
          
);

// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION                                               
//                                                                             
// ********************************************  
input               clk;
input               rst;
input           inverse;

input signed [16:0] i_0;
input signed [16:0] i_1;
input signed [16:0] i_2;
input signed [16:0] i_3;
input signed [16:0] i_4;
input signed [16:0] i_5;
input signed [16:0] i_6;
input signed [16:0] i_7;
input signed [16:0] i_8;
input signed [16:0] i_9;
input signed [16:0] i_10;
input signed [16:0] i_11;
input signed [16:0] i_12;
input signed [16:0] i_13;
input signed [16:0] i_14;
input signed [16:0] i_15;

output reg signed [16+7+4:0] m3_0;
output reg signed [16+7+4:0] m3_1;
output reg signed [16+7+4:0] m3_2;
output reg signed [16+7+4:0] m3_3;
output reg signed [16+7+4:0] m3_4;
output reg signed [16+7+4:0] m3_5;
output reg signed [16+7+4:0] m3_6;
output reg signed [16+7+4:0] m3_7;
output reg signed [16+7+4:0] m3_8;
output reg signed [16+7+4:0] m3_9;
output reg signed [16+7+4:0] m3_10;
output reg signed [16+7+4:0] m3_11;
output reg signed [16+7+4:0] m3_12;
output reg signed [16+7+4:0] m3_13;
output reg signed [16+7+4:0] m3_14;
output reg signed [16+7+4:0] m3_15;

// ********************************************
//                                             
//    Wire DECLARATION                         
//                                             
// ********************************************

wire signed  [16+7:0]  w0_0;
wire signed  [16+7:0]  w0_1;
wire signed  [16+7:0]  w0_2;
wire signed  [16+7:0]  w0_3;
wire signed  [16+7:0]  w0_4;
wire signed  [16+7:0]  w0_5;
wire signed  [16+7:0]  w0_6;
wire signed  [16+7:0]  w0_7;
wire signed  [16+7:0]  w0_8;
wire signed  [16+7:0]  w0_9;
wire signed  [16+7:0]  w0_10;
wire signed  [16+7:0]  w0_11;
wire signed  [16+7:0]  w0_12;
wire signed  [16+7:0]  w0_13;
wire signed  [16+7:0]  w0_14;


wire signed  [16+7:0]  w1_0;
wire signed  [16+7:0]  w1_1;
wire signed  [16+7:0]  w1_2;
wire signed  [16+7:0]  w1_3;
wire signed  [16+7:0]  w1_4;
wire signed  [16+7:0]  w1_5;
wire signed  [16+7:0]  w1_6;
wire signed  [16+7:0]  w1_7;
wire signed  [16+7:0]  w1_8;
wire signed  [16+7:0]  w1_9;
wire signed  [16+7:0]  w1_10;
wire signed  [16+7:0]  w1_11;
wire signed  [16+7:0]  w1_12;
wire signed  [16+7:0]  w1_13;
wire signed  [16+7:0]  w1_14;


wire signed  [16+7:0]  w2_0;
wire signed  [16+7:0]  w2_1;
wire signed  [16+7:0]  w2_2;
wire signed  [16+7:0]  w2_3;
wire signed  [16+7:0]  w2_4;
wire signed  [16+7:0]  w2_5;
wire signed  [16+7:0]  w2_6;
wire signed  [16+7:0]  w2_7;
wire signed  [16+7:0]  w2_8;
wire signed  [16+7:0]  w2_9;
wire signed  [16+7:0]  w2_10;
wire signed  [16+7:0]  w2_11;
wire signed  [16+7:0]  w2_12;
wire signed  [16+7:0]  w2_13;
wire signed  [16+7:0]  w2_14;


wire signed  [16+7:0]  w3_0;
wire signed  [16+7:0]  w3_1;
wire signed  [16+7:0]  w3_2;
wire signed  [16+7:0]  w3_3;
wire signed  [16+7:0]  w3_4;
wire signed  [16+7:0]  w3_5;
wire signed  [16+7:0]  w3_6;
wire signed  [16+7:0]  w3_7;
wire signed  [16+7:0]  w3_8;
wire signed  [16+7:0]  w3_9;
wire signed  [16+7:0]  w3_10;
wire signed  [16+7:0]  w3_11;
wire signed  [16+7:0]  w3_12;
wire signed  [16+7:0]  w3_13;
wire signed  [16+7:0]  w3_14;


wire signed  [16+7:0]  w4_0;
wire signed  [16+7:0]  w4_1;
wire signed  [16+7:0]  w4_2;
wire signed  [16+7:0]  w4_3;
wire signed  [16+7:0]  w4_4;
wire signed  [16+7:0]  w4_5;
wire signed  [16+7:0]  w4_6;
wire signed  [16+7:0]  w4_7;
wire signed  [16+7:0]  w4_8;
wire signed  [16+7:0]  w4_9;
wire signed  [16+7:0]  w4_10;
wire signed  [16+7:0]  w4_11;
wire signed  [16+7:0]  w4_12;
wire signed  [16+7:0]  w4_13;
wire signed  [16+7:0]  w4_14;


wire signed  [16+7:0]  w5_0;
wire signed  [16+7:0]  w5_1;
wire signed  [16+7:0]  w5_2;
wire signed  [16+7:0]  w5_3;
wire signed  [16+7:0]  w5_4;
wire signed  [16+7:0]  w5_5;
wire signed  [16+7:0]  w5_6;
wire signed  [16+7:0]  w5_7;
wire signed  [16+7:0]  w5_8;
wire signed  [16+7:0]  w5_9;
wire signed  [16+7:0]  w5_10;
wire signed  [16+7:0]  w5_11;
wire signed  [16+7:0]  w5_12;
wire signed  [16+7:0]  w5_13;
wire signed  [16+7:0]  w5_14;


wire signed  [16+7:0]  w6_0;
wire signed  [16+7:0]  w6_1;
wire signed  [16+7:0]  w6_2;
wire signed  [16+7:0]  w6_3;
wire signed  [16+7:0]  w6_4;
wire signed  [16+7:0]  w6_5;
wire signed  [16+7:0]  w6_6;
wire signed  [16+7:0]  w6_7;
wire signed  [16+7:0]  w6_8;
wire signed  [16+7:0]  w6_9;
wire signed  [16+7:0]  w6_10;
wire signed  [16+7:0]  w6_11;
wire signed  [16+7:0]  w6_12;
wire signed  [16+7:0]  w6_13;
wire signed  [16+7:0]  w6_14;


wire signed  [16+7:0]  w7_0;
wire signed  [16+7:0]  w7_1;
wire signed  [16+7:0]  w7_2;
wire signed  [16+7:0]  w7_3;
wire signed  [16+7:0]  w7_4;
wire signed  [16+7:0]  w7_5;
wire signed  [16+7:0]  w7_6;
wire signed  [16+7:0]  w7_7;
wire signed  [16+7:0]  w7_8;
wire signed  [16+7:0]  w7_9;
wire signed  [16+7:0]  w7_10;
wire signed  [16+7:0]  w7_11;
wire signed  [16+7:0]  w7_12;
wire signed  [16+7:0]  w7_13;
wire signed  [16+7:0]  w7_14;


wire signed  [16+7:0]  w8_0;
wire signed  [16+7:0]  w8_1;
wire signed  [16+7:0]  w8_2;
wire signed  [16+7:0]  w8_3;
wire signed  [16+7:0]  w8_4;
wire signed  [16+7:0]  w8_5;
wire signed  [16+7:0]  w8_6;
wire signed  [16+7:0]  w8_7;
wire signed  [16+7:0]  w8_8;
wire signed  [16+7:0]  w8_9;
wire signed  [16+7:0]  w8_10;
wire signed  [16+7:0]  w8_11;
wire signed  [16+7:0]  w8_12;
wire signed  [16+7:0]  w8_13;
wire signed  [16+7:0]  w8_14;


wire signed  [16+7:0]  w9_0;
wire signed  [16+7:0]  w9_1;
wire signed  [16+7:0]  w9_2;
wire signed  [16+7:0]  w9_3;
wire signed  [16+7:0]  w9_4;
wire signed  [16+7:0]  w9_5;
wire signed  [16+7:0]  w9_6;
wire signed  [16+7:0]  w9_7;
wire signed  [16+7:0]  w9_8;
wire signed  [16+7:0]  w9_9;
wire signed  [16+7:0]  w9_10;
wire signed  [16+7:0]  w9_11;
wire signed  [16+7:0]  w9_12;
wire signed  [16+7:0]  w9_13;
wire signed  [16+7:0]  w9_14;


wire signed  [16+7:0]  w10_0;
wire signed  [16+7:0]  w10_1;
wire signed  [16+7:0]  w10_2;
wire signed  [16+7:0]  w10_3;
wire signed  [16+7:0]  w10_4;
wire signed  [16+7:0]  w10_5;
wire signed  [16+7:0]  w10_6;
wire signed  [16+7:0]  w10_7;
wire signed  [16+7:0]  w10_8;
wire signed  [16+7:0]  w10_9;
wire signed  [16+7:0]  w10_10;
wire signed  [16+7:0]  w10_11;
wire signed  [16+7:0]  w10_12;
wire signed  [16+7:0]  w10_13;
wire signed  [16+7:0]  w10_14;


wire signed  [16+7:0]  w11_0;
wire signed  [16+7:0]  w11_1;
wire signed  [16+7:0]  w11_2;
wire signed  [16+7:0]  w11_3;
wire signed  [16+7:0]  w11_4;
wire signed  [16+7:0]  w11_5;
wire signed  [16+7:0]  w11_6;
wire signed  [16+7:0]  w11_7;
wire signed  [16+7:0]  w11_8;
wire signed  [16+7:0]  w11_9;
wire signed  [16+7:0]  w11_10;
wire signed  [16+7:0]  w11_11;
wire signed  [16+7:0]  w11_12;
wire signed  [16+7:0]  w11_13;
wire signed  [16+7:0]  w11_14;

wire signed  [16+7:0]  w12_0;
wire signed  [16+7:0]  w12_1;
wire signed  [16+7:0]  w12_2;
wire signed  [16+7:0]  w12_3;
wire signed  [16+7:0]  w12_4;
wire signed  [16+7:0]  w12_5;
wire signed  [16+7:0]  w12_6;
wire signed  [16+7:0]  w12_7;
wire signed  [16+7:0]  w12_8;
wire signed  [16+7:0]  w12_9;
wire signed  [16+7:0]  w12_10;
wire signed  [16+7:0]  w12_11;
wire signed  [16+7:0]  w12_12;
wire signed  [16+7:0]  w12_13;
wire signed  [16+7:0]  w12_14;


wire signed  [16+7:0]  w13_0;
wire signed  [16+7:0]  w13_1;
wire signed  [16+7:0]  w13_2;
wire signed  [16+7:0]  w13_3;
wire signed  [16+7:0]  w13_4;
wire signed  [16+7:0]  w13_5;
wire signed  [16+7:0]  w13_6;
wire signed  [16+7:0]  w13_7;
wire signed  [16+7:0]  w13_8;
wire signed  [16+7:0]  w13_9;
wire signed  [16+7:0]  w13_10;
wire signed  [16+7:0]  w13_11;
wire signed  [16+7:0]  w13_12;
wire signed  [16+7:0]  w13_13;
wire signed  [16+7:0]  w13_14;


wire signed  [16+7:0]  w14_0;
wire signed  [16+7:0]  w14_1;
wire signed  [16+7:0]  w14_2;
wire signed  [16+7:0]  w14_3;
wire signed  [16+7:0]  w14_4;
wire signed  [16+7:0]  w14_5;
wire signed  [16+7:0]  w14_6;
wire signed  [16+7:0]  w14_7;
wire signed  [16+7:0]  w14_8;
wire signed  [16+7:0]  w14_9;
wire signed  [16+7:0]  w14_10;
wire signed  [16+7:0]  w14_11;
wire signed  [16+7:0]  w14_12;
wire signed  [16+7:0]  w14_13;
wire signed  [16+7:0]  w14_14;


wire signed  [16+7:0]  w15_0;
wire signed  [16+7:0]  w15_1;
wire signed  [16+7:0]  w15_2;
wire signed  [16+7:0]  w15_3;
wire signed  [16+7:0]  w15_4;
wire signed  [16+7:0]  w15_5;
wire signed  [16+7:0]  w15_6;
wire signed  [16+7:0]  w15_7;
wire signed  [16+7:0]  w15_8;
wire signed  [16+7:0]  w15_9;
wire signed  [16+7:0]  w15_10;
wire signed  [16+7:0]  w15_11;
wire signed  [16+7:0]  w15_12;
wire signed  [16+7:0]  w15_13;
wire signed  [16+7:0]  w15_14;


wire signed  [16+8:0]  w_00;
wire signed  [16+8:0]  w_01;
wire signed  [16+8:0]  w_02;
wire signed  [16+8:0]  w_03;
wire signed  [16+8:0]  w_04;
wire signed  [16+8:0]  w_05;
wire signed  [16+8:0]  w_06;
wire signed  [16+8:0]  w_07;

wire signed  [16+8:0]  w_10;
wire signed  [16+8:0]  w_11;
wire signed  [16+8:0]  w_12;
wire signed  [16+8:0]  w_13;
wire signed  [16+8:0]  w_14;
wire signed  [16+8:0]  w_15;
wire signed  [16+8:0]  w_16;
wire signed  [16+8:0]  w_17;

wire signed  [16+8:0]  w_20;
wire signed  [16+8:0]  w_21;
wire signed  [16+8:0]  w_22;
wire signed  [16+8:0]  w_23;
wire signed  [16+8:0]  w_24;
wire signed  [16+8:0]  w_25;
wire signed  [16+8:0]  w_26;
wire signed  [16+8:0]  w_27;


wire signed  [16+8:0]  w_30;
wire signed  [16+8:0]  w_31;
wire signed  [16+8:0]  w_32;
wire signed  [16+8:0]  w_33;
wire signed  [16+8:0]  w_34;
wire signed  [16+8:0]  w_35;
wire signed  [16+8:0]  w_36;
wire signed  [16+8:0]  w_37;


wire signed  [16+8:0]  w_40;
wire signed  [16+8:0]  w_41;
wire signed  [16+8:0]  w_42;
wire signed  [16+8:0]  w_43;
wire signed  [16+8:0]  w_44;
wire signed  [16+8:0]  w_45;
wire signed  [16+8:0]  w_46;
wire signed  [16+8:0]  w_47;

wire signed  [16+8:0]  w_50;
wire signed  [16+8:0]  w_51;
wire signed  [16+8:0]  w_52;
wire signed  [16+8:0]  w_53;
wire signed  [16+8:0]  w_54;
wire signed  [16+8:0]  w_55;
wire signed  [16+8:0]  w_56;
wire signed  [16+8:0]  w_57;

wire signed  [16+8:0]  w_60;
wire signed  [16+8:0]  w_61;
wire signed  [16+8:0]  w_62;
wire signed  [16+8:0]  w_63;
wire signed  [16+8:0]  w_64;
wire signed  [16+8:0]  w_65;
wire signed  [16+8:0]  w_66;
wire signed  [16+8:0]  w_67;

wire signed  [16+8:0]  w_70;
wire signed  [16+8:0]  w_71;
wire signed  [16+8:0]  w_72;
wire signed  [16+8:0]  w_73;
wire signed  [16+8:0]  w_74;
wire signed  [16+8:0]  w_75;
wire signed  [16+8:0]  w_76;
wire signed  [16+8:0]  w_77;

wire signed  [16+8:0]  w_80;
wire signed  [16+8:0]  w_81;
wire signed  [16+8:0]  w_82;
wire signed  [16+8:0]  w_83;
wire signed  [16+8:0]  w_84;
wire signed  [16+8:0]  w_85;
wire signed  [16+8:0]  w_86;
wire signed  [16+8:0]  w_87;

wire signed  [16+8:0]  w_90;
wire signed  [16+8:0]  w_91;
wire signed  [16+8:0]  w_92;
wire signed  [16+8:0]  w_93;
wire signed  [16+8:0]  w_94;
wire signed  [16+8:0]  w_95;
wire signed  [16+8:0]  w_96;
wire signed  [16+8:0]  w_97;

wire signed  [16+8:0]  w_100;
wire signed  [16+8:0]  w_101;
wire signed  [16+8:0]  w_102;
wire signed  [16+8:0]  w_103;
wire signed  [16+8:0]  w_104;
wire signed  [16+8:0]  w_105;
wire signed  [16+8:0]  w_106;
wire signed  [16+8:0]  w_107;

wire signed  [16+8:0]  w_110;
wire signed  [16+8:0]  w_111;
wire signed  [16+8:0]  w_112;
wire signed  [16+8:0]  w_113;
wire signed  [16+8:0]  w_114;
wire signed  [16+8:0]  w_115;
wire signed  [16+8:0]  w_116;
wire signed  [16+8:0]  w_117;

wire signed  [16+8:0]  w_120;
wire signed  [16+8:0]  w_121;
wire signed  [16+8:0]  w_122;
wire signed  [16+8:0]  w_123;
wire signed  [16+8:0]  w_124;
wire signed  [16+8:0]  w_125;
wire signed  [16+8:0]  w_126;
wire signed  [16+8:0]  w_127;

wire signed  [16+8:0]  w_130;
wire signed  [16+8:0]  w_131;
wire signed  [16+8:0]  w_132;
wire signed  [16+8:0]  w_133;
wire signed  [16+8:0]  w_134;
wire signed  [16+8:0]  w_135;
wire signed  [16+8:0]  w_136;
wire signed  [16+8:0]  w_137;

wire signed  [16+8:0]  w_140;
wire signed  [16+8:0]  w_141;
wire signed  [16+8:0]  w_142;
wire signed  [16+8:0]  w_143;
wire signed  [16+8:0]  w_144;
wire signed  [16+8:0]  w_145;
wire signed  [16+8:0]  w_146;
wire signed  [16+8:0]  w_147;

wire signed  [16+8:0]  w_150;
wire signed  [16+8:0]  w_151;
wire signed  [16+8:0]  w_152;
wire signed  [16+8:0]  w_153;
wire signed  [16+8:0]  w_154;
wire signed  [16+8:0]  w_155;
wire signed  [16+8:0]  w_156;
wire signed  [16+8:0]  w_157;

wire signed  [16+8:0]  w_01_0;
wire signed  [16+8:0]  w_03_0;
wire signed  [16+8:0]  w_05_0;
wire signed  [16+8:0]  w_07_0;
wire signed  [16+8:0]  w_10_00;
wire signed  [16+8:0]  w_12_00;
wire signed  [16+8:0]  w_14_00;
wire signed  [16+8:0]  w_16_00;
wire signed  [16+8:0]  w_21_0;
wire signed  [16+8:0]  w_23_0;
wire signed  [16+8:0]  w_25_0;
wire signed  [16+8:0]  w_27_0;
wire signed  [16+8:0]  w_30_0;
wire signed  [16+8:0]  w_32_0;
wire signed  [16+8:0]  w_34_0;
wire signed  [16+8:0]  w_36_0;
wire signed  [16+8:0]  w_41_0;
wire signed  [16+8:0]  w_43_0;
wire signed  [16+8:0]  w_45_0;
wire signed  [16+8:0]  w_47_0;
wire signed  [16+8:0]  w_50_0;
wire signed  [16+8:0]  w_52_0;
wire signed  [16+8:0]  w_54_0;
wire signed  [16+8:0]  w_56_0;
wire signed  [16+8:0]  w_61_0;
wire signed  [16+8:0]  w_63_0;
wire signed  [16+8:0]  w_65_0;
wire signed  [16+8:0]  w_67_0;
wire signed  [16+8:0]  w_70_0;
wire signed  [16+8:0]  w_72_0;
wire signed  [16+8:0]  w_74_0;
wire signed  [16+8:0]  w_76_0;
wire signed  [16+8:0]  w_81_0;
wire signed  [16+8:0]  w_83_0;
wire signed  [16+8:0]  w_85_0;
wire signed  [16+8:0]  w_87_0;
wire signed  [16+8:0]  w_90_0;
wire signed  [16+8:0]  w_92_0;
wire signed  [16+8:0]  w_94_0;
wire signed  [16+8:0]  w_96_0;
wire signed  [16+8:0]  w_101_0;
wire signed  [16+8:0]  w_103_0;
wire signed  [16+8:0]  w_105_0;
wire signed  [16+8:0]  w_107_0;
wire signed  [16+8:0]  w_110_0;
wire signed  [16+8:0]  w_112_0;
wire signed  [16+8:0]  w_114_0;
wire signed  [16+8:0]  w_116_0;
wire signed  [16+8:0]  w_121_0;
wire signed  [16+8:0]  w_123_0;
wire signed  [16+8:0]  w_125_0;
wire signed  [16+8:0]  w_127_0;
wire signed  [16+8:0]  w_130_0;
wire signed  [16+8:0]  w_132_0;
wire signed  [16+8:0]  w_134_0;
wire signed  [16+8:0]  w_136_0;
wire signed  [16+8:0]  w_141_0;
wire signed  [16+8:0]  w_143_0;
wire signed  [16+8:0]  w_145_0;
wire signed  [16+8:0]  w_147_0;
wire signed  [16+8:0]  w_150_0;
wire signed  [16+8:0]  w_152_0;
wire signed  [16+8:0]  w_154_0;
wire signed  [16+8:0]  w_156_0;

wire signed  [16+9:0]   w00;
wire signed  [16+9:0]   w01;
wire signed  [16+9:0]   w02;
wire signed  [16+9:0]   w03;
wire signed  [16+9:0]   w10;
wire signed  [16+9:0]   w11;
wire signed  [16+9:0]   w12;
wire signed  [16+9:0]   w13;
wire signed  [16+9:0]   w20;
wire signed  [16+9:0]   w21;
wire signed  [16+9:0]   w22;
wire signed  [16+9:0]   w23;
wire signed  [16+9:0]   w30;
wire signed  [16+9:0]   w31;
wire signed  [16+9:0]   w32;
wire signed  [16+9:0]   w33;
wire signed  [16+9:0]   w40;
wire signed  [16+9:0]   w41;
wire signed  [16+9:0]   w42;
wire signed  [16+9:0]   w43;
wire signed  [16+9:0]   w50;
wire signed  [16+9:0]   w51;
wire signed  [16+9:0]   w52;
wire signed  [16+9:0]   w53;
wire signed  [16+9:0]   w60;
wire signed  [16+9:0]   w61;
wire signed  [16+9:0]   w62;
wire signed  [16+9:0]   w63;
wire signed  [16+9:0]   w70;
wire signed  [16+9:0]   w71;
wire signed  [16+9:0]   w72;
wire signed  [16+9:0]   w73;
wire signed  [16+9:0]   w80;
wire signed  [16+9:0]   w81;
wire signed  [16+9:0]   w82;
wire signed  [16+9:0]   w83;
wire signed  [16+9:0]   w90;
wire signed  [16+9:0]   w91;
wire signed  [16+9:0]   w92;
wire signed  [16+9:0]   w93;
wire signed  [16+9:0]   w100;
wire signed  [16+9:0]   w101;
wire signed  [16+9:0]   w102;
wire signed  [16+9:0]   w103;
wire signed  [16+9:0]   w110;
wire signed  [16+9:0]   w111;
wire signed  [16+9:0]   w112;
wire signed  [16+9:0]   w113;
wire signed  [16+9:0]   w120;
wire signed  [16+9:0]   w121;
wire signed  [16+9:0]   w122;
wire signed  [16+9:0]   w123;
wire signed  [16+9:0]   w130;
wire signed  [16+9:0]   w131;
wire signed  [16+9:0]   w132;
wire signed  [16+9:0]   w133;
wire signed  [16+9:0]   w140;
wire signed  [16+9:0]   w141;
wire signed  [16+9:0]   w142;
wire signed  [16+9:0]   w143;
wire signed  [16+9:0]   w150;
wire signed  [16+9:0]   w151;
wire signed  [16+9:0]   w152;
wire signed  [16+9:0]   w153;

wire signed  [16+10:0] w_0_0;
wire signed  [16+10:0] w_0_1;
wire signed  [16+10:0] w_1_0;
wire signed  [16+10:0] w_1_1;
wire signed  [16+10:0] w_2_0;
wire signed  [16+10:0] w_2_1;
wire signed  [16+10:0] w_3_0;
wire signed  [16+10:0] w_3_1;
wire signed  [16+10:0] w_4_0;
wire signed  [16+10:0] w_4_1;
wire signed  [16+10:0] w_5_0;
wire signed  [16+10:0] w_5_1;
wire signed  [16+10:0] w_6_0;
wire signed  [16+10:0] w_6_1;
wire signed  [16+10:0] w_7_0;
wire signed  [16+10:0] w_7_1;
wire signed  [16+10:0] w_8_0;
wire signed  [16+10:0] w_8_1;
wire signed  [16+10:0] w_9_0;
wire signed  [16+10:0] w_9_1;
wire signed  [16+10:0] w_10_0;
wire signed  [16+10:0] w_10_1;
wire signed  [16+10:0] w_11_0;
wire signed  [16+10:0] w_11_1;
wire signed  [16+10:0] w_12_0;
wire signed  [16+10:0] w_12_1;
wire signed  [16+10:0] w_13_0;
wire signed  [16+10:0] w_13_1;
wire signed  [16+10:0] w_14_0;
wire signed  [16+10:0] w_14_1;
wire signed  [16+10:0] w_15_0;
wire signed  [16+10:0] w_15_1;

wire signed  [16+11:0]  ww0;
wire signed  [16+11:0]  ww1;
wire signed  [16+11:0]  ww2;
wire signed  [16+11:0]  ww3;
wire signed  [16+11:0]  ww4;
wire signed  [16+11:0]  ww5;
wire signed  [16+11:0]  ww6;
wire signed  [16+11:0]  ww7;
wire signed  [16+11:0]  ww8;
wire signed  [16+11:0]  ww9;
wire signed  [16+11:0]  ww10;
wire signed  [16+11:0]  ww11;
wire signed  [16+11:0]  ww12;
wire signed  [16+11:0]  ww13;
wire signed  [16+11:0]  ww14;
wire signed  [16+11:0]  ww15;


// ********************************************
//                                             
//    REG DECLARATION                         
//                                             
// ********************************************

reg signed  [16+9:0]  r00;
reg signed  [16+9:0]  r01;
reg signed  [16+9:0]  r02;
reg signed  [16+9:0]  r03;
reg signed  [16+9:0]  r10;
reg signed  [16+9:0]  r11;
reg signed  [16+9:0]  r12;
reg signed  [16+9:0]  r13;
reg signed  [16+9:0]  r20;
reg signed  [16+9:0]  r21;
reg signed  [16+9:0]  r22;
reg signed  [16+9:0]  r23;
reg signed  [16+9:0]  r30;
reg signed  [16+9:0]  r31;
reg signed  [16+9:0]  r32;
reg signed  [16+9:0]  r33;
reg signed  [16+9:0]  r40;
reg signed  [16+9:0]  r41;
reg signed  [16+9:0]  r42;
reg signed  [16+9:0]  r43;
reg signed  [16+9:0]  r50;
reg signed  [16+9:0]  r51;
reg signed  [16+9:0]  r52;
reg signed  [16+9:0]  r53;
reg signed  [16+9:0]  r60;
reg signed  [16+9:0]  r61;
reg signed  [16+9:0]  r62;
reg signed  [16+9:0]  r63;
reg signed  [16+9:0]  r70;
reg signed  [16+9:0]  r71;
reg signed  [16+9:0]  r72;
reg signed  [16+9:0]  r73;
reg signed  [16+9:0]  r80;
reg signed  [16+9:0]  r81;
reg signed  [16+9:0]  r82;
reg signed  [16+9:0]  r83;
reg signed  [16+9:0]  r90;
reg signed  [16+9:0]  r91;
reg signed  [16+9:0]  r92;
reg signed  [16+9:0]  r93;
reg signed  [16+9:0]  r100;
reg signed  [16+9:0]  r101;
reg signed  [16+9:0]  r102;
reg signed  [16+9:0]  r103;
reg signed  [16+9:0]  r110;
reg signed  [16+9:0]  r111;
reg signed  [16+9:0]  r112;
reg signed  [16+9:0]  r113;
reg signed  [16+9:0]  r120;
reg signed  [16+9:0]  r121;
reg signed  [16+9:0]  r122;
reg signed  [16+9:0]  r123;
reg signed  [16+9:0]  r130;
reg signed  [16+9:0]  r131;
reg signed  [16+9:0]  r132;
reg signed  [16+9:0]  r133;
reg signed  [16+9:0]  r140;
reg signed  [16+9:0]  r141;
reg signed  [16+9:0]  r142;
reg signed  [16+9:0]  r143;
reg signed  [16+9:0]  r150;
reg signed  [16+9:0]  r151;
reg signed  [16+9:0]  r152;
reg signed  [16+9:0]  r153;


// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign w_00=w0_0+w2_2;
assign w_01_0=w1_1+w3_3;
assign w_02=w4_4+w6_6;
assign w_03_0=w5_5+w7_7;
assign w_04=w8_8+w10_10;
assign w_05_0=w9_9+w11_11;
assign w_06=w12_12+w14_14;
assign w_07_0=w13_13+w15_14;
assign w_01=inverse?(-w_01_0):w_01_0;
assign w_03=inverse?(-w_03_0):w_03_0;
assign w_05=inverse?(-w_05_0):w_05_0;
assign w_07=inverse?(-w_07_0):w_07_0;

assign w_10_00=-w0_1-w2_7;
assign w_11=-w1_4-w3_10;
assign w_12_00=-w4_13-w6_12;
assign w_13=-w5_14-w7_9;
assign w_14_00=-w8_6-w10_0;
assign w_15=-w9_3+w11_2;
assign w_16_00=w12_5+w14_11;
assign w_17=w13_8+w15_14;
assign w_10=inverse?(-w_10_00):w_10_00;
assign w_12=inverse?(-w_12_00):w_12_00;
assign w_14=inverse?(-w_14_00):w_14_00;
assign w_16=inverse?(-w_16_00):w_16_00;

assign w_20=w0_2+w2_12;
assign w_21_0=w1_7+w3_14;
assign w_22=w4_9-w6_0;
assign w_23_0=w5_4-w7_5;
assign w_24=-w8_10-w10_11;
assign w_25_0=-w9_14-w11_6;
assign w_26=-w12_1+w14_8;
assign w_27_0=w13_3+w15_13;
assign w_21=inverse?(-w_21_0):w_21_0;
assign w_23=inverse?(-w_23_0):w_23_0;
assign w_25=inverse?(-w_25_0):w_25_0;
assign w_27=inverse?(-w_27_0):w_27_0;

assign w_30_0=-w0_3-w2_14;
assign w_31=-w1_10-w3_7;
assign w_32_0=-w4_0+w6_13;
assign w_33=w5_6+w7_11;
assign w_34_0=w8_4-w10_9;
assign w_35=-w9_2-w11_14;
assign w_36_0=-w12_8+w14_5;
assign w_37=-w13_1+w15_12;
assign w_30=inverse?(-w_30_0):w_30_0;
assign w_32=inverse?(-w_32_0):w_32_0;
assign w_34=inverse?(-w_34_0):w_34_0;
assign w_36=inverse?(-w_36_0):w_36_0;


assign w_40=w0_4+w2_9;
assign w_41_0=w1_13+w3_0;
assign w_42=-w4_8-w6_5;
assign w_43_0=-w5_14+w7_3;
assign w_44=w8_12+w10_1;
assign w_45_0=w9_10-w11_7;
assign w_46=-w12_14+w14_2;
assign w_47_0=-w13_6+w15_11;
assign w_41=inverse?(-w_41_0):w_41_0;
assign w_43=inverse?(-w_43_0):w_43_0;
assign w_45=inverse?(-w_45_0):w_45_0;
assign w_47=inverse?(-w_47_0):w_47_0;

assign w_50_0=-w0_5-w2_4;
assign w_51=-w1_14+w3_6;
assign w_52_0=w4_14-w6_7;
assign w_53=w5_3-w7_13;
assign w_54_0=-w8_2+w10_12;
assign w_55=w9_8+w11_1;
assign w_56_0=-w12_9-w14_0;
assign w_57=-w13_11+w15_10;
assign w_50=inverse?(-w_50_0):w_50_0;
assign w_52=inverse?(-w_52_0):w_52_0;
assign w_54=inverse?(-w_54_0):w_54_0;
assign w_56=inverse?(-w_56_0):w_56_0;

assign w_60=w0_6-w2_0;
assign w_61_0=w1_12-w3_13;
assign w_62=-w4_5+w6_11;
assign w_63_0=w5_7-w7_1;
assign w_64=-w8_14+w10_8;
assign w_65_0=-w9_4+w11_10;
assign w_66=-w12_2-w14_3;
assign w_67_0=-w13_14+w15_9;
assign w_61=inverse?(-w_61_0):w_61_0;
assign w_63=inverse?(-w_63_0):w_63_0;
assign w_65=inverse?(-w_65_0):w_65_0;
assign w_67=inverse?(-w_67_0):w_67_0;

assign w_70_0=-w0_7+w2_5;
assign w_71=-w1_9+w3_11;
assign w_72_0=-w4_3+w6_1;
assign w_73=-w5_13+w7_14;
assign w_74_0=w8_0-w10_2;
assign w_75=-w9_14+w11_12;
assign w_76_0=w12_4-w14_6;
assign w_77=-w13_10+w15_8;
assign w_70=inverse?(-w_70_0):w_70_0;
assign w_72=inverse?(-w_72_0):w_72_0;
assign w_74=inverse?(-w_74_0):w_74_0;
assign w_76=inverse?(-w_76_0):w_76_0;

assign w_80=w0_8-w2_10;
assign w_81_0=+w1_6-w3_4;
assign w_82=w4_12-w6_14;
assign w_83_0=w5_2-w7_0;
assign w_84=w8_14-w10_13;
assign w_85_0=-w9_1+w11_3;
assign w_86=w12_11-w14_9;
assign w_87_0=-w13_5+w15_7;
assign w_81=inverse?(-w_81_0):w_81_0;
assign w_83=inverse?(-w_83_0):w_83_0;
assign w_85=inverse?(-w_85_0):w_85_0;
assign w_87=inverse?(-w_87_0):w_87_0;

assign w_90_0=-w0_9+w2_14;
assign w_91=-w1_3-w3_2;
assign w_92_0=-w4_10+w6_4;
assign w_93=w5_8-w7_14;
assign w_94_0=w8_1-w10_7;
assign w_95=w9_11-w11_5;
assign w_96_0=w12_13-w14_12;
assign w_97=-w13_0+w15_6;
assign w_90=inverse?(-w_90_0):w_90_0;
assign w_92=inverse?(-w_92_0):w_92_0;
assign w_94=inverse?(-w_94_0):w_94_0;
assign w_96=inverse?(-w_96_0):w_96_0;

assign w_100=w0_10-w2_11;
assign w_101_0=w1_0+w3_9;
assign w_102=w4_1+w6_8;
assign w_103_0=-w5_12+w7_2;
assign w_104=-w8_13+w10_3;
assign w_105_0=w9_7-w11_14;
assign w_106=w12_6-w14_14;
assign w_107_0=w13_4+w15_5;
assign w_101=inverse?(-w_101_0):w_101_0;
assign w_103=inverse?(-w_103_0):w_103_0;
assign w_105=inverse?(-w_105_0):w_105_0;
assign w_107=inverse?(-w_107_0):w_107_0;


assign w_110_0=-w0_11+w2_6;
assign w_111=w1_2-w3_14;
assign w_112_0=w4_7-w6_10;
assign w_113=w5_1+w7_12;
assign w_114_0=-w8_3+w10_14;
assign w_115=-w9_5-w11_8;
assign w_116_0=-w12_0-w14_13;
assign w_117=w13_9+w15_4;
assign w_110=inverse?(-w_110_0):w_110_0;
assign w_112=inverse?(-w_112_0):w_112_0;
assign w_114=inverse?(-w_114_0):w_114_0;
assign w_116=inverse?(-w_116_0):w_116_0;

assign w_120=w0_12-w2_1;
assign w_121_0=-w1_5+w3_8;
assign w_122=-w4_14-w6_2;
assign w_123_0=w5_9-w7_4;
assign w_124=w8_11+w10_6;
assign w_125_0=-w9_13+w11_0;
assign w_126=-w12_7-w14_10;
assign w_127_0=w13_14+w15_3;
assign w_121=inverse?(-w_121_0):w_121_0;
assign w_123=inverse?(-w_123_0):w_123_0;
assign w_125=inverse?(-w_125_0):w_125_0;
assign w_127=inverse?(-w_127_0):w_127_0;

assign w_130_0=-w0_13-w2_3;
assign w_131=w1_8-w3_1;
assign w_132_0=w4_6+w6_14;
assign w_133=-w5_11-w7_10;
assign w_134_0=w8_5-w10_4;
assign w_135=-w9_0+w11_9;
assign w_136_0=-w12_14-w14_7;
assign w_137=w13_12+w15_2;
assign w_130=inverse?(-w_130_0):w_130_0;
assign w_132=inverse?(-w_132_0):w_132_0;
assign w_134=inverse?(-w_134_0):w_134_0;
assign w_136=inverse?(-w_136_0):w_136_0;

assign w_140=w0_14+w2_8;
assign w_141_0=-w1_11-w3_5;
assign w_142=w4_2-w6_3;
assign w_143_0=w5_0+w7_6;
assign w_144=-w8_9-w10_14;
assign w_145_0=w9_12+w11_13;
assign w_146=-w12_10-w14_4;
assign w_147_0=w13_7+w15_1;
assign w_141=inverse?(-w_141_0):w_141_0;
assign w_143=inverse?(-w_143_0):w_143_0;
assign w_145=inverse?(-w_145_0):w_145_0;
assign w_147=inverse?(-w_147_0):w_147_0;

assign w_150_0=-w0_14-w2_13;
assign w_151=w1_14+w3_12;
assign w_152_0=-w4_11-w6_9;
assign w_153=w5_10+w7_8;
assign w_154_0=-w8_7-w10_5;
assign w_155=w9_6+w11_4;
assign w_156_0=-w12_3-w14_1;
assign w_157=w13_2+w15_0;
assign w_150=inverse?(-w_150_0):w_150_0;
assign w_152=inverse?(-w_152_0):w_152_0;
assign w_154=inverse?(-w_154_0):w_154_0;
assign w_156=inverse?(-w_156_0):w_156_0;

assign w00=w_00+w_01;
assign w01=w_02+w_03;
assign w02=w_04+w_05;
assign w03=w_06+w_07;

assign w10=w_10+w_11;
assign w11=w_12+w_13;
assign w12=w_14+w_15;
assign w13=w_16+w_17;

assign w20=w_20+w_21;
assign w21=w_22+w_23;
assign w22=w_24+w_25;
assign w23=w_26+w_27;

assign w30=w_30+w_31;
assign w31=w_32+w_33;
assign w32=w_34+w_35;
assign w33=w_36+w_37;

assign w40=w_40+w_41;
assign w41=w_42+w_43;
assign w42=w_44+w_45;
assign w43=w_46+w_47;

assign w50=w_50+w_51;
assign w51=w_52+w_53;
assign w52=w_54+w_55;
assign w53=w_56+w_57;

assign w60=w_60+w_61;
assign w61=w_62+w_63;
assign w62=w_64+w_65;
assign w63=w_66+w_67;

assign w70=w_70+w_71;
assign w71=w_72+w_73;
assign w72=w_74+w_75;
assign w73=w_76+w_77;

assign w80=w_80+w_81;
assign w81=w_82+w_83;
assign w82=w_84+w_85;
assign w83=w_86+w_87;

assign w90=w_90+w_91;
assign w91=w_92+w_93;
assign w92=w_94+w_95;
assign w93=w_96+w_97;

assign w100=w_100+w_101;
assign w101=w_102+w_103;
assign w102=w_104+w_105;
assign w103=w_106+w_107;

assign w110=w_110+w_111;
assign w111=w_112+w_113;
assign w112=w_114+w_115;
assign w113=w_116+w_117;

assign w120=w_120+w_121;
assign w121=w_122+w_123;
assign w122=w_124+w_125;
assign w123=w_126+w_127;

assign w130=w_130+w_131;
assign w131=w_132+w_133;
assign w132=w_134+w_135;
assign w133=w_136+w_137;

assign w140=w_140+w_141;
assign w141=w_142+w_143;
assign w142=w_144+w_145;
assign w143=w_146+w_147;

assign w150=w_150+w_151;
assign w151=w_152+w_153;
assign w152=w_154+w_155;
assign w153=w_156+w_157;

assign  w_0_0=r00+r01;
assign  w_0_1=r02+r03;

assign  w_1_0=r10+r11;
assign  w_1_1=r12+r13;

assign  w_2_0=r20+r21;
assign  w_2_1=r22+r23;

assign  w_3_0=r30+r31;
assign  w_3_1=r32+r33;

assign  w_4_0=r40+r41;
assign  w_4_1=r42+r43;

assign  w_5_0=r50+r51;
assign  w_5_1=r52+r53;

assign  w_6_0=r60+r61;
assign  w_6_1=r62+r63;

assign  w_7_0=r70+r71;
assign  w_7_1=r72+r73;

assign  w_8_0=r80+r81;
assign  w_8_1=r82+r83;

assign  w_9_0=r90+r91;
assign  w_9_1=r92+r93;

assign  w_10_0=r100+r101;
assign  w_10_1=r102+r103;

assign  w_11_0=r110+r111;
assign  w_11_1=r112+r113;

assign  w_12_0=r120+r121;
assign  w_12_1=r122+r123;

assign  w_13_0=r130+r131;
assign  w_13_1=r132+r133;

assign  w_14_0=r140+r141;
assign  w_14_1=r142+r143;

assign  w_15_0=r150+r151;
assign  w_15_1=r152+r153;

assign  ww0=w_0_0+w_0_1;
assign  ww1=w_1_0+w_1_1;
assign  ww2=w_2_0+w_2_1;
assign  ww3=w_3_0+w_3_1;
assign  ww4=w_4_0+w_4_1;
assign  ww5=w_5_0+w_5_1;
assign  ww6=w_6_0+w_6_1;
assign  ww7=w_7_0+w_7_1;
assign  ww8=w_8_0+w_8_1;
assign  ww9=w_9_0+w_9_1;
assign  ww10=w_10_0+w_10_1;
assign  ww11=w_11_0+w_11_1;
assign  ww12=w_12_0+w_12_1;
assign  ww13=w_13_0+w_13_1;
assign  ww14=w_14_0+w_14_1;
assign  ww15=w_15_0+w_15_1;

// ********************************************
//                                             
//    Sequential  Logic                        
//                                             
// ********************************************

always @(posedge clk or negedge rst)
if(!rst)
begin
  r00<=26'b0;
  r01<=26'b0;
  r02<=26'b0;
  r03<=26'b0;
  r10<=26'b0;
  r11<=26'b0;
  r12<=26'b0;
  r13<=26'b0;
  r20<=26'b0;
  r21<=26'b0;
  r22<=26'b0;
  r23<=26'b0;
  r30<=26'b0;
  r31<=26'b0;
  r32<=26'b0;
  r33<=26'b0;
  r40<=26'b0;
  r41<=26'b0;
  r42<=26'b0;
  r43<=26'b0;
  r50<=26'b0;
  r51<=26'b0;
  r52<=26'b0;
  r53<=26'b0;
  r60<=26'b0;
  r61<=26'b0;
  r62<=26'b0;
  r63<=26'b0;
  r70<=26'b0;
  r71<=26'b0;
  r72<=26'b0;
  r73<=26'b0;
  r80<=26'b0;
  r81<=26'b0;
  r82<=26'b0;
  r83<=26'b0;
  r90<=26'b0;
  r91<=26'b0;
  r92<=26'b0;
  r93<=26'b0;
  r100<=26'b0;
  r101<=26'b0;
  r102<=26'b0;
  r103<=26'b0;
  r110<=26'b0;
  r111<=26'b0;
  r112<=26'b0;
  r113<=26'b0;
  r120<=26'b0;
  r121<=26'b0;
  r122<=26'b0;
  r123<=26'b0;
  r130<=26'b0;
  r131<=26'b0;
  r132<=26'b0;
  r133<=26'b0;
  r140<=26'b0;
  r141<=26'b0;
  r142<=26'b0;
  r143<=26'b0;
  r150<=26'b0;
  r151<=26'b0;
  r152<=26'b0;
  r153<=26'b0;
  end
else
  begin
  r00<=w00;
  r01<=w01;
  r02<=w02;
  r03<=w03;
  r10<=w10;
  r11<=w11;
  r12<=w12;
  r13<=w13;
  r20<=w20;
  r21<=w21;
  r22<=w22;
  r23<=w23;
  r30<=w30;
  r31<=w31;
  r32<=w32;
  r33<=w33;
  r40<=w40;
  r41<=w41;
  r42<=w42;
  r43<=w43;
  r50<=w50;
  r51<=w51;
  r52<=w52;
  r53<=w53;
  r60<=w60;
  r61<=w61;
  r62<=w62;
  r63<=w63;
  r70<=w70;
  r71<=w71;
  r72<=w72;
  r73<=w73;
  r80<=w80;
  r81<=w81;
  r82<=w82;
  r83<=w83;
  r90<=w90;
  r91<=w91;
  r92<=w92;
  r93<=w93;
  r100<=w100;
  r101<=w101;
  r102<=w102;
  r103<=w103;
  r110<=w110;
  r111<=w111;
  r112<=w112;
  r113<=w113;
  r120<=w120;
  r121<=w121;
  r122<=w122;
  r123<=w123;
  r130<=w130;
  r131<=w131;
  r132<=w132;
  r133<=w133;
  r140<=w140;
  r141<=w141;
  r142<=w142;
  r143<=w143;
  r150<=w150;
  r151<=w151;
  r152<=w152;
  r153<=w153;
  end
  
always @(posedge clk or negedge rst)
   if(!rst)
     begin
       m3_0<=28'b0;
       m3_1<=28'b0;
       m3_2<=28'b0;
       m3_3<=28'b0;
       m3_4<=28'b0;
       m3_5<=28'b0;
       m3_6<=28'b0;
       m3_7<=28'b0;
       m3_8<=28'b0;
       m3_9<=28'b0;
       m3_10<=28'b0;
       m3_11<=28'b0;
       m3_12<=28'b0;
       m3_13<=28'b0;
       m3_14<=28'b0;
       m3_15<=28'b0;
     end
   else
    begin
       m3_0<=ww0;
       m3_1<=ww1;
       m3_2<=ww2;
       m3_3<=ww3;
       m3_4<=ww4;
       m3_5<=ww5;
       m3_6<=ww6;
       m3_7<=ww7;
       m3_8<=ww8;
       m3_9<=ww9;
       m3_10<=ww10;
       m3_11<=ww11;
       m3_12<=ww12;
       m3_13<=ww13;
       m3_14<=ww14;
       m3_15<=ww15;
     end


// ********************************************
//                                             
//    Sub Modules                              
//                                             
// ********************************************

spiral_16  spiral_160(
                    .i_data(i_0),
                         
                 .o_data_4(w0_0),
                .o_data_13(w0_1),
                .o_data_22(w0_2),
                .o_data_31(w0_3),
                .o_data_38(w0_4),
                .o_data_46(w0_5),
                .o_data_54(w0_6),
                .o_data_61(w0_7),
                .o_data_67(w0_8),
                .o_data_73(w0_9),
                .o_data_78(w0_10),
                .o_data_82(w0_11),
                .o_data_85(w0_12),
                .o_data_88(w0_13),
                .o_data_90(w0_14)
);
                 
spiral_16  spiral_161(
                    .i_data(i_1),
                           
                   .o_data_4(w1_0),
                  .o_data_13(w1_1),
                  .o_data_22(w1_2),
                  .o_data_31(w1_3),
                  .o_data_38(w1_4),
                  .o_data_46(w1_5),
                  .o_data_54(w1_6),
                  .o_data_61(w1_7),
                  .o_data_67(w1_8),
                  .o_data_73(w1_9),
                  .o_data_78(w1_10),
                  .o_data_82(w1_11),
                  .o_data_85(w1_12),
                  .o_data_88(w1_13),
                  .o_data_90(w1_14)
);              


spiral_16  spiral_162(
                   .i_data(i_2),
                             
                  .o_data_4(w2_0),
                 .o_data_13(w2_1),
                 .o_data_22(w2_2),
                 .o_data_31(w2_3),
                 .o_data_38(w2_4),
                 .o_data_46(w2_5),
                 .o_data_54(w2_6),
                 .o_data_61(w2_7),
                 .o_data_67(w2_8),
                 .o_data_73(w2_9),
                 .o_data_78(w2_10),
                 .o_data_82(w2_11),
                 .o_data_85(w2_12),
                 .o_data_88(w2_13),
                 .o_data_90(w2_14)
);


spiral_16  spiral_163(
                   .i_data(i_3),
                             
                  .o_data_4(w3_0),
                 .o_data_13(w3_1),
                 .o_data_22(w3_2),
                 .o_data_31(w3_3),
                 .o_data_38(w3_4),
                 .o_data_46(w3_5),
                 .o_data_54(w3_6),
                 .o_data_61(w3_7),
                 .o_data_67(w3_8),
                 .o_data_73(w3_9),
                 .o_data_78(w3_10),
                 .o_data_82(w3_11),
                 .o_data_85(w3_12),
                 .o_data_88(w3_13),
                 .o_data_90(w3_14)
);


spiral_16  spiral_164(
                     .i_data(i_4),
                               
                    .o_data_4(w4_0),
                   .o_data_13(w4_1),
                   .o_data_22(w4_2),
                   .o_data_31(w4_3),
                   .o_data_38(w4_4),
                   .o_data_46(w4_5),
                   .o_data_54(w4_6),
                   .o_data_61(w4_7),
                   .o_data_67(w4_8),
                   .o_data_73(w4_9),
                   .o_data_78(w4_10),
                   .o_data_82(w4_11),
                   .o_data_85(w4_12),
                   .o_data_88(w4_13),
                   .o_data_90(w4_14)
);


spiral_16  spiral_165(
                     .i_data(i_5),
                               
                    .o_data_4(w5_0),
                   .o_data_13(w5_1),
                   .o_data_22(w5_2),
                   .o_data_31(w5_3),
                   .o_data_38(w5_4),
                   .o_data_46(w5_5),
                   .o_data_54(w5_6),
                   .o_data_61(w5_7),
                   .o_data_67(w5_8),
                   .o_data_73(w5_9),
                   .o_data_78(w5_10),
                   .o_data_82(w5_11),
                   .o_data_85(w5_12),
                   .o_data_88(w5_13),
                   .o_data_90(w5_14)
);


spiral_16  spiral_166(
                     .i_data(i_6),
                               
                    .o_data_4(w6_0),
                   .o_data_13(w6_1),
                   .o_data_22(w6_2),
                   .o_data_31(w6_3),
                   .o_data_38(w6_4),
                   .o_data_46(w6_5),
                   .o_data_54(w6_6),
                   .o_data_61(w6_7),
                   .o_data_67(w6_8),
                   .o_data_73(w6_9),
                   .o_data_78(w6_10),
                   .o_data_82(w6_11),
                   .o_data_85(w6_12),
                   .o_data_88(w6_13),
                   .o_data_90(w6_14)
);


spiral_16  spiral_167(
                     .i_data(i_7),
                               
                    .o_data_4(w7_0),
                   .o_data_13(w7_1),
                   .o_data_22(w7_2),
                   .o_data_31(w7_3),
                   .o_data_38(w7_4),
                   .o_data_46(w7_5),
                   .o_data_54(w7_6),
                   .o_data_61(w7_7),
                   .o_data_67(w7_8),
                   .o_data_73(w7_9),
                   .o_data_78(w7_10),
                   .o_data_82(w7_11),
                   .o_data_85(w7_12),
                   .o_data_88(w7_13),
                   .o_data_90(w7_14)
);


spiral_16  spiral_168(
                     .i_data(i_8),
                               
                    .o_data_4(w8_0),
                   .o_data_13(w8_1),
                   .o_data_22(w8_2),
                   .o_data_31(w8_3),
                   .o_data_38(w8_4),
                   .o_data_46(w8_5),
                   .o_data_54(w8_6),
                   .o_data_61(w8_7),
                   .o_data_67(w8_8),
                   .o_data_73(w8_9),
                   .o_data_78(w8_10),
                   .o_data_82(w8_11),
                   .o_data_85(w8_12),
                   .o_data_88(w8_13),
                   .o_data_90(w8_14)
);


spiral_16  spiral_169(
                     .i_data(i_9),
                               
                    .o_data_4(w9_0),
                   .o_data_13(w9_1),
                   .o_data_22(w9_2),
                   .o_data_31(w9_3),
                   .o_data_38(w9_4),
                   .o_data_46(w9_5),
                   .o_data_54(w9_6),
                   .o_data_61(w9_7),
                   .o_data_67(w9_8),
                   .o_data_73(w9_9),
                   .o_data_78(w9_10),
                   .o_data_82(w9_11),
                   .o_data_85(w9_12),
                   .o_data_88(w9_13),
                   .o_data_90(w9_14)
);


spiral_16  spiral_1610(
                     .i_data(i_10),
                                
                    .o_data_4(w10_0),
                   .o_data_13(w10_1),
                   .o_data_22(w10_2),
                   .o_data_31(w10_3),
                   .o_data_38(w10_4),
                   .o_data_46(w10_5),
                   .o_data_54(w10_6),
                   .o_data_61(w10_7),
                   .o_data_67(w10_8),
                   .o_data_73(w10_9),
                   .o_data_78(w10_10),
                   .o_data_82(w10_11),
                   .o_data_85(w10_12),
                   .o_data_88(w10_13),
                   .o_data_90(w10_14)
);


spiral_16  spiral_1611(
                     .i_data(i_11),
                                
                    .o_data_4(w11_0),
                   .o_data_13(w11_1),
                   .o_data_22(w11_2),
                   .o_data_31(w11_3),
                   .o_data_38(w11_4),
                   .o_data_46(w11_5),
                   .o_data_54(w11_6),
                   .o_data_61(w11_7),
                   .o_data_67(w11_8),
                   .o_data_73(w11_9),
                   .o_data_78(w11_10),
                   .o_data_82(w11_11),
                   .o_data_85(w11_12),
                   .o_data_88(w11_13),
                   .o_data_90(w11_14)
);


spiral_16  spiral_1612(
                     .i_data(i_12),
                                
                    .o_data_4(w12_0),
                   .o_data_13(w12_1),
                   .o_data_22(w12_2),
                   .o_data_31(w12_3),
                   .o_data_38(w12_4),
                   .o_data_46(w12_5),
                   .o_data_54(w12_6),
                   .o_data_61(w12_7),
                   .o_data_67(w12_8),
                   .o_data_73(w12_9),
                   .o_data_78(w12_10),
                   .o_data_82(w12_11),
                   .o_data_85(w12_12),
                   .o_data_88(w12_13),
                   .o_data_90(w12_14)
);

spiral_16  spiral_1613(
                     .i_data(i_13),
                                
                    .o_data_4(w13_0),
                   .o_data_13(w13_1),
                   .o_data_22(w13_2),
                   .o_data_31(w13_3),
                   .o_data_38(w13_4),
                   .o_data_46(w13_5),
                   .o_data_54(w13_6),
                   .o_data_61(w13_7),
                   .o_data_67(w13_8),
                   .o_data_73(w13_9),
                   .o_data_78(w13_10),
                   .o_data_82(w13_11),
                   .o_data_85(w13_12),
                   .o_data_88(w13_13),
                   .o_data_90(w13_14)
);

spiral_16  spiral_1614(
                     .i_data(i_14),
                                
                    .o_data_4(w14_0),
                   .o_data_13(w14_1),
                   .o_data_22(w14_2),
                   .o_data_31(w14_3),
                   .o_data_38(w14_4),
                   .o_data_46(w14_5),
                   .o_data_54(w14_6),
                   .o_data_61(w14_7),
                   .o_data_67(w14_8),
                   .o_data_73(w14_9),
                   .o_data_78(w14_10),
                   .o_data_82(w14_11),
                   .o_data_85(w14_12),
                   .o_data_88(w14_13),
                   .o_data_90(w14_14)
);

spiral_16  spiral_1615(
                     .i_data(i_15),
                                
                    .o_data_4(w15_0),
                   .o_data_13(w15_1),
                   .o_data_22(w15_2),
                   .o_data_31(w15_3),
                   .o_data_38(w15_4),
                   .o_data_46(w15_5),
                   .o_data_54(w15_6),
                   .o_data_61(w15_7),
                   .o_data_67(w15_8),
                   .o_data_73(w15_9),
                   .o_data_78(w15_10),
                   .o_data_82(w15_11),
                   .o_data_85(w15_12),
                   .o_data_88(w15_13),
                   .o_data_90(w15_14)
);

endmodule
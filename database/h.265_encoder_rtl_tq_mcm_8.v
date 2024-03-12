/*
      i0    i1    i2    i3    i4    i5    i6    i7

1 [    9    25    43    57    70    80    87    90  ]     i0
2 [  -25   -70   -90   -80   -43     9    57    87  ]     i1
3 [   43    90    57   -25   -87   -70     9    80  ]     i2
4 [  -57   -80    25    90     9   -87   -43    70  ]  x  i3 
5 [   70    43   -87    -9    90   -25   -80    57  ]     i4
6 [  -80     9    70   -87    25    57   -90    43  ]     i5
7 [   87   -57     9    43   -80    90   -70    25  ]     i6
8 [  -90    87   -80    70   -57    43   -25     9  ]     i7
*/
module mcm_8(
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
          
          m2_0,
          m2_1,
          m2_2,
          m2_3,
          m2_4,
          m2_5,
          m2_6,
          m2_7
);

// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION                                               
//                                                                             
// ********************************************  
input               clk;
input               rst;
input           inverse;

input signed [17:0] i_0;
input signed [17:0] i_1;
input signed [17:0] i_2;
input signed [17:0] i_3;
input signed [17:0] i_4;
input signed [17:0] i_5;
input signed [17:0] i_6;
input signed [17:0] i_7;

output reg signed [17+7+3:0] m2_0;
output reg signed [17+7+3:0] m2_1;
output reg signed [17+7+3:0] m2_2;
output reg signed [17+7+3:0] m2_3;
output reg signed [17+7+3:0] m2_4;
output reg signed [17+7+3:0] m2_5;
output reg signed [17+7+3:0] m2_6;
output reg signed [17+7+3:0] m2_7;

// ********************************************
//                                             
//    Wire DECLARATION                         
//                                             
// ********************************************
wire signed  [17+7:0]  w0_0;
wire signed  [17+7:0]  w0_1;
wire signed  [17+7:0]  w0_2;
wire signed  [17+7:0]  w0_3;
wire signed  [17+7:0]  w0_4;
wire signed  [17+7:0]  w0_5;
wire signed  [17+7:0]  w0_6;
wire signed  [17+7:0]  w0_7;

wire signed  [17+7:0]  w1_0;
wire signed  [17+7:0]  w1_1;
wire signed  [17+7:0]  w1_2;
wire signed  [17+7:0]  w1_3;
wire signed  [17+7:0]  w1_4;
wire signed  [17+7:0]  w1_5;
wire signed  [17+7:0]  w1_6;
wire signed  [17+7:0]  w1_7;

wire signed  [17+7:0]  w2_0;
wire signed  [17+7:0]  w2_1;
wire signed  [17+7:0]  w2_2;
wire signed  [17+7:0]  w2_3;
wire signed  [17+7:0]  w2_4;
wire signed  [17+7:0]  w2_5;
wire signed  [17+7:0]  w2_6;
wire signed  [17+7:0]  w2_7;

wire signed  [17+7:0]  w3_0;
wire signed  [17+7:0]  w3_1;
wire signed  [17+7:0]  w3_2;
wire signed  [17+7:0]  w3_3;
wire signed  [17+7:0]  w3_4;
wire signed  [17+7:0]  w3_5;
wire signed  [17+7:0]  w3_6;
wire signed  [17+7:0]  w3_7;

wire signed  [17+7:0]  w4_0;
wire signed  [17+7:0]  w4_1;
wire signed  [17+7:0]  w4_2;
wire signed  [17+7:0]  w4_3;
wire signed  [17+7:0]  w4_4;
wire signed  [17+7:0]  w4_5;
wire signed  [17+7:0]  w4_6;
wire signed  [17+7:0]  w4_7;

wire signed  [17+7:0]  w5_0;
wire signed  [17+7:0]  w5_1;
wire signed  [17+7:0]  w5_2;
wire signed  [17+7:0]  w5_3;
wire signed  [17+7:0]  w5_4;
wire signed  [17+7:0]  w5_5;
wire signed  [17+7:0]  w5_6;
wire signed  [17+7:0]  w5_7;

wire signed  [17+7:0]  w6_0;
wire signed  [17+7:0]  w6_1;
wire signed  [17+7:0]  w6_2;
wire signed  [17+7:0]  w6_3;
wire signed  [17+7:0]  w6_4;
wire signed  [17+7:0]  w6_5;
wire signed  [17+7:0]  w6_6;
wire signed  [17+7:0]  w6_7;

wire signed  [17+7:0]  w7_0;
wire signed  [17+7:0]  w7_1;
wire signed  [17+7:0]  w7_2;
wire signed  [17+7:0]  w7_3;
wire signed  [17+7:0]  w7_4;
wire signed  [17+7:0]  w7_5;
wire signed  [17+7:0]  w7_6;
wire signed  [17+7:0]  w7_7;

wire signed  [17+8:0]  w_00;
wire signed  [17+8:0]  w_01;
wire signed  [17+8:0]  w_01_0;
wire signed  [17+8:0]  w_02;
wire signed  [17+8:0]  w_03;
wire signed  [17+8:0]  w_03_0;

wire signed  [17+8:0]  w_10;
wire signed  [17+8:0]  w_10_0;
wire signed  [17+8:0]  w_11;
wire signed  [17+8:0]  w_12;
wire signed  [17+8:0]  w_12_0;
wire signed  [17+8:0]  w_13;

wire signed  [17+8:0]  w_20;
wire signed  [17+8:0]  w_21;
wire signed  [17+8:0]  w_21_0;
wire signed  [17+8:0]  w_22;
wire signed  [17+8:0]  w_23;
wire signed  [17+8:0]  w_23_0;

wire signed  [17+8:0]  w_30;
wire signed  [17+8:0]  w_30_0;
wire signed  [17+8:0]  w_31;
wire signed  [17+8:0]  w_32;
wire signed  [17+8:0]  w_32_0;
wire signed  [17+8:0]  w_33;

wire signed  [17+8:0]  w_40;
wire signed  [17+8:0]  w_41;
wire signed  [17+8:0]  w_41_0;
wire signed  [17+8:0]  w_42;
wire signed  [17+8:0]  w_43;
wire signed  [17+8:0]  w_43_0;

wire signed  [17+8:0]  w_50;
wire signed  [17+8:0]  w_50_0;
wire signed  [17+8:0]  w_51;
wire signed  [17+8:0]  w_52;
wire signed  [17+8:0]  w_52_0;
wire signed  [17+8:0]  w_53;

wire signed  [17+8:0]  w_60;
wire signed  [17+8:0]  w_61;
wire signed  [17+8:0]  w_61_0;
wire signed  [17+8:0]  w_62;
wire signed  [17+8:0]  w_63;
wire signed  [17+8:0]  w_63_0;

wire signed  [17+8:0]  w_70;
wire signed  [17+8:0]  w_70_0;
wire signed  [17+8:0]  w_71;
wire signed  [17+8:0]  w_72;
wire signed  [17+8:0]  w_72_0;
wire signed  [17+8:0]  w_73;

wire signed  [17+9:0]  w00;
wire signed  [17+9:0]  w01;

wire signed  [17+9:0]  w10;
wire signed  [17+9:0]  w11;

wire signed  [17+9:0]  w20;
wire signed  [17+9:0]  w21;

wire signed  [17+9:0]  w30;
wire signed  [17+9:0]  w31;

wire signed  [17+9:0]  w40;
wire signed  [17+9:0]  w41;

wire signed  [17+9:0]  w50;
wire signed  [17+9:0]  w51;

wire signed  [17+9:0]  w60;
wire signed  [17+9:0]  w61;

wire signed  [17+9:0]  w70;
wire signed  [17+9:0]  w71;

// ********************************************
//                                             
//    Reg DECLARATION                         
//                                             
// *********************************************

reg signed  [17+9:0]  r00;
reg signed  [17+9:0]  r01;
reg signed  [17+9:0]  r10;
reg signed  [17+9:0]  r11;
reg signed  [17+9:0]  r20;
reg signed  [17+9:0]  r21;
reg signed  [17+9:0]  r30;
reg signed  [17+9:0]  r31;
reg signed  [17+9:0]  r40;
reg signed  [17+9:0]  r41;
reg signed  [17+9:0]  r50;
reg signed  [17+9:0]  r51;
reg signed  [17+9:0]  r60;
reg signed  [17+9:0]  r61;
reg signed  [17+9:0]  r70;
reg signed  [17+9:0]  r71;

// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign w_00=w0_0+w2_2;
assign w_01_0=w1_1+w3_3;
assign w_01=inverse?(-w_01_0):w_01_0;
assign w_02=w4_4+w6_6;
assign w_03_0=w5_5+w7_7;
assign w_03=inverse?(-w_03_0):w_03_0;

assign w_10_0=-w0_1-w2_7;
assign w_10=inverse?(-w_10_0):w_10_0;
assign w_11=-w1_4-w3_5;
assign w_12_0=-w4_2+w6_3;
assign w_12=inverse?(-w_12_0):w_12_0;
assign w_13=w5_0+w7_6;

assign w_20=w0_2+w2_3;
assign w_21_0=w1_7-w3_1;
assign w_21=inverse?(-w_21_0):w_21_0;
assign w_22=-w4_6+w6_0;
assign w_23_0=-w5_4+w7_5;
assign w_23=inverse?(-w_23_0):w_23_0;

assign w_30_0=-w0_3+w2_1;
assign w_30=inverse?(-w_30_0):w_30_0;
assign w_31=-w1_5+w3_7;
assign w_32_0=w4_0-w6_2;
assign w_32=inverse?(-w_32_0):w_32_0;
assign w_33=-w5_6+w7_4;

assign w_40=w0_4-w2_6;
assign w_41_0=w1_2-w3_0;
assign w_41=inverse?(-w_41_0):w_41_0;
assign w_42=w4_7-w6_5;
assign w_43_0=-w5_1+w7_3;
assign w_43=inverse?(-w_43_0):w_43_0;

assign w_50_0=-w0_5+w2_4;
assign w_50=inverse?(-w_50_0):w_50_0;
assign w_51=w1_0-w3_6;
assign w_52_0=w4_1-w6_7;
assign w_52=inverse?(-w_52_0):w_52_0;
assign w_53=w5_3+w7_2;

assign w_60=w0_6+w2_0;
assign w_61_0=-w1_3+w3_2;
assign w_61=inverse?(-w_61_0):w_61_0;
assign w_62=-w4_5-w6_4;
assign w_63_0=w5_7+w7_1;
assign w_63=inverse?(-w_63_0):w_63_0;

assign w_70_0=-w0_7-w2_5;
assign w_70=inverse?(-w_70_0):w_70_0;
assign w_71=w1_6+w3_4;
assign w_72_0=-w4_3-w6_1;
assign w_72=inverse?(-w_72_0):w_72_0;
assign w_73=w5_2+w7_0;

assign w00=w_00+w_01;
assign w01=w_02+w_03;

assign w10=w_10+w_11;
assign w11=w_12+w_13;

assign w20=w_20+w_21;
assign w21=w_22+w_23;

assign w30=w_30+w_31;
assign w31=w_32+w_33;

assign w40=w_40+w_41;
assign w41=w_42+w_43;

assign w50=w_50+w_51;
assign w51=w_52+w_53;

assign w60=w_60+w_61;
assign w61=w_62+w_63;

assign w70=w_70+w_71;
assign w71=w_72+w_73;

// ********************************************
//                                             
//   Sequential  Logic                        
//                                             
// ********************************************

always @(posedge clk or negedge rst)
   if(!rst)
     begin
       r00 <=27'd0;
       r01 <=27'd0;
       r10 <=27'd0;
       r11 <=27'd0;
       r20 <=27'd0;
       r21 <=27'd0;
       r30 <=27'd0;
       r31 <=27'd0;
       r40 <=27'd0;
       r41 <=27'd0;
       r50 <=27'd0;
       r51 <=27'd0;
       r60 <=27'd0;
       r61 <=27'd0;
       r70 <=27'd0;
       r71 <=27'd0;   
     end
  else
      begin
       r00 <=w00;
       r01 <=w01;
       r10 <=w10;
       r11 <=w11;
       r20 <=w20;
       r21 <=w21;
       r30 <=w30;
       r31 <=w31;
       r40 <=w40;
       r41 <=w41;
       r50 <=w50;
       r51 <=w51;
       r60 <=w60;
       r61 <=w61;
       r70 <=w70;
       r71 <=w71;
     end     

always @(posedge clk or negedge rst)
   if(!rst)
     begin
       m2_0<=28'b0;
       m2_1<=28'b0;
       m2_2<=28'b0;
       m2_3<=28'b0;
       m2_4<=28'b0;
       m2_5<=28'b0;
       m2_6<=28'b0;
       m2_7<=28'b0;
     end
	 else
    begin
       m2_0<=r00+r01;
       m2_1<=r10+r11;
       m2_2<=r20+r21;
       m2_3<=r30+r31;
       m2_4<=r40+r41;
       m2_5<=r50+r51;
       m2_6<=r60+r61;
       m2_7<=r70+r71;
     end

// ********************************************
//                                             
//    Sub Modules                              
//                                             
// ********************************************
spiral_8  spiral_80(
                .i_data(i_0),
                  
                .o_data_9(w0_0),
               .o_data_25(w0_1),
              .o_data_43(w0_2),
              .o_data_57(w0_3),
              .o_data_70(w0_4),
              .o_data_80(w0_5),
              .o_data_87(w0_6),
              .o_data_90(w0_7)
);

spiral_8  spiral_81(
                .i_data(i_1),
                           
                .o_data_9(w1_0),
                .o_data_25(w1_1),
                .o_data_43(w1_2),
                .o_data_57(w1_3),
                .o_data_70(w1_4),
                .o_data_80(w1_5),
                .o_data_87(w1_6),
                .o_data_90(w1_7)
);

spiral_8  spiral_82(
                .i_data(i_2),
                           
                .o_data_9(w2_0),
                .o_data_25(w2_1),
                .o_data_43(w2_2),
                .o_data_57(w2_3),
                .o_data_70(w2_4),
                .o_data_80(w2_5),
                .o_data_87(w2_6),
                .o_data_90(w2_7)
);

spiral_8  spiral_83(
                .i_data(i_3),
                           
                .o_data_9(w3_0),
                .o_data_25(w3_1),
                .o_data_43(w3_2),
                .o_data_57(w3_3),
                .o_data_70(w3_4),
                .o_data_80(w3_5),
                .o_data_87(w3_6),
                .o_data_90(w3_7)
);

spiral_8  spiral_84(
                .i_data(i_4),
                           
                .o_data_9(w4_0),
                .o_data_25(w4_1),
                .o_data_43(w4_2),
                .o_data_57(w4_3),
                .o_data_70(w4_4),
                .o_data_80(w4_5),
                .o_data_87(w4_6),
                .o_data_90(w4_7)
);

spiral_8  spiral_85(
                .i_data(i_5),
                          
                .o_data_9(w5_0),
                .o_data_25(w5_1),
                .o_data_43(w5_2),
                .o_data_57(w5_3),
                .o_data_70(w5_4),
                .o_data_80(w5_5),
                .o_data_87(w5_6),
                .o_data_90(w5_7)
);

spiral_8  spiral_86(
                 .i_data(i_6),
                            
                 .o_data_9(w6_0),
                 .o_data_25(w6_1),
                 .o_data_43(w6_2),
                 .o_data_57(w6_3),
                 .o_data_70(w6_4),
                 .o_data_80(w6_5),
                 .o_data_87(w6_6),
                 .o_data_90(w6_7)
);

spiral_8  spiral_87(
                 .i_data(i_7),
                            
                 .o_data_9(w7_0),
                 .o_data_25(w7_1),
                 .o_data_43(w7_2),
                 .o_data_57(w7_3),
                 .o_data_70(w7_4),
                 .o_data_80(w7_5),
                 .o_data_87(w7_6),
                 .o_data_90(w7_7)
);

endmodule
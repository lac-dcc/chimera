/*
      i0    i1    i2    i3
1 [   18,   50,   75,   89]       i0
2 [  -50,  -89,  -18,   75]       i1
3 [   75,   18,  -89,   50]   ×   i2
4 [  -89,   75,  -50,   18]       i3

*/
module mcm_4(
          clk ,
          rst ,
      inverse ,
              
          i_0 ,
          i_1 ,
          i_2 ,
          i_3 ,
          
          m1_0,
          m1_1,
          m1_2,
          m1_3
);
// ********************************************
//                                             
//    INPUT / OUTPUT DECLARATION                                               
//                                                                             
// ********************************************  
input               clk;
input               rst;
input           inverse;

input signed [18:0] i_0;
input signed [18:0] i_1;
input signed [18:0] i_2;
input signed [18:0] i_3;

output reg signed [18+7+2:0] m1_0;
output reg signed [18+7+2:0] m1_1;
output reg signed [18+7+2:0] m1_2;
output reg signed [18+7+2:0] m1_3;

// ********************************************
//                                             
//    Wire DECLARATION                         
//                                             
// ********************************************
wire signed [18+7:0] w0_0;
wire signed [18+7:0] w0_1;
wire signed [18+7:0] w0_2;
wire signed [18+7:0] w0_3;
wire signed [18+7:0] w1_0;
wire signed [18+7:0] w1_1;
wire signed [18+7:0] w1_2;
wire signed [18+7:0] w1_3;
wire signed [18+7:0] w2_0;
wire signed [18+7:0] w2_1;
wire signed [18+7:0] w2_2;
wire signed [18+7:0] w2_3;
wire signed [18+7:0] w3_0;
wire signed [18+7:0] w3_1;
wire signed [18+7:0] w3_2;
wire signed [18+7:0] w3_3;
wire signed [18+8:0] w00;
wire signed [18+8:0] w01;
wire signed [18+8:0] w01_0;
wire signed [18+8:0] w10;
wire signed [18+8:0] w11;
wire signed [18+8:0] w10_0;
wire signed [18+8:0] w20;
wire signed [18+8:0] w21;
wire signed [18+8:0] w21_0;
wire signed [18+8:0] w30;
wire signed [18+8:0] w31;
wire signed [18+8:0] w30_0;
wire signed [18+9:0] w0;
wire signed [18+9:0] w1;
wire signed [18+9:0] w2;
wire signed [18+9:0] w3;


// ********************************************
//                                             
//    Reg  DECLARATION                         
//                                             
// ********************************************
  
 reg signed [18+7+2:0] m10;
 reg signed [18+7+2:0] m11;
 reg signed [18+7+2:0] m12;
 reg signed [18+7+2:0] m13;

// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign w00=w0_0+w2_2;
assign w01_0=w1_1+w3_3;
assign w01=inverse?(-w01_0):w01_0;

assign w10_0=-w0_1-w2_0;
assign w10=inverse?(-w10_0):w10_0;
assign w11=-w1_3+w3_2;

assign w20=w0_2-w2_3;
assign w21_0=w1_0+w3_1;
assign w21=inverse?(-w21_0):w21_0;

assign w30_0=-w0_3-w2_1;
assign w31=w1_2+w3_0;
assign w30=inverse?(-w30_0):w30_0;

assign w0=w00+w01;
assign w1=w10+w11;
assign w2=w20+w21;
assign w3=w30+w31;

// **********************************************
//                                             
//    Sequential  Logic                        
//                                             
// ********************************************

always @(posedge clk or negedge rst)
   if(!rst)
     begin
       m10<=28'b0;
       m11<=28'b0;
       m12<=28'b0;
       m13<=28'b0;
     end
   else
    begin
       m10<=w0;
       m11<=w1;
       m12<=w2;
       m13<=w3;
     end

always @(posedge clk or negedge rst)
   if(!rst)
     begin
       m1_0<=28'b0;
       m1_1<=28'b0;
       m1_2<=28'b0;
       m1_3<=28'b0;
     end
	 else
    begin
       m1_0<=m10;
       m1_1<=m11;
       m1_2<=m12;
       m1_3<=m13;
     end
     
// ********************************************
//                                             
//    Sub Modules                              
//                                             
// ********************************************

spiral_4  spiral_40(
                    .i_data(i_0),
                         
                 .o_data_18(w0_0),
                 .o_data_50(w0_1),
                 .o_data_75(w0_2),
                 .o_data_89(w0_3)
  );
spiral_4  spiral_41(
                   .i_data(i_1),
                             
                 .o_data_18(w1_0),
                 .o_data_50(w1_1),
                 .o_data_75(w1_2),
                 .o_data_89(w1_3)
  );
spiral_4  spiral_42(
                  .i_data(i_2),
                            
                .o_data_18(w2_0),
                .o_data_50(w2_1),
                .o_data_75(w2_2),
                .o_data_89(w2_3)
  );
spiral_4  spiral_43(
                  .i_data(i_3),
                            
                .o_data_18(w3_0),
                .o_data_50(w3_1),
                .o_data_75(w3_2),
                .o_data_89(w3_3)
  );
  
  endmodule               
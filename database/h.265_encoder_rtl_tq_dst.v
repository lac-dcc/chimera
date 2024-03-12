/*
 i0    i1    i2    i3
1 [ 29,   55,    74,   84 ]     i0
2 [ 74,   74,    0 ,  -74 ]     i1
3 [ 84,  -29,   -74,   55 ] ?   i2 
4 [ 55,  -84,    74,  -29 ]     i3
*/

module  dst(
          clk,
          rst,
      inverse,
      
          i_0,
          i_1,
          i_2,
          i_3,
          
          o_0,
          o_1,
          o_2,
          o_3
);

// ********************************************
//                                             
//  INPUT / OUTPUT DECLARATION                                               
//                                                                             
// ********************************************  
input                    clk;
input                    rst;
input                inverse;
input signed      [18:0] i_0;
input signed      [18:0] i_1;
input signed      [18:0] i_2;
input signed      [18:0] i_3;

output reg signed [27:0] o_0;
output reg signed [27:0] o_1;
output reg signed [27:0] o_2;
output reg signed [27:0] o_3;

// **********************************************
//                                             
//    Wire DECLARATION                         
//                                             
// **********************************************

wire signed [26:0]     w0_00;
wire signed [26:0]     w0_01;
wire signed [26:0]     w0_10;
wire signed [26:0]     w0_11;
wire signed [26:0]     w0_20;
wire signed [26:0]     w0_21;
wire signed [26:0]     w0_30;
wire signed [26:0]     w0_31;

wire signed [26:0]     w1_00;
wire signed [26:0]     w1_01;
wire signed [26:0]     w1_10;
wire signed [26:0]     w1_11;
wire signed [26:0]     w1_20;
wire signed [26:0]     w1_21;
wire signed [26:0]     w1_30;
wire signed [26:0]     w1_31;


// **********************************************
//                                             
//    REG DECLARATION                         
//                                             
// **********************************************

reg  signed [26:0]     o_00;
reg  signed [26:0]     o_01;
reg  signed [26:0]     o_10;
reg  signed [26:0]     o_11;
reg  signed [26:0]     o_20;
reg  signed [26:0]     o_21;
reg  signed [26:0]     o_30;
reg  signed [26:0]     o_31;

// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign w0_00=29*i_0+55*i_1;
assign w0_01=74*i_2+84*i_3;
assign w0_10=74*i_0+74*i_1;
assign w0_11= -74*i_3;
assign w0_20=84*i_0-29*i_1;
assign w0_21=-74*i_2+55*i_3;
assign w0_30=55*i_0-84*i_1;
assign w0_31=74*i_2-29*i_3;

assign w1_00=29*i_0+74*i_1;
assign w1_01=84*i_2+55*i_3;
assign w1_10=55*i_0+74*i_1;
assign w1_11= -29*i_2-84*i_3;
assign w1_20=74*i_0;
assign w1_21=-74*i_2+74*i_3;
assign w1_30=84*i_0-74*i_1;
assign w1_31=55*i_2-29*i_3;

// ********************************************
//                                             
//    Sequential  Logic                        
//                                             
// ********************************************

always @(posedge clk or negedge rst)
   if(!rst) begin
   o_00<='b0; o_01<='b0;
   o_10<='b0; o_11<='b0;
   o_20<='b0; o_21<='b0;
   o_30<='b0; o_31<='b0; 
   end
   else
 if(inverse)   begin
   o_00<=w1_00; o_01<=w1_01;
   o_10<=w1_10; o_11<=w1_11;
   o_20<=w1_20; o_21<=w1_21;
   o_30<=w1_30; o_31<=w1_31;
   end
   else  begin
   o_00<=w0_00; o_01<=w0_01;
   o_10<=w0_10; o_11<=w0_11;
   o_20<=w0_20; o_21<=w0_21;
   o_30<=w0_30; o_31<=w0_31;
   end
   
   
 always @(posedge clk or negedge rst)
   if(!rst) begin
   o_0<='b0; o_1<='b0;
   o_2<='b0; o_3<='b0;
   end
   else begin
   o_0<=o_00+o_01;o_1<=o_10+o_11;
   o_2<=o_20+o_21;o_3<=o_30+o_31;
   end  
   
endmodule
 
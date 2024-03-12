/*
      i0    i1    i2    i3
1 [   64,   64,    0,    0]       i0
2 [   64,  -64,    0,    0]       i1
3 [    0,    0,   36,   83]   ×   i2
4 [    0,    0,  -83,   36]       i3

*/
module  mcm00(
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
input               clk;
input               rst;
input           inverse;
input signed [19:0] i_0;
input signed [19:0] i_1;
input signed [19:0] i_2;
input signed [19:0] i_3;

output reg signed [19+7+1:0] o_0;
output reg signed [19+7+1:0] o_1;
output reg signed [19+7+1:0] o_2;
output reg signed [19+7+1:0] o_3;


// **********************************************
//                                             
//    Wire DECLARATION                         
//                                             
// **********************************************

wire signed [19+7:0]  w0_0;
wire signed [19+7:0]  w0_1;

wire signed [19+7:0]  w2_0;
wire signed [19+7:0]  w2_1;
wire signed [19+7:0]  w3_0;
wire signed [19+7:0]  w3_1;

wire signed [19+8:0]   w20;
wire signed [19+8:0]   w21;
wire signed [19+8:0]   w30;
wire signed [19+8:0]   w31;
wire signed [19+8:0]    w0;
wire signed [19+8:0]    w1;
wire signed [19+8:0]    w2;
wire signed [19+8:0]    w3;

// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************
assign w0_0=64*i_0;
assign w0_1=64*i_1;

assign w0 =w0_0+w0_1;
assign w1 =w0_0-w0_1;

assign w20 =w2_0+w3_1;
assign w21 =w2_0-w3_1;
assign w2=inverse?w21:w20;

assign w30 =-w2_1+w3_0;
assign w31 =w2_1+w3_0;
assign w3=inverse?w31:w30;

// ********************************************
//                                             
//    Sequential  Logic                        
//                                             
// ********************************************

always @(posedge clk or negedge rst)
   if(!rst)
     begin
      o_0<=28'b0;
      o_1<=28'b0;
      o_2<=28'b0;
      o_3<=28'b0;
     end
   else
    begin
       o_0<=w0;
       o_1<=w1;
       o_2<=w2;
       o_3<=w3;
     end
         
// ********************************************
//                                             
//    Sub Modules                              
//                                             
// ********************************************

spiral_0 spiral_00(
                .i_data(i_2),
                
                .o_data_36(w2_0),
                .o_data_83(w2_1)
);

spiral_0 spiral_01(
                .i_data(i_3),
                
                .o_data_36(w3_0),
                .o_data_83(w3_1)
);

endmodule
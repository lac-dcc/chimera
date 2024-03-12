/*
      i0    i1    i2    i3
1 [   64,   64,    0,    0]       i0
2 [   64,  -64,    0,    0]       i1
3 [    0,    0,   36,   83]   x   i2
4 [    0,    0,  -83,   36]       i3

*/
module  mcm_0(
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
input                 clk;
input                 rst;
input             inverse;
input   signed [18:0] i_0;
input   signed [18:0] i_1;
input   signed [18:0] i_2;
input   signed [18:0] i_3;

output reg signed [27:0] o_0;
output reg signed [27:0] o_1;
output reg signed [27:0] o_2;
output reg signed [27:0] o_3;


// **********************************************
//                                             
//    Wire DECLARATION                         
//                                             
// **********************************************

wire  signed   [19:0]    ob1_0;    
wire  signed   [19:0]    ob1_1;  
wire  signed   [19:0]    ob1_2;  
wire  signed   [19:0]    ob1_3; 

wire  signed   [18:0]    op1_0;    
wire  signed   [18:0]    op1_1;  
wire  signed   [18:0]    op1_2;  
wire  signed   [18:0]    op1_3; 

wire  signed   [19:0]    im_0;    
wire  signed   [19:0]    im_1;  
wire  signed   [19:0]    im_2;  
wire  signed   [19:0]    im_3; 

wire  signed   [27:0]    om_0;    
wire  signed   [27:0]    om_1;  
wire  signed   [27:0]    om_2;  
wire  signed   [27:0]    om_3; 

wire  signed   [27:0]    op3_0;    
wire  signed   [27:0]    op3_1;  
wire  signed   [27:0]    op3_2;  
wire  signed   [27:0]    op3_3; 

wire  signed   [27:0]    ob3_0;    
wire  signed   [27:0]    ob3_1;  
wire  signed   [27:0]    ob3_2;  
wire  signed   [27:0]    ob3_3; 

wire  signed   [27:0]       o0;    
wire  signed   [27:0]       o1;  
wire  signed   [27:0]       o2;  
wire  signed   [27:0]       o3;


// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign   im_0=inverse?op1_0:ob1_0;
assign   im_1=inverse?op1_1:ob1_1;
assign   im_2=inverse?op1_2:ob1_2;
assign   im_3=inverse?op1_3:ob1_3;

assign   o0=inverse?ob3_0:op3_0;
assign   o1=inverse?ob3_1:op3_1;
assign   o2=inverse?ob3_2:op3_2;
assign   o3=inverse?ob3_3:op3_3;

// ********************************************
//                                             
//    Sequential  Logic                        
//                                             
// ********************************************

always @(posedge clk or negedge rst)
   if(!rst) begin
     o_0<='b0;o_1<='b0;
     o_2<='b0;o_3<='b0;
   end	 
   else     begin
     o_0<=o0;o_1<=o1;
	 o_2<=o2;o_3<=o3;
   end
      
// ********************************************
//                                             
//    Sub Modules                              
//                                             
// ********************************************

butterfly1_4   b14(   
               .i_0(i_0),
               .i_1(i_1),
               .i_2(i_2),
               .i_3(i_3),
                       
               .o_0(ob1_0),
               .o_1(ob1_1),
               .o_2(ob1_2),
               .o_3(ob1_3)
);

premuat1_4      p14(
               .i_0(i_0),
               .i_1(i_1),
               .i_2(i_2),
               .i_3(i_3),
              
               .o_0(op1_0),
               .o_1(op1_1),
               .o_2(op1_2),
               .o_3(op1_3)
);

mcm00         m001(
              .clk(clk),
              .rst(rst),
          .inverse(inverse),
          
              .i_0(im_0),
              .i_1(im_1),
              .i_2(im_2),
              .i_3(im_3),
                 
              .o_0(om_0),
              .o_1(om_1),
              .o_2(om_2),
              .o_3(om_3)
);

butterfly3_4   b34(  
               .i_0(om_0),
               .i_1(om_1),
               .i_2(om_2),
               .i_3(om_3),
                       
               .o_0(ob3_0),
               .o_1(ob3_1),
               .o_2(ob3_2),
               .o_3(ob3_3)
);

premuat3_4      p34(
               .i_0(om_0),
               .i_1(om_1),
               .i_2(om_2),
               .i_3(om_3),
              
               .o_0(op3_0),
               .o_1(op3_1),
               .o_2(op3_2),
               .o_3(op3_3)
);

endmodule
		 

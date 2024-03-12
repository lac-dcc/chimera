module butterfly3_16(
             enable,
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
                
                 o_0,
                 o_1,
                 o_2,
                 o_3,
                 o_4,
                 o_5,
                 o_6,
                 o_7,
                 o_8 ,
                 o_9 ,
                 o_10,
                 o_11,
                 o_12,
                 o_13,
                 o_14,
                 o_15            
);

// ****************************************************************
//
//	INPUT / OUTPUT DECLARATION
//
// ****************************************************************                

input             enable;
input signed  [27:0] i_0;
input signed  [27:0] i_1;
input signed  [27:0] i_2;
input signed  [27:0] i_3;
input signed  [27:0] i_4;
input signed  [27:0] i_5;
input signed  [27:0] i_6;
input signed  [27:0] i_7;
input signed  [27:0] i_8;
input signed  [27:0] i_9;
input signed  [27:0] i_10;
input signed  [27:0] i_11;
input signed  [27:0] i_12;
input signed  [27:0] i_13;
input signed  [27:0] i_14;
input signed  [27:0] i_15;


output  signed [27:0] o_0 ;
output  signed [27:0] o_1 ;
output  signed [27:0] o_2 ;
output  signed [27:0] o_3 ;
output  signed [27:0] o_4 ;
output  signed [27:0] o_5 ;
output  signed [27:0] o_6 ;
output  signed [27:0] o_7 ;
output  signed [27:0] o_8 ;
output  signed [27:0] o_9 ;
output  signed [27:0] o_10;
output  signed [27:0] o_11;
output  signed [27:0] o_12;
output  signed [27:0] o_13;
output  signed [27:0] o_14;
output  signed [27:0] o_15;


// ****************************************************************
//
//	WIRE DECLARATION
//
// ****************************************************************

wire  signed [27:0]   b_0;
wire  signed [27:0]   b_1;
wire  signed [27:0]   b_2;
wire  signed [27:0]   b_3;
wire  signed [27:0]   b_4;
wire  signed [27:0]   b_5;
wire  signed [27:0]   b_6;
wire  signed [27:0]   b_7;
wire  signed [27:0]   b_8;
wire  signed [27:0]   b_9;
wire  signed [27:0]   b_10;
wire  signed [27:0]   b_11;
wire  signed [27:0]   b_12;
wire  signed [27:0]   b_13;
wire  signed [27:0]   b_14;
wire  signed [27:0]   b_15;

// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign b_0=i_0+i_15;
assign b_1=i_1+i_14;
assign b_2=i_2+i_13;
assign b_3=i_3+i_12;
assign b_4=i_4+i_11;
assign b_5=i_5+i_10;
assign b_6=i_6+i_9;
assign b_7=i_7+i_8;
assign b_8=i_7-i_8;               
assign b_9=i_6-i_9;
assign b_10=i_5-i_10;               
assign b_11=i_4-i_11;
assign b_12=i_3-i_12;               
assign b_13=i_2-i_13;
assign b_14=i_1-i_14;               
assign b_15=i_0-i_15;

assign o_0=enable?b_0:i_0;
assign o_1=enable?b_1:i_1;
assign o_2=enable?b_2:i_2;
assign o_3=enable?b_3:i_3;
assign o_4=enable?b_4:i_4;
assign o_5=enable?b_5:i_5;
assign o_6=enable?b_6:i_6;
assign o_7=enable?b_7:i_7;
assign o_8=enable?b_8:i_8;
assign o_9=enable?b_9:i_9;
assign o_10=enable?b_10:i_10;
assign o_11=enable?b_11:i_11;
assign o_12=enable?b_12:i_12;
assign o_13=enable?b_13:i_13;
assign o_14=enable?b_14:i_14;
assign o_15=enable?b_15:i_15;

endmodule

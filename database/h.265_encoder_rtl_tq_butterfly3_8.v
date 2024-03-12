module butterfly3_8(
             enable,
                i_0,
                i_1,
                i_2,
                i_3,
                i_4,
                i_5,
                i_6,
                i_7,
                
                o_0,
                o_1,
                o_2,
                o_3,
                o_4,
                o_5,
                o_6,
                o_7
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

output signed [27:0] o_0;
output signed [27:0] o_1;
output signed [27:0] o_2;
output signed [27:0] o_3;
output signed [27:0] o_4;
output signed [27:0] o_5;
output signed [27:0] o_6;
output signed [27:0] o_7;

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

// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign b_0=i_0+i_7;
assign b_1=i_1+i_6;
assign b_2=i_2+i_5;
assign b_3=i_3+i_4;
assign b_4=i_3-i_4;               
assign b_5=i_2-i_5;
assign b_6=i_1-i_6;               
assign b_7=i_0-i_7;

assign o_0=enable?b_0:i_0;
assign o_1=enable?b_1:i_1;
assign o_2=enable?b_2:i_2;
assign o_3=enable?b_3:i_3;
assign o_4=enable?b_4:i_4;
assign o_5=enable?b_5:i_5;
assign o_6=enable?b_6:i_6;
assign o_7=enable?b_7:i_7;


endmodule


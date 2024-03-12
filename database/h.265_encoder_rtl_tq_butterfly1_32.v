module butterfly1_32(
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
                i_16,
                i_17,
                i_18,
                i_19,
                i_20,
                i_21,
                i_22,
                i_23,
                i_24,
                i_25,
                i_26,
                i_27,
                i_28,
                i_29,
                i_30,
                i_31,
                
                o_0,
                o_1,
                o_2,
                o_3,
                o_4,
                o_5,
                o_6,
                o_7,
                o_8,
                o_9,
                o_10,
                o_11,
                o_12,
                o_13,
                o_14,
                o_15,
                o_16,
                o_17,
                o_18,
                o_19,
                o_20,
                o_21,
                o_22,
                o_23,
                o_24,
                o_25,
                o_26,
                o_27,
                o_28,
                o_29,
                o_30,
                o_31
);

// ****************************************************************
//
//	INPUT / OUTPUT DECLARATION
//
// ****************************************************************                

input             enable;
input signed  [15:0] i_0;
input signed  [15:0] i_1;
input signed  [15:0] i_2;
input signed  [15:0] i_3;
input signed  [15:0] i_4;
input signed  [15:0] i_5;
input signed  [15:0] i_6;
input signed  [15:0] i_7;
input signed  [15:0] i_8;
input signed  [15:0] i_9;
input signed  [15:0] i_10;
input signed  [15:0] i_11;
input signed  [15:0] i_12;
input signed  [15:0] i_13;
input signed  [15:0] i_14;
input signed  [15:0] i_15;
input signed  [15:0] i_16;
input signed  [15:0] i_17;
input signed  [15:0] i_18;
input signed  [15:0] i_19;
input signed  [15:0] i_20;
input signed  [15:0] i_21;
input signed  [15:0] i_22;
input signed  [15:0] i_23;
input signed  [15:0] i_24;
input signed  [15:0] i_25;
input signed  [15:0] i_26;
input signed  [15:0] i_27;
input signed  [15:0] i_28;
input signed  [15:0] i_29;
input signed  [15:0] i_30;
input signed  [15:0] i_31;


output  signed [16:0] o_0;
output  signed [16:0] o_1;
output  signed [16:0] o_2;
output  signed [16:0] o_3;
output  signed [16:0] o_4;
output  signed [16:0] o_5;
output  signed [16:0] o_6;
output  signed [16:0] o_7;
output  signed [16:0] o_8;
output  signed [16:0] o_9;
output  signed [16:0] o_10;
output  signed [16:0] o_11;
output  signed [16:0] o_12;
output  signed [16:0] o_13;
output  signed [16:0] o_14;
output  signed [16:0] o_15;
output  signed [16:0] o_16;
output  signed [16:0] o_17;
output  signed [16:0] o_18;
output  signed [16:0] o_19;
output  signed [16:0] o_20;
output  signed [16:0] o_21;
output  signed [16:0] o_22;
output  signed [16:0] o_23;
output  signed [16:0] o_24;
output  signed [16:0] o_25;
output  signed [16:0] o_26;
output  signed [16:0] o_27;
output  signed [16:0] o_28;
output  signed [16:0] o_29;
output  signed [16:0] o_30;
output  signed [16:0] o_31;


// ****************************************************************
//
//	WIRE DECLARATION
//
// ****************************************************************

wire  signed [16:0]   b_0;
wire  signed [16:0]   b_1;
wire  signed [16:0]   b_2;
wire  signed [16:0]   b_3;
wire  signed [16:0]   b_4;
wire  signed [16:0]   b_5;
wire  signed [16:0]   b_6;
wire  signed [16:0]   b_7;
wire  signed [16:0]   b_8;
wire  signed [16:0]   b_9;
wire  signed [16:0]   b_10;
wire  signed [16:0]   b_11;
wire  signed [16:0]   b_12;
wire  signed [16:0]   b_13;
wire  signed [16:0]   b_14;
wire  signed [16:0]   b_15;
wire  signed [16:0]   b_16;
wire  signed [16:0]   b_17;
wire  signed [16:0]   b_18;
wire  signed [16:0]   b_19;
wire  signed [16:0]   b_20;
wire  signed [16:0]   b_21;
wire  signed [16:0]   b_22;
wire  signed [16:0]   b_23;
wire  signed [16:0]   b_24;
wire  signed [16:0]   b_25;
wire  signed [16:0]   b_26;
wire  signed [16:0]   b_27;
wire  signed [16:0]   b_28;
wire  signed [16:0]   b_29;
wire  signed [16:0]   b_30;
wire  signed [16:0]   b_31;

// ********************************************
//                                             
//    Combinational Logic                      
//                                             
// ********************************************

assign b_0=i_0+i_31;
assign b_1=i_1+i_30;
assign b_2=i_2+i_29;
assign b_3=i_3+i_28;
assign b_4=i_4+i_27;
assign b_5=i_5+i_26;
assign b_6=i_6+i_25;
assign b_7=i_7+i_24;
assign b_8=i_8+i_23;               
assign b_9=i_9+i_22;
assign b_10=i_10+i_21;
assign b_11=i_11+i_20;
assign b_12=i_12+i_19;
assign b_13=i_13+i_18;
assign b_14=i_14+i_17;
assign b_15=i_15+i_16;
assign b_16=i_15-i_16;
assign b_17=i_14-i_17;
assign b_18=i_13-i_18;
assign b_19=i_12-i_19;
assign b_20=i_11-i_20;
assign b_21=i_10-i_21;
assign b_22=i_9-i_22;
assign b_23=i_8-i_23; 
assign b_24=i_7-i_24;      
assign b_25=i_6-i_25;
assign b_26=i_5-i_26;               
assign b_27=i_4-i_27;
assign b_28=i_3-i_28;               
assign b_29=i_2-i_29;
assign b_30=i_1-i_30;               
assign b_31=i_0-i_31;

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
assign o_16=enable?b_16:i_16;
assign o_17=enable?b_17:i_17;
assign o_18=enable?b_18:i_18;
assign o_19=enable?b_19:i_19;
assign o_20=enable?b_20:i_20;
assign o_21=enable?b_21:i_21;
assign o_22=enable?b_22:i_22;
assign o_23=enable?b_23:i_23;
assign o_24=enable?b_24:i_24;
assign o_25=enable?b_25:i_25;
assign o_26=enable?b_26:i_26;
assign o_27=enable?b_27:i_27;
assign o_28=enable?b_28:i_28;
assign o_29=enable?b_29:i_29;
assign o_30=enable?b_30:i_30;
assign o_31=enable?b_31:i_31;

endmodule
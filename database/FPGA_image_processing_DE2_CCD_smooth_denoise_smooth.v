// File name :     denoise_smooth.v
// Function  :     use a common template to smooth the captured image and denoise the image 
// Author    :     super sun 
// Last Modified:  10/03/31
// All rights preserved @ HIT_EDA_LAB
///////////////////////////////////////////////////////////////////////////////////////////
module denoise_smooth
(
clk_in,
rst_n,
idata_valid,
data_in,
data_o
);

// ports declaration
input        clk_in;
input        rst_n;
input        idata_valid;
input  [9:0] data_in;
output [9:0] data_o;
////////////////////////////
// parameters declaration
parameter X1 = 8'h01, X2 = 8'h02, X3 = 8'h01;
parameter X4 = 8'h02, X5 = 8'h04, X6 = 8'h02;
parameter X7 = 8'h01, X8 = 8'h02, X9 = 8'h01;

//wire
wire [9:0] line0;
wire [9:0] line1;
wire [9:0] line2;

wire [19:0] mac0;
wire [19:0] mac1;
wire [19:0] mac2;

wire [21:0] sum;
wire [9:0] data_o;

//assign 
assign data_o = sum[13:4];

//module declaration 

filter_buffer L0
(			
	.clken(idata_valid),
	.clock(clk_in),
	.shiftin(data_in),
	//.shiftout,
	.taps0x(line0),
	.taps1x(line1),
	.taps2x(line2)
);

Multiply mul0
(	
	.aclr0(!rst_n),
	.clock0(clk_in),
	.dataa_0(line0),
	.datab_0(X9),
	.datab_1(X8),
	.datab_2(X7),
	.result(mac0)
);

Multiply mul1
(	
	.aclr0(!rst_n),
	.clock0(clk_in),
	.dataa_0(line1),
	.datab_0(X6),
	.datab_1(X5),
	.datab_2(X4),
	.result(mac1)
);

Multiply mul2
(	
	.aclr0(!rst_n),
	.clock0(clk_in),
	.dataa_0(line2),
	.datab_0(X3),
	.datab_1(X2),
	.datab_2(X1),
	.result(mac2)
);

pa parellel_add
(
    .aclr(!rst_n),
	.clock(clk_in),
	.data0x(mac0),
	.data1x(mac1),
	.data2x(mac2),
	.result(sum)
);
	
endmodule

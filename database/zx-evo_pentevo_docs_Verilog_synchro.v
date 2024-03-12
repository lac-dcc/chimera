// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on

module test (
	input clock,
	input [8:0] wraddress,
	input [7:0] data,
	input wren,
	input [8:0] rdaddress,
	output reg [7:0] q
	);

	reg [7:0] mem [0:511]; 
	
	always @(posedge clock)
		q <= mem[rdaddress];
	
	always @(posedge clock)
	if (wren)
		mem[wraddress] <= data;

endmodule
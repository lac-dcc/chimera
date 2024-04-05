

`timescale 1ns / 1ps
`default_nettype none


module LUT6
		#(
			parameter	[63:0]	INIT = {64{1'b0}}
		)
		(
			output	O,
			input	I0,
			input	I1,
			input	I2,
			input	I3,
			input	I4,
			input	I5
		);
	
	wire	[63:0]	lut_table = INIT;
	wire	[5:0]	index = {I5, I4, I3, I2, I1, I0};
	
	assign O = lut_table[index];
	
endmodule



`default_nettype wire



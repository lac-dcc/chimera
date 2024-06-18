// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License


// -----------------------------------------------------------------------------
/* Description:
	The accumulator is used to store the current result, 
	and when the ena signal is active, 
	it outputs the data from the data bus on the rising edge of clk.
*/
// Version: 0.1
// -----------------------------------------------------------------------------


module accum (
	input clk,    // Clock
	input rst,    // Asynchronous reset active high
	input ena,
	input [7:0] data,

	output reg [7:0] accum
);
	always @(posedge clk) begin : proc_accum
		if(rst) begin
			accum <= 8'b0000_0000;
		end else if (ena) begin
			accum <= data;
		end
	end

endmodule
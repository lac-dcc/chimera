// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

module data1c_sync #(
	parameter DW = 8,   // data width
	parameter STAGE = 3 // the number of sync stage
	)(
	input clk,    // Clock
	input rst_n,  // Asynchronous reset active low
	input [DW-1:0] data_in,
	output [DW-1:0] data_out
);
	reg [DW-1 : 0] data_r [STAGE-1 : 0] ;

	integer i;
	always @(posedge clk or negedge rst_n) begin
		if (rst_n == 1'b0) begin
			for (i = 0; i < STAGE; i = i + 1) begin
				data_r[i] <= {DW{1'b0}} ;
			end
		end
		else begin
			data_r[0] <= data_in ;
			for (i = 1; i < STAGE; i = i + 1) begin
				data_r[i] <= data_r[i-1] ;
			end
		end
	end

	assign data_out = data_r[STAGE-1] ;

endmodule
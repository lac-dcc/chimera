// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

module gray_counter #(
	parameter SIZE = 4
	)(
	input						clk,    // Clock
	input						rst_n,  // Asynchronous reset active low
	input						inr, 	// increment

	output reg	[SIZE - 1 : 0]	gray
);
	reg [SIZE - 1 : 0] gray_temp ;
	reg [SIZE - 1 : 0] bin 		 ;
	reg [SIZE - 1 : 0] bin_temp  ;

	integer i ;
	always @(*) begin
		for (i = 0; i < SIZE; i++) begin
			bin[i]    = ^(gray >> i);  // gray to bin
			bin_temp  = bin + inr ;  // add in bin
			gray_temp = (bin_temp >> 1) ^ bin_temp ;  //bin to gray
		end				
	end

	always @(posedge clk or negedge rst_n) begin
		if (rst_n == 1'b0) begin
			gray <= {SIZE{1'b0}} ;
		end
		else begin
			gray <= gray_temp ;
		end
	end

endmodule
// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

module gray_to_bin#(
	parameter SIZE = 4
	)(
	input  [SIZE - 1 : 0] gray  ,

	output reg [SIZE - 1 : 0] bin 
);
	integer i ;
	always @(*) begin
		for (i = 0; i <= SIZE; i++) begin
			bin[i] = ^(gray >> i) ; // 0 ^ num = num
		end
	end

endmodule
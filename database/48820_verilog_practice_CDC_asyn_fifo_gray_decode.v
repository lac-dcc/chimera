// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License

module gray_decode #(
	parameter W = 32'd8
	)(
	input  [W-1:0] gray ,
	output [W-1:0] gray_decode
);
	integer i ;
	reg [W-1 : 0] gray_decode_r ;

	always @(*) begin
		gray_decode_r[W-1] = gray[W-1] ;
		for (i = W-2; i >= 0; i = i - 1) begin
			gray_decode_r[i] = gray_decode_r[i+1] ^ gray[i] ;
		end
		
	end

	assign gray_decode = gray_decode_r ;

endmodule
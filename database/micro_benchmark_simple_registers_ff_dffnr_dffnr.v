// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

///////////////////////////////////////////////
//  Functionality: Active high async resetable,
//		negedge triggered D flip-flop
///////////////////////////////////////////////

module dffnr(clk_i, clr_i, d_i,q_o);

	input clk_i, clr_i,d_i;
	output reg q_o;
	always @ (negedge clk_i or posedge clr_i) begin
		q_o <= (clr_i)? 1'b0: d_i;
	end

endmodule

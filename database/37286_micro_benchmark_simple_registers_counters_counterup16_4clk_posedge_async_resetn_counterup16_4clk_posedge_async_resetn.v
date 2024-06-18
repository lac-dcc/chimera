// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

/////////////////////////////////////////
//  Functionality: four 16 bit up counters 
//			 operating upon 4 different clocks 
////////////////////////////////////////

module counterup16_4clk_posedge_async_resetn (clock0, clock1, clock2, clock3, reset, cnt0_16, cnt1_16, cnt2_16, cnt3_16);
	input clock0, clock1, clock2, clock3;
	input reset;
	output [15:0] cnt0_16;
	output [15:0] cnt1_16;
	output [15:0] cnt2_16;
	output [15:0] cnt3_16;

	counterup16 u_cnt0(.clk(clock0), .reset(reset), .count(cnt0_16));
	counterup16 u_cnt1(.clk(clock1), .reset(reset), .count(cnt1_16));
	counterup16 u_cnt2(.clk(clock2), .reset(reset), .count(cnt2_16));
	counterup16 u_cnt3(.clk(clock3), .reset(reset), .count(cnt3_16));

endmodule 

// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

/////////////////////////////////////////
//  Functionality: four 16 bit up counters 
//			 operating upon 7 different clocks 
////////////////////////////////////////

module counterup16_7clk_posedge_async_resetn (clock0, clock1, clock2, clock3, clock4, clock5, clock6, reset, cnt0_16, cnt1_16, cnt2_16, cnt3_16, cnt4_16,cnt5_16,cnt6_16);
	input clock0, clock1, clock2, clock3, clock4, clock5, clock6;
	input reset;
	output [15:0] cnt0_16;
	output [15:0] cnt1_16;
	output [15:0] cnt2_16;
	output [15:0] cnt3_16;
	output [15:0] cnt4_16;
	output [15:0] cnt5_16;
	output [15:0] cnt6_16;

	counterup16 u_cnt0(.clk(clock0), .reset(reset), .count(cnt0_16));
	counterup16 u_cnt1(.clk(clock1), .reset(reset), .count(cnt1_16));
	counterup16 u_cnt2(.clk(clock2), .reset(reset), .count(cnt2_16));
	counterup16 u_cnt3(.clk(clock3), .reset(reset), .count(cnt3_16));
	counterup16 u_cnt4(.clk(clock4), .reset(reset), .count(cnt4_16));
	counterup16 u_cnt5(.clk(clock5), .reset(reset), .count(cnt5_16));
	counterup16 u_cnt6(.clk(clock6), .reset(reset), .count(cnt6_16));
endmodule 

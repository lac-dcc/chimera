// This program was cloned from: https://github.com/tangxifan/micro_benchmark
// License: MIT License

/////////////////////////////////////////
//  Functionality: 36 bit up counter + seperate 12 bit counter 
//	operating upon 2 different clocks 
//  Coder: M Usman Kiani
////////////////////////////////////////

module counterup36_8_2clk_async_resetp (clock0,reset,out1,out2);
	parameter N=36;
	parameter size = 77;
	input clock0;
	input reset;
	output [(size*N)-1:0] out1;
	wire [N-1:0] count_w;
	output [9:0] out2;


	cluster_counters a0(clock0, reset, count_w);
	counterup10_1clk_async_resetp b0(.clk(clock0), .reset(reset), .count(out2));

	generate
	genvar k;
	for(k=0;k < size; k=k+1)begin
	   assign out1[((N-1)+k*N):(k*N)] = count_w;
	end
	endgenerate
/*
`ifdef COCOTB_SIM
initial begin
  $dumpfile("wave.vcd");
  $dumpvars(0, counterup36_8_2clk_async_resetp);
end
`endif
*/
endmodule 


module cluster_counters (clock0, reset, out);
	input clock0;
	input reset;
	output [35:0] out;

	counterup8_1clk_async_resetp ins0(.clk(clock0), .reset(reset), .count(out [7:0]));
	counterup12_1clk_async_resetp ins1(.clk(clock0), .reset(reset), .count(out [19:8]));
	counterup16_1clk_async_resetp ins2(.clk(clock0), .reset(reset), .count(out [35:20]));

endmodule 

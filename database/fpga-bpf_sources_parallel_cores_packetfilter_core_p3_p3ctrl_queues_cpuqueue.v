//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps

/*

cpuqueue.v

Implements a queue for the CPU module. This is one of the three queues used in
p3ctrl.v (refer to that file for details) 

*/


module cpuqueue (
	input wire clk,
	input wire rst,

	input wire [1:0] token_from_sn,
	input wire en_from_sn,
	input wire deq,
	
	output wire [1:0] head
);

reg [1:0] first = 0, second = 0, third = 0;
wire [1:0] first_n, second_n, third_n;

assign first_n = second;
assign second_n = third;
assign third_n = (en_from_sn) ? token_from_sn : 0;

always @(posedge clk) begin
	if (rst) begin
		first = 0;
		second = 0;
		third = 0;
	end else begin
		//This feels like it can be optimized somehow...
		if (deq || (first == 0)) begin
			first <= first_n;
		end
		if (deq || (first == 0) || (second == 0)) begin
			second <= second_n;
		end
		if (deq || (first == 0) || (second == 0) || (third == 0)) begin
			third <= third_n;
		end
	end
end

//Output
assign head = (first == 0) ? ((second == 0) ? third : second) : first;

endmodule

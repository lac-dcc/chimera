// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`timescale 1ns / 1ps

`include "hCPU.v"
`include "./io/segcom.v"

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:04:31 09/07/2023 
// Design Name: 
// Module Name:    segdisplay 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module hClockDivider(
	input clock,
	output clock_out
);
	reg  [23:0] counter;
	
	 always @(posedge clock) begin
			counter <= counter + 2'b1;
	 end
	 
	 assign clock_out = counter[23];
	 
	 initial begin
		counter = 2'b0;
	 end
endmodule

module segdisplay(
    input clock,
    input reset,
    output [7:0] sel,
    output [7:0] data,
	 output led0
    );
	 
	 wire [31:0] instruction;
	 
	 wire [15:0] inM;
	 wire [15:0] outM;
	 wire writeM;
	 wire [15:0] addressM;
	 wire [15:0] pc;
	 
	 reg [7:0] sel_temp;
	 reg [7:0] data_temp;
	 wire [7:0] segdata0;
	 wire [7:0] segdata1;
	 wire [7:0] segdata2;
	 wire [7:0] segdata3;
	 reg [9:0] segcounter;
	 
	 wire delay_clock;
	 
	 reg [15:0] memory;
	 
	 hClockDivider hcd(.clock(clock), .clock_out(delay_clock));

	test_rom hrom(.clka(delay_clock), .ena(1'b1), .addra({14'b0, pc, 2'b0}), .douta(instruction));
	
	hCPU hcpu(.inM(inM), 
	.instruction(instruction[15:0]), 
	.reset(~reset), 
	.clock(delay_clock), 
	.outM(outM), 
	.writeM(writeM), 
	.addressM(addressM),
	.pc(pc));
	
	always @(posedge clock) begin
		memory <= (writeM == 1'b1) ? outM : memory;
		$write("segdisplay::memory 0x%x\n", memory);
		$write("segdisplay::pc_temp %d\n", pc);
		$write("segdisplay::segdata0 0x%x\n", segdata0);
		$write("segdisplay::delay_clock 0x%x\n", delay_clock);
	end
	assign inM = memory;
	
	segcom hseg0(.val(memory[3:0]), .data(segdata0));
	segcom hseg1(.val(memory[7:4]), .data(segdata1));
	segcom hseg2(.val(memory[11:8]), .data(segdata2));
	segcom hseg3(.val(memory[15:12]), .data(segdata3));
	
	always @(posedge clock) begin
		segcounter <= segcounter + 2'b1;
		case (segcounter[9:8])
			2'b00: begin
				sel_temp <= 8'b11111110;
				data_temp <= segdata0;
			end
			2'b01: begin
				sel_temp <= 8'b11111101;
				data_temp <= segdata1;
			end
			2'b10: begin
				sel_temp <= 8'b11111011;
				data_temp <= segdata2;
			end
			2'b11: begin
				sel_temp <= 8'b11110111;
				data_temp <= segdata3;
			end
			default: begin
				segcounter <= 0;
			end
		endcase
		$write("segdisplay::segcounter %d\n", segcounter);
	end
	
	assign sel = sel_temp;
	assign data = data_temp;
	assign led0 = ~reset;
	
	initial begin
		segcounter = 2'b0;
		memory = 16'b0;
		sel_temp = 8'b0;
		data_temp = 8'b0;
	end

endmodule

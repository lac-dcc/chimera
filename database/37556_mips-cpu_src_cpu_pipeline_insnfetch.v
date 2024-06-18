// This program was cloned from: https://github.com/sxtyzhangzk/mips-cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/18 20:13:08
// Design Name: 
// Module Name: pipeline_insnfetch
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pipeline_insnfetch(
	input CLK,
	input RST,
	
	output read_flag,
	output [31:0] addr,
	//output [2:0] length,
	input [31:0] read_data,
	input busy,
	input done,
	
	input next_insn_enabled,
	input [31:0] next_insn,
	input busy_in,
	
	output reg [31:0] insn,
	output reg [31:0] insnPC,
	output reg placeholder_insn
    );
	
	reg [31:0] PC;
	wire [31:0] nextPC;
	
	assign nextPC = next_insn_enabled ? next_insn : PC + 4;
	assign addr = nextPC;//done ? nextPC : PC;
	assign read_flag = !busy_in && !busy;
	//assign length = 4;
	
	always @(posedge CLK or posedge RST) begin
		if(RST) begin
			PC <= -32'd4;
		end else if(!busy_in && !busy) begin
			PC <= nextPC;
		end
	end
	
	always @(*) begin
		if(!busy) begin
			insn = read_data;
			insnPC = PC;
			placeholder_insn = 0;
		end else begin
			insn = 0;
			insnPC = 0;
			placeholder_insn = 1;
		end
	end
	
	/*always @(posedge CLK or posedge RST) begin
		if(RST) begin
			PC <= 0;
		end else if(done) begin
			PC <= nextPC;
		end
	end
	
	always @(*) begin
		if(!busy) begin
			insn = read_data;
			insnPC = PC;
			placeholder_insn = 0;
		end else begin
			insn = 0;
			insnPC = 0;
			placeholder_insn = 1;
		end
	end*/
	
	/*always @(negedge CLK or posedge RST) begin
		if(RST) begin
			insn <= 0;
			insnPC <= 0;
			placeholder_insn <= 0;
		end else begin
			if(done) begin
				insn <= read_data;
				insnPC <= PC;
				placeholder_insn <= 0;
			end else begin
				insn <= 0;
				insnPC <= 0;
				placeholder_insn <= 1;
			end
		end
	end*/
endmodule

// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _hcpu_h_
`define _hcpu_h_

`include "../combinational-logic/hALU.v"
`include "../sequential-logic/hPC.v"

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:21:19 08/16/2023 
// Design Name: 
// Module Name:    hCPU 
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
module hJmpCheck(
	input [15:0] reg_a_next,
	input [15:0] pc_in,
	input zr,
	input ng,
	input msb,
	input [2:0] jump,
	output [15:0] pc_out,
	output pc_load,
	output pc_inc
	);
	
	reg enable_load_pc, enable_inc_pc;
	reg [15:0] pc_next;
	
	always @* begin 
		pc_next = pc_in;
		enable_load_pc = 1'b0;
		enable_inc_pc = 1'b1;
		
		if (msb == 1'b1) begin 
			case (jump)
			3'b001: 
				begin
					if (zr == 1'b0 && ng == 1'b0) begin
						pc_next = reg_a_next;
						enable_load_pc = 1'b1;
						enable_inc_pc = 1'b0;
					end
				end
			3'b010:
				begin
					if (zr == 1'b1 && ng == 1'b0) begin
						pc_next = reg_a_next;
						enable_load_pc = 1'b1;
						enable_inc_pc = 1'b0;
					end
				end
			3'b011:
				begin
					if (ng == 1'b0) begin
						pc_next = reg_a_next;
						enable_load_pc = 1'b1;
						enable_inc_pc = 1'b0;
					end
				end
			3'b100:
				begin
					if (zr == 1'b0 && ng == 1'b1) begin
						pc_next = reg_a_next;
						enable_load_pc = 1'b1;
						enable_inc_pc = 1'b0;
					end
				end
			3'b101:
				begin
					if (zr == 1'b0) begin
						pc_next = reg_a_next;
						enable_load_pc = 1'b1;
						enable_inc_pc = 1'b0;
					end
				end
			3'b110:
				begin
					if (ng == 1'b1 || zr == 1'b1) begin
						pc_next = reg_a_next;
						enable_load_pc = 1'b1;
						enable_inc_pc = 1'b0;
					end
				end
			3'b111:
				begin
					pc_next = reg_a_next;
					enable_load_pc = 1'b1;
					enable_inc_pc = 1'b0;
				end
			endcase
		end
	end
	
	assign pc_out = pc_next;
	assign pc_load = enable_load_pc;
	assign pc_inc = enable_inc_pc;
endmodule

module hCPU(
    input [15:0] inM,
    input [15:0] instruction,
    input reset,
	 input clock,
    output [15:0] outM,
    output writeM,
    output [15:0] addressM,
    output [15:0] pc
    );
	 
	 wire msb;
	 wire a; // c-instruction a bit
	 wire [5:0] comp; // c-instruction comp part;
	 wire [2:0] dest; // c-instruction dest part;
	 wire [2:0] jump; // c-instruction jump part;
	 reg [15:0] reg_a, reg_d;
	 wire [15:0] reg_a_next, reg_d_next;
	 wire [15:0] pc_next, to_hpc;
	 wire enable_load_pc, enable_inc_pc;
	 
	 assign msb = instruction[15];
	 assign a = instruction[12];
	 assign comp = instruction[11:6];
	 assign dest = instruction[5:3];
	 assign jump = instruction[2:0];
	 
	 // for alu
	 wire [15:0] x, y, alu_out;
	 wire zx, nx, zy, ny, f, no;
	 wire zr, ng;
	 
	 assign x = reg_d_next;
	 assign y = a == 0 ? reg_a_next : inM;
		
	 assign zx = comp[5];
	 assign nx = comp[4];
	 assign zy = comp[3];
	 assign ny = comp[2];
	 assign f = comp[1];
	 assign no = comp[0];
	 
	 hALU halu(.x(x), .y(y), .zx(zx), .nx(nx), .zy(zy), .ny(ny), .f(f), .no(no), .out(alu_out), .zr(zr), .ng(ng));
	 
	 hJmpCheck h_jmp_check(.reg_a_next(reg_a_next), .pc_in(pc_next), .zr(zr), .ng(ng), .msb(msb),.jump(jump), .pc_out(to_hpc), .pc_load(enable_load_pc), .pc_inc(enable_inc_pc));
	
	 always @(posedge clock) begin
		$write("hCPU::instruction %x;reset %x;pc_next %x\n", instruction, reset, pc_next);
	 
		if (msb == 0) begin
			reg_a <= instruction[14:0];
			reg_d <= reg_d_next;
		end else begin
			if (dest[2] == 1'b1) begin
				reg_a <= alu_out;
			end else begin
				reg_a <= reg_a_next;
			end
			
			if (dest[1] == 1'b1) begin
				reg_d <= alu_out;
			end else begin
				reg_d <= reg_d_next;
			end
		end
	 end
	 assign reg_a_next = reg_a;
	 assign reg_d_next = reg_d;
	 
	 hPC hpc(.in(to_hpc), .load(enable_load_pc), .inc(enable_inc_pc), .reset(reset), .clock(clock), .out(pc_next));
	 	 
	 assign pc = pc_next;
	 assign outM = (dest[0] == 1'b1) ? alu_out : 16'b0;
	 assign writeM = (dest[0] == 1'b1) ? 1'b1 : 1'b0;
	 assign addressM = reg_a_next;
endmodule

`endif


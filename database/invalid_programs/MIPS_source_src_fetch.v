`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:41:57 12/29/2016 
// Design Name: 
// Module Name:    pc 
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
`include "macros.v"
module fetch(
input wire							clk,
input wire							rst,
input wire [31:0]                   instruction,
input wire [31:0]                   pc_branch,
input wire [31:0]                   pc_jump,
input wire [31:0]                   pc_next,
input wire                          real_token,
input wire                          jump_token,
input wire                          isHazard,
input wire                          isFlush,
input wire                          isCacheStall,
output reg [31:0]                   reg_pc,
output reg [31:0]                   reg_instruction,
/* the BHT interface */
output reg [1:0]                    reg_bht_token,
input wire [9:0]                    bht_write_addr,
input wire                          bht_we,
input wire [33:0]                   bht_din
    );

	wire [31:0]                pc_inc;
	wire [31:0]                pc;
	wire                       pre_jump_flag;
	wire                       jump_j_flag;
	wire                       jump_jal_flag;
	wire                       jump_jr_flag;
	/* the BHT related signals */
    wire                        if_branch_flag;
		
	/* pre-decode the jump flag for J/JAL */
	assign jump_j_flag = (instruction[31:26] == `OPCODE_J_JUMP) ? 1'b1 : 1'b0;
	assign jump_jal_flag = (instruction[31:26] == `OPCODE_JAL_JUMP) ? 1'b1 : 1'b0;
	assign jump_jr_flag = (instruction[31:26] == `OPCODE_R && instruction[5:0] == `R_FUNC_JR) ? 1'b1 : 1'b0;
	/* set the pre-jump signal */
    assign pre_jump_flag = (jump_j_flag | jump_jal_flag) | jump_jr_flag;
    /* check the branch and jump instruction at the FETCH stage */
    assign if_branch_flag = (instruction[31:26] == `OPCODE_I_BEQ) | (instruction[31:26] == `OPCODE_I_BNE) | pre_jump_flag;
	
	/* calculate the output PC */
	assign pc_inc = reg_pc + 3'd4;
	assign pc = BRANCH_RES(isFlush, jump_token, real_token, pc_branch, pc_jump, pc_next, pc_inc);
	function [31:0] BRANCH_RES;
		input         isFlush;
		input         jump_token;
		input         real_token;
		input [31:0]  pc_branch;
		input [31:0]  pc_jump;
		input [31:0]  pc_next;
		input [31:0]  pc_inc;
		begin
		  if( isFlush )
		  begin
		      if( real_token )
		          BRANCH_RES = pc_branch;
		      else if( jump_token )
		          BRANCH_RES = pc_jump;
		      else
		          BRANCH_RES = pc_next;
		  end
		  else
		      BRANCH_RES = pc_inc;
		end
	endfunction
	
	
	wire [9:0]     bht_read_addr;
	wire [33:0]    bht_dout;
	wire [1:0]     bht_predict_isBranch;
	wire [31:0]    bht_predict_pc;
	
	/* bht read port */
	assign bht_read_addr = reg_pc[11:2];
	assign bht_predict_isBranch = bht_dout[33:32];
	assign bht_predict_pc = bht_dout[31:0];
	/* instantiate of the BHT */
	bht bht_inst(
	   .a( bht_write_addr ),
	   .d( bht_din ),
	   .dpra( bht_read_addr ),
	   .clk( clk ),
	   .we( bht_we ),
	   .dpo( bht_dout )
	);
	
	/* deal with other ocasions */
	always@(posedge clk)
	begin
		if( rst )
		  begin
			reg_pc <= 0;
			reg_instruction <= 0;
			reg_bht_token <= 0;
		  end
		else
			begin
				/* set the instruction as NOP when found the FLUSH signal */
                if( isFlush )
                 begin
                    reg_pc <= pc;
                    reg_instruction <= `NOP;
                    reg_bht_token <= 0;
                 end
                 /* stall when found the Hazard signal */
			    else if( isHazard || isCacheStall )
			     begin
			        reg_pc <= reg_pc;
                    reg_instruction <= reg_instruction;
                    reg_bht_token <= reg_bht_token;
				 end
				 /* the branch predict */
				 else if( if_branch_flag && bht_predict_isBranch[1] )
				 begin
				    reg_pc <= bht_predict_pc;
				    reg_instruction <= instruction;
				    reg_bht_token <= bht_predict_isBranch;
				 end
				else
				 begin
				    reg_pc <= pc;
				    reg_instruction <= instruction;
				    reg_bht_token <= bht_predict_isBranch;;
				 end   
			end
	end

endmodule

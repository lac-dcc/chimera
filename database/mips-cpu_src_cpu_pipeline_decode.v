// This program was cloned from: https://github.com/sxtyzhangzk/mips-cpu
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/18 20:31:47
// Design Name: 
// Module Name: pipeline_decode
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

`include "opcode.h"

module pipeline_decode(
	input CLK,
	input RST,
	
	input [31:0] 		prev_insn,
	input [31:0] 		prev_insnPC,
	input 				prev_placeholder_insn,	//indicates that current instruction is a placeholder(NOP) and prev_next_insn should not be changed 
	output reg 			prev_next_insn_enabled,
	output reg [31:0] 	prev_next_insn,
	output 				prev_busy,
	
	input 								next_busy,
	output reg [31:0] 					next_insnPC,	//may be useful when handle exceptions
	output reg [2:0]					next_insn_id,	//may be useful when forward data
	output reg [`ALU_OPCODE_WIDTH-1:0]	alu_opcode,
	output reg [31:0]					alu_src1,
	output reg 							alu_src1_forward,		//1 for forward from ALU, 2 for forward from MEM
	output reg [2:0]					alu_src1_forward_from,
	output reg [31:0]					alu_src2,
	output reg 							alu_src2_forward,
	output reg [2:0]					alu_src2_forward_from,
	output reg [`MEM_OPCODE_WIDTH-1:0]	mem_opcode,
	output reg [31:0]					mem_src2,
	output reg 							mem_src2_forward,
	output reg [2:0]					mem_src2_forward_from,
	
	input [2:0]		writeback_insn_id,
	input [31:0] 	writeback_data,
	
	input [2:0]		alu_forward_insn_id,
	input [31:0]	alu_forward_data
    );
    
    localparam OPCD_SPECIAL 	= 6'h00;
    localparam OPCD_REGIMM		= 6'h01;
    localparam OPCD_BEQ			= 6'h04;
    localparam OPCD_BNE			= 6'h05;
    localparam OPCD_POP06		= 6'h06;
    localparam OPCD_POP07		= 6'h07;
    //localparam OPCD_ADDI		= 6'h08;
	localparam OPCD_POP10		= 6'h08;
    localparam OPCD_ADDIU		= 6'h09;
    localparam OPCD_SLTI		= 6'h0A;
    localparam OPCD_SLTIU		= 6'h0B;
    localparam OPCD_ANDI		= 6'h0C;
    localparam OPCD_ORI			= 6'h0D;
    localparam OPCD_XORI		= 6'h0E;
    localparam OPCD_AUI			= 6'h0F;
	localparam OPCD_POP26		= 6'h16;
	localparam OPCD_POP27		= 6'h17;
	localparam OPCD_POP30		= 6'h18;
    localparam OPCD_LB			= 6'h20;
    localparam OPCD_LH			= 6'h21;
    localparam OPCD_LW			= 6'h23;
    localparam OPCD_LBU			= 6'h24;
    localparam OPCD_LHU			= 6'h25;
    localparam OPCD_SB			= 6'h28;
    localparam OPCD_SH			= 6'h29;
	localparam OPCD_SW			= 6'h2B;
    localparam OPCD_LWC1		= 6'h31;
    localparam OPCD_SWC1		= 6'h39;
    localparam OPCD_J			= 6'h02;
    localparam OPCD_JAL			= 6'h03;
    localparam OPCD_BC			= 6'h32;
	localparam OPCD_POP66		= 6'h36;
    localparam OPCD_BALC		= 6'h3A;
	localparam OPCD_POP76		= 6'h3E;
    
    localparam OPFUNC_SLL		= 6'h00;
    localparam OPFUNC_SRL		= 6'h02;
    localparam OPFUNC_SRA		= 6'h03;
    localparam OPFUNC_SLLV		= 6'h04;
    localparam OPFUNC_SRLV		= 6'h06;
    localparam OPFUNC_SRAV		= 6'h07;
    localparam OPFUNC_JR		= 6'h08;
    localparam OPFUNC_JALR		= 6'h09;
    localparam OPFUNC_SYSCALL	= 6'h0C;
    localparam OPFUNC_BREAK		= 6'h0D;
    localparam OPFUNC_SOP30		= 6'h18;	//mul muh
    localparam OPFUNC_SOP31		= 6'h19;	//mulu mulu
    localparam OPFUNC_SOP32		= 6'h1A;	//div mod
    localparam OPFUNC_SOP33		= 6'h1B;	//divu modu
    localparam OPFUNC_ADD		= 6'h20;
    localparam OPFUNC_ADDU		= 6'h21;
    localparam OPFUNC_SUB		= 6'h22;
    localparam OPFUNC_SUBU		= 6'h23;
    localparam OPFUNC_AND		= 6'h24;
    localparam OPFUNC_OR		= 6'h25;
    localparam OPFUNC_XOR		= 6'h26;
    localparam OPFUNC_NOR		= 6'h27;
    localparam OPFUNC_SLT		= 6'h2A;
    localparam OPFUNC_SLTU		= 6'h2B;
    
    
    
    reg [31:0] 	insn;
    reg [31:0]	insnPC;
    reg [2:0] 	insn_id;				//insn_id[2] must be 0
    reg [4:0]	insn_write_reg[7:0];	//register to which the instruction write back 
	//reg [1:0]	insn_data_stage[7:0];
	reg			insn_data_overrided[7:0];
	
    reg [31:0] 	reg_file[31:1];
	wire [31:0]	GPR[31:0];
	
    reg 		reg_lock[31:0];
    reg [2:0]	reg_lock_by[31:0];	//the id of last instruction that locks the register
	//reg [1:0]	reg_data_stage[31:0];	//[0] for can be forwarded from MEMORY, [1] for can be forwardedd from ALU
	//reg 		reg_readable[31:0];
	reg [4:0]	next_insn_write_reg;
	//reg [1:0]	next_insn_data_stage;
	
	reg [4:0] next_insn_write_reg_pending;
	//reg [1:0] next_insn_data_stage_pending;
    
	genvar j;
	generate 
		for(j=1; j<32; j=j+1)
			assign GPR[j] = reg_file[j];
	endgenerate
	assign GPR[0] = 0;
    
    
	
    reg busy;
    assign prev_busy = busy || next_busy;
	
	wire writeback_flag = /*insn_data_stage[writeback_insn_id][0] &*/ !insn_data_overrided[writeback_insn_id];
	wire alu_forward_flag = /*insn_data_stage[alu_forward_insn_id][1] &*/ !insn_data_overrided[alu_forward_insn_id];
	
	wire [4:0] writeback_reg = insn_write_reg[writeback_insn_id];
		//writeback_flag ?  : 0;
	wire [4:0] alu_forward_reg = insn_write_reg[alu_forward_insn_id];
		//alu_forward_flag ?  : 0;
	
    integer i;
	/*always @(posedge CLK or posedge RST) begin
		if(RST) begin
			
		end else begin
			
		end
	end*/
	
	task write_register;
		input [4:0] regid;
		//input [1:0] stage;
		begin
			//if(regid != 0) begin
				//next_insn_data_stage_pending <= stage;
				next_insn_write_reg_pending <= regid;
			//end
		end
	endtask
	
	reg drop_next_insn;
	
	localparam NEVER 		= 0;
	localparam ALWAYS 		= 1;
	localparam RS_EQ_RT 	= 2;
	localparam RS_NE_RT		= 3;
	localparam RS_GTU_RT	= 4;
	localparam RS_LTU_RT	= 5;
	localparam RS_GEU_RT	= 6;
	localparam RS_LEU_RT	= 7;
	localparam RS_GT_RT		= 8;
	localparam RS_LT_RT		= 9;
	localparam RS_GE_RT		= 10;
	localparam RS_LE_RT		= 11;
	localparam RS_EQ_ZERO	= 12;
	localparam RS_NE_ZERO	= 13;
	localparam RS_GT_ZERO	= 14;
	localparam RS_LT_ZERO	= 15;
	localparam RS_GE_ZERO	= 16;
	localparam RS_LE_ZERO	= 17;
	localparam RT_EQ_ZERO	= 18;
	localparam RT_NE_ZERO	= 19;
	localparam RT_GT_ZERO	= 20;
	localparam RT_LT_ZERO	= 21;
	localparam RT_GE_ZERO	= 22;
	localparam RT_LE_ZERO	= 23;
	
	reg [23:0] jump_cond;
	reg [6:0] jump_cond_basic;
	reg [4:0] 	jump_cond_id;
	
	localparam JUMP_J = 0;
	localparam JUMP_BC = 1;
	localparam JUMP_BALC = 2;
	localparam JUMP_BC_LONG = 4;
	localparam JUMP_J_LONG = 8;
	localparam JUMP_BC_VERY_LONG = 16;
	localparam JUMP_GPR_RS = 32;
	reg	[5:0]	jump_type;
	
	reg [3:0] POP_insn_type;	//8 for register busy
	reg [31:0] Branch_target;
	reg [31:0] BC_target;
	reg [31:0] BC_long_target;		//21 bit addr
	reg [31:0] J_target;			//26 bit addr
	reg [31:0] BC_very_long_target;	//26 bit addr
	
	//reg [5:0] tmp_opcode;
	//reg [4:0] tmp_rs, tmp_rt;
	//reg [15:0] tmp_imm;
	//reg [31:0] tmp_PC;
	reg [31:0] GPR_rs, GPR_rt;
	reg 		rs_lock, rt_lock;
	reg [2:0] rs_lock_by, rt_lock_by;
	//reg [1:0] rs_data_stage, rt_data_stage;
	
	/*always @(posedge CLK or posedge RST)  begin
		if(RST) begin
			busy <= 0;
		end else begin
			if(!prev_busy) begin
				tmp_opcode = prev_insn[31:26];
				tmp_rs = prev_insn[25:21];
				tmp_rt = prev_insn[20:16];
				tmp_imm = prev_insn[15:0];
				tmp_PC = prev_insnPC;
			end else begin
				tmp_opcode = insn[31:26];
				tmp_rs = insn[25:21];
				tmp_rt = insn[20:16];
				tmp_imm = insn[15:0];
				tmp_PC = insnPC;
			end
			
			Branch_target = tmp_PC + {{14{tmp_imm[15]}}, tmp_imm, 2'b00};
			BC_target = tmp_PC + 4 + {{14{tmp_imm[15]}}, tmp_imm, 2'b00};
			BC_long_target = tmp_PC + 4 + {{9{tmp_rt[5]}}, tmp_rt, tmp_imm, 2'b00};
			J_target = {tmp_PC[31:28], tmp_rs, tmp_rt, tmp_imm, 2'b00};
			BC_very_long_target = tmp_PC + 4 + {{4{tmp_rs[4]}}, tmp_rs, tmp_rt, tmp_imm, 2'b00};
			
			if(tmp_rs == 0) begin
				GPR_rs = 0;
				rs_lock = 0;
			end else if(tmp_rs == writeback_reg) begin
				GPR_rs = writeback_data;
				rs_lock = 0;
			end else if(tmp_rs == alu_forward_reg) begin
				GPR_rs = alu_forward_data;
				rs_lock = 0;
			end else begin
				GPR_rs = reg_file[tmp_rs];
				rs_lock = reg_lock[tmp_rs];
			end
			
			if(tmp_rt == 0) begin
				GPR_rt = 0;
				rt_lock = 0;
			end else if(tmp_rt == writeback_reg) begin
				GPR_rt = writeback_data;
				rt_lock = 0;
			end else if(tmp_rt == alu_forward_reg) begin
				GPR_rt = alu_forward_data;
				rt_lock = 0;
			end else begin
				GPR_rt = reg_file[tmp_rt];
				rt_lock = reg_lock[tmp_rt];
			end
			
			if(tmp_rt == 0)
				POP_insn_type = rs_lock ? 8 : 0;
			else if(tmp_rs == 0)
				POP_insn_type = rt_lock ? 8 : 1;
			else if(tmp_rs == tmp_rt)
				POP_insn_type = rt_lock ? 8 : 2;
			else
				POP_insn_type = rs_lock || rt_lock ? 8 : 4;
			
			jump_cond[0] = 0;
			jump_cond[1] = 1;
			jump_cond[2] = GPR_rs == GPR_rt;
			jump_cond[3] = GPR_rs != GPR_rt;
			jump_cond[4] = GPR_rs > GPR_rt;
			jump_cond[5] = GPR_rs < GPR_rt;
			jump_cond[6] = GPR_rs >= GPR_rt;
			jump_cond[7] = GPR_rs <= GPR_rt;
			jump_cond[8] = $signed(GPR_rs) > $signed(GPR_rt);
			jump_cond[9] = $signed(GPR_rs) < $signed(GPR_rt);
			jump_cond[10] = $signed(GPR_rs) >= $signed(GPR_rt);
			jump_cond[11] = $signed(GPR_rs) <= $signed(GPR_rt);
			jump_cond[12] = GPR_rs == 0;
			jump_cond[13] = GPR_rs != 0;
			jump_cond[14] = $signed(GPR_rs) > 0;
			jump_cond[15] = $signed(GPR_rs) < 0;
			jump_cond[16] = $signed(GPR_rs) >= 0;
			jump_cond[17] = $signed(GPR_rs) <= 0;
			jump_cond[18] = GPR_rt == 0;
			jump_cond[19] = GPR_rt != 0;
			jump_cond[20] = $signed(GPR_rt) > 0;
			jump_cond[21] = $signed(GPR_rt) < 0;
			jump_cond[22] = $signed(GPR_rt) >= 0;
			jump_cond[23] = $signed(GPR_rt) <= 0;
			
			busy <= 0;
			if(tmp_opcode == OPCD_SPECIAL) begin
				if(tmp_imm[5:0] == OPFUNC_JR || tmp_imm[5:0] == OPFUNC_JALR)
					if(rs_lock)
						busy <= 1;
			end else if(tmp_opcode == OPCD_REGIMM) begin
				if(rs_lock)
					busy <= 1;
			end else if(tmp_opcode == OPCD_BEQ || tmp_opcode == OPCD_BNE) begin
				if(rs_lock || rt_lock)
					busy <= 1;
			end else if(POP_insn_type[3]) begin//POP_insn_type == 8
				busy <= 1;
			end
		end
	end
	*/
	
	reg [5:0] opcode;
    reg [4:0] rs, rt, rd, sa;
    reg [5:0] opfunc;
    reg [15:0] imm;
    reg [25:0] j_addr;
	
	task fetch_rs;	//rs -> src1
		begin
			alu_src1 <= GPR_rs;
			alu_src1_forward <= rs_lock;
			alu_src1_forward_from <= rs_lock_by;
		end
	endtask
	
	task fetch_rt;
		begin
			alu_src2 <= GPR_rt;
			alu_src2_forward <= rt_lock;
			alu_src2_forward_from <= rt_lock_by;
		end
	endtask
	
	task decode_rtype;		//dst reg = src1 reg OP src2 reg
		input [4:0] dst;
		input use_src1;		//src1 -- rs
		input use_src2;		//src2 -- rt
		input [`ALU_OPCODE_WIDTH-1:0] alu_op;
		input [`MEM_OPCODE_WIDTH-1:0] mem_op;
		
		begin
			if(use_src1) begin
				fetch_rs();
			end
			if(use_src2) begin
				fetch_rt();
			end
			alu_opcode <= alu_op;
			mem_opcode <= mem_op;
			write_register(dst);
		end
	endtask
	
	task decode_itype;
		input [4:0] 	dst;
		input 			use_src1;
		input			sign_extend;
		//input [15:0] 	imm2;
		input [`ALU_OPCODE_WIDTH-1:0] alu_op;
		input [`MEM_OPCODE_WIDTH-1:0] mem_op;
		
		begin
			if(use_src1) begin
				fetch_rs();
			end
			//fetch_register(src1, alu_src1, alu_src1_forward, alu_src1_forward_from);
			if(sign_extend)
				alu_src2 <= {{16{imm[15]}}, imm};	//sign extended
			else
				alu_src2 <= {16'b0, imm};			//zero extended
			alu_opcode <= alu_op;
			mem_opcode <= mem_op;
			write_register(dst);
		end
	endtask
	
	reg tmp_busy;
	
	reg [31:0] tmp_GPR_rs, tmp_GPR_rt;
	reg clear_next_insn;
	
	reg [31:0] last_next_insn;
	reg last_next_insn_enabled;
	reg last_drop_next_insn;
	
	reg [31:0]	insnPC_add_4;
	
	always @(posedge CLK or posedge RST) begin
		if(RST) begin
			insn <= 0;
			insnPC <= 0;
			reg_lock[0] <= 0;
			//reg_data_stage[0] <= 0;
			reg_lock_by[0] <= 0;
			for(i=1; i<32; i=i+1) begin
				reg_file[i] <= 0;
				reg_lock[i] <= 0;
				reg_lock_by[i] <= 0;
				//reg_data_stage[i] <= 0;
			end
			for(i=0; i<8; i=i+1) begin
				//insn_data_stage[i] <= 0;
				insn_data_overrided[i] <= 1;
				insn_write_reg[i] <= 0;
			end
			
			//prev_next_insn <= 0;
			//prev_next_insn_enabled <= 0;
			next_insnPC <= 0;
			alu_opcode <= 0;
			alu_src1 <= 0;
			alu_src2 <= 0;
			alu_src1_forward <= 0;
			alu_src1_forward_from <= 0;
			alu_src2_forward <= 0;
			alu_src2_forward_from <= 0;
			mem_opcode <= 0;
			mem_src2 <= 0;
			mem_src2_forward <= 0;
			mem_src2_forward_from <= 0;
			insn_id <= 0;
			next_insn_id <= 0;
			//next_insn_write_reg <= 0;
			//next_insn_data_stage <= 0;
			//drop_next_insn <= 0;
			//next_insn_data_stage_pending <= 0;
			next_insn_write_reg_pending <= 0;
			
			//tmp_GPR_rs <= 0;
			//tmp_GPR_rt <= 0;
			last_next_insn <= 0;
			last_next_insn_enabled <= 0;
			last_drop_next_insn <= 0;
			
			clear_next_insn <= 1;
		end else begin
			if(writeback_flag) begin
				if(writeback_reg == 0)
					$display("Assertion Failed: Writeback_reg == 0");
				reg_file[writeback_reg] <= writeback_data;
				reg_lock[writeback_reg] <= 0;
				//reg_data_stage[writeback_reg] <= 0;
				//insn_data_stage[writeback_insn_id] <= 0;
			end
			if(alu_forward_flag) begin
				if(alu_forward_reg == 0)
					$display("Assertion Failed: ALU_forward_reg == 0");
					
				reg_file[alu_forward_reg] <= alu_forward_data;
				reg_lock[alu_forward_reg] <= 0;
				//reg_data_stage[alu_forward_reg] <= 0;
				//insn_data_stage[alu_forward_insn_id] <= 0;
			end

			if(!prev_busy) begin
				insn	= prev_insn;
				insnPC	= prev_insnPC;
				
				if(next_insn_write_reg != 0) begin
					insn_write_reg[next_insn_id]			<= next_insn_write_reg;
					//insn_data_stage[next_insn_id]			<= next_insn_data_stage;
					insn_data_overrided[next_insn_id]		<= 0;
					reg_lock[next_insn_write_reg]			<= 1;
					//reg_data_stage[next_insn_write_reg]		<= next_insn_data_stage;
					if(reg_lock[next_insn_write_reg])
						insn_data_overrided[reg_lock_by[next_insn_write_reg]] <= 1;
					reg_lock_by[next_insn_write_reg]		<= next_insn_id;
				end else begin
					insn_write_reg[next_insn_id]	<= 0;
					insn_data_overrided[next_insn_id] <= 1;
					//insn_data_stage[next_insn_id]	<= 0;
				end
			end
			
			opcode 	= insn[31:26];
			rs 		= insn[25:21];
			rt 		= insn[20:16];
			rd 		= insn[15:11];
			sa 		= insn[10:6];
			opfunc 	= insn[5:0];
			imm 	= insn[15:0];
			j_addr	= insn[25:0];
			
			
			
			
			case(1'b1)
			writeback_flag && rs == writeback_reg: begin
				GPR_rs = writeback_data;
				rs_lock = 0;
				rs_lock_by = 0;
				//rs_data_stage = 0;
			end
			
			alu_forward_flag && rs == alu_forward_reg: begin
				GPR_rs = alu_forward_data;
				rs_lock = 0;
				rs_lock_by = 0;
				//rs_data_stage = 0;
			end
			
			default: begin
				GPR_rs	= GPR[rs];
				rs_lock = reg_lock[rs];
				rs_lock_by = reg_lock_by[rs];
				//rs_data_stage = reg_data_stage[rs];
			end
			endcase
			
			case(1'b1)
			writeback_flag && rt == writeback_reg: begin
				GPR_rt = writeback_data;
				rt_lock = 0;
				rt_lock_by = 0;
				//rt_data_stage = 0;
			end
			
			alu_forward_flag && rt == alu_forward_reg: begin
				GPR_rt = alu_forward_data;
				rt_lock = 0;
				rt_lock_by = 0;
				//rt_data_stage = 0;
			end
			
			default: begin
				GPR_rt	= GPR[rt];	
				rt_lock = reg_lock[rt];
				rt_lock_by = reg_lock_by[rt];
				//rt_data_stage = reg_data_stage[rt];
			end
			endcase
			
			if(!prev_busy) begin
				if(next_insn_write_reg != 0 && rs == next_insn_write_reg) begin
					rs_lock = 1;
					//rs_data_stage = next_insn_data_stage;
					rs_lock_by = next_insn_id;
				end
				if(next_insn_write_reg != 0 && rt == next_insn_write_reg) begin
					rt_lock = 1;
					//rt_data_stage = next_insn_data_stage;
					rt_lock_by = next_insn_id;
				end
			end
			
			//tmp_GPR_rs <= GPR_rs;
			//tmp_GPR_rt <= GPR_rt;
			insnPC_add_4 = insnPC + 4;
			Branch_target <= insnPC_add_4 + {{14{imm[15]}}, imm, 2'b00};
			BC_target <= insnPC_add_4 + {{14{imm[15]}}, imm, 2'b00};
			BC_long_target <= insnPC_add_4 + {{9{rt[4]}}, rt, imm, 2'b00};
			J_target <= {insnPC_add_4[31:28], rs, rt, imm, 2'b00};
			BC_very_long_target <= insnPC_add_4 + {{4{rs[4]}}, rs, rt, imm, 2'b00};
			
			//jump_cond[0] <= 0;
			//jump_cond[1] <= 1;
			jump_cond_basic[0] <= GPR_rs == GPR_rt;
			//jump_cond[3] <= GPR_rs != GPR_rt;
			jump_cond_basic[1] <= GPR_rs > GPR_rt;
			//jump_cond[5] <= GPR_rs < GPR_rt;
			//jump_cond[6] <= GPR_rs >= GPR_rt;
			//jump_cond[7] <= GPR_rs <= GPR_rt;
			jump_cond_basic[2] <= $signed(GPR_rs) > $signed(GPR_rt);
			//jump_cond[9] <= $signed(GPR_rs) < $signed(GPR_rt);
			//jump_cond[10] <= $signed(GPR_rs) >= $signed(GPR_rt);
			//jump_cond[11] <= $signed(GPR_rs) <= $signed(GPR_rt);
			jump_cond_basic[3] <= GPR_rs == 0;
			//jump_cond[13] <= GPR_rs != 0;
			jump_cond_basic[4] <= $signed(GPR_rs) > 0;
			//jump_cond[15] <= $signed(GPR_rs) < 0;
			//jump_cond[16] <= $signed(GPR_rs) >= 0;
			//jump_cond[17] <= $signed(GPR_rs) <= 0;
			jump_cond_basic[5] <= GPR_rt == 0;
			//jump_cond[19] <= GPR_rt != 0;
			jump_cond_basic[6] <= $signed(GPR_rt) > 0;
			//jump_cond[21] <= $signed(GPR_rt) < 0;
			//jump_cond[22] <= $signed(GPR_rt) >= 0;
			//jump_cond[23] <= $signed(GPR_rt) <= 0;
					
			if(rt == 0)
				POP_insn_type = rs_lock ? 4'd8 : 4'd0;
			else if(rs == 0)
				POP_insn_type = rt_lock ? 4'd8 : 4'd1;
			else if(rs == rt)
				POP_insn_type = rt_lock ? 4'd8 : 4'd2;
			else
				POP_insn_type = rs_lock || rt_lock ? 4'd8 : 4'd4;
			
			tmp_busy = 0;
			case(opcode)
			OPCD_SPECIAL: begin
				if(opfunc == OPFUNC_JR || opfunc == OPFUNC_JALR)
					tmp_busy = rs_lock;
			end
			OPCD_REGIMM: 			tmp_busy = rs_lock;
			OPCD_BEQ, OPCD_BNE: 	tmp_busy = rs_lock || rt_lock;
			OPCD_POP06, OPCD_POP07, 
			OPCD_POP10, OPCD_POP26, 
			OPCD_POP27, OPCD_POP30, 
			OPCD_POP66, OPCD_POP76:	tmp_busy = POP_insn_type[3];
			endcase
			
			busy <= tmp_busy;
			
			jump_cond_id <= NEVER;
			jump_type <= JUMP_J;
			
			clear_next_insn <= 0;
			if(!prev_placeholder_insn) begin
				/*prev_next_insn <= 0;
				prev_next_insn_enabled <= 0;
				drop_next_insn <= 0;*/
				clear_next_insn <= 1;
			end
			if(!next_busy) begin
				if(insn_id == 3'b011)
					insn_id = 0;
				else
					insn_id = insn_id + 1;
			end
			next_insn_write_reg_pending <= 0;
			//next_insn_data_stage_pending <= 0;
			alu_opcode <= `ALU_NOP;
			alu_src1 <= 0;
			alu_src2 <= 0;
			alu_src1_forward <= 0;
			alu_src2_forward <= 0;
			alu_src1_forward_from <= 0;
			alu_src2_forward_from <= 0;
			mem_opcode <= `MEM_NOP;
			mem_src2 <= 0;
			mem_src2_forward <= 0;
			mem_src2_forward_from <= 0;
			next_insnPC <= insnPC;
			next_insn_id <= busy ? 3'b111 : insn_id;
			
			if(!drop_next_insn && !tmp_busy) begin
				case(opcode)
				OPCD_SPECIAL: begin
					
					case(opfunc)
					OPFUNC_ADD:		decode_rtype(rd, 1, 1, `ALU_ADD, `MEM_NOP);
					OPFUNC_ADDU:	decode_rtype(rd, 1, 1, `ALU_ADDU, `MEM_NOP);
					OPFUNC_SUB:		decode_rtype(rd, 1, 1, `ALU_SUB, `MEM_NOP);
					OPFUNC_SUBU:	decode_rtype(rd, 1, 1, `ALU_SUBU, `MEM_NOP);
					OPFUNC_SLLV:	decode_rtype(rd, 1, 1, `ALU_SLL, `MEM_NOP);
					OPFUNC_SRLV:	decode_rtype(rd, 1, 1, sa == 5'h01 ? `ALU_ROR : `ALU_SRL, `MEM_NOP);
					OPFUNC_SRAV:	decode_rtype(rd, 1, 1, `ALU_SRA, `MEM_NOP);
					OPFUNC_AND:		decode_rtype(rd, 1, 1, `ALU_AND, `MEM_NOP);
					OPFUNC_OR:		decode_rtype(rd, 1, 1, `ALU_OR, `MEM_NOP);
					OPFUNC_NOR:		decode_rtype(rd, 1, 1, `ALU_NOR, `MEM_NOP);
					OPFUNC_XOR:		decode_rtype(rd, 1, 1, `ALU_XOR, `MEM_NOP);
					OPFUNC_SLL: begin
						decode_rtype(rd, 0, 1, `ALU_SLL, `MEM_NOP);
						alu_src1 <= {27'b0, sa};
					end
					OPFUNC_SRL: begin
						decode_rtype(rd, 0, 1, rs == 5'h01 ? `ALU_ROR : `ALU_SRL, `MEM_NOP);
						alu_src1 <= {27'b0, sa};
					end
					OPFUNC_SRA: begin
						decode_rtype(rd, 0, 1, `ALU_SRA, `MEM_NOP);
						alu_src1 <= {27'b0, sa};
					end
					OPFUNC_SOP30: begin
						if(sa == 5'b00010)	//MUL
							decode_rtype(rd, 1, 1, `ALU_MULTL, `MEM_NOP);
						else if(sa == 5'b00011)
							decode_rtype(rd, 1, 1, `ALU_MULTH, `MEM_NOP);
						//TODO: Exception
					end
					OPFUNC_SOP31: begin
						if(sa == 5'b00010)
							decode_rtype(rd, 1, 1, `ALU_MULTLU, `MEM_NOP);
						else if(sa == 5'b00011)
							decode_rtype(rd, 1, 1, `ALU_MULTHU, `MEM_NOP);
						//TODO: Exception
					end
					OPFUNC_SOP32: begin
						if(sa == 5'b00010)
							decode_rtype(rd, 1, 1, `ALU_DIV, `MEM_NOP);
						else if(sa == 5'b00011)
							decode_rtype(rd, 1, 1, `ALU_MOD, `MEM_NOP);
						//TODO: Exception
					end
					OPFUNC_SOP33: begin
						if(sa == 5'b00010)
							decode_rtype(rd, 1, 1, `ALU_DIVU, `MEM_NOP);
						else if(sa == 5'b00011)
							decode_rtype(rd, 1, 1, `ALU_MODU, `MEM_NOP);
					end
					OPFUNC_JR: begin 
						/*if(rs_lock)
							busy <= 1;
						else*/ begin
							jump_cond_id <= ALWAYS;
							jump_type <= JUMP_GPR_RS;
						end
						//decode_jump_reg(rs);
					end
					OPFUNC_JALR: begin
						/*if(rs_lock)
							busy <= 1;
						else*/ begin
							jump_cond_id <= ALWAYS;
							jump_type <= JUMP_GPR_RS;
							//decode_jump_reg(rs);
							alu_src1 <= insnPC + 8;
							write_register(31);
						end
					end
					OPFUNC_SLT: 	decode_rtype(rd, 1, 1, `ALU_SLT, `MEM_NOP);
					OPFUNC_SLTU:	decode_rtype(rd, 1, 1, `ALU_SLTU, `MEM_NOP);
					default:;	//TODO: Exception
					endcase
				end
				
				//OPCD_ADDI:		decode_itype(rt, rs, imm, `ALU_ADD, `MEM_NOP);
				OPCD_ADDIU:		decode_itype(rt, 1, 1, `ALU_ADDU, `MEM_NOP);
				OPCD_ANDI:		decode_itype(rt, 1, 0, `ALU_AND, `MEM_NOP);
				OPCD_ORI:		decode_itype(rt, 1, 0, `ALU_OR, `MEM_NOP);
				OPCD_XORI:		decode_itype(rt, 1, 0, `ALU_XOR, `MEM_NOP);
				OPCD_BEQ: begin
					/*if(rs_lock || rt_lock)
						busy <= 1;
					else*/ begin
						//jump_cond_flag = COND_RS_RT;
						jump_cond_id <= RS_EQ_RT;
						jump_type <= JUMP_J;
					end
					//else if(CMP_rs_rt[0] /*get_register(rs) == get_register(rt)*/)
					//	jump_offset(imm);
				end
				OPCD_BNE: begin
					/*if(rs_lock || rt_lock)
						busy <= 1;
					else*/ begin
						//jump_cond_flag = COND_RS_RT;
						jump_cond_id <= RS_NE_RT;
						//jump_cond_neg = 1;
						jump_type <= JUMP_J;
					end
					//else if(!CMP_rs_rt[0] /*get_register(rs) != get_register(rt)*/)
					//	jump_offset(imm);
				end
				OPCD_J: begin
					//jump_target = {insnPC[31:28], j_addr, 2'b00};
					//jump_cond_flag = COND_ALWAYS;
					jump_cond_id <= ALWAYS;
					jump_type <= JUMP_J_LONG;
					//prev_next_insn <= {insnPC[31:28], j_addr, 2'b00};
					//prev_next_insn_enabled <= 1;
				end
				OPCD_JAL: begin
					//jump_target = {insnPC[31:28], j_addr, 2'b00};
					//jump_cond_flag = COND_ALWAYS;
					jump_cond_id <= ALWAYS;
					jump_type <= JUMP_J_LONG;
					//prev_next_insn <= {insnPC[31:28], j_addr, 2'b00};
					//prev_next_insn_enabled <= 1;
					alu_src1 <= insnPC + 8;
					write_register(31);
				end
				OPCD_BC: begin
					//jump_target = insnPC + 4 + {{4{j_addr[25]}}, j_addr, 2'b00};
					//jump_cond_flag = COND_ALWAYS;
					jump_cond_id <= ALWAYS;
					jump_type <= JUMP_BC_VERY_LONG;
					//prev_next_insn <= insnPC + 4 + {{4{j_addr[25]}}, j_addr, 2'b00};
					//prev_next_insn_enabled <= 1;
					//drop_next_insn <= 1;
				end
				OPCD_BALC: begin
					//jump_target = insnPC + 4 + {{4{j_addr[25]}}, j_addr, 2'b00};
					//jump_cond_flag = COND_ALWAYS;
					jump_cond_id <= ALWAYS;
					jump_type <= JUMP_BC_VERY_LONG;
					//prev_next_insn <= insnPC + 4 + {{4{j_addr[25]}}, j_addr, 2'b00};
					//prev_next_insn_enabled <= 1;
					//drop_next_insn <= 1;
					alu_src1 <= insnPC + 4;
					write_register(31);
				end
				OPCD_REGIMM: begin
					if(rt[0]/*rt == 5'b00001*/) begin	//BGEZ
						begin
							jump_cond_id <= RS_GE_ZERO;
							jump_type <= JUMP_J;
						end
					end else /*if(rt == 5'b00000)*/ begin	//BLTZ
						begin
							jump_cond_id <= RS_LT_ZERO;
							jump_type <= JUMP_J;
						end
					end
					//TODO: Exception
				end
				OPCD_POP06: begin	//BLEZ, BLEZALC, BGEZALC
					case(POP_insn_type)
					0: begin	//BLEZ
						//jump_cond_flag = COND_RS_ZERO;
						jump_cond_id <= RS_LE_ZERO;
						//jump_cond_neg = 1;
						jump_type <= JUMP_J;
						//else if(!CMP_rs_zero[1]/*$signed(get_register(rs)) <= 0*/)
						//	jump_offset(imm);
					end
					
					1: begin	//BLEZALC
						//jump_cond_flag = COND_RT_ZERO;
						jump_cond_id <= RT_LE_ZERO;
						//jump_cond_neg = 1;
						jump_type <= JUMP_BALC;
						alu_src1 <= insnPC + 4;
						//else if(!CMP_rt_zero[1]/*$signed(get_register(rt)) <= 0*/)
						//	branch_compact_offset_and_link(imm);
					end
					
					2: begin	//BGEZALC
						//jump_cond_flag = COND_RT_ZERO;
						jump_cond_id <= RT_GE_ZERO;
						//jump_cond_neg = 1;
						jump_type <= JUMP_BALC;
						alu_src1 <= insnPC + 4;
						//else if(!CMP_rt_zero[2]/*$signed(get_register(rt)) >= 0*/)
						//	branch_compact_offset_and_link(imm);
					end
					
					4: begin	//BGEUC
						//jump_cond_flag = COND_RS_RT;
						jump_cond_id <= RS_GEU_RT;
						//jump_cond_neg = 1;
						jump_type <= JUMP_BC;
						//else if(!CMP_rs_rt[2]/*get_register(rs) >= get_register(rt)*/)
						//	branch_compact_offset(imm);
					end
					
					//8: busy <= 1;
					endcase
				end
				OPCD_POP07: begin
					case(POP_insn_type)
					0: begin	//BGTZ
						//jump_cond_flag = COND_RS_ZERO;
						jump_cond_id <= RS_GT_ZERO;
						jump_type <= JUMP_J;
						//else if(CMP_rs_zero[1]/*$signed(get_register(rs)) > 0*/)
						//	jump_offset(imm);
					end 

					1: begin	//BGTZALC
						//jump_cond_flag = COND_RT_ZERO;
						jump_cond_id <= RT_GT_ZERO;
						jump_type <= JUMP_BALC;
						alu_src1 <= insnPC + 4;
						//else if(CMP_rt_zero[1]/*$signed(get_register(rt)) > 0*/)
						//	branch_compact_offset_and_link(imm);
					end 

					2: begin	//BLTZALC
						//jump_cond_flag = COND_RT_ZERO;
						jump_cond_id <= RT_LT_ZERO;
						jump_type <= JUMP_BALC;
						alu_src1 <= insnPC + 4;
						//else if(CMP_rt_zero[2]/*$signed(get_register(rt)) < 0*/)
						//	branch_compact_offset_and_link(imm);
					end 

					4: begin	//BLTUC
						//jump_cond_flag = COND_RS_RT;
						jump_cond_id <= RS_LTU_RT;
						jump_type <= JUMP_BC;
						//else if(CMP_rs_rt[2]/*get_register(rs) < get_register(rt)*/)
						//	branch_compact_offset(imm);
					end
					
					//8: busy <= 1;
					endcase
				end
				OPCD_POP10: begin
					case(POP_insn_type)
					1: begin	//BEQZALC
						//jump_cond_flag = COND_RT_ZERO;
						jump_cond_id <= RT_EQ_ZERO;
						jump_type <= JUMP_BALC;
						alu_src1 <= insnPC + 4;
						//else if(CMP_rt_zero[0]/*get_register(rt) == 0*/)
						//	branch_compact_offset_and_link(imm);
					end 
					
					4: begin	//BEQC
						//jump_cond_flag = COND_RS_RT;
						jump_cond_id <= RS_EQ_RT;
						jump_type <= JUMP_BC;
						//else if(CMP_rs_rt[0]/*get_register(rs) == get_register(rt)*/)
						//	branch_compact_offset(imm);
					end
					
					//8: busy <= 1;
					endcase
				end
				OPCD_POP30: begin
					case(POP_insn_type)
					1: begin	//BNEZALC
						//jump_cond_flag = COND_RT_ZERO;
						jump_cond_id <= RT_NE_ZERO;
						//jump_cond_neg = 1;
						jump_type <= JUMP_BALC;
						alu_src1 <= insnPC + 4;
						//else if(!CMP_rt_zero[0]/*get_register(rt) != 0*/)
						//	branch_compact_offset_and_link(imm);
					end 

					4: begin	//BNEC
						//jump_cond_flag = COND_RS_RT;
						jump_cond_id <= RS_NE_RT;
						//jump_cond_neg = 1;
						jump_type <= JUMP_BC;
						//else if(!CMP_rs_rt[0]/*get_register(rs) != get_register(rt)*/)
						//	branch_compact_offset(imm);
					end
					
					//8: busy <= 1;
					endcase
				end
				OPCD_POP26: begin
					case(POP_insn_type)
					1: begin	//BLEZC
						//jump_cond_flag = COND_RT_ZERO;
						jump_cond_id <= RT_LE_ZERO;
						//jump_cond_neg = 1;
						jump_type <= JUMP_BC;
						//else if(!CMP_rt_zero[1]/*$signed(get_register(rt)) <= 0*/)
						//	branch_compact_offset(imm);
					end 

					2: begin	//BGEZC
						//jump_cond_flag = COND_RT_ZERO;
						jump_cond_id <= RT_GE_ZERO;
						//jump_cond_neg = 1;
						jump_type <= JUMP_BC;
						//else if(!CMP_rt_zero[2]/*$signed(get_register(rt)) >= 0*/)
						//	branch_compact_offset(imm);
					end 

					4: begin	//BGEC
						//jump_cond_flag = COND_RS_RT;
						jump_cond_id <= RS_GE_RT;
						//jump_cond_neg = 1;
						jump_type <= JUMP_BC;
						//else if(!CMP_rs_rt[4]/*$signed(get_register(rs)) >= $signed(get_register(rt))*/)
						//	branch_compact_offset(imm);
					end
					
					//8: busy <= 1;
					endcase
				end
				OPCD_POP27: begin
					case(POP_insn_type)
					1: begin	//BGTZC
						//jump_cond_flag = COND_RT_ZERO;
						jump_cond_id <= RT_GT_ZERO;
						jump_type <= JUMP_BC;
						//else if(CMP_rt_zero[1]/*$signed(get_register(rt)) > 0*/)
						//	branch_compact_offset(imm);
					end 
					
					2: begin	//BLTZC
						//jump_cond_flag = COND_RT_ZERO;
						jump_cond_id <= RT_LT_ZERO;
						jump_type <= JUMP_BC;
						//else if(CMP_rt_zero[2]/*$signed(get_register(rt)) < 0*/)
						//	branch_compact_offset(imm);
					end 
					
					4: begin	//BLTC
						//jump_cond_flag = COND_RS_RT;
						jump_cond_id <= RS_LT_RT;
						jump_type <= JUMP_BC;
						//else if(CMP_rs_rt[4]/*$signed(get_register(rs)) < $signed(get_register(rt))*/)
						//	branch_compact_offset(imm);
					end
					
					//8: busy <= 1;
					endcase
				end
				OPCD_POP66: begin
					case(POP_insn_type)
					0: begin
						//jump_cond_flag = COND_RS_ZERO;
						jump_cond_id <= RS_EQ_ZERO;
						jump_type <= JUMP_BC_LONG;
					end
						//else if(CMP_rs_zero[0]/*get_register(rs) == 0*/) begin
							//prev_next_insn <= insnPC + 4 + {{9{insn[20]}}, insn[20:0], 2'b00};
						//	prev_next_insn <= BC_long_target;
						//	prev_next_insn_enabled <= 1;
						//	drop_next_insn <= 1;
						//end
					
					//8: busy <= 1;
					endcase
				end
				OPCD_POP76: begin
					case(POP_insn_type)
					0: begin
						//jump_cond_flag = COND_RS_ZERO;
						jump_cond_id <= RS_NE_ZERO;
						//jump_cond_neg = 1;
						jump_type <= JUMP_BC_LONG;
						//else if(!CMP_rs_zero[0]/*get_register(rs) != 0*/) begin
							//prev_next_insn <= insnPC + 4 + {{9{insn[20]}}, insn[20:0], 2'b00};
						//	prev_next_insn <= BC_long_target;
						//	prev_next_insn_enabled <= 1;
						//	drop_next_insn <= 1;
						//end
					end
					
					//8: busy <= 1;
					endcase
				end
				
				OPCD_SLTI: 		decode_itype(rt, 1, 1, `ALU_SLT, `MEM_NOP);
				OPCD_SLTIU:		decode_itype(rt, 1, 1, `ALU_SLTU, `MEM_NOP);
				OPCD_LB:		decode_itype(rt, 1, 1, `ALU_ADDU, `MEM_LB);
				OPCD_LBU:		decode_itype(rt, 1, 1, `ALU_ADDU, `MEM_LBU);
				OPCD_LH:		decode_itype(rt, 1, 1, `ALU_ADDU, `MEM_LH);
				OPCD_LHU:		decode_itype(rt, 1, 1, `ALU_ADDU, `MEM_LHU);
				OPCD_LW:		decode_itype(rt, 1, 1, `ALU_ADDU, `MEM_LW);
				OPCD_SB: begin
					decode_itype(0, 1, 1, `ALU_ADDU, `MEM_SB);
					mem_src2 <= GPR_rt;
					mem_src2_forward <= rt_lock;
					mem_src2_forward_from <= rt_lock_by;
					//fetch_register(rt, mem_src2, mem_src2_forward, mem_src2_forward_from);
				end
				OPCD_SH: begin
					decode_itype(0, 1, 1, `ALU_ADDU, `MEM_SH);
					mem_src2 <= GPR_rt;
					mem_src2_forward <= rt_lock;
					mem_src2_forward_from <= rt_lock_by;
					//fetch_register(rt, mem_src2, mem_src2_forward, mem_src2_forward_from);
				end
				OPCD_SW: begin
					decode_itype(0, 1, 1, `ALU_ADDU, `MEM_SW);
					mem_src2 <= GPR_rt;
					mem_src2_forward <= rt_lock;
					mem_src2_forward_from <= rt_lock_by;
					//fetch_register(rt, mem_src2, mem_src2_forward, mem_src2_forward_from);
				end
				OPCD_AUI: begin
					fetch_rs();
					//fetch_register(rs, alu_src1, alu_src1_forward, alu_src1_forward_from);
					alu_src2 <= {imm, 16'b0};
					alu_opcode <= `ALU_ADDU;
					write_register(rt);
				end
				
				default:;	//TODO: Exception
				endcase
			end
			
			last_next_insn <= prev_next_insn;
			last_next_insn_enabled <= prev_next_insn_enabled;
			last_drop_next_insn <= drop_next_insn;
		end
	end
	
	always @(*) begin
		prev_next_insn = last_next_insn;
		prev_next_insn_enabled = last_next_insn_enabled;
		drop_next_insn = last_drop_next_insn;
		if(clear_next_insn) begin
			prev_next_insn = 0;
			prev_next_insn_enabled = 0;
			drop_next_insn = 0;
		end
		
		//next_insn_data_stage = next_insn_data_stage_pending;
		next_insn_write_reg = next_insn_write_reg_pending;
		
		jump_cond[0] = 0;
		jump_cond[1] = 1;
		jump_cond[2] = jump_cond_basic[0];
		jump_cond[3] = !jump_cond_basic[0];
		jump_cond[4] = jump_cond_basic[1];
		jump_cond[5] = !(jump_cond_basic[0] || jump_cond_basic[1]);
		jump_cond[6] = jump_cond_basic[0] || jump_cond_basic[1];
		jump_cond[7] = !jump_cond_basic[1];
		jump_cond[8] = jump_cond_basic[2];
		jump_cond[9] = !(jump_cond_basic[0] || jump_cond_basic[2]);
		jump_cond[10] = jump_cond_basic[0] || jump_cond_basic[2];
		jump_cond[11] = !jump_cond_basic[2];
		jump_cond[12] = jump_cond_basic[3];
		jump_cond[13] = !jump_cond_basic[3];
		jump_cond[14] = jump_cond_basic[4];
		jump_cond[15] = !(jump_cond_basic[3] || jump_cond_basic[4]);
		jump_cond[16] = jump_cond_basic[3] || jump_cond_basic[4];
		jump_cond[17] = !jump_cond_basic[4];
		jump_cond[18] = jump_cond_basic[5];
		jump_cond[19] = !jump_cond_basic[5];
		jump_cond[20] = jump_cond_basic[6];
		jump_cond[21] = !(jump_cond_basic[5] || jump_cond_basic[6]);
		jump_cond[22] = jump_cond_basic[5] || jump_cond_basic[6];
		jump_cond[23] = !jump_cond_basic[6];
			
		if(jump_cond[jump_cond_id]) begin
			case(jump_type)
			JUMP_J: begin
				prev_next_insn = Branch_target;
				prev_next_insn_enabled = 1;
			end
			JUMP_BC: begin
				prev_next_insn = BC_target;
				prev_next_insn_enabled = 1;
				drop_next_insn = 1;
			end
			JUMP_BALC: begin
				prev_next_insn = BC_target;
				prev_next_insn_enabled = 1;
				drop_next_insn = 1;
				//alu_src1 <= insnPC + 4;
				//write_register(31, 1);
				//next_insn_data_stage = 1;
				next_insn_write_reg = 31;
			end
			JUMP_BC_LONG: begin
				prev_next_insn = BC_long_target;
				prev_next_insn_enabled = 1;
				drop_next_insn = 1;
			end
			JUMP_GPR_RS: begin
				prev_next_insn = GPR_rs;
				prev_next_insn_enabled = 1;
			end
			JUMP_J_LONG: begin
				prev_next_insn = J_target;
				prev_next_insn_enabled = 1;
			end
			JUMP_BC_VERY_LONG: begin
				prev_next_insn = BC_very_long_target;
				prev_next_insn_enabled = 1;
				drop_next_insn = 1;
			end
			default:;
			endcase
		end
	end
endmodule

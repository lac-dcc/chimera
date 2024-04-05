`include "riscv_defines.v"

/* 解码和寄存器读取 */
module kamikaze_decode( clk_i,
			rst_i,
			is_compressed_instr_i,
			instr_i,
			instr_valid_i,
			pc_i,
			
			rf_rs1_o,
			rf_rs2_o,
			
			rf_rs1_i,
			rf_rs2_i,
			
			rf_rd_o,
			rf_rd_we_o,
			
			decode_valid_o,
			
			alu_func_o,
			
			alu_op1_o,
			alu_op2_o,
			
			ex_we_i,
			ex_wd_i,
			ex_wdata_i,
			
			
			pc_o,
			pc_next_o
		
			);
	
	input clk_i;
	input rst_i;
	
	input is_compressed_instr_i;
	input [31:0] instr_i;
	input instr_valid_i;
	
	input [31:0] pc_i; /*虽然没什么卵用*/
	input [31:0] pc_next_i; /*下一个pc，分支预测是否正确*/
	
	/* 寄存器地址输出 */
	output reg [4:0] rf_rs1_o;
	output reg [4:0] rf_rs2_o;
	
	/* 寄存器数据输入 */
	input [31:0] rf_rs1_i;
	input [31:0] rf_rs2_i;
	
	/* ALU 输出 */
	output reg [31:0] alu_op1_o;
	output reg [31:0] alu_op2_o;
	
	/* 到回写阶段的 */
	output reg [4:0] rf_rd_o  = 0; /* 寄存器 2R 1W地址口, 同步RAM?分布RAM? */
	output reg rf_rd_we_o;
	
	output reg [2:0] alu_func_o = 0;
	
	/* 从回写阶段判断是否有写的数据 */
	input ex_we_i;
	input [4:0]ex_wd_i;
	input [31:0]ex_wdata_i;
	
	output reg [31:0] pc_o;
	output wire [31:0] pc_next_o;
	
	assign pc_next_o = pc_i;
	
	output reg decode_valid_o; /* 指令是否有效 */
	
	
	reg is_compressed_instr = 0;
	
	/* 指令解码 */
	
	wire [6:0] opcode = instr_i[6:0];
	
	/* 寄存器 */
	wire [4:0] rs1_i = instr_i[19:15];
	wire [4:0] rs2_i = instr_i[24:20];
	wire [4:0] rd_i  = instr_i[11:7];
	
	/* 立即数 */
	wire [31:0] d_imm_i = { {21{ instr_i[31] }}, instr_i[30:25], instr_i[24:21], instr_i[20]};
	wire [31:0] d_imm_s = { {21{ instr_i[31] }}, instr_i[30:25], instr_i[11:8], instr_i[7]};
	wire [31:0] d_imm_b = { {20{ instr_i[31] }}, instr_i[7], instr_i[30:25], instr_i[11:8], 1'b0};
	
	wire [31:0] d_imm_u = { instr_i[31], instr_i[30:20], instr_i[19:12], 12'h000};
	
	wire [31:0] d_imm_j = { {12{instr_i[31]}}, instr_i[19:12], instr_i[20], 
				instr_i[30:25], instr_i[24:21], 1'b0};	
				
	
	wire [2:0] alu_func = instr_i[14:12];
	
	wire [31:0]rf_rs1;
	wire [31:0]rf_rs2;
	
	
	/* 流水线结果前递 */
	assign rf_rs1 = ex_we_i? (ex_wd_i == rs1_i? ex_wdata_i: rf_rs1_i): rf_rs1_i;
	assign rf_rs2 = ex_we_i? (ex_wd_i == rs2_i? ex_wdata_i: rf_rs2_i): rf_rs2_i;
	
	always @(posedge clk_i or negedge rst_i)
	begin
		if(!rst_i)
		begin
			decode_valid_o <= 0;
			rf_rd_we_o <= 0;
			pc_o <= 0;
		end
		else
		begin			
			rf_rs1_o <= rs1_i; /* 可能可以提前 */
			rf_rs2_o <= rs2_i;
			rf_rd_o  <= rd_i; /* 寄存器解码 */
			
			decode_valid_o <= instr_valid_i;
			
			alu_func_o <= 0;
			
			rf_rd_we_o <= 0;
			
			case (opcode)
				`OPC_OP_IMM:
				begin
					alu_func_o <= alu_func;
					alu_op2_o <= d_imm_i;
					
					alu_op1_o <= rf_rs1;
					
					rf_rd_we_o <= instr_valid_i;
				end
				/*OPC_LUI:
				OPC_AUIPC:
				OPC_OP:
				OPC_JAL:
				OPC_JALR:
				OPC_BRANCH:
				OPC_LOAD:
				OPC_STORE:
				OPC_SYSTEM:*/
				default:
				begin
					decode_valid_o <= 0;
				end
			endcase
			
			pc_o <= pc_i;
			is_compressed_instr <= is_compressed_instr_i;
		end
	end
	
	
endmodule

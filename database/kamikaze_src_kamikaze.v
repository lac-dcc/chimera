/* 神疯RISC-V RV32IMC CPU 顶层文件 */
/* Zhiyuan Wan，Jan. 2017 */
module kamikaze(clk_i,
		rst_i,
		im_addr_o,
		im_data_i);
	input clk_i;
	input rst_i;
	output [31:0] im_addr_o;
	input [31:0] im_data_i;
	
	wire [31:0] instruction;
	wire is_compressed_instr;
	wire instr_valid;
	
	wire [31:0] pc_fetch;
	
	/* 寄存器 */
	wire [4:0] reg_raddr_1;
	wire [4:0] reg_raddr_2;
	
	wire [31:0] reg_rdata_1;
	wire [31:0] reg_rdata_2;
	
	wire [4:0] reg_waddr;
	wire [31:0] reg_wdata;
	wire reg_we;
	
	/* 解码后 */
	wire [2:0] alu_func;
	
	wire [4:0]decoded_rd;
	wire [31:0]decoded_imm;
	wire [31:0]decoded_pc;
	wire [31:0]decoded_pc_next;
	
	wire [31:0]alu_op1;
	wire [31:0]alu_op2;
	
	wire decoded_rd_we;
	wire executed_rd_we;
	
	wire [4:0]executed_rd;
	wire [31:0]executed_rd_data;
	
	assign reg_we = executed_rd_we;
	assign reg_wdata = executed_rd_data;
	assign reg_waddr = executed_rd;

		
	kamikaze_fetch fetch(	.clk_i(clk_i), .rst_i(rst_i), /* 取指，扩展 */
				.im_addr_o(im_addr_o), .im_data_i(im_data_i),
				.instr_o(instruction), .is_compressed_instr_o(is_compressed_instr),
				.instr_valid_o(instr_valid), .pc_o(pc_fetch)
				);
				
	kamikaze_decode decode( .clk_i(clk_i), .rst_i(rst_i), /* 解码，读寄存器 */
				.instr_i(instruction), .is_compressed_instr_i(is_compressed_instr),
				
				.pc_i(pc_fetch), .instr_valid_i(instr_valid),
				
				.alu_func_o(alu_func),
				
				.rf_rs1_o(reg_raddr_1), .rf_rs2_o(reg_raddr_2),
				.rf_rs1_i(reg_rdata_1), .rf_rs2_i(reg_rdata_2), /* 访问寄存器 */
				
				.alu_op1_o(alu_op1), .alu_op2_o(alu_op2),
				
				.rf_rd_o(decoded_rd), .rf_rd_we_o(decoded_rd_we),
				
				.ex_we_i(reg_we), .ex_wd_i(reg_waddr), .ex_wdata_i(reg_wdata),
				
				.pc_o(decoded_pc), .pc_next_o(decoded_pc_next)
				);
				
	kamikaze_execute execute(.clk_i(clk_i), .rst_i(rst_i), /* 执行 */
	
				.alu_op1_i(alu_op1), .alu_op2_i(alu_op2),
				
				.alu_func_i(alu_func),
				
				.pc_i(decoded_pc),
				
				.rf_rd_i(decoded_rd),
				.rf_rd_we_i(decoded_rd_we), .rf_rd_we_o(executed_rd_we),
				.rf_rd_o(executed_rd), .result_o(executed_rd_data)
				);
	
	kamikaze_regfile regfile(.clk_i(clk_i), /* 写寄存器 */
				.raddr1_i(reg_raddr_1), .raddr2_i(reg_raddr_2),
				.rdata1_o(reg_rdata_1), .rdata2_o(reg_rdata_2),
				.we_i(reg_we), .wdata_i(reg_wdata), .waddr_i(reg_waddr));
				
endmodule

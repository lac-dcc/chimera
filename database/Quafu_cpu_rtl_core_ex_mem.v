// This program was cloned from: https://github.com/gzzyyxh/Quafu
// License: MIT License

`include "defines.v"

module ex_mem(

	input	wire										clk,
	input wire										rst,
	input wire[5:0]								stall,
	input wire                   				flush,
	
	
	//来自执行阶段的信息	
	input wire[`RegAddrBus]       			ex_wd,
	input wire                    			ex_wreg,
	input wire[`RegBus]					 		ex_wdata,

	input wire[`AluOpBus]						ex_aluop,
	input wire[`RegBus]							ex_mem_addr,
	input wire[`RegBus]							ex_reg2,
	
	input wire										ex_csr_reg_we,
	input wire[11:0]								ex_csr_reg_write_addr,
	input wire[`RegBus]							ex_csr_reg_data,
	
	input wire[31:0]             				ex_excepttype,
	input wire[`RegBus]          				ex_current_inst_address,
	
	//送到访存阶段的信息
	output reg[`RegAddrBus]      				mem_wd,
	output reg                   				mem_wreg,
	output reg[`RegBus]					 		mem_wdata,
	
	output reg[`AluOpBus]						mem_aluop,
	output reg[`RegBus]							mem_mem_addr,
	output reg[`RegBus]							mem_reg2,
	
	output reg										mem_csr_reg_we,
	output reg[11:0]								mem_csr_reg_write_addr,
	output reg[`RegBus]							mem_csr_reg_data,
	
	output reg[31:0]            				mem_excepttype,
	output reg[`RegBus]         				mem_current_inst_address
);


	always @ (posedge clk) begin
		if(rst == `RstEnable) begin
			mem_wd <= `NOPRegAddr;
			mem_wreg <= `WriteDisable;
			mem_wdata <= `ZeroWord;
			mem_aluop <= `EXE_NOP_OP;
			mem_mem_addr <= `ZeroWord;
			mem_reg2 <= `ZeroWord;
			
			mem_csr_reg_we <= `WriteDisable;
			mem_csr_reg_write_addr <= 12'b000000000000;
			mem_csr_reg_data <= `ZeroWord;
			
			mem_excepttype <= `ZeroWord;
			mem_current_inst_address <= `ZeroWord;
		end else if(flush == 1'b1 ) begin
			mem_wd <= `NOPRegAddr;
			mem_wreg <= `WriteDisable;
			mem_wdata <= `ZeroWord;
			mem_aluop <= `EXE_NOP_OP;
			mem_mem_addr <= `ZeroWord;
			mem_reg2 <= `ZeroWord;
			mem_csr_reg_we <= `WriteDisable;
			mem_csr_reg_write_addr <= 12'b000000000000;
			mem_csr_reg_data <= `ZeroWord;
			mem_excepttype <= `ZeroWord;
			mem_current_inst_address <= `ZeroWord;
		end else if(stall[3] == `Stop && stall[4] == `NoStop) begin
			mem_wd <= `NOPRegAddr;
			mem_wreg <= `WriteDisable;
			mem_wdata <= `ZeroWord;
			mem_aluop <= `EXE_NOP_OP;
			mem_mem_addr <= `ZeroWord;
			mem_reg2 <= `ZeroWord;
			
			mem_csr_reg_we <= `WriteDisable;
			mem_csr_reg_write_addr <= 12'b000000000000;
			mem_csr_reg_data <= `ZeroWord;
			
			mem_excepttype <= `ZeroWord;
			mem_current_inst_address <= `ZeroWord;	
		end else if(stall[3] == `NoStop) begin
			mem_wd <= ex_wd;
			mem_wreg <= ex_wreg;
			mem_wdata <= ex_wdata;
			mem_aluop <= ex_aluop;
			mem_mem_addr <= ex_mem_addr;
			mem_reg2 <= ex_reg2;
			
			mem_csr_reg_we <= ex_csr_reg_we;
			mem_csr_reg_write_addr <= ex_csr_reg_write_addr;
			mem_csr_reg_data <= ex_csr_reg_data;
			
			mem_excepttype <= ex_excepttype;
			mem_current_inst_address <= ex_current_inst_address;
		end    //if
	end      //always
			

endmodule

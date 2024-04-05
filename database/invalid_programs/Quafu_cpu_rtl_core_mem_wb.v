`include "defines.v"

module mem_wb(

	input	wire										clk,
	input wire										rst,
	input wire[5:0]								stall,
	input wire  			                  flush,	
	

	//来自访存阶段的信息	
	input wire[`RegAddrBus]       mem_wd,
	input wire                    mem_wreg,
	input wire[`RegBus]				mem_wdata,
	
	input wire							mem_csr_reg_we,
	input wire[11:0]					mem_csr_reg_write_addr,
	input wire[`RegBus]				mem_csr_reg_data,

	//送到回写阶段的信息
	output reg[`RegAddrBus]      wb_wd,
	output reg                   wb_wreg,
	output reg[`RegBus]			  wb_wdata,

	output reg							wb_csr_reg_we,
	output reg[11:0]					wb_csr_reg_write_addr,
	output reg[`RegBus]				wb_csr_reg_data
	
);


	always @ (posedge clk) begin
		if(rst == `RstEnable) begin
			wb_wd <= `NOPRegAddr;
			wb_wreg <= `WriteDisable;
			wb_wdata <= `ZeroWord;
			
			wb_csr_reg_we <= `WriteDisable;
			wb_csr_reg_write_addr <= 12'b000000000000;
			wb_csr_reg_data <= `ZeroWord;
		end else if(flush == 1'b1 ) begin
			wb_wd <= `NOPRegAddr;
			wb_wreg <= `WriteDisable;
		   wb_wdata <= `ZeroWord;
			wb_csr_reg_we <= `WriteDisable;
			wb_csr_reg_write_addr <= 12'b000000000000;
			wb_csr_reg_data <= `ZeroWord;	
		end else if(stall[4] == `Stop && stall[5] == `NoStop) begin
			wb_wd <= `NOPRegAddr;
			wb_wreg <= `WriteDisable;
			wb_wdata <= `ZeroWord;
			
			wb_csr_reg_we <= `WriteDisable;
			wb_csr_reg_write_addr <= 12'b000000000000;
			wb_csr_reg_data <= `ZeroWord;
		end else if(stall[4] == `NoStop) begin
			wb_wd <= mem_wd;
			wb_wreg <= mem_wreg;
			wb_wdata <= mem_wdata;
			
			wb_csr_reg_we <= mem_csr_reg_we;
			wb_csr_reg_write_addr <= mem_csr_reg_write_addr;
			wb_csr_reg_data <= mem_csr_reg_data;
		end    //if
	end      //always
			

endmodule

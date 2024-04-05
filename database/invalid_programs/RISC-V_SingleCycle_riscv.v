/*
 * Ask me anything: via repo/issue, or e-mail: vencifreeman16@sjtu.edu.cn.
 * Author: @VenciFreeman (GitHub), copyright 2019.
 * School: Shanghai Jiao Tong University.
 
 * Description:
 * This file controls the CPU.
 
 * Details:
 * There is no details.
 
 * History:
 * - 19/12/19: Create this file;
 * - 19/12/23: Add own modules;
 * - 19/12/24: Add own modules;
 * - 19/12/26: Update modules;
 * - 19/12/27: Update modules;
 * - 19/12/28: Finished!
 
 * Notes:
 
 */

`include "ex.v"
`include "id.v"
`include "if.v"
`include "mem.v"
`include "wb.v"
`include "register.v"

module riscv(

	input wire				 clk,
	input wire				 rst,         // high is reset

    // inst_mem
	input wire[31:0]         inst_i,	  // instruction
	output wire[31:0]        inst_addr_o, // instruction address
	output wire              inst_ce_o,	  // chip select signal

    // data_mem
	input wire[31:0]         data_i,      // load data from data_mem
	output wire              data_we_o,
    output wire              data_ce_o,
	output wire[31:0]        data_addr_o,
	output wire[31:0]        data_o       // store data to  data_mem

);

	wire [4:0] 	id_ex_ALUop;
	wire [31:0] id_ex_Reg1;
	wire [31:0] id_ex_Reg2;
	wire        id_ex_WriteReg;
	wire [4:0] 	id_ex_WriteData;
	wire [31:0] id_ex_LinkAddress;	
	wire [31:0] id_ex_Inst;

	wire 		id_reg_Read1;
	wire 	    id_reg_Read2;
	wire [31:0] id_reg_Data1;
	wire [31:0] id_reg_Data2;
	wire [4:0] 	id_reg_Addr1;
	wire [4:0] 	id_reg_Addr2;

	wire 		ex_mem_WriteReg;
	wire [4:0]  ex_mem_WriteNum;
	wire [31:0] ex_mem_WriteData;
	wire [4:0]  ex_mem_ALUop;
	wire [31:0] ex_mem_Addr;
	wire [31:0] ex_mem_Reg;

	wire 		mem_wb_WriteReg;
	wire [4:0]  mem_wb_WriteNum;
	wire [31:0] mem_wb_WriteData;

	wire [4:0]  wb_reg_WriteAddr;
	wire 		wb_reg_we;
	wire [31:0] wb_reg_WriteData;

	wire 		pc_id_branch;
	wire [31:0] pc_id_address;

	PC pc(
		.clk(clk),
		.rst(rst),
		.Branch(pc_id_branch),
		.Addr(pc_id_address),
		.ce(inst_ce_o),
		.PC(inst_addr_o)
	);

	ID id(
		.rst(rst),
		.pc_i(inst_addr_o),
		.inst_i(inst_i),
		.RegData1(id_reg_Data1),
		.RegData2(id_reg_Data2),
		.RegRead1(id_reg_Read1),
		.RegRead2(id_reg_Read2),
		.RegAddr1(id_reg_Addr1),
		.RegAddr2(id_reg_Addr2),
		.ALUop(id_ex_ALUop),
		.Reg1(id_ex_Reg1),
		.Reg2(id_ex_Reg2),
		.WriteData(id_ex_WriteData),
		.WriteReg(id_ex_WriteReg),
		.Branch(pc_id_branch),
		.BranchAddr(pc_id_address),
		.LinkAddr(id_ex_LinkAddress),
		.inst_o(id_ex_Inst)
	);

	Registers registers(
		.clk(clk),
		.rst(rst),
		.we(wb_reg_we),
		.WriteAddr(wb_reg_WriteAddr),
		.WriteData(wb_reg_WriteData),
		.ReadReg1(id_reg_Read1),
		.ReadReg2(id_reg_Read2),
		.ReadAddr1(id_reg_Addr1),
		.ReadAddr2(id_reg_Addr2),
		.ReadData1(id_reg_Data1),
		.ReadData2(id_reg_Data2)
	);

	EX ex(
		.rst(rst),
		.ALUop_i(id_ex_ALUop),
		.Oprend1(id_ex_Reg1),
		.Oprend2(id_ex_Reg2),
		.WriteDataNum_i(id_ex_WriteData),
		.WriteReg_i(id_ex_WriteReg),
		.LinkAddr(id_ex_LinkAddress),
		.inst_i(id_ex_Inst),
		.WriteReg_o(ex_mem_WriteReg),
		.ALUop_o(ex_mem_ALUop),
		.WriteDataNum_o(ex_mem_WriteNum),
		.WriteData_o(ex_mem_WriteData),
		.MemAddr_o(ex_mem_Addr),
		.Result(ex_mem_Reg)
	);

	MEM mem(
		.rst(rst),
		.WriteReg_i(ex_mem_WriteReg),
		.WriteDataAddr_i(ex_mem_WriteNum),
		.ALUop_i(ex_mem_ALUop),
		.WriteData_i(ex_mem_WriteData),
		.MemAddr_i(ex_mem_Addr),
		.Reg_i(ex_mem_Reg),
		.MemData_i(data_i),
		.MemWE_o(data_we_o),
		.WriteReg_o(mem_wb_WriteReg),
		.MemCE_o(data_ce_o),
		.WriteDataAddr_o(mem_wb_WriteNum),
		.WriteData_o(mem_wb_WriteData),
		.MemAddr_o(data_addr_o),
		.MemData_o(data_o)
	);

	WB wb(
		.rst(rst),
		.MemWriteNum(mem_wb_WriteNum),
		.MemWriteReg(mem_wb_WriteReg),
		.MemWriteData(mem_wb_WriteData),
		.WriteBackNum(wb_reg_WriteAddr),
		.WriteBackReg(wb_reg_we),
		.WriteBackData(wb_reg_WriteData)
	);

endmodule
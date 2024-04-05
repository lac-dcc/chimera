`include "defines.v"

module openmips(
    input  wire               clock,
	input  wire               reset,
	input  wire[`RegisterBus] rom_data_input,
	output wire[`RegisterBus] rom_address_output,
	output wire               rom_ce_output
);

    wire[`AddressBus]         pc;
	wire[`AddressBus]         id_pc_input;
	wire[`DataBus]            id_instruction_input;
	
	wire[`ALUOpBus]           id_aluop_output;
	wire[`ALUSelBus]          id_alusel_output;
	wire[`RegisterBus]        id_reg1_output;
	wire[`RegisterBus]        id_reg2_output;
	wire                      id_wreg_output;
	wire[`RegisterAddressBus] id_wd_output;
	
	wire[`ALUOpBus]           ex_aluop_input;
	wire[`ALUSelBus]          ex_alusel_input;
	wire[`RegisterBus]        ex_reg1_input;
	wire[`RegisterBus]        ex_reg2_input;
	wire                      ex_wreg_input;
	wire[`RegisterAddressBus] ex_wd_input;
	
	wire                      ex_wreg_output;
	wire[`RegisterAddressBus] ex_wd_output;
	wire[`RegisterBus]        ex_wdata_output;
	
	wire                      mem_wreg_input;
	wire[`RegisterAddressBus] mem_wd_input;
	wire[`RegisterBus]        mem_wdata_input;
	
	wire                      mem_wreg_output;
	wire[`RegisterAddressBus] mem_wd_output;
	wire[`RegisterBus]        mem_wdata_output;

	wire                      wb_wreg_input;
	wire[`RegisterAddressBus] wb_wd_input;
	wire[`RegisterBus]        wb_wdata_input;
	
	wire                      reg1_read;
	wire                      reg2_read;
	wire[`RegisterBus]        reg1_data;
	wire[`RegisterBus]        reg2_data;
	wire[`RegisterAddressBus] reg1_address;
	wire[`RegisterAddressBus] reg2_address;
	
	pc_reg pc_reg0(
		.clock(clock),
		.reset(reset),
		.pc(pc),
		.ce(rom_ce_output)
	);
	
	assign rom_address_output = pc;
	
	if_id if_id0(
		.clock(clock), 
		.reset(reset),
		
		.if_pc(pc),
		.if_instruction(rom_data_input),
		
		.id_pc(id_pc_input),
		.id_instruction(id_instruction_input)
	);
	
	id id0(
		.reset(reset),
		.pc_input(id_pc_input),
		.instruction_input(id_instruction_input),
		
		.reg1_data_input(reg1_data),
		.reg2_data_input(reg2_data),
		
		.ex_wreg_input(ex_wreg_output),
		.ex_wdata_input(ex_wdata_output),
		.ex_wd_input(ex_wd_output),

		.mem_wreg_input(mem_wreg_output),
		.mem_wdata_input(mem_wdata_output),
		.mem_wd_input(mem_wd_output),
		
		.reg1_read_output(reg1_read),
		.reg2_read_output(reg2_read),

		.reg1_addr_output(reg1_address),
		.reg2_addr_output(reg2_address),

		.aluop_output(id_aluop_output),
		.alusel_output(id_alusel_output),
		.reg1_output(id_reg1_output),
		.reg2_output(id_reg2_output),
		.wd_output(id_wd_output),
		.wreg_output(id_wreg_output)
		
	);
	
	regfile regfile1(
		.clock(clock),
		.reset(reset),

		.write_enable(wb_wreg_input),
		.write_address(wb_wd_input),
		.write_data(wb_wdata_input),

		.read_enable1(reg1_read),
		.read_address1(reg1_address),
		.read_data1(reg1_data),

		.read_enable2(reg2_read),
		.read_address2(reg2_address),
		.read_data2(reg2_data)
	);
	
	id_ex id_ex0(
		.clock(clock),
		.reset(reset),

		.id_aluop(id_aluop_output),
		.id_alusel(id_alusel_output),
		.id_reg1(id_reg1_output),
		.id_reg2(id_reg2_output),
		.id_wd(id_wd_output),
		.id_wreg(id_wreg_output),
		
		.ex_aluop(ex_aluop_input),
		.ex_alusel(ex_alusel_input),
		.ex_reg1(ex_reg1_input),
		.ex_reg2(ex_reg2_input),
		.ex_wd(ex_wd_input),
		.ex_wreg(ex_wreg_input)
	);
	 
	ex ex0(
		.reset(reset),

		.aluop_input(ex_aluop_input),
		.alusel_input(ex_alusel_input),
		
		.reg1_input(ex_reg1_input),
		.reg2_input(ex_reg2_input),
		.wd_input(ex_wd_input),
		.wreg_input(ex_wreg_input),

		.wd_output(ex_wd_output),
		.wreg_output(ex_wreg_output),
		.wdata_output(ex_wdata_output)
	);
	
	ex_mem ex_mem0(
		.clock(clock),
		.reset(reset),

		.ex_wd(ex_wd_output),
		.ex_wreg(ex_wreg_output),
		.ex_wdata(ex_wdata_output),

		.mem_wd(mem_wd_input),
		.mem_wreg(mem_wreg_input),
		.mem_wdata(mem_wdata_input)
	);
	
	
	mem mem0(
		.reset(reset),

		.wd_input(mem_wd_input),
		.wreg_input(mem_wreg_input),
		.wdata_input(mem_wdata_input),

		.wd_output(mem_wd_output),
		.wreg_output(mem_wreg_output),
		.wdata_output(mem_wdata_output)
	);
	
	mem_wb mem_wb0(
		.clock(clock),
		.reset(reset),

		.mem_wd(mem_wd_output),
		.mem_wreg(mem_wreg_output),
		.mem_wdata(mem_wdata_output),

		.wb_wd(wb_wd_input),
		.wb_wreg(wb_wreg_input),
		.wb_wdata(wb_wdata_input)
	);
	 
endmodule
`include "defines.v"

module openmips_min_sopc(
	input wire clock,
	input wire reset
);

	wire[`InstructionAddressBus] inst_addr;
	wire[`InstructionBus]        inst;
	wire                         rom_chip_enable;
	wire                         memory_write_enable;
	wire[`RegisterBus]           memory_address_input;
	wire[`RegisterBus]           memory_data_input;
	wire[`RegisterBus]           memory_data_output;
	wire[3:0]                    memory_sel_input;
	wire                         memory_chip_enable_input;

	wire[5:0] 					 interrupt_input;
	wire 						 timer_interrupt_output;

	assign interrupt_input = {5'b00000, timer_interrupt_output};

	openmips openmips0(
		.clock(clock), 
		.reset(reset),

		.rom_data_input(inst), 
		.rom_address_output(inst_addr), 
		.rom_chip_enable(rom_chip_enable),

		
		.ram_write_enable_output(memory_write_enable),
		.ram_address_output(memory_address_input),
		.ram_sel_output(memory_sel_input),
		.ram_data_input(memory_data_output),
		.ram_data_output(memory_data_input),
		.ram_chip_enable(memory_chip_enable_input),

		.interrupt_input(interrupt_input),
		.timer_interrupt_output(timer_interrupt_output)	
	);

	inst_rom inst_rom0(
		.ce(rom_chip_enable),
		.address(inst_addr), 
		.instruction(inst)
	);

	data_ram data_ram0(
        .clock(clock),
        .write_enable(memory_write_enable),
        .address(memory_address_input),
        .sel(memory_sel_input),
        .data_input(memory_data_input),
        .data_output(memory_data_output),
		.chip_enable(memory_chip_enable_input)
    );
	 
endmodule
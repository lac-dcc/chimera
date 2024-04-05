`include "defines.v"

module openmips_min_sopc(
	input wire clock,
	input wire reset
);

	wire[`AddressBus] inst_addr;
	wire[`DataBus]    inst;
	wire              rom_ce;
	 
	openmips openmips0(
		.clock(clock), 
		.reset(reset),
		.rom_data_input(inst), 
		.rom_address_output(inst_addr), 
		.rom_chip_enable(rom_ce)
	);

	inst_rom inst_rom0(
		.ce(rom_ce),
		.address(inst_addr), 
		.instruction(inst)
	);
	 
endmodule
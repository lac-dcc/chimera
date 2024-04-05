`include "defines.v"

module inst_rom(
    input  wire                         ce,
	input  wire[`InstructionAddressBus] address,
	output reg[`InstructionBus]         instruction
);

    reg[`InstructionBus] inst_mem[0:`InstructionMemoryNum - 1];
	 
	 initial $readmemh ("inst_rom.data", inst_mem);
	 
	 always @ (*) begin
	     if (ce == `ChipDisable) begin
		      instruction <= `ZeroWord;
		  end else begin
		      instruction <= inst_mem[address[`InstructionMemNumLog2 + 1:2]];
		  end
	 end

endmodule
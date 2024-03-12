`include "defines.v"

module inst_rom(
    input  wire              ce,
	 input  wire[`AddressBus] address,
	 output reg[`DataBus]     instruction
);

    reg[`DataBus] inst_mem[0:`MemoryNum - 1];
	 
	 initial $readmemh ("inst_rom.data", inst_mem);
	 
	 always @ (*) begin
	     if (ce == `ChipDisable) begin
		      instruction <= `ZeroWord;
		  end else begin
		      instruction <= inst_mem[address[`MemoryNumLog2 + 1:2]];
		  end
	 end

endmodule
// This program was cloned from: https://github.com/lmxyy/Computer-Architecture-Task-2
// License: MIT License

`ifdef inst_rom.v
`else
 `define inst_rom.v
// --------------------------------------------------------------------------------
 `include "defines.v"

module inst_rom(
		input wire 		  ce,
		input wire [`InstAddrBus] addr,
		output reg [`InstBus] 	  inst
	      );

   reg[`InstBus]  inst_mem[0:10];
   
   initial $readmemh ("instr.data",inst_mem);

   always @ (*)
     begin
	if (ce == `ChipDisable) inst <= `ZeroWord;
	else
	  inst <= inst_mem[addr[`InstMemNumLog2+1:2]];
     end

endmodule // inst_rom

// --------------------------------------------------------------------------------
`endif

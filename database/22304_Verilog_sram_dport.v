// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 DUAL PORT RAM
************************************************/
module sram(q, data, read_addr, write_addr, we, read_clock, write_clock);
	input [7:0] data;
	input [5:0] read_addr, write_addr;
	input we, read_clock, write_clock;
	output reg [7:0] q;

	reg [7:0] sram[63:0];
	
	always @ (posedge write_clock)
	begin
	
		if (we)
			sram[write_addr] <= data;
	end
	
	always @ (posedge read_clock)
	begin
	
		q <= sram[read_addr];
	end
endmodule
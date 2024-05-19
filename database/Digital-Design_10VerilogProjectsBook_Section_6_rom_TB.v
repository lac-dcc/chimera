// This program was cloned from: https://github.com/FPGADude/Digital-Design
// License: GNU General Public License v3.0


module rom_TB;
	reg  [3:0] address;
	wire [7:0] data;

	rom DUT(.address(address), .data(data));

	integer i;
	initial begin
		for(i = 0; i < 16; i = i + 1) begin
			address = i;
			#2;
		end	
	end

	initial begin
		$dumpfile("rom_TB.vcd");
		$dumpvars(0, rom_TB);
	end

endmodule




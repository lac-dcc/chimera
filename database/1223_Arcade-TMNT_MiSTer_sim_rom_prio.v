// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

module rom_prio(
	input [7:0] address,
	output reg [3:0] dout
);

reg [7:0] data[0:255];

initial begin
	$readmemh("sim/roms/prom_prio_8.txt", data, 0);
end

always @(*) begin
	#1 dout <= data[address][3:0];
end

endmodule

// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

module RAM12(
	input [7:0] addr,
	input en,
	input we,
	input [11:0] din,
	output [11:0] dout);
	
reg [11:0] data[0:255];

always @(*) begin
	if (we & en)
		data[addr] <= din;
end

	assign dout = data[addr];

endmodule

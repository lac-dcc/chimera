// This program was cloned from: https://github.com/furrtek/Arcade-TMNT_MiSTer
// License: GNU General Public License v2.0

// OKI counter cell
// furrtek 2022

module CNT2(
	input CLK,
	input nLOAD, CEN1, CEN2,
	input [3:0] D,
	output reg [3:0] Q
);

always @(posedge CLK) begin
	if (!nLOAD)
		Q <= D;
	else
		if (CEN1 & CEN2) Q <= Q + 1'b1;
end

endmodule

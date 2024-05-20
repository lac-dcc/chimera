// This program was cloned from: https://github.com/MikhaelKaa/zs-pentagon
// License: MIT License

`timescale 1 ns / 1 ns

module pent_logic_1 (D, WRn, A0, IORQn, RD, K9, K10, K11, TAPEOUT, SOUND);
	input [4:0] D;
	input WRn, A0, IORQn, RD;
	output K9, K10, K11, TAPEOUT, SOUND;

	wire [3:0] dd43_Q;
	ic_1533tm8 dd43 (.D(D[3:0]), .C(dd8_4), .R(1'b1), .Q_p(dd43_Q));
	wire dd8_4 = ~(WRn | ~dd50_10);
	wire dd50_10 = ~(A0 | IORQn);
	reg dd10 = 1'b0;
	
	always @(posedge dd8_4) dd10 <= D[4];

	assign SOUND = dd10;
	assign {TAPEOUT, K11, K10, K9} = dd43_Q;

endmodule
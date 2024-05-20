// This program was cloned from: https://github.com/MikhaelKaa/zs-pentagon
// License: MIT License

`timescale 1 ns / 1 ns

module pent_logic_0 (D, C39, A14, A15, IORQn, WRn, A1, CAS, DIS, C33, C34, C35, C36, C37, C38);
	input [5:0] D;
	input C39, A14, A15, IORQn, WRn, A1, CAS, DIS;
	output C33, C34, C35, C36, C37, C38;
	
	wire [5:0]dd62_out;
	ic_1533tm9 dd62(.D(D), .R(C39), .C(dd64_13), .Q(dd62_out));
	wire dd64_13 = ~(dd62_out[5] | ~(~(IORQn | WRn) & ~(A1 | A15)));
	wire[3:0]dd61_out;
	ic_1533kp11 dd61(.A({1'bz, dd62_out[2], dd62_out[1], dd62_out[0]}), .B({1'bz, A14, A15, A14}), .SA(dd63_6), .CS(1'b0),  .Y(dd61_out));
	assign dd61_9 = dd61_out[2];
	assign C34 = dd61_out[1];
	assign C33 = dd61_out[0];
	wire dd63_6 = ~(A14 & A15);
	wire dd61_9;
	wire dd65_11 = DIS | dd61_9;
	assign C37 = ~(CAS & dd64_1);
	wire dd64_1 = ~dd65_11;
	assign C38 = ~(CAS & dd65_11);
	assign C35 = dd62_out[3];
	assign C36 = dd62_out[4];
endmodule
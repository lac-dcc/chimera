// This program was cloned from: https://github.com/MikhaelKaa/zs-pentagon
// License: MIT License

`timescale 1 ns / 1 ns

module video   (Q, C17, C3, C18, C1, C2,	K9, K10, K11, BL, C5, C7,	FLASHER,	R, G, B, I, SYNC, test_pin);
	input [7:0] Q;
	input	C17, C3, C18, C1, C2,	K9, K10, K11, BL, C5, C7,	FLASHER;
	output R, G, B, I, SYNC, test_pin;

	wire [7:0]dd37_q;
	ic_1533ir23 dd37 (.D(Q), .Q(dd37_q), .C(C17), .OEn(1'b0));
	
	wire [7:0]dd40_q;
	ic_1533ir23 dd40 (.D(dd37_q), .Q(dd40_q), .C(C3), .OEn(1'b0));
	
	wire [7:0]dd38_q;
	ic_1533ir23 dd38 (.D(Q), .Q(dd38_q), .C(C18), .OEn(1'b0));
	
	wire [3:0]dd41_q;
	ir16 dd41(.D(dd38_q[3:0]), .DI(1'b0), .C(C1), .Q(dd41_q), .PE(C2), .OE(1'b1));
	
	wire [3:0]dd42_q;
	ir16 dd42(.D(dd38_q[7:4]), .DI(dd41_q[3]), .C(C1), .Q(dd42_q), .PE(C2), .OE(1'b1));
	
	wire dd7_11 = ~(dd40_q[7] & FLASHER);
	wire dd6_11 = dd42_q[3] ^ dd7_11;
	
	wire dd46_ay, dd46_by;
	ic_1533kp2 dd46(.A({K9,  K9,  dd40_q[3], dd40_q[0]}), .EA(BL), .B({K10, K10, dd40_q[4], dd40_q[1]}), .EB(BL), .S1(dd6_11), .S2(C5), .AY(dd46_ay), .BY(dd46_by));
	wire dd47_ay, dd47_by;
	ic_1533kp2 dd47(.A({K11, K11, dd40_q[5], dd40_q[2]}), .EA(BL), .B({1'b0, 1'b0, dd40_q[6], dd40_q[6]}), .EB(BL), .S1(dd6_11), .S2(C5), .AY(dd47_ay), .BY(dd47_by));
	

	
	assign B = dd46_ay;
	assign R = dd46_by;
	assign G = dd47_ay;
	assign I = dd46_by;
	assign SYNC = C7;
	assign test_pin = C18;//dd37_q[0];
endmodule
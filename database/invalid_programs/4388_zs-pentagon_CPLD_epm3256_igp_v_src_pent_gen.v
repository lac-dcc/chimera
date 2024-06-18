// This program was cloned from: https://github.com/MikhaelKaa/zs-pentagon
// License: MIT License

`ifndef MACRO_74
`include "logic74.v"
`endif
`timescale 1 ns / 1 ns

module pent_gen (clk14m, C1, C25, C2, C31, C3, B1, B2, B3, B4, B5, B6, SSI, B7, B8, B9, B10, B11, B12, B13, C6, KSI, C7, BL, C5, C8, RAS, RAS_n, CAS, CAS_n, C30, B14, B15, B16, B17, test_pin);
	input  clk14m, C30;
	output C1, C25, C2, C31, C3, B1, B2, B3, B4, B5, B6, SSI, B7, B8, B9, B10, B11, B12, B13, C6, KSI, C7, BL, C5, C8, RAS, RAS_n, CAS, CAS_n, B14, B15, B16, B17;
	output test_pin;

	assign test_pin = dd7_8;//dd2_12;
	// 14MHz clock division
	wire clk14_p = clk14m;
	wire clk14_n = ~clk14m;
	reg [1:0] dd2 = 2'b0;
	always @(negedge clk14_n) begin // TODO: negedge or posedge
		dd2 = dd2 + 1'b1;
		dd7_8_filter <= dd7_8;
	end	

	assign C1  = dd2[0];
	assign C25 = ~dd2[1];
	assign C31 = clk14_p;
	// DD5.2
	assign C2  = C25 & dd3_3 & dd3_2;
	// DD1.6
	assign C3  = ~dd3_2;

	assign #5 B6  = dd2_12;
	wire dd7_8 = ~( ( ~B3 ) & ( ~( B4 | dd4_7 ) ) );
	reg dd2_12 = 1'b0; // TODO: dd7_8 with glitch... -> division 4, need 2... 
	reg dd7_8_filter = 1'b0;
	always @(negedge dd7_8_filter) begin // TODO: negedge or posedge
		dd2_12 <= ~dd2_12;
	end
	assign #5 SSI = dd7_8;

	// DD3
	wire dd3_5 = dd2[1];
	wire dd3_3, dd3_2, dd3_12;

	ic_1533ie7 dd3_ie7 (
		.q1(dd3_3),
		.q2(dd3_2),
		.q3(B1),
		.q4(B2),
		.R(1'b0),
		.C(1'b1),
		.CR(dd3_12), 
		.plus1(dd3_5),
		.minus1(1'b1)
	);

	// DD4
	wire dd4_5 = dd3_12;
	wire dd4_3, dd4_2, dd4_7;

	reg [3:0]dd4_ie7_cnt = 4'b0;
	always @(posedge dd4_5) begin
		if(dd4_5) begin 
			dd4_ie7_cnt = dd4_ie7_cnt  + 1'b1;
			if (dd4_ie7_cnt == 4'b0000) dd4_ie7_cnt = 4'b0010;
		end

	end
	assign #5 {dd4_7, B5, B4, B3} = dd4_ie7_cnt;
	
	// DD11 
	wire dd11_14 = B6;
	reg [3:0]dd11 = 4'b0;
	always @(negedge dd11_14) begin // TODO: negedge or posedge
		dd11 <= dd11 + 1'b1;
	end	
	// DD12
	wire dd12_14 = dd11[3];
	reg [3:0]dd12 = 4'b0;
	wire dd12_ = dd12[1] & dd12[3];
	always @(negedge dd12_14) begin // TODO: negedge or posedge
		//if(dd12_) begin dd12 <= 4'b0000; end // TODO: check b0001 
		if(dd12 == 4'b1001) dd12 <= 4'b0000;
		else dd12 <= dd12 + 1'b1; 
		//dd12 = dd12 + 1;
	end
	assign #5 {B10, B9, B8, B7} = dd11[3:0];
	assign #5 {B13, B12, B11} = dd12[2:0];
	// DD9.3
	wire d9_8 = B12 & B13;
	assign #5 C6 = ~(dd12[3] | d9_8);
	assign #5 KSI = B10 & B11 & d9_8;

	// DD6.1 (3 pin)
	assign  C7 = KSI^SSI;

	// DD6.3 (8 pin)
	wire dd6_8 = KSI^(( B5 ) & ( ~( B4 | dd4_7 )));

	// VT1 R16, C17
	assign  BL = dd6_8; // TODO: without RC
	
	// DD10.2 (8 pin)
	reg dd10_t2 = 1'b0;
	wire dd10_t2_c = B1;
	always@(negedge dd10_t2_c) begin
		// DD9.2 6 pin - C6 & dd4_7
		dd10_t2 <= (C6 & dd4_7);
	end
	assign C5 = ~dd10_t2;

	// DD51.5 10 pin
	assign C8 = ~KSI; // TODO: without RC

	// DD45

	wire [3:0] dd45_qp;
	wire [3:0] dd45_qn;
	ic_1533tm8 dd45 (.C(C31), .R(1'b1), .D({1'bz, 1'bz, RAS, C25}), .Q_p(dd45_qp), .Q_n(dd45_qn));
	assign RAS = dd45_qp[0];
	assign CAS = dd45_qp[1];
	assign RAS_n = dd45_qn[0];
	assign CAS_n = dd45_qn[1];

	// DD14
	ic_1533kp11 dd14(.A({1'b1, 1'b0, B13, B12}), .B({B12, B8, B7, B6}), .SA(C30), .CS(1'b0),  .Y({B17, B16, B15, B14}));
	
endmodule
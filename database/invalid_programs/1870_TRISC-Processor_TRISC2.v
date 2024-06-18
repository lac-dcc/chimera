// This program was cloned from: https://github.com/rolo-g/TRISC-Processor
// License: MIT License

//Rolando Rosales 1001850424 - TRISC2

module TRISC2(
	input SysClock, StartStop, Mode, ClockIn, ClearAddGen, RW, //Mode = SW9, ClockIn = Key2, ClearAddGen = Key3, RW = Key5
	input [7:0] DataIn, //DataIn = {SW7,SW6,SW5,SW4,SW3,SW2,SW1,SW0}
	output [14:0] Cled,
	output [6:0] hex5out, hex4out, hex3out, hex2out, hex1out, hex0out);

	wire [3:0] ADDRbus, RAMadd, IRout, ALUout, BRout, AddIn, AddGen, hex5in, hex4in, hex3in, hex2in, hex1in, hex0in;
	wire RAMin, RAMwrite, toggle;
	wire [7:0] RAMdata, MDI, MDO;
	wire C0, C1, C2, C3, C4, C7, C8, C9, C5, C10, C11, C12, C13, C14, OVR, Cout;

	assign RAMadd = C3 == 0 ? MDO[3:0] : ADDRbus;
	assign AddIn = Mode == 1'b0 ? RAMadd : AddGen;
	assign RAMin = Mode == 1'b0 ? SysClock*C4 : ClockIn;
	assign RAMdata = Mode == 1'b0 ? MDI : DataIn;
	assign RAMwrite = Mode == 1'b0 ? C5 : ~RW;

	assign Cled[0] = C0, Cled[1] = C1, Cled[2] = C2, Cled[3] = C3, Cled[4] = C4, Cled[5] = C5, Cled[7] = C7;
	assign Cled[8] = C8, Cled[9] = C9, Cled[10] = C10, Cled[11] = C11, Cled[12] = C12, Cled[13] = C13, Cled[14] = C14;
	assign hex5in = ADDRbus, hex4in = AddIn, hex3in = MDO[7:4], hex2in = MDO[3:0], hex1in = RAMdata[7:4], hex0in = RAMdata[3:0];
	
	OnOffToggle DivideX2
	(
		.OnOff(ClockIn) , // input OnOff_sig
		.IN(1'b1) , // input IN_sig
		.OUT(toggle) // output OUT_sig
	);
	BinUp AddressGen
	(
		.inc(toggle) , // input inc_sig
		.clear(ClearAddGen) , // input clear_sig
		.load(1'b1) , // input load_sig
		.D(4'b0) , // input [N-1:0] D_sig
		.Q(AddGen) // output [N-1:0] Q_sig
	);
	Lab11RAM RAM
	(
		.address ( AddIn ),
		.clock ( ~RAMin ),
		.data ( RAMdata ),
		.wren ( RAMwrite ),
		.q ( MDO )
	);
	BinUp PC
	(
		.inc(~C2) ,	// input  inc_sig
		.clear(~C0) ,	// input  clear_sig
		.load(~C1) ,	// input  load_sig
		.D(MDO[3:0]) ,	// input [N-1:0] D_sig
		.Q(ADDRbus) 	// output [N-1:0] Q_sig
	);
	piporeg IR
	(
		.x(MDO[7:4]) ,	// input [N-1:0] x_sig
		.CLK(~C7) ,	// input  CLK_sig
		.CLR(StartStop) ,	// input  CLR_sig
		.y(IRout) 	// output [N-1:0] y_sig
	);
	accumulator ACC
	(
		.A(MDO[3:0]) ,	// input [3:0] A_sig
		.B(BRout) ,	// input [3:0] B_sig
		.INC(~C9) ,	// input  INC_sig
		.LDR(~C11) ,	// input  LDR_sig
		.CLR(~C8) ,	// input  CLR_sig
		.AB(C10) ,	// input  AB_sig
		.Z(MDI[3:0]) 	// output [3:0] Z_sig
	);
	piporeg BR
	(
		.x(ALUout) ,	// input [N-1:0] x_sig
		.CLK(~C14) ,	// input  CLK_sig
		.CLR(StartStop) ,	// input  CLR_sig
		.y(BRout) 	// output [N-1:0] y_sig
	);
	alu ALU
	(
		.A(MDI[3:0]) ,	// input [3:0] A_sig
		.B(MDO[3:0]) ,	// input [3:0] B_sig
		.S0(C12) ,	// input  S0_sig
		.S1(C13) ,	// input  S1_sig
		.R(ALUout) ,	// output [3:0] R_sig
		.OVR(OVR) ,	// output  OVR_sig
		.Cout(Cout) 	// output  Cout_sig
	);
	controlunit CU
	(
		.SysClock(~SysClock) ,	// input  SysClock_sig
		.StartStop(StartStop) ,	// input  StartStop_sig
		.SW(IRout) ,	// input [3:0] SW_sig
		.C0(C0) ,	// output  C0_sig
		.C1(C1) ,	// output  C1_sig
		.C2(C2) ,	// output  C2_sig
		.C3(C3) ,	// output  C3_sig
		.C4(C4) ,	// output  C4_sig
		.C7(C7) ,	// output  C7_sig
		.C8(C8) ,	// output  C8_sig
		.C9(C9) ,	// output  C9_sig
		.C5(C5) ,	// output  C5_sig
		.C10(C10) ,	// output  C10_sig
		.C11(C11) ,	// output  C11_sig
		.C12(C12) ,	// output  C12_sig
		.C13(C13) ,	// output  C13_sig
		.C14(C14) ,	// output  C14_sig
	);
	
	/*
	ORIGINAL INSTANTIATIONS
	piporeg IR (MDO[7:4], ~C7, StartStop, IRout);
	controlunit CU (~SysClock, StartStop, IRout, C0, C1, C2, C3, C4, C7, C8, C9, C5, C10, C11, C12, C13, C14);
	alu ALU(.A(MDI[3:0]), .S0(C12), .S1(C13), .B(MDO[3:0]), .R(ALUout), .OVR(OVR), .Cout(Cout));
	piporeg BufferReg(ALUout, ~C14, StartStop, BRout);
	accumulator ACC(MDO[3:0], BRout, ~C9, ~C11, ~C8, C10, MDI[3:0]);
	BinUp PC(~C2, ~C0, ~C1, MDO[3:0], ADDRbus);
	*/
	
	sevenseghex hex0(hex0in[3], hex0in[2], hex0in[1], hex0in[0], hex0out[0], hex0out[1], hex0out[2], hex0out[3], hex0out[4], hex0out[5], hex0out[6]);
	sevenseghex hex1(hex1in[3], hex1in[2], hex1in[1], hex1in[0], hex1out[0], hex1out[1], hex1out[2], hex1out[3], hex1out[4], hex1out[5], hex1out[6]);
	sevenseghex hex2(hex2in[3], hex2in[2], hex2in[1], hex2in[0], hex2out[0], hex2out[1], hex2out[2], hex2out[3], hex2out[4], hex2out[5], hex2out[6]);
	sevenseghex hex3(hex3in[3], hex3in[2], hex3in[1], hex3in[0], hex3out[0], hex3out[1], hex3out[2], hex3out[3], hex3out[4], hex3out[5], hex3out[6]);
	sevenseghex hex4(hex4in[3], hex4in[2], hex4in[1], hex4in[0], hex4out[0], hex4out[1], hex4out[2], hex4out[3], hex4out[4], hex4out[5], hex4out[6]);
	sevenseghex hex5(hex5in[3], hex5in[2], hex5in[1], hex5in[0], hex5out[0], hex5out[1], hex5out[2], hex5out[3], hex5out[4], hex5out[5], hex5out[6]);
endmodule 
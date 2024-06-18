// This program was cloned from: https://github.com/FIUSCIS-CDA/CPU_MultiCycle
// License: MIT License

// Copyright (C) 2020  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
// CREATED		"Mon Apr 29 17:54:45 2024"

module FSM(
	clk,
	reset,
	Funct,
	Op,
	NS
);


input wire	clk;
input wire	reset;
input wire	[5:0] Funct;
input wire	[5:0] Op;
output wire	[4:0] NS;

wire	notRESET;
wire	NS0beforeFF;
wire	NS1beforeFF;
wire	NS2beforeFF;
wire	NS3beforeFF;
wire	NS4beforeFF;
reg	[4:0] NS_ALTERA_SYNTHESIZED;
wire	Power;
wire	[4:0] Q;
wire	State0;
wire	State1;
wire	State10;
wire	State11;
wire	State12;
wire	State13;
wire	State14;
wire	State15;
wire	State2;
wire	State3;
wire	State4;
wire	State5;
wire	State6;
wire	State7;
wire	State8;
wire	State9;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_69;
wire	SYNTHESIZED_WIRE_16;
wire	SYNTHESIZED_WIRE_17;
wire	SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	SYNTHESIZED_WIRE_26;
wire	SYNTHESIZED_WIRE_27;
wire	SYNTHESIZED_WIRE_28;
wire	SYNTHESIZED_WIRE_29;
wire	SYNTHESIZED_WIRE_30;
wire	SYNTHESIZED_WIRE_31;
wire	SYNTHESIZED_WIRE_32;
wire	SYNTHESIZED_WIRE_33;
wire	SYNTHESIZED_WIRE_34;
wire	SYNTHESIZED_WIRE_35;
wire	SYNTHESIZED_WIRE_36;
wire	SYNTHESIZED_WIRE_37;
wire	SYNTHESIZED_WIRE_38;
wire	SYNTHESIZED_WIRE_39;
wire	SYNTHESIZED_WIRE_40;
wire	SYNTHESIZED_WIRE_41;
wire	SYNTHESIZED_WIRE_42;
wire	SYNTHESIZED_WIRE_43;
wire	SYNTHESIZED_WIRE_44;
wire	SYNTHESIZED_WIRE_45;
wire	SYNTHESIZED_WIRE_46;
wire	SYNTHESIZED_WIRE_47;
wire	SYNTHESIZED_WIRE_48;
wire	SYNTHESIZED_WIRE_49;
wire	SYNTHESIZED_WIRE_50;
wire	SYNTHESIZED_WIRE_51;
wire	SYNTHESIZED_WIRE_52;
wire	SYNTHESIZED_WIRE_53;
wire	SYNTHESIZED_WIRE_54;
wire	SYNTHESIZED_WIRE_55;
wire	SYNTHESIZED_WIRE_56;
wire	SYNTHESIZED_WIRE_57;
wire	SYNTHESIZED_WIRE_70;
wire	SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_62;
wire	SYNTHESIZED_WIRE_63;
wire	SYNTHESIZED_WIRE_64;
wire	SYNTHESIZED_WIRE_65;
wire	SYNTHESIZED_WIRE_66;
wire	SYNTHESIZED_WIRE_67;
wire	SYNTHESIZED_WIRE_68;

assign	SYNTHESIZED_WIRE_69 = 0;
assign	SYNTHESIZED_WIRE_70 = 1;




Encoder_32	b2v_inst(
	.A0(State0),
	.A1(State1),
	.A2(State2),
	.A3(State3),
	.A4(State4),
	.A5(State5),
	.A6(State6),
	.A7(State7),
	.A8(State8),
	.A9(State9),
	.A10(State10),
	.A11(State11),
	.A12(State12),
	.A13(State13),
	.A14(State14),
	.A15(State15),
	.A16(SYNTHESIZED_WIRE_0),
	.A17(SYNTHESIZED_WIRE_69),
	.A18(SYNTHESIZED_WIRE_69),
	.A19(SYNTHESIZED_WIRE_69),
	.A20(SYNTHESIZED_WIRE_69),
	.A21(SYNTHESIZED_WIRE_69),
	.A22(SYNTHESIZED_WIRE_69),
	.A23(SYNTHESIZED_WIRE_69),
	.A24(SYNTHESIZED_WIRE_69),
	.A25(SYNTHESIZED_WIRE_69),
	.A26(SYNTHESIZED_WIRE_69),
	.A27(SYNTHESIZED_WIRE_69),
	.A28(SYNTHESIZED_WIRE_69),
	.A29(SYNTHESIZED_WIRE_69),
	.A30(SYNTHESIZED_WIRE_69),
	.A31(SYNTHESIZED_WIRE_69),
	.Q(Q));

assign	notRESET =  ~reset;


S2	b2v_inst10(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_16));


LW	b2v_inst11(
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_17));

assign	State3 = SYNTHESIZED_WIRE_16 & SYNTHESIZED_WIRE_17;


S3	b2v_inst13(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(State4));


S2	b2v_inst14(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_18));


SW	b2v_inst15(
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_19));

assign	State5 = SYNTHESIZED_WIRE_18 & SYNTHESIZED_WIRE_19;


S1	b2v_inst17(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_20));


RTYPE	b2v_inst18(
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_21));

assign	State6 = SYNTHESIZED_WIRE_20 & SYNTHESIZED_WIRE_21;


S10	b2v_inst2(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_56));


S6	b2v_inst20(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_28));


ADD	b2v_inst21(
	.Funct(Funct),
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_22));


ANDD	b2v_inst22(
	.Funct(Funct),
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_24));


ORR	b2v_inst23(
	.Funct(Funct),
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_23));


SLL	b2v_inst24(
	.Functcode(Funct),
	.Opcode(Op),
	.Y(SYNTHESIZED_WIRE_25));


SLT	b2v_inst25(
	.Funct(Funct),
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_26));


SUB	b2v_inst26(
	.Funct(Funct),
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_27));

assign	SYNTHESIZED_WIRE_29 = SYNTHESIZED_WIRE_22 | SYNTHESIZED_WIRE_23 | SYNTHESIZED_WIRE_24 | SYNTHESIZED_WIRE_25 | SYNTHESIZED_WIRE_26 | SYNTHESIZED_WIRE_27;

assign	State7 = SYNTHESIZED_WIRE_28 & SYNTHESIZED_WIRE_29;


S1	b2v_inst29(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_30));


S0	b2v_inst3(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(State1));


BEQ	b2v_inst30(
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_31));

assign	State8 = SYNTHESIZED_WIRE_30 & SYNTHESIZED_WIRE_31;


S1	b2v_inst32(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_32));


J	b2v_inst33(
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_33));

assign	State9 = SYNTHESIZED_WIRE_32 & SYNTHESIZED_WIRE_33;


S2	b2v_inst35(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_34));

assign	SYNTHESIZED_WIRE_63 = SYNTHESIZED_WIRE_34 & SYNTHESIZED_WIRE_35;


S12	b2v_inst38(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_64));


S1	b2v_inst39(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_45));



S15	b2v_inst40(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_66));


S1	b2v_inst41(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_36));


BNE	b2v_inst42(
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_37));

assign	State11 = SYNTHESIZED_WIRE_36 & SYNTHESIZED_WIRE_37;


S1	b2v_inst44(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_38));

assign	State12 = SYNTHESIZED_WIRE_38 & SYNTHESIZED_WIRE_39;


S6	b2v_inst47(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_40));

assign	State13 = SYNTHESIZED_WIRE_40 & SYNTHESIZED_WIRE_41;


MULT	b2v_inst49(
	.Funct(Funct),
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_41));


S1	b2v_inst5(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_67));


S6	b2v_inst50(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_42));


MFLO	b2v_inst51(
	.Funct(Funct),
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_43));

assign	State14 = SYNTHESIZED_WIRE_42 & SYNTHESIZED_WIRE_43;


S4	b2v_inst53(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_51));


S5	b2v_inst54(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_50));


S7	b2v_inst55(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_49));


S8	b2v_inst56(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_54));


S9	b2v_inst57(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_53));


S11	b2v_inst58(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_52));


LUI	b2v_inst59(
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_44));


LW	b2v_inst6(
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_48));


S14	b2v_inst60(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_55));

assign	State15 = SYNTHESIZED_WIRE_44 & SYNTHESIZED_WIRE_45;


ADDI	b2v_inst62(
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_47));



assign	NS3beforeFF = notRESET & Q[3];

assign	NS2beforeFF = notRESET & Q[2];

assign	NS1beforeFF = notRESET & Q[1];

assign	NS0beforeFF = notRESET & Q[0];


always@(posedge clk or negedge Power or negedge Power)
begin
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[0] <= 0;
	end
else
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[0] <= 1;
	end
else
	begin
	NS_ALTERA_SYNTHESIZED[0] <= NS0beforeFF;
	end
end


SW	b2v_inst7(
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_46));


always@(posedge clk or negedge Power or negedge Power)
begin
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[3] <= 0;
	end
else
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[3] <= 1;
	end
else
	begin
	NS_ALTERA_SYNTHESIZED[3] <= NS3beforeFF;
	end
end


always@(posedge clk or negedge Power or negedge Power)
begin
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[2] <= 0;
	end
else
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[2] <= 1;
	end
else
	begin
	NS_ALTERA_SYNTHESIZED[2] <= NS2beforeFF;
	end
end


always@(posedge clk or negedge Power or negedge Power)
begin
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[1] <= 0;
	end
else
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[1] <= 1;
	end
else
	begin
	NS_ALTERA_SYNTHESIZED[1] <= NS1beforeFF;
	end
end

assign	NS4beforeFF = notRESET & Q[4];


always@(posedge clk or negedge Power or negedge Power)
begin
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[4] <= 0;
	end
else
if (!Power)
	begin
	NS_ALTERA_SYNTHESIZED[4] <= 1;
	end
else
	begin
	NS_ALTERA_SYNTHESIZED[4] <= NS4beforeFF;
	end
end

assign	SYNTHESIZED_WIRE_68 = SYNTHESIZED_WIRE_46 | SYNTHESIZED_WIRE_47 | SYNTHESIZED_WIRE_48;


ADDI	b2v_inst76(
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_35));


S1	b2v_inst77(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_62));

assign	State0 = SYNTHESIZED_WIRE_49 | SYNTHESIZED_WIRE_50 | SYNTHESIZED_WIRE_51 | SYNTHESIZED_WIRE_52 | SYNTHESIZED_WIRE_53 | SYNTHESIZED_WIRE_54 | SYNTHESIZED_WIRE_55 | SYNTHESIZED_WIRE_56 | SYNTHESIZED_WIRE_57 | SYNTHESIZED_WIRE_70 | SYNTHESIZED_WIRE_70 | SYNTHESIZED_WIRE_70;

assign	SYNTHESIZED_WIRE_0 = SYNTHESIZED_WIRE_61 & SYNTHESIZED_WIRE_62;


S13	b2v_inst8(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_57));


ORI	b2v_inst80(
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_61));


S16	b2v_inst81(
	.S(NS_ALTERA_SYNTHESIZED),
	.Y(SYNTHESIZED_WIRE_65));

assign	State10 = SYNTHESIZED_WIRE_63 | SYNTHESIZED_WIRE_64 | SYNTHESIZED_WIRE_65 | SYNTHESIZED_WIRE_66;


SLTI	b2v_inst83(
	.Op(Op),
	.Y(SYNTHESIZED_WIRE_39));

assign	State2 = SYNTHESIZED_WIRE_67 & SYNTHESIZED_WIRE_68;

assign	NS = NS_ALTERA_SYNTHESIZED;
assign	Power = 1;

endmodule

// This program was cloned from: https://github.com/ckugel/Reaction-Time-Game
// License: MIT License

// Copyright (C) 2023  Intel Corporation. All rights reserved.
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
// VERSION		"Version 22.1std.1 Build 917 02/14/2023 SC Standard Edition"
// CREATED		"Tue Apr 30 03:28:14 2024"

module divideByFiftyThousandCounter(
	Enable,
	Clock,
	ClockOut
);


input wire	Enable;
input wire	Clock;
output wire	ClockOut;

wire	SYNTHESIZED_WIRE_59;
wire	SYNTHESIZED_WIRE_60;
reg	SYNTHESIZED_WIRE_61;
wire	SYNTHESIZED_WIRE_62;
reg	SYNTHESIZED_WIRE_63;
wire	SYNTHESIZED_WIRE_64;
reg	SYNTHESIZED_WIRE_65;
wire	SYNTHESIZED_WIRE_66;
reg	TFF_inst3;
wire	SYNTHESIZED_WIRE_67;
reg	SYNTHESIZED_WIRE_68;
wire	SYNTHESIZED_WIRE_69;
reg	SYNTHESIZED_WIRE_70;
reg	TFF_inst25;
reg	SYNTHESIZED_WIRE_71;
wire	SYNTHESIZED_WIRE_72;
wire	SYNTHESIZED_WIRE_73;
wire	SYNTHESIZED_WIRE_74;
wire	SYNTHESIZED_WIRE_75;
reg	TFF_inst18;
reg	TFF_inst19;
wire	SYNTHESIZED_WIRE_76;
reg	TFF_inst80;
wire	SYNTHESIZED_WIRE_77;
wire	SYNTHESIZED_WIRE_31;
reg	TFF_inst20;
wire	SYNTHESIZED_WIRE_78;
wire	SYNTHESIZED_WIRE_79;
reg	TFF_inst1;
reg	TFF_inst2;
reg	TFF_inst16;
reg	TFF_inst6;

assign	ClockOut = TFF_inst25;
assign	SYNTHESIZED_WIRE_59 = 1;




always@(posedge Clock or negedge SYNTHESIZED_WIRE_60 or negedge SYNTHESIZED_WIRE_59)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	TFF_inst1 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_59)
	begin
	TFF_inst1 <= 1;
	end
else
	TFF_inst1 <= TFF_inst1 ^ SYNTHESIZED_WIRE_61;
end

assign	SYNTHESIZED_WIRE_64 = SYNTHESIZED_WIRE_62 & SYNTHESIZED_WIRE_63;



always@(posedge Clock or negedge SYNTHESIZED_WIRE_60 or negedge SYNTHESIZED_WIRE_59)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	SYNTHESIZED_WIRE_61 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_59)
	begin
	SYNTHESIZED_WIRE_61 <= 1;
	end
else
	SYNTHESIZED_WIRE_61 <= SYNTHESIZED_WIRE_61 ^ Enable;
end

assign	SYNTHESIZED_WIRE_76 = SYNTHESIZED_WIRE_64 & SYNTHESIZED_WIRE_65;

assign	SYNTHESIZED_WIRE_78 = SYNTHESIZED_WIRE_66 & TFF_inst3;

assign	SYNTHESIZED_WIRE_69 = SYNTHESIZED_WIRE_67 & SYNTHESIZED_WIRE_68;


always@(posedge Clock or negedge SYNTHESIZED_WIRE_60 or negedge SYNTHESIZED_WIRE_59)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	TFF_inst16 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_59)
	begin
	TFF_inst16 <= 1;
	end
else
	TFF_inst16 <= TFF_inst16 ^ SYNTHESIZED_WIRE_69;
end

assign	SYNTHESIZED_WIRE_60 = ~(SYNTHESIZED_WIRE_63 & SYNTHESIZED_WIRE_68 & SYNTHESIZED_WIRE_70 & TFF_inst25 & SYNTHESIZED_WIRE_65 & SYNTHESIZED_WIRE_71);


always@(posedge Clock or negedge SYNTHESIZED_WIRE_60 or negedge SYNTHESIZED_WIRE_59)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	TFF_inst18 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_59)
	begin
	TFF_inst18 <= 1;
	end
else
	TFF_inst18 <= TFF_inst18 ^ SYNTHESIZED_WIRE_72;
end


always@(posedge Clock or negedge SYNTHESIZED_WIRE_60 or negedge SYNTHESIZED_WIRE_59)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	TFF_inst19 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_59)
	begin
	TFF_inst19 <= 1;
	end
else
	TFF_inst19 <= TFF_inst19 ^ SYNTHESIZED_WIRE_73;
end


always@(posedge Clock or negedge SYNTHESIZED_WIRE_60 or negedge SYNTHESIZED_WIRE_59)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	TFF_inst2 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_59)
	begin
	TFF_inst2 <= 1;
	end
else
	TFF_inst2 <= TFF_inst2 ^ SYNTHESIZED_WIRE_74;
end


always@(posedge Clock or negedge SYNTHESIZED_WIRE_60 or negedge SYNTHESIZED_WIRE_59)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	TFF_inst20 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_59)
	begin
	TFF_inst20 <= 1;
	end
else
	TFF_inst20 <= TFF_inst20 ^ SYNTHESIZED_WIRE_75;
end

assign	SYNTHESIZED_WIRE_73 = SYNTHESIZED_WIRE_72 & TFF_inst18;

assign	SYNTHESIZED_WIRE_75 = SYNTHESIZED_WIRE_73 & TFF_inst19;

assign	SYNTHESIZED_WIRE_72 = SYNTHESIZED_WIRE_76 & TFF_inst80;


always@(posedge Clock or negedge SYNTHESIZED_WIRE_60 or negedge SYNTHESIZED_WIRE_59)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	SYNTHESIZED_WIRE_71 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_59)
	begin
	SYNTHESIZED_WIRE_71 <= 1;
	end
else
	SYNTHESIZED_WIRE_71 <= SYNTHESIZED_WIRE_71 ^ SYNTHESIZED_WIRE_77;
end


always@(posedge Clock or negedge SYNTHESIZED_WIRE_60 or negedge SYNTHESIZED_WIRE_59)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	TFF_inst25 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_59)
	begin
	TFF_inst25 <= 1;
	end
else
	TFF_inst25 <= TFF_inst25 ^ SYNTHESIZED_WIRE_31;
end

assign	SYNTHESIZED_WIRE_31 = SYNTHESIZED_WIRE_77 & SYNTHESIZED_WIRE_71;

assign	SYNTHESIZED_WIRE_77 = SYNTHESIZED_WIRE_75 & TFF_inst20;


always@(posedge Clock or negedge SYNTHESIZED_WIRE_60 or negedge SYNTHESIZED_WIRE_59)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	TFF_inst3 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_59)
	begin
	TFF_inst3 <= 1;
	end
else
	TFF_inst3 <= TFF_inst3 ^ SYNTHESIZED_WIRE_66;
end


always@(posedge Clock or negedge SYNTHESIZED_WIRE_60 or negedge SYNTHESIZED_WIRE_59)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	SYNTHESIZED_WIRE_70 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_59)
	begin
	SYNTHESIZED_WIRE_70 <= 1;
	end
else
	SYNTHESIZED_WIRE_70 <= SYNTHESIZED_WIRE_70 ^ SYNTHESIZED_WIRE_78;
end


always@(posedge Clock or negedge SYNTHESIZED_WIRE_60 or negedge SYNTHESIZED_WIRE_59)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	TFF_inst6 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_59)
	begin
	TFF_inst6 <= 1;
	end
else
	TFF_inst6 <= TFF_inst6 ^ SYNTHESIZED_WIRE_79;
end


always@(posedge Clock or negedge SYNTHESIZED_WIRE_60 or negedge SYNTHESIZED_WIRE_59)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	SYNTHESIZED_WIRE_63 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_59)
	begin
	SYNTHESIZED_WIRE_63 <= 1;
	end
else
	SYNTHESIZED_WIRE_63 <= SYNTHESIZED_WIRE_63 ^ SYNTHESIZED_WIRE_62;
end

assign	SYNTHESIZED_WIRE_74 = SYNTHESIZED_WIRE_61 & TFF_inst1;


always@(posedge Clock or negedge SYNTHESIZED_WIRE_60 or negedge SYNTHESIZED_WIRE_59)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	SYNTHESIZED_WIRE_68 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_59)
	begin
	SYNTHESIZED_WIRE_68 <= 1;
	end
else
	SYNTHESIZED_WIRE_68 <= SYNTHESIZED_WIRE_68 ^ SYNTHESIZED_WIRE_67;
end


always@(posedge Clock or negedge SYNTHESIZED_WIRE_60 or negedge SYNTHESIZED_WIRE_59)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	SYNTHESIZED_WIRE_65 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_59)
	begin
	SYNTHESIZED_WIRE_65 <= 1;
	end
else
	SYNTHESIZED_WIRE_65 <= SYNTHESIZED_WIRE_65 ^ SYNTHESIZED_WIRE_64;
end

assign	SYNTHESIZED_WIRE_66 = SYNTHESIZED_WIRE_74 & TFF_inst2;

assign	SYNTHESIZED_WIRE_79 = SYNTHESIZED_WIRE_78 & SYNTHESIZED_WIRE_70;


always@(posedge Clock or negedge SYNTHESIZED_WIRE_60 or negedge SYNTHESIZED_WIRE_59)
begin
if (!SYNTHESIZED_WIRE_60)
	begin
	TFF_inst80 <= 0;
	end
else
if (!SYNTHESIZED_WIRE_59)
	begin
	TFF_inst80 <= 1;
	end
else
	TFF_inst80 <= TFF_inst80 ^ SYNTHESIZED_WIRE_76;
end

assign	SYNTHESIZED_WIRE_62 = SYNTHESIZED_WIRE_69 & TFF_inst16;

assign	SYNTHESIZED_WIRE_67 = SYNTHESIZED_WIRE_79 & TFF_inst6;


endmodule

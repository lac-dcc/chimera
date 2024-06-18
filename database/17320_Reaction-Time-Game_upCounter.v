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
// CREATED		"Thu Apr 11 13:06:32 2024"

module upCounter(
	Enable,
	Clock,
	Q
);


input wire	Enable;
input wire	Clock;
output wire	[4:0] Q;

reg	[4:0] Q_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_3;





always@(posedge Clock)
begin
	Q_ALTERA_SYNTHESIZED[0] <= Q_ALTERA_SYNTHESIZED[0] ^ Enable;
end


always@(posedge Clock)
begin
	Q_ALTERA_SYNTHESIZED[1] <= Q_ALTERA_SYNTHESIZED[1] ^ SYNTHESIZED_WIRE_7;
end


always@(posedge Clock)
begin
	Q_ALTERA_SYNTHESIZED[2] <= Q_ALTERA_SYNTHESIZED[2] ^ SYNTHESIZED_WIRE_8;
end


always@(posedge Clock)
begin
	Q_ALTERA_SYNTHESIZED[3] <= Q_ALTERA_SYNTHESIZED[3] ^ SYNTHESIZED_WIRE_9;
end


always@(posedge Clock)
begin
	Q_ALTERA_SYNTHESIZED[4] <= Q_ALTERA_SYNTHESIZED[4] ^ SYNTHESIZED_WIRE_3;
end

assign	SYNTHESIZED_WIRE_7 = Enable & Q_ALTERA_SYNTHESIZED[0];

assign	SYNTHESIZED_WIRE_8 = SYNTHESIZED_WIRE_7 & Q_ALTERA_SYNTHESIZED[1];

assign	SYNTHESIZED_WIRE_9 = SYNTHESIZED_WIRE_8 & Q_ALTERA_SYNTHESIZED[2];

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_9 & Q_ALTERA_SYNTHESIZED[3];

assign	Q = Q_ALTERA_SYNTHESIZED;

endmodule

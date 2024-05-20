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
// CREATED		"Sat Apr 20 02:18:49 2024"

module testCounter(
	Clock,
	Enable,
	X
);


input wire	Clock;
input wire	Enable;
output wire	[3:0] X;

reg	[3:0] X_ALTERA_SYNTHESIZED;
wire	SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_12;





always@(posedge Clock or negedge SYNTHESIZED_WIRE_10)
begin
if (!SYNTHESIZED_WIRE_10)
	begin
	X_ALTERA_SYNTHESIZED[0] <= 0;
	end
else
	X_ALTERA_SYNTHESIZED[0] <= X_ALTERA_SYNTHESIZED[0] ^ Enable;
end

assign	SYNTHESIZED_WIRE_10 = ~(X_ALTERA_SYNTHESIZED[3] & SYNTHESIZED_WIRE_11);


always@(posedge Clock or negedge SYNTHESIZED_WIRE_10)
begin
if (!SYNTHESIZED_WIRE_10)
	begin
	X_ALTERA_SYNTHESIZED[3] <= 0;
	end
else
	X_ALTERA_SYNTHESIZED[3] <= X_ALTERA_SYNTHESIZED[3] ^ SYNTHESIZED_WIRE_3;
end

assign	SYNTHESIZED_WIRE_11 = Enable & X_ALTERA_SYNTHESIZED[0];

assign	SYNTHESIZED_WIRE_12 = SYNTHESIZED_WIRE_11 & X_ALTERA_SYNTHESIZED[1];

assign	SYNTHESIZED_WIRE_3 = SYNTHESIZED_WIRE_12 & X_ALTERA_SYNTHESIZED[2];


always@(posedge Clock or negedge SYNTHESIZED_WIRE_10)
begin
if (!SYNTHESIZED_WIRE_10)
	begin
	X_ALTERA_SYNTHESIZED[2] <= 0;
	end
else
	X_ALTERA_SYNTHESIZED[2] <= X_ALTERA_SYNTHESIZED[2] ^ SYNTHESIZED_WIRE_12;
end


always@(posedge Clock or negedge SYNTHESIZED_WIRE_10)
begin
if (!SYNTHESIZED_WIRE_10)
	begin
	X_ALTERA_SYNTHESIZED[1] <= 0;
	end
else
	X_ALTERA_SYNTHESIZED[1] <= X_ALTERA_SYNTHESIZED[1] ^ SYNTHESIZED_WIRE_11;
end

assign	X = X_ALTERA_SYNTHESIZED;

endmodule

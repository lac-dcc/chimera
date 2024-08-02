// This program was cloned from: https://github.com/silicon-vlsi/VLSI-2025
// License: MIT License

// Copyright (c) 2024 Silicon University, Bhubaneswar, India
// This is the RTL for the celcius project which reads the
// temperature from a LM70 temperature sensor using the 
// SPI protocol.

//DEFINES
//`define CLK_DIV	9'd511
//
// DO NOT CHANGE THIS MODULE PORTS
module celcius (
	input wire RSTN,	// Reset pin
	input wire CLK,		// FPGA CLOCK at 100MHz
	input wire SEL_CORF,	// 0-> CELCIUS, 1-> FAHRENHEIT
	//
	output reg SCK,		//SPI Clock
        output reg CS,		//SPI Chip slect
	input  wire SIO,	//SPI Data input from LM70
	//
	output reg [7:0] DATA_7SEG,	//DATA for 7-segment display
	output reg [1:0] SEL_7SEG	// Select LSB/MSB 7-seg display
	
);


endmodule

// This program was cloned from: https://github.com/nikita600/OPEN_SSF_CART
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: nikita600
// 
// Create Date:    21:24:48 04/13/2024 
// Design Name: 
// Module Name:    mapper 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mapper(
    input [1:23] cart_address,
    inout [0:15] cart_data,
	 
	 input ys, 			// VDP is currently drawing the backdrop colour.
	 input edclk, 		// External Dot Clock (~13.4 or 10.7 MHz).
	 input cas0, 		// Read or Write on $000000-$DFFFFF region.
	 input ceo, 		/*	Chip Enable for the cartridge.
								Normally low when accessing $000000-$3FFFFF region.
								When expension unit is present then low when accessing $400000-$7FFFFF.
							*/
	 input as, 			// Address strobe, address on bus is currently valid and not changing.
	 input vclk, 		// 68K Clock
	 output dtack, 	// Data acknowledge to 68K.
	 input cas2, 		// Read or Write on $E00000-$FFFFFF region, maybe (Upper 2MB).
	 input asel, 		// Read or Write on $000000-$7FFFFF region
	 input vres, 		// System reset, from front panel switch.
	 input lwr, 		// Lower byte WRite, the lower byte on the data lines should be written to the location in the address lines.
	 input uwr, 		// Upper byte WRite, the upper byte on the data lines should be written to the location in the address lines.
	 
	 input tme, 		/* Set for r/w at/to $A13000-$A130FF, given the name suggests it might be for a real time clock in the cartridge.
								This would enable usage as a chip enable on a RTC, using fewer address lines or logic to that RTC. Used in Sonic 3 for SRAM.
							*/
	 
	 output [0:25] rom_address,
	 inout [0:15] rom_data,
	 output [0:4] rom_ce,
	 output rom_oe,
	 
	 output sram_oe,
	 output sram_ce,
	 output sram_we
	 
    );

reg [0:7] banks;
reg [0:7] bank_clocks;

reg [0:7] bank1;
reg [0:7] bank2;
reg [0:7] bank3;
reg [0:7] bank4;
reg [0:7] bank5;
reg [0:7] bank6;
reg [0:7] bank7;

assign rom_address[18:25] = 
	banks[0:7] == 8'b00000001 ? 8'b00000000 :
	banks[0:7] == 8'b00000010 ? bank1 :
	banks[0:7] == 8'b00000100 ? bank2 :
	banks[0:7] == 8'b00001000 ? bank3 :
	banks[0:7] == 8'b00010000 ? bank4 :
	banks[0:7] == 8'b00100000 ? bank5 :
	banks[0:7] == 8'b01000000 ? bank6 :
	banks[0:7] == 8'b10000000 ? bank7 : 8'b00000000;
	
assign rom_address[0:17] = cart_address[1:18];

assign rom_data = cart_data;
assign rom_ce[0] = cas0;
assign rom_oe = ceo;

always @(*)
begin
	
	if (tme && lwr
		&& cart_address[4] && cart_address[5] 
		&& cart_address[6] && cart_address[7])
	begin
		case(cart_address[1:3])
			3'b000: bank_clocks <= 8'b00000001;
			3'b001: bank_clocks <= 8'b00000010;
			3'b010: bank_clocks <= 8'b00000100;
			3'b011: bank_clocks <= 8'b00001000;
			
			3'b100: bank_clocks <= 8'b00010000;
			3'b101: bank_clocks <= 8'b00100000;
			3'b110: bank_clocks <= 8'b01000000;
			3'b111: bank_clocks <= 8'b10000000;
			
			default: bank_clocks <= 8'b00000000;
		endcase
	end
	
	if (lwr && ceo)
	begin
		case(cart_address[19:21])
			3'b000: banks <= 8'b00000001;
			3'b001: banks <= 8'b00000010;
			3'b010: banks <= 8'b00000100;
			3'b011: banks <= 8'b00001000;
			
			3'b100: banks <= 8'b00010000;
			3'b101: banks <= 8'b00100000;
			3'b110: banks <= 8'b01000000;
			3'b111: banks <= 8'b10000000;
			
			default: banks <= 8'b00000000;
		endcase
	end
	
end

// SRAM


endmodule

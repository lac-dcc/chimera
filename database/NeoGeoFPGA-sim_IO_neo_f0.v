// This program was cloned from: https://github.com/neogeodev/NeoGeoFPGA-sim
// License: GNU General Public License v3.0

// NeoGeo logic definition (simulation only)
// Copyright (C) 2018 Sean Gonsalves
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

`timescale 1ns/1ns

module neo_f0(
	input nRESET,
	input nDIPRD0,
	input nDIPRD1,					// "IN3"
	input nBITWD0,
	input [7:0] DIPSW,
	input [7:4] M68K_ADDR,
	inout [7:0] M68K_DATA,
	input SYSTEMB,
	output [5:0] nSLOT,
	output SLOTA, SLOTB, SLOTC,
	output reg [2:0] LED_LATCH,
	output reg [7:0] LED_DATA,
	
	input RTC_DOUT, RTC_TP,
	output RTC_DIN, RTC_CLK, RTC_STROBE
	
	//output [3:0] EL_OUT,
	//output [8:0] LED_OUT1,
	//output [8:0] LED_OUT2
);

	reg [2:0] REG_RTCCTRL;
	reg [2:0] SLOTS;
	
	assign RTC_DIN = REG_RTCCTRL[0];
	assign RTC_CLK = REG_RTCCTRL[1];
	assign RTC_STROBE = REG_RTCCTRL[2];
	
	//PCB only:
	//These might have to be positive logic to match clock polarity of used chips
	//assign nLED_LATCH = (M68K_ADDR[6:4] == 3'b011) ? nBITWD0 : 1'b1;
	//assign nLED_DATA = (M68K_ADDR[6:4] == 3'b100) ? nBITWD0 : 1'b1;
	
	// REG_DIPSW $300001~?, odd bytes
	// REG_SYSTYPE $300081~?, odd bytes TODO (Test switch and stuff... Neutral for now)
	assign M68K_DATA = (nDIPRD0) ? 8'bzzzzzzzz :
								(M68K_ADDR[7]) ? 8'b11000000 :
								DIPSW;
	
	// REG_STATUS_A $320001~?, odd bytes TODO
	// nDIPRD1: Output IN300~IN304 to D0~D4, D5 ?, and CALTP/CALDOUT to D6/D7 TODO (Neutral switches + RTC ok for now)
	assign M68K_DATA = (nDIPRD1) ? 8'bzzzzzzzz :
									{RTC_DOUT, RTC_TP, 1'b1, 5'b11111};
	
	always @(nRESET, nBITWD0)
	begin
		if (!nRESET)
		begin
			SLOTS <= 3'b000;
			REG_RTCCTRL <= 3'b000;
		end
		else if (!nBITWD0)
		begin
			// DEBUG
			if (M68K_ADDR[6:4] == 3'b010)
				$display("SELECT SLOT %d", M68K_DATA[2:0]);
			else if (M68K_ADDR[6:4] == 3'b011)
				$display("SET LED LATCHES to %b", M68K_DATA[5:3]);
			else if (M68K_ADDR[6:4] == 3'b100)
				$display("SET LED DATA to %b", M68K_DATA[7:0]);
			else if (M68K_ADDR[6:4] == 3'b101)
				$display("SET RTCCTRL to %b", M68K_DATA[2:0]);
			
			case (M68K_ADDR[6:4])
				3'b010:
					SLOTS <= M68K_DATA[2:0];			// REG_SLOT $380021
				3'b011:
					LED_LATCH <= M68K_DATA[5:3];		// REG_LEDLATCHES $380031
				3'b100:
					LED_DATA <= M68K_DATA[7:0];		// REG_LEDDATA $380041
				3'b101:
					REG_RTCCTRL <= M68K_DATA[2:0];	// REG_RTCCTRL $380051
			endcase
		end
	end
	
	assign {SLOTC, SLOTB, SLOTA} = SYSTEMB ? SLOTS : 3'b000;	// Maybe not
	
	// TODO: check this
	assign nSLOT = SYSTEMB ? 
						(SLOTS == 3'b000) ? 6'b111110 :
						(SLOTS == 3'b001) ? 6'b111101 :
						(SLOTS == 3'b010) ? 6'b111011 :
						(SLOTS == 3'b011) ? 6'b110111 :
						(SLOTS == 3'b100) ? 6'b101111 :
						(SLOTS == 3'b101) ? 6'b011111 :
						6'b111111 :		// Invalid
						6'b111111 ;		// All slots disabled
	
endmodule

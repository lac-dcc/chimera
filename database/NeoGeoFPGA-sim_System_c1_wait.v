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

module c1_wait(
	input CLK_68KCLK, nAS,
	input nROM_ZONE, nPORT_ZONE, nCARD_ZONE,
	input nROMWAIT, nPWAIT0, nPWAIT1, PDTACK,
	output nDTACK
);

	reg [1:0] WAIT_CNT;
	
	//assign nPDTACK = ~(nPORT_ZONE | PDTACK);		// Really a NOR ? May stall CPU if PDTACK = GND

	assign nDTACK = nAS | |{WAIT_CNT};					// Is it nVALID instead of nAS ?
	
	//assign nCLK_68KCLK = ~nCLK_68KCLK;
	
	always @(negedge CLK_68KCLK)
	begin
		if (!nAS)
		begin
			// Count down only when nAS low
			if (WAIT_CNT) WAIT_CNT <= WAIT_CNT - 1'b1;
		end
		else
		begin
			if (!nROM_ZONE)
				WAIT_CNT <= ~nROMWAIT;				// 0~1 or 1~2 wait cycles ?
			else if (!nPORT_ZONE)
				WAIT_CNT <= ~{nPWAIT0, nPWAIT1};	// Needs checking
			else if (!nCARD_ZONE)
				WAIT_CNT <= 2;							// MAME and mvstech says so, to check
			else
				WAIT_CNT <= 0;
		end
	end
	
endmodule

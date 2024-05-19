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

module syslatch(
	input [4:1] M68K_ADDR,
	input nBITW1,
	input nRESET,
	output SHADOW, nVEC, nCARDWEN, CARDWENB, nREGEN, nSYSTEM, nSRAMWEN, PALBNK
);

	reg [7:0] SLATCH;
	
	assign SHADOW = SLATCH[0];
	assign nVEC = SLATCH[1];
	assign nCARDWEN = SLATCH[2];
	assign CARDWENB = SLATCH[3];
	assign nREGEN = SLATCH[4];
	assign nSYSTEM = SLATCH[5];
	assign nSRAMWEN = ~SLATCH[6];		// See MVS schematics page 3
	assign PALBNK = SLATCH[7];
	
	// System latch
	always @(M68K_ADDR[4:1] or nBITW1 or nRESET)
	begin
		if (!nRESET)
		begin
			if (nBITW1)
				SLATCH <= 8'b0;	// Clear
			else
			begin						// Demux mode
				case (M68K_ADDR[3:1])
					0: SLATCH <= {7'b0000000, M68K_ADDR[4]};
					1: SLATCH <= {6'b000000, M68K_ADDR[4], 1'b0};
					2: SLATCH <= {5'b00000, M68K_ADDR[4], 2'b00};
					3: SLATCH <= {4'b0000, M68K_ADDR[4], 3'b000};
					4: SLATCH <= {3'b000, M68K_ADDR[4], 4'b0000};
					5: SLATCH <= {2'b00, M68K_ADDR[4], 5'b00000};
					6: SLATCH <= {1'b0, M68K_ADDR[4], 6'b000000};
					7: SLATCH <= {M68K_ADDR[4], 7'b0000000};
				endcase
			end
		end
		else if (!nBITW1)
		begin							// Latch mode
			SLATCH[M68K_ADDR[3:1]] <= M68K_ADDR[4];
			
			// DEBUG
			if (M68K_ADDR[4:1] == 4'h0)
				$display("SYSLATCH: NOSHADOW");
			else if (M68K_ADDR[4:1] == 4'h1)
				$display("SYSLATCH: REG_SWPBIOS");
			else if (M68K_ADDR[4:1] == 4'h2)
				$display("SYSLATCH: REG_CRDUNLOCK1");
			else if (M68K_ADDR[4:1] == 4'h3)
				$display("SYSLATCH: REG_CRDLOCK2");
			else if (M68K_ADDR[4:1] == 4'h4)
				$display("SYSLATCH: REG_CRDREGSEL");
			else if (M68K_ADDR[4:1] == 4'h5)
				$display("SYSLATCH: REG_BRDFIX");
			else if (M68K_ADDR[4:1] == 4'h6)
				$display("SYSLATCH: REG_SRAMLOCK");
			else if (M68K_ADDR[4:1] == 4'h7)
				$display("SYSLATCH: REG_PALBANK1");
			else if (M68K_ADDR[4:1] == 4'h8)
				$display("SYSLATCH: REG_SHADOW");
			else if (M68K_ADDR[4:1] == 4'h9)
				$display("SYSLATCH: REG_SWPROM");
			else if (M68K_ADDR[4:1] == 4'hA)
				$display("SYSLATCH: REG_CRDLOCK1");
			else if (M68K_ADDR[4:1] == 4'hB)
				$display("SYSLATCH: REG_CRDUNLOCK2");
			else if (M68K_ADDR[4:1] == 4'hC)
				$display("SYSLATCH: REG_CRDNORMAL");
			else if (M68K_ADDR[4:1] == 4'hD)
				$display("SYSLATCH: REG_CRTFIX");
			else if (M68K_ADDR[4:1] == 4'hE)
				$display("SYSLATCH: REG_SRAMUNLOCK");
			else if (M68K_ADDR[4:1] == 4'hF)
				$display("SYSLATCH: REG_PALBANK0");
		end
	end
	
endmodule

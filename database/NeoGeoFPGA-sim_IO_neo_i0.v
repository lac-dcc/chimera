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

module neo_i0(
	// OR, AND gate and sync inverter are kept in neogeo.v
	input nRESET,
	input nCOUNTOUT,
	input [3:1] M68K_ADDR,
	input M68K_ADDR_7,
	output reg COUNTER1,
	output reg COUNTER2,
	output reg LOCKOUT1,
	output reg LOCKOUT2,
	input [15:0] PBUS,
	input PCK2B,
	output reg [15:0] G
);
	
	always @(posedge PCK2B)
		G <= {PBUS[11:0], PBUS[15:12]};
	
	// A7=Counter/lockout data
	// A1=1/2
	// A2=Counter/lockout

	always @(nCOUNTOUT, nRESET)
	begin
		if (!nRESET)
		begin
			COUNTER1 <= 1'b0;
			COUNTER2 <= 1'b0;
			LOCKOUT1 <= 1'b0;
			LOCKOUT2 <= 1'b0;
		end
		else
		begin
			if (!nCOUNTOUT)
			begin
				// DEBUG
				if ({M68K_ADDR_7, M68K_ADDR[3:1]} == 4'b0000)
					$display("COIN COUNTER 1 RESET");
				else if ({M68K_ADDR_7, M68K_ADDR[3:1]} == 4'b0001)
					$display("COIN COUNTER 2 RESET");
				else if ({M68K_ADDR_7, M68K_ADDR[3:1]} == 4'b0010)
					$display("COIN LOCKOUT 1 RESET");
				else if ({M68K_ADDR_7, M68K_ADDR[3:1]} == 4'b0011)
					$display("COIN LOCKOUT 2 RESET");
				else if ({M68K_ADDR_7, M68K_ADDR[3:1]} == 4'b1000)
					$display("COIN COUNTER 1 SET");
				else if ({M68K_ADDR_7, M68K_ADDR[3:1]} == 4'b1001)
					$display("COIN COUNTER 2 SET");
				else if ({M68K_ADDR_7, M68K_ADDR[3:1]} == 4'b1010)
					$display("COIN LOCKOUT 1 SET");
				else if ({M68K_ADDR_7, M68K_ADDR[3:1]} == 4'b1011)
					$display("COIN LOCKOUT 2 SET");
				
				if (M68K_ADDR[3:1] == 3'b000) COUNTER1 <= M68K_ADDR_7;
				if (M68K_ADDR[3:1] == 3'b001) COUNTER2 <= M68K_ADDR_7;
				if (M68K_ADDR[3:1] == 3'b010) LOCKOUT1 <= M68K_ADDR_7;
				if (M68K_ADDR[3:1] == 3'b011) LOCKOUT2 <= M68K_ADDR_7;
			end
		end
	end
	
endmodule

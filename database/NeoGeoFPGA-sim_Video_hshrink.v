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

module hshrink(
	input [3:0] SHRINK,	// Shrink value
	input CK, L,
	output OUTA, OUTB
);

	wire [3:0] nSHRINK;

	wire [3:0] U193_REG;
	wire [3:0] T196_REG;
	wire [3:0] U243_REG;
	wire [3:0] U226_REG;
	
	wire [3:0] U193_P;
	wire [3:0] T196_P;
	wire [3:0] U243_P;
	wire [3:0] U226_P;
	
	assign nSHRINK[3:0] = ~SHRINK[3:0];
	
	// Lookup
	assign U193_P[0] = ~&{nSHRINK[3:2]};
	assign U193_P[1] = ~&{nSHRINK[3:1]};
	assign U193_P[2] = ~&{nSHRINK[3], ~&{SHRINK[2:1]}};
	assign U193_P[3] = 1'b1;
	
	assign T196_P[0] = ~|{&{SHRINK[2], ~|{SHRINK[1:0], SHRINK[3]}}, ~|{SHRINK[3:2]}};
	assign T196_P[1] = ~&{nSHRINK[3:0]};
	assign T196_P[2] = ~&{~&{SHRINK[1:0]}, ~|{SHRINK[3:2]}};
	assign T196_P[3] = ~&{nSHRINK[3], ~&{SHRINK[2:0]}};
	
	assign U243_P[0] = ~|{nSHRINK[3], ~|{SHRINK[2:1]}};
	assign U243_P[1] = ~|{nSHRINK[3:2]};
	assign U243_P[2] = ~|{nSHRINK[3:1]};
	assign U243_P[3] = SHRINK[3];
	
	assign U226_P[0] = ~&{~&{SHRINK[1:0], nSHRINK[2], SHRINK[3]}, ~&{SHRINK[3:2]}};
	assign U226_P[1] = &{SHRINK[3:0]};
	assign U226_P[2] = ~|{nSHRINK[3], ~|{SHRINK[2:0]}};
	assign U226_P[3] = ~|{~&{SHRINK[3:2]}, ~|{SHRINK[1:0]}};

	// Shift registers
	FS2 U193(CK, U193_P, 1'b1, ~L, U193_REG);
	BD3 T193A(U193_REG[3], T193A_OUT);
	FS2 T196(CK, T196_P, T193A_OUT, ~L, T196_REG);
	
	FS2 U243(CK, U243_P, 1'b1, ~L, U243_REG);
	BD3 U258A(U243_REG[3], U258A_OUT);
	FS2 U226(CK, U226_P, U258A_OUT, ~L, U226_REG);
	
	assign OUTA = T196_REG[3];
	assign OUTB = U226_REG[3];
	
	/*always@(*)
	begin
		case (SHRINK)
			4'h0: BITMAP <= 16'b0000000010000000;
			4'h1: BITMAP <= 16'b0000100010000000;
			4'h2: BITMAP <= 16'b0000100010001000;
			4'h3: BITMAP <= 16'b0010100010001000;
			4'h4: BITMAP <= 16'b0010100010001010;
			4'h5: BITMAP <= 16'b0010101010001010;
			4'h6: BITMAP <= 16'b0010101010101010;
			4'h7: BITMAP <= 16'b1010101010101010;
			4'h8: BITMAP <= 16'b1010101011101010;
			4'h9: BITMAP <= 16'b1011101011101010;
			4'hA: BITMAP <= 16'b1011101011101011;
			4'hB: BITMAP <= 16'b1011101111101011;
			4'hC: BITMAP <= 16'b1011101111101111;
			4'hD: BITMAP <= 16'b1111101111101111;
			4'hE: BITMAP <= 16'b1111101111111111;
			4'hF: BITMAP <= 16'b1111111111111111;
		endcase
	end*/

endmodule

// This program was cloned from: https://github.com/chipsalliance/yosys-f4pga-plugins
// License: Apache License 2.0

// Copyright 2020-2022 F4PGA Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0

//////////////////////////
//      arithmetic      //
//////////////////////////

(* techmap_celltype = "$alu" *)
module _80_quicklogic_alu (A, B, CI, BI, X, Y, CO);

	parameter A_SIGNED = 0;
	parameter B_SIGNED = 0;
	parameter A_WIDTH = 1;
	parameter B_WIDTH = 1;
	parameter Y_WIDTH = 1;

	input [A_WIDTH-1:0] A;
	input [B_WIDTH-1:0] B;
	output [Y_WIDTH-1:0] X, Y;

	input CI, BI;
	output [Y_WIDTH-1:0] CO;

	wire [1024:0] _TECHMAP_DO_ = "splitnets CARRY; clean";

        (* force_downto *)
        wire [Y_WIDTH-1:0] A_buf, B_buf;
        \$pos #(.A_SIGNED(A_SIGNED), .A_WIDTH(A_WIDTH), .Y_WIDTH(Y_WIDTH)) A_conv (.A(A), .Y(A_buf));
        \$pos #(.A_SIGNED(B_SIGNED), .A_WIDTH(B_WIDTH), .Y_WIDTH(Y_WIDTH)) B_conv (.A(B), .Y(B_buf));

        (* force_downto *)
        wire [Y_WIDTH-1:0] AA = A_buf;
        (* force_downto *)
        wire [Y_WIDTH-1:0] BB = BI ? ~B_buf : B_buf;
	wire [Y_WIDTH: 0 ] CARRY;

	assign CO[Y_WIDTH-1:0] = CARRY[Y_WIDTH:1];
	// Due to VPR limitations regarding IO connexion to carry chain,
	// we generate the carry chain input signal using an intermediate adder
	// since we can connect a & b from io pads, but not cin & cout
	generate
	     adder intermediate_adder (
	       .cin     ( ),
	       .cout    (CARRY[0]),
	       .a       (CI     ),
	       .b       (CI     ),
	       .sumout  (      )
	     );

	     adder first_adder (
	       .cin     (CARRY[0]),
	       .cout    (CARRY[1]),
	       .a       (AA[0]  ),
	       .b       (BB[0]  ),
	       .sumout  (Y[0]   )
	     );
	endgenerate

	genvar i;
	generate for (i = 1; i < Y_WIDTH ; i = i+1) begin:gen3
	     adder my_adder (
	       .cin     (CARRY[i]  ),
	       .cout    (CARRY[i+1]),
	       .a       (AA[i]     ),
	       .b       (BB[i]     ),
	       .sumout  (Y[i]      )
	     );
	end endgenerate
	assign X = AA ^ BB;
endmodule


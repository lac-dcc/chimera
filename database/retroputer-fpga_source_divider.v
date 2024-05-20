// This program was cloned from: https://github.com/kerrishotts/retroputer-fpga
// License: MIT License

/* OBTAINED FROM:
 * https://github.com/varkenvarken/robin/blob/master/SoC/divider.v
 *
 * ORIGINAL FOLLOWS:
 *
 * robin, a SoC design for the IceBreaker board.
 *
 * divider.v : a 32 bit integer division module
 *
 * Copyright 2019,2020 Michel Anders
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License. 
 */
 
 module divider(
    input clk,
    input reset,
	input [31:0] a,
	input [31:0] b,
	input go,
	input divs,
	input remainder,
	output [31:0] c,
	output is_zero,
	output is_negative,
	output reg available
	);

	localparam DIV_SHIFTL    = 2'd0;
	localparam DIV_SUBTRACT  = 2'd1;
	localparam DIV_AVAILABLE = 2'd2;
	localparam DIV_DONE      = 2'd3;
	reg [1:0] step;

	reg [32:0] dividend;
	reg [32:0] divisor;
	reg [32:0] quotient, quotient_part;
	wire overshoot = divisor > dividend;
	wire division_by_zero = (b == 0);
	// for signed division the sign of the remainder is always equal 
	// to the sign of the dividend (a) while the sign of the quotient
	// is equal to the product of the sign of dividend and divisor
	// this to keep the following realation true
	// quotient * divisor + remainder == dividend
	wire signq = a[31] ^ b[31];
	wire sign = remainder ? a[31] : signq ;
	reg [31:0] result;
	wire [31:0] abs_a = a[31] ? -a : a;
	wire [31:0] abs_b = b[31] ? -b : b;

	always @(posedge clk) begin
		if(go) begin
			// on receiving the go signal we initializer all registers
			// we take care of taking the absolute values for
			// dividend and divisor. We skip any calculations of a
			// quotient if the divisor is zero.
			step <= division_by_zero ? DIV_AVAILABLE : DIV_SHIFTL;
			available <= 0;
			dividend  <= divs ? {1'b0, abs_a} : {1'b0, a};
			divisor   <= divs ? {1'b0, abs_b} : {1'b0, b};
			quotient  <= 0;
			quotient_part <= 1;
		end else
			case(step)
				// as long as the divisor is smaller than the dividend
				// we multiply the divisor and the quotient_part by 2
				// If no longer true, we correct by shifting everything
				// back. This means registers should by 33 bit instead
				// of 32 to accommodate the shifts.
				DIV_SHIFTL	: 	begin
									if(~overshoot) begin
										divisor <= divisor << 1;
										quotient_part <= quotient_part << 1;
									end else begin
										divisor <= divisor >> 1;
										quotient_part <= quotient_part >> 1;
										step <= DIV_SUBTRACT;
									end
								end
				// the next state is all about subtracting the divisor
				// if it is smaller than the dividend. If it is, we
				// perform the subtraction and or in the quotient_part
				// into the quotient. Then divisor and quotient_part
				// are halved again until the quotient_part is zero, in
				// which case we are done.
				DIV_SUBTRACT:	begin
									if(quotient_part == 0)
										step <= DIV_AVAILABLE;
									else begin
										if(~overshoot) begin
											dividend <= dividend - divisor;
											quotient <= quotient | quotient_part;
										end 
										divisor <= divisor >> 1;
										quotient_part <= quotient_part >> 1;
									end
								end
				// we signal availability of the result (for one clock)
				// to the cpu and set the result to the chosen option.
				DIV_AVAILABLE:	begin
									step <= DIV_DONE;
									available <= 1;
									result <= remainder ? dividend[31:0] : quotient[31:0];
								end
				default		: 	available <= 0;
			endcase
	end

	// these wires make sure that the correct sign correction is applied
	// and the relevant flags are returned.
	assign c = divs ? (sign ? -result : result) : result;
	assign is_zero = (c == 0);
	assign is_negative = c[31];

endmodule
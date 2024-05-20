// This program was cloned from: https://github.com/adelfi172/Registers---Verilog
// License: GNU General Public License v3.0

/* ***************************************************************************************
 * Module Name: ShiftRight (Logical Shift Right Register)
 * Description: Implements a logical shift right register that shifts the input data
 *              to the right by one bit position. This module performs a logical shift,
 *              meaning it shifts zeros into the most significant bit regardless of the
 *              sign of the original number. It is particularly useful for bit manipulation
 *              tasks where arithmetic considerations are not required.
 *
 * Author: Pereira, Rodrigo
 * Creation Date: 06/05/2024
 * Revision: Version 1.0
 *
 * Inputs:
 *     clk_i_i  - System clock.
 *     rst_i    - Reset signal that resets the register.
 *     data_i 	- Input data to be shifted.
 *
 * Outputs:
 *     data_o 	- Output data after shifting right.
 * 
 * Parameter:
 *     N 		- Parameterizable N size
 *
 * Notes:
 *	   This shift register does not preserve the sign bit, making it suitable for 
 *	   unsigned binary numbers.
 *     This module is useful for testing and rapid prototyping in embedded systems.
 * *************************************************************************************/
module ShiftRight
#(parameter N = 8)
(
	clk_i, 
	rst_i, 
	data_i, 
	data_o
);

input wire clk_i;
input wire rst_i;
input wire [N-1:0] data_i;

output [N-1:0] data_o;
reg [N-1:0] shift_reg;

always @(posedge clk_i or posedge rst_i) 
begin        
	if (rst_i) shift_reg <= {N-1{1'b0}};
    else shift_reg <= data_i >> 1; // Shift right operation
end

assign data_o = shift_reg;

endmodule

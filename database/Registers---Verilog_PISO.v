// This program was cloned from: https://github.com/adelfi172/Registers---Verilog
// License: GNU General Public License v3.0

/* ***************************************************************************************
 * Module Name: Parameterizable PISO (Parallel-In Serial-Out Shift Register)
 * Description: Implements a Parallel-In Serial-Out shift register that receives
 *              data parallely and shifts it out serially. Used for data manipulation
 *              in applications requiring data serialization.
 *
 * Author: Pereira, Rodrigo
 * Creation Date: 06/05/2024
 * Revision: Version 1.0
 *
 * Inputs:
 *     clk_i      - System clock.
 *     rst_i      - Reset signal that resets the register.
 *     parallel_i - Parallel input data.
 *	   load_i	  - Load data
 *
 * Outputs:
 *     serial_o   - Serial output of shifted data.
 * 
 * Parameter:
 *     N 		  - Parameterizable N size
 *
 * Notes:
 *     This module is useful for testing and rapid prototyping in embedded systems.
 * *************************************************************************************/

module PISO
#(parameter N = 8)
(
	clk_i, 
	rst_i, 
	load_i, 
	parallel_i, 
	serial_o
);

input wire clk_i;
input wire rst_i;
input wire load_i;
input wire [N-1:0] parallel_i;

output serial_o;
reg [N-1:0] shift_reg;

always @(posedge clk_i or posedge rst_i) 
begin
    if (rst_i) shift_reg <= {N-1{1'b0}};
    else 
		if (load_i) shift_reg <= parallel_i;
    else shift_reg <= {shift_reg[N-2:0], 1'b0};
end

assign serial_o = shift_reg[7];

endmodule
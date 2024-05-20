// This program was cloned from: https://github.com/adelfi172/Registers---Verilog
// License: GNU General Public License v3.0

/* ***************************************************************************************
 * Module Name: Parameterizable SIPO (Serial-In Parallel-Out Shift Register)
 * Description: Implements a Serial-In Parallel-Out shift register that receives
 *              data serially and shifts it out parallely. Used for data manipulation
 *              in applications requiring data serialization.
 *
 * Author: Pereira, Rodrigo
 * Creation Date: 06/05/2024
 * Revision: Version 1.0
 *
 * Inputs:
 *     clk_i      - System clock.
 *     rst_i      - Reset signal that resets the register.
 *     serial_i   - Serial input data.
 *
 * Outputs:
 *     parallel_o - Parallel output of shifted data.
 * 
 * Parameter:
 *     N 		  - Parameterizable N size
 *
 * Notes:
 *     This module is useful for testing and rapid prototyping in embedded systems.
 * *************************************************************************************/
module SIPO
#(parameter N = 8)
(
	clk_i, 
	rst_i, 
	serial_i, 
	parallel_o
);

input wire clk_i;
input wire rst_i;
input wire serial_i;

output wire [N-1:0] parallel_o;
reg [N-1:0] shift_reg;

always @(posedge clk_i or posedge rst_i) 
begin
    if (rst_i) shift_reg <= {N-1{1'b0}};
    else shift_reg <= {shift_reg[N-2:0], serial_i};
end

assign parallel_o = shift_reg;
endmodule
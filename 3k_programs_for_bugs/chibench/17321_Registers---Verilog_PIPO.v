// This program was cloned from: https://github.com/adelfi172/Registers---Verilog
// License: GNU General Public License v3.0

/* ***************************************************************************************
 * Module Name: Parameterizable PIPO (Parallel-In Parallel-Out Shift Register)
 * Description: Implements a Parallel-In Parallel-Out shift register that receives
 *              data parallely and shifts it out Parallel. Used for data manipulation
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
 *     parallel_o - Parallel output of shifted data.
 * 
 * Parameter:
 *     N 		  - Parameterizable N size
 *
 * Notes:
 *     This module is useful for testing and rapid prototyping in embedded systems.
 * *************************************************************************************/
module PIPO
#(parameter N = 8)
(
	clk_i, 
	rst_i, 
	parallel_i, 
	parallel_o
);

input wire clk_i; 
input wire rst_i;
input wire [N-1:0] parallel_i;

output [N-1:0] parallel_o;
reg [N-1:0] shift_reg;

always @(posedge clk_i or posedge rst_i) 
begin
    if (rst_i) shift_reg <= {N-1{1'b0}};
    else shift_reg <= parallel_i;
end

assign parallel_o = shift_reg;

endmodule

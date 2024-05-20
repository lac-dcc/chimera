// This program was cloned from: https://github.com/adelfi172/Registers---Verilog
// License: GNU General Public License v3.0

/* ***********************************************************************************
 * Module Name: Parameterizable SISO (Serial-In Serial-Out Shift Register)
 * Description: Implements a Serial-In Serial-Out shift register that receives
 *              data serially and shifts it out serially. Used for data manipulation
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
 *     serial_o   - Serial output of shifted data.
 *
 * Parameter:
 *     N 		  - Parameterizable N size
 *
 * Notes:
 *     This module is useful for testing and rapid prototyping in embedded systems.
 * *********************************************************************************/
module SISO
#(parameter N = 8)
(
	clk_i, 
	rst_i, 
	serial_i, 
	serial_o
);

input clk_i, rst_i, serial_i;
    
output serial_o;
reg [N-1:0] shift_reg;

always @(posedge clk_i or posedge rst_i) 
begin
    if (rst_i) shift_reg <= {N-1{1'b0}};
    else shift_reg <= {shift_reg[N-2:0], serial_i};
end

assign serial_o = shift_reg[N-1];

endmodule
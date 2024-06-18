// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License


// -----------------------------------------------------------------------------
/* Description:
	instruction register
The registers are used to store instructions sent from the data bus 
into either the high 8-bit or low 8-bit registers.

The ena signal is used to control whether to register or not.

Each instruction is two bytes, 16 bits, the high 3 bits are the opcode and 
the low 13 bits are the address (the CPU address bus is 13 bits and the addressing space is 8K bytes).

The data bus of this design is 8 bits, and each instruction needs to be fetched twice, 
first the high 8 bits and then the low 8 bits.

*/
// Version: 0.1
// -----------------------------------------------------------------------------
module register (
	input clk,    // Clock
	input rst,  // Asynchronous reset active high
	
	input [7:0] data,
	input 		ena ,

	output reg [15:0] opc_iraddr
);
	reg state ;

	// If load_ir from machine actived, load instruction data from rom in 2 clock periods.
    // Load high 8 bits first, and then low 8 bits.

	always @(posedge clk) begin : proc_opc_iraddr
		if(rst) begin
			opc_iraddr <= 16'b 0000_0000_0000_0000;
			state      <= 1'b0 ;
		end else if (ena) begin
			case (state)
				1'b0 : begin
					opc_iraddr[15:8] <= data ;
					state			 <= 1'b1 	 ;
				end
				1'b1 : begin
					opc_iraddr[7:0] <= data ;
					state			<= 1'b0 	;
				end
				default : begin 
					opc_iraddr [ 15 : 0 ] <= 16'bxxxx_xxxx_xxxx_xxxx; 
					state <= 1'bx; 
				end
			endcase
		end else begin
			state <= 1'b0 ;
		end
	end

endmodule
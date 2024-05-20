// This program was cloned from: https://github.com/huangxc6/verilog_practice
// License: MIT License


// -----------------------------------------------------------------------------
/* Description:
	generate clk
*/
// Version: 0.1
// -----------------------------------------------------------------------------

module clk_gen (
	input clk,    // Clock
	input rst,    // Asynchronous reset active high

	output reg fetch , // 8 frequence division
	output reg alu_en  // Arithmetic enable 	
);
	reg [7 : 0] state ;

	parameter IDLE = 8'b0000_0000;
	parameter S1 = 8'b0000_0001;
	parameter S2 = 8'b0000_0010;
	parameter S3 = 8'b0000_0100;
	parameter S4 = 8'b0000_1000;
	parameter S5 = 8'b0001_0000;
	parameter S6 = 8'b0010_0000;
	parameter S7 = 8'b0100_0000;
	parameter S8 = 8'b1000_0000;

	always @(posedge clk or negedge rst) begin
		if (rst == 1'b1) begin
			state  <= IDLE ;
			fetch  <= 1'b0 ;
			alu_en <= 1'b0 ;
		end
		else begin
			case (state)
				IDLE : state <= S1 ;
				S1: begin
					alu_en <= 1'b1 ;
					state  <= S2   ;
				end
				S2: begin
					alu_en <= 1'b0 ;
					state  <= S3   ;
				end
				S3: begin
					fetch  <= 1'b1 ;
					state  <= S4   ;
				end
				S4: state <= S5	   ;
				S5: state <= S6	   ;
				S6: state <= S7	   ;
				S7: begin
					fetch  <= 1'b0 ;
					state  <= S8   ;
				end
				S8: state <= S1    ;
				default : state <= IDLE;
			endcase
		end
	end

endmodule
// This program was cloned from: https://github.com/adam-maj/tt06
// License: Apache License 2.0

`default_nettype none

module alu (
	input wire clk,
	input wire reset,
	input wire [1:0] alu_arithmetic_mux,
	input wire [3:0] rs,
	input wire [3:0] rt,
	output reg [3:0] alu_out
);
	localparam ADD = 2'b00;
	localparam SUB = 2'b01;
	localparam MUL = 2'b10;
	localparam DIV = 2'b11;

	always @(posedge clk) begin 
		if (!reset) begin 
			alu_out <= 8'b00000000;
        end else begin
            case (alu_arithmetic_mux)
                ADD: alu_out <= rs + rt;
                SUB: alu_out <= rs - rt;
                MUL: alu_out <= rs * rt;
                DIV: alu_out <= rs / rt;
            endcase
		end
    end
endmodule

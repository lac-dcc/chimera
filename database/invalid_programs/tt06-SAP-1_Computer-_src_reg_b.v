// This program was cloned from: https://github.com/kevinwguan/tt06-SAP-1_Computer-
// License: Apache License 2.0

`default_nettype none
`timescale 1ns/1ps
module reg_b(
    input 	clk,
    input 	rst,
    input 	load,
    input[7:0] 	bus,
    output[7:0] out
    );

    reg[7:0] reg_b;
    
    always @(posedge clk) begin
    	if (rst) begin
   	    reg_b <= 8'b0;
    	end else if (load) begin
    	    reg_b <= bus;
    	end
    end
    
    assign out = reg_b;

endmodule

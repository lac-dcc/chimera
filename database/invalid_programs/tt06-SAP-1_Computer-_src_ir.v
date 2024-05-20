// This program was cloned from: https://github.com/kevinwguan/tt06-SAP-1_Computer-
// License: Apache License 2.0

`default_nettype none
`timescale 1ns/1ps
module ir(
    input 	clk,
    input 	rst,
    input 	load,
    input[7:0] 	bus,
    output[7:0] out
    );

    reg[7:0] ir;

    always @(posedge clk) begin
    	if (rst) begin
            ir <= 8'b0;
    	end else if (load) begin
    	    ir <= bus;
    	end
    end
    
    assign out = ir;

endmodule


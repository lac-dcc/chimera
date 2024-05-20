// This program was cloned from: https://github.com/kevinwguan/tt06-SAP-1_Computer-
// License: Apache License 2.0

`default_nettype none
`timescale 1ns/1ps
module pc(
    input	clk,
    input 	rst,
    input 	inc,
    output[7:0] out
    );

    reg[3:0] pc;
    
    always @(posedge clk) begin
    	if (rst) begin
    	    pc <= 4'b0;
    	end else if (inc) begin
    	    pc <= pc + 1;
    	end
    end
    
    assign out = pc;

endmodule


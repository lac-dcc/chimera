// This program was cloned from: https://github.com/kevinwguan/tt06-SAP-1_Computer-
// License: Apache License 2.0

`default_nettype none
`timescale 1ns/1ps
module memory(
    input 	clk,
    input 	rst,
    input 	load,
    input[7:0] 	bus,
    output[7:0] out
    );

    reg[3:0] mar;
    reg[7:0] rom[0:15];
    
    
    initial begin
    
    	rom[0] = 8'h0D;
    	rom[1] = 8'h1E;
    	rom[2] = 8'h2F;
    	rom[3] = 8'hF0;
    	rom[4] = 8'h00;
    	rom[5] = 8'h00;
    	rom[6] = 8'h00;
    	rom[7] = 8'h00;
    	rom[8] = 8'h00;
    	rom[9] = 8'h00;
    	rom[10] = 8'h00;
    	rom[11] = 8'h00;
    	rom[12] = 8'h00;
    	rom[13] = 8'h03;
    	rom[14] = 8'h04;
    	rom[15] = 8'h02;
    
    end
    
    always @(posedge clk) begin
    	if (rst) begin
    	    mar <= 4'b0;
    	end else if (load) begin
    	    mar <= bus[3:0];
    	end
    end
    
    assign out = rom[mar];

endmodule

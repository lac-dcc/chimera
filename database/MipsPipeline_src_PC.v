// This program was cloned from: https://github.com/TCL606/MipsPipeline
// License: MIT License

`timescale 1ns / 1ps

module PC(clk, reset, PC_i, PC_o);
    //Input Clock Signals
    input reset;             
    input clk;
    //Input PC             
    input [31:0] PC_i;
    //Output PC  
    output reg [31:0] PC_o; 
    
    initial begin
        PC_o <= 0;
    end

    always@(posedge reset or posedge clk)
    begin
        if(reset) begin
            PC_o <= 0;
        end else begin
            PC_o <= PC_i;
        end
    end
endmodule
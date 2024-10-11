// This program was cloned from: https://github.com/tongplw/HW-Syn-Lab
// License: MIT License

`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2020 09:37:28 PM
// Design Name: 
// Module Name: binaryCounter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module binaryCounter(
    output reg[3:0] outputs,
    output reg cout,
    output reg bout,
    input wire up,
    input wire down,
    input wire set9,
    input wire set0,
    input wire clk
    );
    
initial outputs = 0;


always@(posedge clk)
begin 
    cout = 0;
    bout = 0;
    outputs = outputs + up;
    outputs = outputs - down;
    
    case({set9, set0})
        2'b10: outputs = 1;
        2'b01: outputs = 0;
    endcase
    
    case(outputs)
        4'b0010: // A overflow
            begin
                outputs = 0;
                cout = 1;
            end 
        4'b1111: // F underflow
            begin
                outputs = 1;
                bout = 1;
            end
    endcase
end

endmodule

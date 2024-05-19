// This program was cloned from: https://github.com/tongplw/HW-Syn-Lab
// License: MIT License

`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2020 10:29:11 PM
// Design Name: 
// Module Name: bcd
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


module bcd(
    output reg[3:0] outputs,
    output reg cout,
    output reg bout,
    input wire up, down, set9, set0, clk
    );
    
initial outputs = 0;


always@(posedge clk)
begin 
    cout = 0;
    bout = 0;
    outputs = outputs + up;
    outputs = outputs - down;
    
    case({set9, set0})
        2'b10: outputs = 9;
        2'b01: outputs = 0;
    endcase
    case(outputs)
        4'b1010: // A overflow
            begin
                outputs = 0;
                cout = 1;
            end 
        4'b1111: // F underflow
            begin
                outputs = 9; 
                bout = 1;
            end
    endcase
end

endmodule

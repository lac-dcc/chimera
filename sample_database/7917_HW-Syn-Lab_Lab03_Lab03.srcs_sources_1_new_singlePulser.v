// This program was cloned from: https://github.com/tongplw/HW-Syn-Lab
// License: MIT License

`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/16/2020 07:45:31 PM
// Design Name: 
// Module Name: singlePulser
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


module singlePulser(
    output reg debouncedBtn,
    input rawBtn,
    input clk
    );

reg state;

initial state = 0;

always@(posedge clk)
begin
    debouncedBtn = 0;
    case({rawBtn, state})
//        2'b00,
        2'b01: state = 0;
        2'b10: 
            begin
                state = 1;
                debouncedBtn = 1;
            end
//        2'b11,
    endcase
end

    
endmodule

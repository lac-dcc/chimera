`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/24 17:46:52
// Design Name: 
// Module Name: ALU
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


module ALU#(
    parameter REGISTER_LEN = 10
)
(
    input [3:0]                 Cal_value   ,    
    input [2:0]                 OP          ,
    input [REGISTER_LEN-1:0]    A           ,
    input [REGISTER_LEN-1:0]    B           ,
    output reg [REGISTER_LEN:0] R

    );


    always @ (*) begin
    case (OP)
        3'b001:R <= A < B ? 1: 0;
        3'b000:R <= A;
        3'b010:R <= A + Cal_value;
        3'b011:R <= A - Cal_value;
        3'b100:R <= A + B;
        3'b101:R <= A - B;
        3'b110:R <= A & B;
        3'b111:R <= A | B;   
        default: R <= A;
    endcase
    end


endmodule

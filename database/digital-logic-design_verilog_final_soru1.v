`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2022 10:31:10 PM
// Design Name: 
// Module Name: soru1
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

module soru1 
(
input [4:0] number1_i,
input [4:0] number2_i,
output reg [8:0] mult_o
);

reg [7:0] num1, num2, num3, num4;

//        - - - -
//        - - - -
//        ________
//        - - - -
//      - - - - 0
//    - - - - 0 0
//  - - - - 0 0 0
// _______________

always@(*) begin
    mult_o[8] = number1_i[4] ^ number2_i[4]; 
end

always @(*) begin

    num1 = 0;
    num2 = 0;
    num3 = 0;
    num4 = 0;

    if (number2_i[0] == 1'b1) begin
        num1[3:0] = number1_i[3:0];
    end
    if (number2_i[1] == 1'b1) begin
        num2[4:1] = number1_i[3:0];
    end
    if (number2_i[2] == 1'b1) begin
        num3[5:2] = number1_i[3:0];
    end
    if (number2_i[3] == 1'b1) begin
        num4[6:3] = number1_i[3:0];
    end

    mult_o[7:0] = num1 + num2 + num3 + num4;

end

endmodule
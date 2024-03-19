`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:54:43 04/30/2018 
// Design Name: 
// Module Name:    ALU_TOP 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU_TOP(AB_SW,ALU_OP,F_LED_SW,LED);
 input[2:0] AB_SW,ALU_OP,F_LED_SW;
 output[7:0] LED;
 wire[2:0] AB_SW,ALU_OP,F_LED_SW;
 wire[31:0] A,B,F;
 wire ZF,OF;
 wire[7:0] LED;
 data_test M1(AB_SW,A,B);
 OP M2(A,B,F,ZF,OF,ALU_OP);
 LED_choice M3(F_LED_SW,LED,F,ZF,OF);
 endmodule
 
 
 
 




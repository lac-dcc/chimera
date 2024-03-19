`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:48 04/30/2018 
// Design Name: 
// Module Name:    LED_choice 
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
module LED_choice(F_LED_SW,LED,F,ZF,OF);
input[31:0] F;
input ZF,OF;
input[2:0] F_LED_SW;
output[7:0] LED;
reg[7:0] LED;
wire[31:0] F;
wire[2:0] F_LED_SW;
wire ZF,OF;
always@(*)
begin
 case(F_LED_SW)
 3'b000:LED=F[7:0];
 3'b001:LED=F[15:8];
 3'b010:LED=F[23:16];
 3'b011:LED=F[31:24];
 default:begin LED[7]=ZF;LED[0]=OF;LED[6:1]=6'b0;end
 endcase
 end
 endmodule




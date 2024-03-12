`timescale 1ns / 1ps
module Universal_shift_reg(O , clk , clear , S , I);

input clk , clear ;
input [2 : 0] S ; 
input [3 : 0] I; 
output [3 : 0] O;
wire [3 : 0] D_temp;

Mux_8_to_1 inst1(D_temp[0] , S , O[0] , 1'b0 , O[1] , I[0] , ~O[0] , O[3] , O[1] , O[2]);
Mux_8_to_1 inst2(D_temp[1] , S , O[1] , O[0] , O[2] , I[1] , ~O[1] , O[0] , O[2] , O[3]);
Mux_8_to_1 inst3(D_temp[2] , S , O[2] , O[1] , O[3] , I[2] , ~O[2] , O[1] , O[3] , O[0]);
Mux_8_to_1 inst4(D_temp[3] , S , O[3] , O[2] , 1'b0 , I[3] , ~O[3] , O[2] , O[0] , O[1]);

D_FlipFlop D_inst1(O[0] , D_temp[0] , clk , clear);
D_FlipFlop D_inst2(O[1] , D_temp[1] , clk , clear);
D_FlipFlop D_inst3(O[2] , D_temp[2] , clk , clear);
D_FlipFlop D_inst4(O[3] , D_temp[3] , clk , clear);

endmodule

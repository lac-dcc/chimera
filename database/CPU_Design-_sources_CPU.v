// This program was cloned from: https://github.com/mmohamedkhaled/CPU_Design-
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps


module CPU(input clk, rst, output [7:0] w_data);

wire [5:0] addr;
CounterNBitMod #(6,6) BIT(clk,rst,1'b1,addr);
wire [25:0] instructions;
wire [7:0] A_data, B_data;
wire [7:0] B;
wire [7:0] Result_Out;
wire ZFlag;
ROM rom(addr,instructions);
wire [7:0] data1;
regFile reg1(.clk(clk),.rst(rst),.A_addr(instructions[25:22]),
.B_addr(instructions[21:18]),
.W_addr(instructions[17:14]),
.wr(instructions[13]),
.A_data(A_data),
.B_data(B_data),
.W_data(w_data));
ALU alu(A_data,B,instructions[10:8],Result_Out,ZFlag);

assign B=(instructions[11]==0)? B_data : data1;

assign w_data=(instructions[12]==0)?Result_Out:instructions[7:0];


//module regFile
//(clk, rst, A_data, B_data, W_data, A_addr, B_addr, W_addr, wr);
endmodule

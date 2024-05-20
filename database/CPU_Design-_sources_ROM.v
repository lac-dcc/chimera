// This program was cloned from: https://github.com/mmohamedkhaled/CPU_Design-
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps


module ROM (input [5:0] addr, output [25:0] data_out);
reg [25:0] mem [0:63];
assign data_out = mem[addr];
initial begin
 mem[0]= 26'b0000_0000_0000_1_1_0_000_01111100;
 mem[1]= 26'b0000_0000_0001_1_1_0_000_00011100;
 mem[2]= 26'b0000_0000_0010_1_1_0_000_11000111;
 mem[3]= 26'b0000_0001_1010_1_0_0_111_00000000;
 mem[4]= 26'b0000_0010_1011_1_0_0_110_00000000;
 mem[5]= 26'b1010_1011_1100_1_0_0_000_00000000;
end
endmodule

// This program was cloned from: https://github.com/chandana38/RISCVerse
// License: MIT License

`timescale 1ns / 1ps
module fetch#(
parameter data_width = 32)
(input clk,
input rst,
output reg [data_width-1:0] instr_reg_fetch,
output reg [data_width-1:0] pc_fetch,
output reg [data_width-1:0] npc_fetch);

reg [7:0] instr_mem [16383:0];

always@(posedge clk or negedge rst)
begin
	if(!rst)
	begin
		instr_reg_fetch <= 32'h0;
		pc_fetch <= 32'h0;
		npc_fetch <= 32'h0;
	end
	else
	begin
		pc_fetch <= npc_fetch;
		npc_fetch <= npc_fetch + 4;
		instr_reg_fetch <= {instr_mem[pc_fetch+3],instr_mem[pc_fetch+2],instr_mem[pc_fetch+1],instr_mem[pc_fetch]};
	end
end
endmodule

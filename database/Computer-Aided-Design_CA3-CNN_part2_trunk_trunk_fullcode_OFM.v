// This program was cloned from: https://github.com/kasrahj/Computer-Aided-Design
// License: MIT License

module Ofm(clk,rst, address, wrData, wren);
	input clk;
	input rst;
	input[7:0] address;
	input[7:0] wrData;
	input wren;

	reg [7:0] mem[0:127][0:3];

	integer i, j;
	always@(posedge clk, posedge rst)
	begin
		if(rst)begin   
			for (i = 0; i < 127; i = i + 1)
          		for (j = 0; j < 4; j = j + 1)
            		mem[i][j] <= 8'h00;
		end
		else if(wren)
		begin
			mem[address / 4][address % 4] <= wrData;
		end
	end

endmodule








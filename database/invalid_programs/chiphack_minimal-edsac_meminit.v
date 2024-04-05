module meminit #(parameter ABITS=9) (
	input clk,
	input rst,
	output [ABITS-1:0] memaddr,
	output [15:0] memwdata,
	output memwr,
	input memwait
);

	localparam IDLE=0, WRITING=1, ENDADDR=37;
	reg state = IDLE ;
	assign memwr = (state == WRITING);

	always @(posedge clk)
	if (rst) begin
		memaddr <= 0;
		state <= WRITING;
	end else case (state)
	IDLE:	;
	WRITING: 
		if (~memwait) begin
			if (memaddr == ENDADDR)
				state <= IDLE;
			else
				memaddr <= memaddr + 1;
		end
	endcase

/* initial orders */
	always case (memaddr)
		0:  memwdata = (("T"-"@")<<11) | 30;
		1:  memwdata = (("T"-"@")<<11) | 32;
		2:  memwdata = (("T"-"@")<<11) | 31;
		3:  memwdata = (("I"-"@")<<11) | 0;
		4:  memwdata = (("S"-"@")<<11) | 33;
		5:  memwdata = (("G"-"@")<<11) | 3;
		6:  memwdata = (("L"-"@")<<11) | 11;
		7:  memwdata = (("T"-"@")<<11) | 30;
		8:  memwdata = (("I"-"@")<<11) | 0;
		9:  memwdata = (("S"-"@")<<11) | 34;
		10: memwdata = (("G"-"@")<<11) | 8;
		11: memwdata = (("T"-"@")<<11) | 32;
		12: memwdata = (("A"-"@")<<11) | 31;
		13: memwdata = (("V"-"@")<<11) | 35;
		14: memwdata = (("L"-"@")<<11) | 16;
		15: memwdata = (("A"-"@")<<11) | 32;
		16: memwdata = (("T"-"@")<<11) | 31;
		17: memwdata = (("I"-"@")<<11) | 0;
		18: memwdata = (("S"-"@")<<11) | 34;
		19: memwdata = (("E"-"@")<<11) | 11;
		20: memwdata = (("T"-"@")<<11) | 0;
		21: memwdata = (("A"-"@")<<11) | 31;
		22: memwdata = (("A"-"@")<<11) | 30;
		23: memwdata = (("T"-"@")<<11) | 37;
		24: memwdata = (("A"-"@")<<11) | 23;
		25: memwdata = (("A"-"@")<<11) | 36;
		26: memwdata = (("U"-"@")<<11) | 23;
		27: memwdata = (("S"-"@")<<11) | 37;
		28: memwdata = (("G"-"@")<<11) | 1;
		29: memwdata = (("E"-"@")<<11) | 37;
		30: memwdata = (("@"-"@")<<11) | 0;
		31: memwdata = (("@"-"@")<<11) | 0;
		32: memwdata = (("@"-"@")<<11) | 0;
		33: memwdata = (("@"-"@")<<11) | 64;
		34: memwdata = (("@"-"@")<<11) | 48;
		35: memwdata = (("@"-"@")<<11) | 10;
		36: memwdata = (("@"-"@")<<11) | 1;
		37: memwdata = (("@"-"@")<<11) | 0;
	endcase

endmodule


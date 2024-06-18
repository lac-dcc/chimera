// This program was cloned from: https://github.com/huangxc6/Software_Hardware_Co-Design_24Spring
// License: MIT License

//Name: busmux
//Function: 
//	 	select which reg push to bus
//Author: caojian

//Rout, Gout, DINout, R0, R1, R2, R3, G, DIN, BusWires
//only R0~R3

module busmux
#(parameter REG_NUM = 4, DATAWIDTH = 6)
(
	input      [REG_NUM-1:0]   Rout,
	input                      Gout, DINout,
	input      [DATAWIDTH-1:0] R0, R1, R2, R3, G, DIN,
	output reg [DATAWIDTH-1:0] BusWires
);

	wire[REG_NUM+1:0] Sel;

	assign Sel = {Rout, Gout, DINout};

	always@(*)
	begin
		if(Sel == 'b100_000)
			BusWires = R0;
		else if(Sel == 'b010_000)
			BusWires = R1;
		else if(Sel == 'b001_000)
			BusWires = R2;
		else if(Sel == 'b000_100)
			BusWires = R3;
		else if(Sel == 'b000_010)
			BusWires = G;
		else BusWires = DIN;
	end

endmodule //end of busmux
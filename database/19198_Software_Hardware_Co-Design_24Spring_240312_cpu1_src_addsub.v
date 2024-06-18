// This program was cloned from: https://github.com/huangxc6/Software_Hardware_Co-Design_24Spring
// License: MIT License

//Name: Add Sub
//Function: 
//	 	AddSub = 0 Add
//      AddSub = 1 Sub
//Author: caojian

module addsub
#(parameter DATAWIDTH = 6)
(
	input 					   AddSub,
	input      [DATAWIDTH-1:0] A,
	input 	   [DATAWIDTH-1:0] BusWires,

	output reg [DATAWIDTH-1:0] Sum
);

	always@(*) begin
		if(!AddSub)
			Sum = A + BusWires;
		else
			Sum = A - BusWires;
	end

endmodule //end of addsub

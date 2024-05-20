// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 8-bit BARREL SHIFTER BEHAVIORAL
************************************************/

module barrel_bh(Out,In,Lr,n);

	input [7:0]In;
	input [2:0]n;
	input Lr;
	output reg [7:0]Out;

	always@(*) begin
		if(Lr)
			Out = In << n;
		else
			Out = In >> n;
	end // always@(*)

endmodule
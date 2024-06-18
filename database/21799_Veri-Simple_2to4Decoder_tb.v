// This program was cloned from: https://github.com/Mariam-Katamashvili/Veri-Simple
// License: MIT License

module tb();
	reg [1:0] inp;
	wire [3:0] outp;

	decoder2_4 circuit(
		.in(inp),
		.out(outp)
	);

	initial begin
		inp = 0;
		#5;
		inp = 1;
		#5;
		inp = 2;
		#5;
		inp = 3;
		#5;
	end 
endmodule 
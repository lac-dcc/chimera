// This program was cloned from: https://github.com/rolo-g/TRISC-Processor
// License: MIT License

//Rolando Rosales 1001850424 - HW8 P1 parametrized 4-bit two-to-one mux

module twoto1mux #(parameter N = 4)
(
	input [N-1:0] A, B,
	input AB,
	output [N-1:0] Y
);
	assign Y = AB == 0 ? A : B;
endmodule 
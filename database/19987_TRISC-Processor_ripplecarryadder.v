// This program was cloned from: https://github.com/rolo-g/TRISC-Processor
// License: MIT License

//Rolando Rosales 1001850424 - Two's Complement Ripple Carry Adder/Subtractor w/ Overflow Detection
module ripplecarryadder (
	input [3:0] A, B,
	input C0,
	output [3:0] S,
	output OVR, Cout);
	wire [4:1] C;
	fulladder s0 (A[0], C0^B[0], C0, S[0], C[1]);
	fulladder s1 (A[1], C0^B[1], C[1], S[1], C[2]);
	fulladder s2 (A[2], C0^B[2], C[2], S[2], C[3]);
	fulladder s3 (A[3], C0^B[3], C[3], S[3], C[4]);
		assign Cout = C[4];
		assign OVR = C[3]^C[4];
endmodule 
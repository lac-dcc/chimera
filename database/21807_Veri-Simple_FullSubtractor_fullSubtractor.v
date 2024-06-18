// This program was cloned from: https://github.com/Mariam-Katamashvili/Veri-Simple
// License: MIT License

module fullSubtractor (a, b, c, bout, diff); //define the variables
input a, b, c; //inputs
output bout, diff; //outputs
	assign bout = ((~a)&b) | (~(a^b)&c); //equation for bout
	assign diff = a ^ b ^ c;//eqaution for diff
endmodule

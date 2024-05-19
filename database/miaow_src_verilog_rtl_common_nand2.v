// This program was cloned from: https://github.com/VerticalResearchGroup/miaow
// License: BSD 3-Clause "New" or "Revised" License

module nand2 (in1,in2,out);
input in1,in2;
output out;
assign out = ~(in1 & in2);
endmodule

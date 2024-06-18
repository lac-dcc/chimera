// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module nand_gate(a,b,y);
input a,b;
output y;
nand(y,a,b);
endmodule
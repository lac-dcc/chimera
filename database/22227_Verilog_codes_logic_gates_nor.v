// This program was cloned from: https://github.com/Aryavardhan37/Verilog_codes
// License: MIT License

module nor_gate(a,b,y);
input a,b;
output y;
nor(y,a,b);
endmodule
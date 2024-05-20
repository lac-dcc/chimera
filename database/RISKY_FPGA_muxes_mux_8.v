// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module mux_8(output out, input a, b, c, d, e, f, g, h, s0, s1, s2);
wire s1bar;
wire s0bar;
wire s2bar;
assign s1bar=~s1;
assign s0bar=~s0;
assign s2bar=~s2;
assign out = (a & s2bar & s1bar & s0bar) | (b & s2bar & s1bar & s0) | (c & s2bar & s1 & s0bar) + (d & s2bar & s1 & s0) + (e & s2 & s1bar & s0bar) + (f & s2 & s1bar & s0) + (g & s2 & s1 & s0bar) + (h & s2 & s1 & s0);
endmodule

// This program was cloned from: https://github.com/chicken8848/RISKY
// License: MIT License

module mux_2 (a, b, s, out);

output out;
input a, b, s;

assign out=(s)?b:a;

endmodule

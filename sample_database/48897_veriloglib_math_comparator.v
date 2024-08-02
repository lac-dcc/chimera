// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module comparator
#(parameter WIDTH = 8)
(
    input [WIDTH-1:0] A, B,
    output equal, greater, lesser
);

assign equal = (A == B)? 1 : 0;
assign greater = (A > B)? 1 : 0;
assign lesser = (A < B)? 1 : 0;

endmodule
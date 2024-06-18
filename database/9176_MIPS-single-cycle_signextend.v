// This program was cloned from: https://github.com/the-pinbo/MIPS-single-cycle
// License: MIT License

module signextend (input [15 : 0] in, output [31 : 0] out);
    assign out ={{16 {in [ 15 ]}}, in};
endmodule
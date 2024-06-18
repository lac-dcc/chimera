// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module (
    input [7:0] in,
    output [31:0] out );//

    assign out = { {24{in[7]}}  , in};

endmodule
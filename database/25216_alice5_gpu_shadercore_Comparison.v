// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// RISC-V IMF decoder
module Comparison
    #(parameter DATA_WIDTH=32) 
(
    input wire [DATA_WIDTH-1:0] v1,
    input wire [DATA_WIDTH-1:0] v2,

    input wire compare_equal,
    input wire compare_not_equal,
    input wire compare_less_than,
    input wire compare_greater_equal,
    input wire compare_less_than_unsigned,
    input wire compare_greater_equal_unsigned,

    output wire result
);

    assign result =
        compare_equal ? (v1 == v2) :
        compare_not_equal ? !(v1 == v2) :
        compare_less_than ? ($signed(v1) < $signed(v2)) :
        compare_greater_equal ? ($signed(v1) >= $signed(v2)) :
        compare_less_than_unsigned ? ($unsigned(v1) < $unsigned(v2)) :
        compare_greater_equal_unsigned ? ($unsigned(v1) >= $unsigned(v2)) :
        1'b0;

endmodule


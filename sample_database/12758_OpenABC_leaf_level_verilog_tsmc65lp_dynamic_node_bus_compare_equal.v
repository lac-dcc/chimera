// This program was cloned from: https://github.com/NYU-MLDA/OpenABC
// License: BSD 3-Clause "New" or "Revised" License

module bus_compare_equal (a, b, bus_equal);
    parameter WIDTH = 8;
    parameter BHC = 10;

    input [WIDTH-1:0] a, b;
    output wire bus_equal;

    assign bus_equal = (a==b) ? 1'b1 : 1'b0;
endmodule
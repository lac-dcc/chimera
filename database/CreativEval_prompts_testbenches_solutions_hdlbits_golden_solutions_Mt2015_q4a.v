// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module (input x, input y, output z);
    assign z = (x ^ y) & x;
endmodule
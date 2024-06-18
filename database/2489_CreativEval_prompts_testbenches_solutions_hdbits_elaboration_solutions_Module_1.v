// This program was cloned from: https://github.com/matthewdelorenzo/CreativEval
// License: BSD 3-Clause "New" or "Revised" License

module top_module ( input a, input b, output out );
    mod_a instance1(.out(out), .in1(a), .in2(b));
endmodule
// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module ( input a, input b, output out );
    mod_a MOD_A(a, b, out);
endmodule
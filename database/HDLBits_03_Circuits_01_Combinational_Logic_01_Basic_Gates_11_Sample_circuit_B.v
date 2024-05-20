// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module ( input x, input y, output z );
    assign z = !(x^y);
endmodule

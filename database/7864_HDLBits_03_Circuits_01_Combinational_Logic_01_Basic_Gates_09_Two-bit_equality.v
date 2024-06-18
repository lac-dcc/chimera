// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module ( input [1:0] A, input [1:0] B, output z ); 

    assign z = (A==B);
    
endmodule

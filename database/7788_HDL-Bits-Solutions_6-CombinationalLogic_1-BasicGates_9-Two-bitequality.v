// This program was cloned from: https://github.com/viduraakalanka/HDL-Bits-Solutions
// License: The Unlicense

module top_module ( input [1:0] A, input [1:0] B, output z ); 
    assign z = (A==B);

endmodule

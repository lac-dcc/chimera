// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module (
    input [7:0] in,
    output parity); 
    
    assign parity = ^ in[7:0];

endmodule
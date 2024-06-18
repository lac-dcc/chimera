// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module ( input clk, input d, output q );
    wire one, two;
    
    my_dff my_dff1(clk, d, one);
    my_dff my_dff2(clk, one, two);
    my_dff my_dff3(clk, two, q);

endmodule
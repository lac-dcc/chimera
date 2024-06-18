// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    
    wire one, two, three, four;
    assign one = p2a && p2b;
    assign two = p2c && p2d;
    
    assign three = p1a && p1b && p1c;
    assign four = p1d && p1e && p1f;
    
    assign p2y = one || two;
    assign p1y = three || four;

endmodule
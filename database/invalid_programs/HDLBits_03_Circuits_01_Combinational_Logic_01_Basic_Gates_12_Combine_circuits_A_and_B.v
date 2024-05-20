// This program was cloned from: https://github.com/matthlud/HDLBits
// License: Apache License 2.0

module a (input x, input y, output z);
    assign z = (x^y) & x;
endmodule


module b ( input x, input y, output z );
    assign z = !(x^y);
endmodule

module top_module (input x, input y, output z);
    
    wire z1, z2, z3, z4;
    
    a ia1
    (
        .x(x),
        .y(y),
        .z(z1),
    );
    
    a ia2
    (
        .x(x),
        .y(y),
        .z(z2),
    );
    
    b ib1
    (
        .x(x),
        .y(y),
        .z(z3),
    );
    
    b ib2
    (
        .x(x),
        .y(y),
        .z(z4),
    );
    
    assign z = ((z1|z2)^(z3&z4));

endmodule

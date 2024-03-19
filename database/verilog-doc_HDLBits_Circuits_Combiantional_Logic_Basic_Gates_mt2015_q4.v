module top_module (input x, input y, output z);
    wire z1,z2,z3,z4,out1,out2;
    A ins1(x,y,z1);
    B ins2(x,y,z2);
    A ins3(x,y,z3);
    B ins4(x,y,z4);
    assign out1 = z1 | z2;
    assign out2 = z3 & z4;
    assign z = out1 ^ out2;
endmodule

module A(input x, input y, output z);
    assign z = (x^y) & x;
endmodule

module B ( input x, input y, output z );
    assign z = ~(x^y);
endmodule


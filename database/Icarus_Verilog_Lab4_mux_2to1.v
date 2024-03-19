`ifndef MUX_2to1
`define MUX_2to1
module mux_2to1( out, sel, in1, in2 );
    
    output out;
    input in1, in2;
    input sel;
    wire not_sel, and1, and2;

    // out = (~sel & in1) | (sel & in2);
    not( not_sel, sel);
    and( and1, not_sel, in1);
    and( and2, sel, in2);
    or( out, and1, and2);

endmodule
`endif
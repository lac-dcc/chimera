
module pad_inout(
    inout   pad,
    input   pad_ena,
    input   to_pad,
    output  from_pad
    );

    assign pad = pad_ena ? to_pad : 1'bz;
    assign from_pad = pad;

endmodule

module pad_in(
    input   pad,
    output  from_pad
    );

    assign from_pad = pad;
    
endmodule

module pad_out(
    output  pad,
    input   to_pad
    );

    assign pad = to_pad;
    
endmodule

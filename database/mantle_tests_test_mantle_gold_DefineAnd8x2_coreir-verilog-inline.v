module And8x2 (
    input [1:0] I0,
    input [1:0] I1,
    input [1:0] I2,
    input [1:0] I3,
    input [1:0] I4,
    input [1:0] I5,
    input [1:0] I6,
    input [1:0] I7,
    output [1:0] O
);
assign O = {& ({I7[1],I6[1],I5[1],I4[1],I3[1],I2[1],I1[1],I0[1]}),& ({I7[0],I6[0],I5[0],I4[0],I3[0],I2[0],I1[0],I0[0]})};
endmodule


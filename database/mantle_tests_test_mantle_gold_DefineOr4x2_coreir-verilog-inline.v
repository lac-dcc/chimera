module Or4x2 (
    input [1:0] I0,
    input [1:0] I1,
    input [1:0] I2,
    input [1:0] I3,
    output [1:0] O
);
assign O = {| ({I3[1],I2[1],I1[1],I0[1]}),| ({I3[0],I2[0],I1[0],I0[0]})};
endmodule


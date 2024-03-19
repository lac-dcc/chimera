module And4x4 (
    input [3:0] I0,
    input [3:0] I1,
    input [3:0] I2,
    input [3:0] I3,
    output [3:0] O
);
assign O = {& ({I3[3],I2[3],I1[3],I0[3]}),& ({I3[2],I2[2],I1[2],I0[2]}),& ({I3[1],I2[1],I1[1],I0[1]}),& ({I3[0],I2[0],I1[0],I0[0]})};
endmodule


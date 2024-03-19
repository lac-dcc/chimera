module HalfAdder (
    input I,
    input CIN,
    output O,
    output COUT
);
assign O = I ^ CIN;
assign COUT = I & CIN;
endmodule


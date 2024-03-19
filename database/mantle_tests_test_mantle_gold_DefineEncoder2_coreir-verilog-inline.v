module Or1xNone (
    input I0,
    output O
);
assign O = | I0;
endmodule

module Encoder2 (
    input [1:0] I,
    output [0:0] O
);
Or1xNone Or1xNone_inst0 (
    .I0(I[1]),
    .O(O)
);
endmodule


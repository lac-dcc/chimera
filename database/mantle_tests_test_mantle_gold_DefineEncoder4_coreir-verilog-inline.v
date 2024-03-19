module Encoder4 (
    input [3:0] I,
    output [1:0] O
);
assign O = {I[2] | I[3],I[1] | I[3]};
endmodule


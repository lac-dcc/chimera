// This program was cloned from: https://github.com/drom/quark
// License: MIT License

module mux16 #( parameter W = 1 ) (
    sel,
    i1111,
    i1110,
    i1101,
    i1100,
    i1011,
    i1010,
    i1001,
    i1000,
    i0111,
    i0110,
    i0101,
    i0100,
    i0011,
    i0010,
    i0001,
    i0000,
    o
);

input [3:0] sel;
input [W-1:0]
    i1111,
    i1110,
    i1101,
    i1100,
    i1011,
    i1010,
    i1001,
    i1000,
    i0111,
    i0110,
    i0101,
    i0100,
    i0011,
    i0010,
    i0001,
    i0000;

output [W-1:0] o;

reg [W-1:0] o;

always @ (
    sel,
    i1111,
    i1110,
    i1101,
    i1100,
    i1011,
    i1010,
    i1001,
    i1000,
    i0111,
    i0110,
    i0101,
    i0100,
    i0011,
    i0010,
    i0001,
    i0000
) begin
    case (sel)
    0:  o = i0000;
    1:  o = i0001;
    2:  o = i0010;
    3:  o = i0011;
    4:  o = i0100;
    5:  o = i0101;
    6:  o = i0110;
    7:  o = i0111;
    8:  o = i1000;
    9:  o = i1001;
    10: o = i1010;
    11: o = i1011;
    12: o = i1100;
    13: o = i1101;
    14: o = i1110;
    default o = i1111;
    endcase
end

endmodule

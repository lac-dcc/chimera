module test (
    input wire [7 : 0] i,
    output wire [7 : 0] o
);
test_1 anon_1(.i(i[7:0]), .o(o[7:0]));
endmodule
module test_1 (
    input wire [7 : 0] i,
    output wire [7 : 0] o
);
m_1_1 anon_1_1(.i(i[7:0]), .o(o[7:0]));
endmodule
module m_1_1 (
    input wire [7 : 0] i,
    output wire [7 : 0] o
);
draw_binary_arithm__1_1_1 anon_1_1_1(.i(i[7:0]), ._tmp(o[7:0]));
endmodule
module draw_binary_arithm__1_1_1 (
    input wire [7 : 0] i,
    output wire [7 : 0] _tmp
);
assign _tmp = (i[7:0]) + (i[7:0]);
endmodule

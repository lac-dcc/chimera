module test (
    input wire [1 : 0] in1,
    output wire out1
);
test_1 anon_1(.in1(in1[1:0]), .out1(out1));
endmodule
module test_1 (
    input wire [1 : 0] in1,
    output wire out1
);
wire [1 : 0] i1;
assign i1 = {{1{0}}, in1[1]} && (~(in1[1:0]));
assign out1 = (~(i1[1])) > (X) || in1[1];
endmodule

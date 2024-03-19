module Gen_mux(
    input [511:0]data_in1,
    input [511:0]data_in2,
    input [383:0]bytetype1,
    input [383:0]bytetype2,
    input sel,
    output [511:0]data_out,
    output [383:0] ByteType
);
   assign data_out = sel? data_in2:data_in1;
   assign ByteType = sel? bytetype2:bytetype1;
endmodule
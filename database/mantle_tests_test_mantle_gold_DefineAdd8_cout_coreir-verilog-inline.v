module Add8_cout (
    input [7:0] I0,
    input [7:0] I1,
    output [7:0] O,
    output COUT
);
wire [8:0] coreir_add9_inst0_out;
assign coreir_add9_inst0_out = 9'(({1'b0,I0}) + ({1'b0,I1}));
assign O = coreir_add9_inst0_out[7:0];
assign COUT = coreir_add9_inst0_out[8];
endmodule


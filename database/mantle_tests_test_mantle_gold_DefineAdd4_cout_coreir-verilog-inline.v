module Add4_cout (
    input [3:0] I0,
    input [3:0] I1,
    output [3:0] O,
    output COUT
);
wire [4:0] coreir_add5_inst0_out;
assign coreir_add5_inst0_out = 5'(({1'b0,I0}) + ({1'b0,I1}));
assign O = coreir_add5_inst0_out[3:0];
assign COUT = coreir_add5_inst0_out[4];
endmodule


module Add2_cout (
    input [1:0] I0,
    input [1:0] I1,
    output [1:0] O,
    output COUT
);
wire [2:0] coreir_add3_inst0_out;
assign coreir_add3_inst0_out = 3'(({1'b0,I0}) + ({1'b0,I1}));
assign O = coreir_add3_inst0_out[1:0];
assign COUT = coreir_add3_inst0_out[2];
endmodule


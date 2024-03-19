module INV (input  I, output  O);
wire  GP_INV_inst0_OUT;
GP_INV GP_INV_inst0 (.IN(I), .OUT(GP_INV_inst0_OUT));
assign O = GP_INV_inst0_OUT;
endmodule


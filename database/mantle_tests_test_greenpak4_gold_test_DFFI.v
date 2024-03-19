module DFFI (input  I, input  CLK, output  O);
wire  GP_DFFI_inst0_nQ;
GP_DFFI GP_DFFI_inst0 (.D(I), .CLK(CLK), .nQ(GP_DFFI_inst0_nQ));
assign O = GP_DFFI_inst0_nQ;
endmodule


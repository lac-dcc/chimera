module DFF (input  I, input  CLK, output  O);
wire  GP_DFF_inst0_Q;
GP_DFF GP_DFF_inst0 (.D(I), .CLK(CLK), .Q(GP_DFF_inst0_Q));
assign O = GP_DFF_inst0_Q;
endmodule


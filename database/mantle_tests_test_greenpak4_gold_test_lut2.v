module LUT2 (input  I0, input  I1, output  O);
wire  GP_2LUT_inst0_OUT;
GP_2LUT #(.INIT(4'h8)) GP_2LUT_inst0 (.IN0(I0), .IN1(I1), .OUT(GP_2LUT_inst0_OUT));
assign O = GP_2LUT_inst0_OUT;
endmodule


module LUT4 (input  I0, input  I1, input  I2, input  I3, output  O);
wire  GP_4LUT_inst0_OUT;
GP_4LUT #(.INIT(16'h8000)) GP_4LUT_inst0 (.IN0(I0), .IN1(I1), .IN2(I2), .IN3(I3), .OUT(GP_4LUT_inst0_OUT));
assign O = GP_4LUT_inst0_OUT;
endmodule


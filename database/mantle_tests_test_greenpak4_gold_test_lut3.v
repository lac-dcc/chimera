module LUT3 (input  I0, input  I1, input  I2, output  O);
wire  GP_3LUT_inst0_OUT;
GP_3LUT #(.INIT(8'h80)) GP_3LUT_inst0 (.IN0(I0), .IN1(I1), .IN2(I2), .OUT(GP_3LUT_inst0_OUT));
assign O = GP_3LUT_inst0_OUT;
endmodule


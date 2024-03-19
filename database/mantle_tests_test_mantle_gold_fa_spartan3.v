module FullAdder (input  I0, input  I1, input  I2, output  O, output  COUT);
wire  LUT3_inst0_O;
wire  LUT3_inst1_O;
LUT3 #(.INIT(8'h96)) LUT3_inst0 (.I0(I0), .I1(I1), .I2(I2), .O(LUT3_inst0_O));
LUT3 #(.INIT(8'hE8)) LUT3_inst1 (.I0(I0), .I1(I1), .I2(I2), .O(LUT3_inst1_O));
assign O = LUT3_inst0_O;
assign COUT = LUT3_inst1_O;
endmodule


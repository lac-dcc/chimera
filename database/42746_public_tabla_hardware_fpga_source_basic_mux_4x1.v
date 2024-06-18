// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

module mux_4x1(
  sel,
  in0,
  in1,
  in2,
  in3,
  out
);

// *****************************************************************************
parameter LEN         = 8;

// *****************************************************************************
input     [1:0]        sel;
input     [LEN-1 : 0]  in0;
input     [LEN-1 : 0]  in1;
input     [LEN-1 : 0]  in2;
input     [LEN-1 : 0]  in3;
output    [LEN-1 : 0]  out;

// *****************************************************************************
wire [LEN-1 : 0] out1;
wire [LEN-1 : 0] out2;

assign out1 = sel[0] ? in1 : in0;
assign out2 = sel[0] ? in3 : in2;

assign out = sel[1] ? out2: out1;

endmodule

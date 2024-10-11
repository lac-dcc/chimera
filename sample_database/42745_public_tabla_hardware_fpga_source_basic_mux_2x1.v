// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

module mux_2x1(
  sel,
  in0,
  in1,
  out
);

// *****************************************************************************
parameter LEN         = 8;

// *****************************************************************************
input                  sel;
input     [LEN-1 : 0]  in0;
input     [LEN-1 : 0]  in1;
output    [LEN-1 : 0]  out;

// *****************************************************************************
assign out = (sel) ? in1 : in0;

endmodule

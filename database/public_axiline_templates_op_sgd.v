// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

wire [BITWIDTH-1:0]%output%;
op_sgd#(
   .INPUT_BITWIDTH(INPUT_BITWIDTH),
   .BITWIDTH(BITWIDTH),
   .SIZE(%SIZE%)
)sgd_unit(
   .in(%pipe%)
   .w(%W:0%),
   .x(%x:0%),
   .output(%output%)
);

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

wire [BITWIDTH-1:0]%output%;
osip#(
   .INPUT_BITWIDTH(INPUT_BITWIDTH),
   .BITWIDTH(BITWIDTH),
   .SIZE(%SIZE%)
)osip_unit(
   .w(%W:0%),
   .x(%x:0%),
   .output(%output%)
);

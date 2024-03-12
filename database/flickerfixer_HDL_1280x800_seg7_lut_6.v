module seg7_lut_6(
   output   [6:0]    hex0,
   output   [6:0]    hex1,
   output   [6:0]    hex2,
   output   [6:0]    hex3,
   output   [6:0]    hex4,
   output   [6:0]    hex5,
   input    [23:0]   values
   );

   seg7_lut u0(hex0, values[3:0]);
   seg7_lut u1(hex1, values[7:4]);
   seg7_lut u2(hex2, values[11:8]);
   seg7_lut u3(hex3, values[15:12]);
   seg7_lut u4(hex4, values[19:16]);
   seg7_lut u5(hex5, values[23:20]);

endmodule

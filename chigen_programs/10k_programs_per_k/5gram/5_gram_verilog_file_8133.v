// Seed: 1036440309
`timescale 1 ps / 1ps `timescale 1ps / 1ps
module module_0 ();
  reg id_0;
  assign id_0 = 1;
  reg id_1;
  assign id_0 = id_1;
  assign id_0 = 1 ? id_1 : id_0 ? (~id_1) : 1'b0;
  initial begin
    id_0 <= id_0;
    id_0 = id_0;
  end
endmodule

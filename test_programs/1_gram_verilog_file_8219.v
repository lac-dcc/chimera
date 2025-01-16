// Seed: 3041834427
module module_0;
  wire id_2;
  assign id_1 = 1;
  assign module_2.id_2 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = 1'b0;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  reg id_4;
  always_comb #1 if (id_3[1'h0+1] - -1) id_2 <= id_4;
  wire id_5;
  module_0 modCall_1 ();
  assign id_2 = -1'b0;
endmodule

// Seed: 3451211821
module module_0 (
    id_1
);
  input wire id_1;
  always id_2 <= 1;
  wire id_3;
  module_3 modCall_1 ();
  assign modCall_1.id_1 = 0;
  assign id_2 = 1;
  assign module_1.id_3 = 0;
  always_comb @(posedge 1 or id_1);
endmodule
module module_1;
  always_comb id_1 <= 1;
  uwire id_2, id_3;
  if (1) assign id_2 = {1, 1 & 1'h0} < 1;
  else module_0 modCall_1 (id_3);
endmodule
module module_2 (
    input wire id_0
);
  wire id_2;
  wire id_3;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_2 = 0;
endmodule
module module_3 ();
  assign id_1 = 1;
endmodule

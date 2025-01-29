// Seed: 686775598
module module_0 (
    id_1
);
  output wire id_1;
  assign id_1 = 1;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  uwire id_7 = -1, id_8;
  xor primCall (id_3, id_8, id_2, id_7, id_6, id_1, id_5, id_4);
  module_0 modCall_1 (id_3);
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    output wand  id_0,
    output tri   id_1,
    output uwire id_2,
    input  wire  id_3,
    input  uwire id_4,
    output uwire id_5
);
  wire id_7, id_8;
  module_0 modCall_1 (id_8);
endmodule

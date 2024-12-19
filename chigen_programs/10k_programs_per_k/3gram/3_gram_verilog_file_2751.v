// Seed: 4059612523
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  assign id_3 = id_4 - 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  uwire id_6;
  nand primCall (id_1, id_2, id_6, id_3, id_4, id_8, id_7, id_5);
  assign id_6 = 1;
  wire id_7, id_8;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_6,
      id_2
  );
  assign modCall_1.id_3 = 0;
endmodule

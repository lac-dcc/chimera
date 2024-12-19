// Seed: 441747254
module module_0 (
    output supply1 id_0,
    input tri1 id_1,
    output uwire id_2,
    output wand id_3,
    input tri1 id_4,
    input uwire id_5,
    output tri0 id_6,
    output tri1 id_7,
    output supply1 id_8
);
  assign id_8 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    output wor id_1,
    input wor id_2,
    input uwire id_3,
    input wire id_4,
    input tri1 id_5,
    output wire id_6,
    output wire id_7,
    output tri0 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_1,
      id_8,
      id_4,
      id_5,
      id_6,
      id_1,
      id_1
  );
  assign modCall_1.id_8 = 0;
endmodule

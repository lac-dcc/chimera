// Seed: 2253437119
module module_0 (
    input uwire id_0,
    input supply1 id_1,
    input supply0 id_2,
    input tri0 id_3,
    output supply1 id_4,
    input tri0 id_5,
    input wor id_6,
    output wor id_7,
    input supply0 id_8
);
  specify
    (id_10 => id_11) = (1, -1);
    specparam id_12 = (-1);
    specparam id_13 = 1 * {1, id_1};
  endspecify
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    output wire id_2,
    output tri1 id_3,
    input uwire id_4,
    input wand id_5,
    output supply0 id_6
);
  nand primCall (id_2, id_0, id_5, id_1, id_4);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_0,
      id_3,
      id_0,
      id_1,
      id_3,
      id_0
  );
  assign modCall_1.id_7 = 0;
endmodule

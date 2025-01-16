// Seed: 902772801
module module_0 (
    input uwire id_0,
    input wor id_1,
    input wor id_2,
    input uwire id_3,
    input supply0 id_4,
    output tri id_5,
    output tri id_6,
    input uwire id_7,
    output uwire id_8,
    output uwire id_9,
    output tri id_10,
    input wand id_11,
    output wire id_12,
    input wor id_13,
    output supply0 id_14,
    input supply1 id_15
);
  assign id_6 = -1;
endmodule
macromodule module_1 (
    output wor id_0,
    output wand id_1,
    input supply0 id_2,
    input tri1 id_3,
    input supply0 id_4
);
  supply0 id_6 = id_3;
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_6,
      id_2,
      id_6,
      id_0,
      id_1,
      id_4,
      id_0,
      id_6,
      id_0,
      id_2,
      id_0,
      id_2,
      id_1,
      id_6
  );
  assign modCall_1.id_14 = 0;
endmodule

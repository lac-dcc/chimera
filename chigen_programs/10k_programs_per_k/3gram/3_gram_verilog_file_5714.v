// Seed: 3122820237
module module_0 (
    output wand id_0,
    input supply1 id_1,
    input wand id_2,
    output tri1 id_3,
    input wor id_4,
    input tri id_5,
    input supply1 id_6,
    input supply0 id_7,
    output tri id_8
);
endmodule
module module_1 (
    output wor id_0,
    input uwire id_1,
    input wor id_2,
    input wand id_3,
    output supply1 id_4,
    output wor id_5
);
  assign id_0 = id_3;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_2,
      id_5,
      id_2,
      id_3,
      id_3,
      id_3,
      id_5
  );
  assign modCall_1.id_8 = 0;
  assign id_5 = -1'h0;
endmodule

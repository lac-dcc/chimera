// Seed: 3602850095
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    input tri0 id_2,
    output wand id_3,
    input tri1 id_4,
    input tri0 id_5,
    input wor id_6,
    input wor id_7,
    output tri id_8,
    output tri0 id_9,
    output tri id_10,
    output supply1 id_11,
    output uwire id_12
);
  assign id_3 = id_5;
  id_14(
      -1, id_5 - id_6, id_5, -1, ~-1, id_0
  );
endmodule
module module_1 (
    input uwire id_0,
    input supply0 id_1,
    input tri id_2,
    input wor id_3,
    input wand id_4,
    output supply0 id_5,
    output wor id_6,
    output wand id_7,
    output supply0 id_8
);
  supply1 id_10, id_11;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_8,
      id_3,
      id_1,
      id_3,
      id_0,
      id_8,
      id_5,
      id_8,
      id_7,
      id_5
  );
  assign modCall_1.id_12 = 0;
  assign id_8 = id_10 != -1'b0;
endmodule

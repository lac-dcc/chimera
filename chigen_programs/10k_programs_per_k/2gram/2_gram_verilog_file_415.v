// Seed: 1304449069
module module_0 (
    output wand id_0,
    output uwire id_1,
    input wand id_2,
    input wor id_3,
    input tri1 id_4,
    output uwire id_5,
    output supply0 id_6,
    input tri1 id_7,
    output wand id_8,
    input tri id_9,
    input wand id_10,
    output tri1 id_11
    , id_16,
    output tri1 id_12,
    output wor id_13,
    output supply1 id_14
);
  assign id_0 = id_2;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    output wor id_0,
    input uwire id_1,
    output wor id_2,
    output supply1 id_3,
    output tri0 id_4,
    input tri1 id_5,
    input tri id_6,
    output tri1 id_7
    , id_10,
    output wor id_8
);
  parameter id_11 = 1 > 1;
  xnor primCall (id_2, id_11, id_1, id_6, id_5, id_12);
  wire id_12 = !1'b0;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_5,
      id_1,
      id_5,
      id_4,
      id_4,
      id_6,
      id_4,
      id_6,
      id_1,
      id_0,
      id_4,
      id_0,
      id_2
  );
endmodule

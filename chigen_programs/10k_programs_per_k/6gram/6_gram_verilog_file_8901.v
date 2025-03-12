// Seed: 1171679196
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input tri1 id_2,
    output supply1 id_3
);
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    output wand id_2,
    input wor id_3,
    input wand id_4,
    input supply0 id_5,
    output supply0 id_6,
    input supply0 id_7,
    output wire id_8,
    input supply1 id_9,
    input wand id_10,
    input tri id_11,
    output tri id_12
);
  logic id_14;
  or primCall (id_12, id_11, id_3, id_4, id_14, id_5, id_1, id_10);
  module_0 modCall_1 (
      id_3,
      id_10,
      id_5,
      id_12
  );
  assign modCall_1.id_0 = 0;
endmodule

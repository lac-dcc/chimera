// Seed: 2790867925
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input wire id_2,
    input tri id_3,
    input wor id_4,
    input tri1 id_5,
    output wand id_6
);
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    output supply0 id_2,
    output uwire id_3,
    input uwire id_4,
    output tri0 id_5,
    output tri0 id_6,
    output tri1 id_7,
    output wor id_8,
    input wand id_9,
    output tri id_10,
    output supply0 id_11,
    output supply0 id_12
);
  uwire id_14 = 1;
  or primCall (id_6, id_14, id_4, id_9, id_0);
  module_0 modCall_1 (
      id_0,
      id_4,
      id_0,
      id_9,
      id_9,
      id_9,
      id_6
  );
  assign modCall_1.id_0 = 0;
endmodule

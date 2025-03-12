// Seed: 2952814880
module module_0 (
    output wor id_0,
    output supply0 id_1,
    input supply1 id_2
    , id_9,
    output wor id_3,
    input uwire id_4,
    output wor id_5,
    output tri1 id_6,
    input supply0 id_7
);
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input wor id_1,
    input wor id_2,
    input wand id_3,
    input tri0 id_4,
    output tri0 id_5,
    output wand id_6,
    input tri1 id_7,
    input wand id_8,
    output tri0 id_9
);
  wire id_11;
  and primCall (id_6, id_2, id_4, id_11, id_7, id_3, id_1);
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_9,
      id_7,
      id_6,
      id_6,
      id_8
  );
endmodule

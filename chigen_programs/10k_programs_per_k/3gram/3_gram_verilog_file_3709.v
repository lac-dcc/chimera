// Seed: 3935023680
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input wor id_2,
    input wand id_3
    , id_10,
    output wand id_4,
    input tri0 id_5,
    input tri0 id_6,
    output wand id_7,
    input tri0 id_8
);
endmodule
module module_1 (
    input wire id_0,
    input uwire id_1,
    input uwire id_2,
    input supply1 id_3,
    input wand id_4,
    output supply1 id_5,
    input supply1 id_6,
    input wand id_7,
    input tri0 id_8,
    output wor id_9,
    input tri1 id_10,
    output uwire id_11
);
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_8,
      id_9,
      id_7,
      id_4,
      id_9,
      id_1
  );
  assign modCall_1.id_8 = 0;
endmodule

// Seed: 2752043256
module module_0 (
    output wand id_0,
    input wire id_1,
    output uwire id_2,
    output supply1 id_3,
    input supply1 id_4,
    input supply1 id_5,
    output wand id_6,
    input tri0 id_7
);
  wire [-1  **  1 : -1] id_9;
endmodule
module module_1 (
    input wire id_0
    , id_11,
    input wand id_1,
    input supply1 id_2,
    output uwire id_3,
    input tri0 id_4,
    output tri0 id_5,
    output supply1 id_6,
    output wor id_7,
    output wor id_8,
    input wire id_9
);
  xor primCall (id_8, id_0, id_9, id_2, id_4, id_11, id_1);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_7,
      id_7,
      id_9,
      id_1,
      id_8,
      id_0
  );
  assign modCall_1.id_7 = 0;
endmodule

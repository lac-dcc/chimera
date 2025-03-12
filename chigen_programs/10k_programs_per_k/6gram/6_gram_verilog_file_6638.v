// Seed: 3384805756
module module_0 (
    output tri0 id_0,
    output wire id_1,
    output supply0 id_2
    , id_8,
    input wor id_3,
    output wand id_4,
    input tri0 id_5
    , id_9,
    output supply1 id_6
);
  assign id_1 = 1;
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    input wand id_2,
    output supply1 id_3,
    output tri1 id_4,
    output uwire id_5,
    output wand id_6,
    inout tri1 id_7,
    input wand id_8
    , id_12,
    input wor id_9,
    output tri id_10
);
  logic id_13;
  nand primCall (id_7, id_9, id_8, id_12, id_13, id_1, id_2);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_6,
      id_7,
      id_10,
      id_9,
      id_7
  );
  assign modCall_1.id_1 = 0;
endmodule

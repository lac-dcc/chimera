// Seed: 3708437548
module module_0 (
    input wor id_0,
    output tri1 id_1,
    input supply0 id_2,
    output supply1 id_3,
    output tri id_4,
    output tri0 id_5,
    output wor id_6,
    input supply0 id_7,
    input tri0 id_8,
    output tri0 id_9
    , id_15,
    output wand id_10,
    input wire id_11,
    input wire id_12,
    input tri0 id_13
);
endmodule
module module_1 (
    output uwire id_0,
    input  tri1  id_1,
    input  tri0  id_2,
    input  tri1  id_3,
    input  tri   id_4
);
  assign id_0 = id_4 & id_1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_4,
      id_0,
      id_0,
      id_0,
      id_0,
      id_4,
      id_3,
      id_0,
      id_0,
      id_1,
      id_3,
      id_3
  );
  assign modCall_1.id_13 = 0;
  wire id_6;
endmodule

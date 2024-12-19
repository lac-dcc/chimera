// Seed: 1986808561
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input tri1 id_2,
    inout wor id_3,
    input wire id_4,
    input wand id_5,
    input tri0 id_6,
    output wand id_7,
    output uwire id_8,
    output tri id_9
);
endmodule
module module_1 (
    inout supply1 id_0,
    output wand id_1,
    input tri1 id_2,
    input tri1 id_3
    , id_12,
    input wor id_4,
    input supply1 id_5,
    input supply0 id_6,
    output tri0 id_7,
    input supply0 id_8,
    input wire id_9,
    output tri0 id_10
);
  wire id_13;
  nand primCall (id_1, id_2, id_0, id_4, id_13);
  module_0 modCall_1 (
      id_0,
      id_5,
      id_8,
      id_0,
      id_2,
      id_9,
      id_9,
      id_10,
      id_10,
      id_1
  );
  assign modCall_1.type_4 = 0;
endmodule

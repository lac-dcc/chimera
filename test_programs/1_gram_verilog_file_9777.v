// Seed: 885493013
module module_0 (
    input tri0 id_0,
    output wand id_1,
    input wand id_2,
    id_7,
    input supply1 id_3,
    output supply0 id_4,
    output tri1 id_5
);
  wire id_8;
  assign id_5 = id_2;
  wire id_9;
  wire id_10;
  id_11(
      .id_0(-1), .id_1(-1), .id_2(1)
  );
endmodule
module module_1 (
    output tri id_0,
    input wand id_1,
    input wand id_2,
    input wand id_3,
    output tri0 id_4,
    input wire id_5,
    input wor id_6,
    output wand id_7,
    input wand id_8,
    input wire id_9,
    input wor id_10,
    input supply1 id_11,
    input tri0 id_12,
    input tri0 id_13,
    output uwire id_14
);
  nand primCall (id_4, id_2, id_11, id_5, id_1, id_9, id_13, id_12, id_8, id_3, id_6, id_10);
  module_0 modCall_1 (
      id_8,
      id_14,
      id_11,
      id_13,
      id_4,
      id_4
  );
  assign modCall_1.type_13 = 0;
endmodule

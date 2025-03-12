// Seed: 1011718013
module module_0 (
    input tri0 id_0,
    output wand id_1,
    input tri0 id_2,
    output wor id_3,
    input tri0 id_4,
    output uwire id_5,
    input wand id_6,
    input supply0 id_7,
    input wire id_8,
    input uwire id_9,
    input tri1 id_10,
    output tri id_11,
    input supply0 id_12,
    input wire id_13,
    input tri0 id_14,
    output tri id_15,
    output wor id_16
);
  assign id_3#(
      .id_0 (-1),
      .id_9 (-1),
      .id_7 (1'b0),
      .id_10(1)
  ) = 1;
endmodule
module module_1 (
    output tri   id_0,
    input  uwire id_1,
    input  tri1  id_2,
    output wand  id_3
);
  wire id_5;
  assign id_0 = id_2;
  xor primCall (id_3, id_1, id_5, id_2);
  module_0 modCall_1 (
      id_2,
      id_3,
      id_2,
      id_3,
      id_2,
      id_3,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_1,
      id_0,
      id_3
  );
  assign modCall_1.id_16 = 0;
endmodule

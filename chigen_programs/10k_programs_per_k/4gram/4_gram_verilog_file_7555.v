// Seed: 3474027278
module module_0 (
    input  wand  id_0,
    input  uwire id_1,
    input  tri   id_2,
    output tri   id_3,
    input  wor   id_4,
    input  wand  id_5,
    input  wand  id_6,
    input  tri   id_7
);
  wire id_9;
  parameter id_10 = -1;
endmodule
module module_1 (
    input supply0 id_0,
    output tri id_1,
    input tri id_2,
    output uwire id_3,
    input uwire id_4,
    input uwire id_5,
    input wor id_6,
    input wor id_7,
    input supply1 id_8,
    input wire id_9,
    input wire id_10,
    input tri1 id_11,
    output supply1 id_12,
    input tri1 id_13,
    input tri id_14,
    output wand id_15,
    input supply0 id_16,
    output wand id_17,
    input uwire id_18,
    input uwire id_19,
    output tri id_20
);
  assign id_12 = id_6;
  module_0 modCall_1 (
      id_0,
      id_13,
      id_7,
      id_17,
      id_19,
      id_18,
      id_14,
      id_18
  );
  assign modCall_1.id_3 = 0;
endmodule

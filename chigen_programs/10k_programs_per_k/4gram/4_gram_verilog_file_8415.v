// Seed: 4286395397
module module_0 (
    output wand id_0,
    output uwire id_1,
    output tri0 id_2,
    output supply0 id_3,
    output tri0 id_4,
    input wire id_5,
    input wire id_6,
    output wire id_7,
    output tri1 id_8,
    input wor id_9,
    output supply1 id_10,
    input wire id_11,
    output wor id_12,
    output supply0 id_13,
    input supply0 id_14,
    input supply1 id_15
);
endmodule
module module_1 (
    output wor   id_0,
    output wand  id_1,
    input  tri0  id_2,
    input  tri0  id_3,
    output tri   id_4,
    output tri0  id_5,
    input  tri0  id_6,
    output uwire id_7,
    input  tri   id_8,
    input  uwire id_9,
    output uwire id_10,
    input  tri   id_11
);
  wire id_13;
  assign id_7  = id_13 ? id_2 : id_8;
  assign id_10 = 1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_1,
      id_5,
      id_1,
      id_9,
      id_9,
      id_10,
      id_10,
      id_8,
      id_1,
      id_9,
      id_0,
      id_5,
      id_8,
      id_2
  );
endmodule

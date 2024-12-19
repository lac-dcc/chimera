// Seed: 2114743451
module module_0 (
    output uwire id_0,
    input tri0 id_1,
    input wire id_2,
    output tri1 id_3,
    input uwire id_4,
    input wand id_5,
    output supply1 id_6,
    output uwire id_7,
    input supply0 id_8,
    input wire id_9,
    output wand id_10,
    input supply1 id_11,
    output tri1 id_12,
    output supply1 id_13,
    output supply0 id_14,
    output wand id_15,
    input supply0 id_16,
    input tri0 id_17,
    output uwire id_18,
    input wire id_19,
    input wor id_20,
    inout tri0 id_21
);
  id_23(
      id_2 - id_11
  );
  uwire id_24;
  assign id_24 = (id_1);
  wire id_25;
endmodule
module module_1 (
    input  tri0  id_0,
    input  tri0  id_1,
    input  wor   id_2,
    input  wand  id_3,
    output wand  id_4,
    output wire  id_5,
    input  wor   id_6,
    input  uwire id_7,
    output tri   id_8,
    input  wand  id_9,
    input  tri1  id_10,
    output wor   id_11,
    input  wand  id_12
);
  tri1 id_14 = id_1;
  assign id_4 = id_14;
  wand id_15;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_15,
      id_4,
      id_9,
      id_2,
      id_15,
      id_4,
      id_1,
      id_12,
      id_14,
      id_7,
      id_8,
      id_8,
      id_8,
      id_11,
      id_0,
      id_3,
      id_4,
      id_7,
      id_10,
      id_15
  );
  assign modCall_1.id_24 = 0;
  always id_8 = id_15;
endmodule

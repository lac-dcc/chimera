// Seed: 534691835
module module_0 (
    input tri id_0,
    input wor id_1,
    output uwire id_2,
    input tri0 id_3,
    input wand id_4,
    output tri0 id_5,
    input wand id_6,
    output wire id_7,
    output supply1 id_8,
    input tri id_9,
    input supply1 id_10,
    input supply0 id_11,
    input wor id_12,
    input wire id_13,
    input supply0 id_14,
    input wor id_15,
    output tri0 id_16,
    input tri1 id_17,
    input wor id_18,
    input tri0 id_19,
    input supply1 id_20,
    input tri1 id_21,
    input uwire id_22
);
  assign id_16 = {1 & id_3, 1'b0};
endmodule
module module_1 (
    input  tri   id_0,
    input  wire  id_1,
    input  uwire id_2,
    input  wand  id_3,
    output tri0  id_4,
    output wand  id_5,
    input  tri1  id_6,
    output wand  id_7,
    input  wor   id_8,
    output uwire id_9,
    output tri0  id_10,
    input  tri   id_11,
    output wor   id_12
);
  wire id_14;
  wire id_15;
  assign id_7 = 1 - id_3;
  wire id_16;
  wire id_17;
  module_0(
      id_6,
      id_11,
      id_4,
      id_0,
      id_1,
      id_5,
      id_8,
      id_12,
      id_9,
      id_11,
      id_11,
      id_2,
      id_3,
      id_0,
      id_1,
      id_2,
      id_10,
      id_2,
      id_1,
      id_0,
      id_2,
      id_3,
      id_3
  );
endmodule

// Seed: 1556745185
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input supply1 id_2,
    input tri id_3,
    output wor id_4,
    input tri1 id_5,
    input tri id_6,
    input wand id_7,
    input supply1 id_8,
    output supply0 id_9,
    input wor id_10,
    output wire id_11,
    output wand id_12,
    output tri id_13,
    input uwire id_14,
    output uwire id_15,
    output wor id_16,
    output wor id_17,
    output supply0 id_18,
    input supply1 id_19,
    output wand id_20,
    input wire id_21,
    input wand id_22
);
  wire id_24;
  wire id_25;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    output logic id_0,
    input  tri0  id_1,
    input  tri   id_2,
    output tri0  id_3,
    output wand  id_4,
    input  wor   id_5,
    input  logic id_6
);
  tri id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_1,
      id_3,
      id_1,
      id_5,
      id_5,
      id_2,
      id_3,
      id_2,
      id_4,
      id_3,
      id_3,
      id_2,
      id_4,
      id_3,
      id_3,
      id_3,
      id_2,
      id_4,
      id_5,
      id_1
  );
  generate
    always @(*) id_0 <= id_6;
  endgenerate
  assign id_8 = 1;
endmodule

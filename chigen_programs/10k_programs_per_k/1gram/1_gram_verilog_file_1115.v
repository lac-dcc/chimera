// Seed: 1101048041
module module_0 (
    output wand id_0,
    output wire id_1,
    input supply0 id_2,
    input supply1 id_3,
    input uwire id_4[-1 : -1],
    output wand id_5,
    output wor id_6,
    input tri0 id_7,
    output supply0 id_8,
    input tri1 id_9,
    output uwire id_10,
    input tri0 id_11,
    input wor id_12,
    output tri0 id_13,
    input uwire id_14
);
  parameter id_16 = 1;
endmodule
module module_1 (
    output tri   id_0,
    input  wire  id_1,
    output wand  id_2,
    input  wire  id_3#(.id_10(1)),
    input  tri   id_4,
    input  tri1  id_5,
    input  uwire id_6,
    output logic id_7,
    input  wor   id_8
);
  parameter id_11 = 1;
  xor primCall (id_7, id_1, id_6, id_5, id_4, id_10, id_8, id_11);
  always id_7 <= id_1;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_8,
      id_6,
      id_2,
      id_0,
      id_5,
      id_2,
      id_5,
      id_2,
      id_8,
      id_5,
      id_2,
      id_3
  );
  assign modCall_1.id_14 = 0;
  parameter id_12 = id_11[-1'h0];
  always $signed(42);
  ;
endmodule

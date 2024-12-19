// Seed: 2725828626
module module_0 (
    input wand id_0,
    input uwire id_1,
    input supply1 module_0,
    input tri1 id_3,
    input supply0 id_4,
    output uwire id_5,
    output wand id_6,
    input tri1 id_7,
    output tri1 id_8
    , id_19,
    output uwire id_9,
    input tri id_10,
    output wand id_11,
    input supply1 id_12,
    input wand id_13,
    input wire id_14,
    output uwire id_15,
    output tri1 id_16,
    input supply0 id_17
);
endmodule
module module_1 (
    output uwire id_0,
    input  tri0  id_1,
    input  wor   id_2,
    output logic id_3
    , id_9,
    input  tri0  id_4,
    output wand  id_5,
    input  tri   id_6,
    input  tri0  id_7
    , id_10
);
  assign id_5 = 'b0 ? 1 && (id_10 | id_4) : 1;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_4,
      id_1,
      id_4,
      id_5,
      id_0,
      id_1,
      id_0,
      id_5,
      id_1,
      id_0,
      id_2,
      id_1,
      id_4,
      id_5,
      id_5,
      id_2
  );
  assign modCall_1.type_6 = 0;
  wire id_11;
  wire id_12;
  always @(1) id_3 <= 1;
  assign id_3 = 1;
endmodule

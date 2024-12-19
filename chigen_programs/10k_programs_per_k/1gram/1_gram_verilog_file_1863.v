// Seed: 2248315496
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    input supply0 id_2,
    input wor id_3,
    input tri0 id_4
    , id_18,
    input uwire id_5,
    input tri0 id_6,
    input wand id_7,
    output wire id_8,
    input wand id_9,
    input supply0 id_10
    , id_19,
    input supply1 id_11,
    output uwire id_12,
    output wand id_13,
    input tri0 id_14,
    output wor id_15,
    input tri0 id_16
);
  assign id_18 = id_14 ^ id_2;
  wire id_20;
endmodule
module module_1 (
    output supply1 id_0,
    output tri1 id_1,
    input tri1 id_2,
    output uwire id_3,
    output tri1 id_4,
    input supply1 id_5,
    input logic id_6,
    output logic id_7,
    input tri id_8,
    input supply0 id_9,
    output tri0 id_10,
    input supply1 id_11,
    input tri1 id_12,
    output supply0 id_13
);
  module_0 modCall_1 (
      id_3,
      id_10,
      id_12,
      id_9,
      id_5,
      id_9,
      id_11,
      id_5,
      id_4,
      id_2,
      id_12,
      id_2,
      id_4,
      id_13,
      id_11,
      id_4,
      id_11
  );
  assign modCall_1.type_22 = 0;
  wire id_15;
  always id_7 <= id_6;
  wire id_16;
  wire id_17, id_18, id_19, id_20;
endmodule

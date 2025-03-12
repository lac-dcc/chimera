// Seed: 1369992908
module module_0 (
    input uwire id_0,
    input uwire id_1,
    output wor id_2,
    input tri id_3,
    input wand id_4,
    output wire id_5,
    output wor id_6,
    input supply0 id_7,
    input wor id_8,
    input uwire id_9,
    input uwire id_10,
    input uwire id_11,
    output supply0 id_12,
    output tri id_13,
    output tri id_14,
    input supply1 id_15,
    output wire id_16,
    input wire id_17,
    input supply1 id_18,
    output wand id_19,
    input supply1 id_20,
    input supply0 id_21,
    input supply1 id_22,
    output tri id_23,
    output wor id_24
);
  parameter id_26 = 1;
endmodule
module module_1 (
    input supply0 id_0
    , id_14,
    input tri1 id_1,
    input wor id_2,
    output tri id_3,
    output wire id_4,
    output uwire id_5,
    input wand id_6,
    output tri0 id_7,
    output tri0 id_8,
    input wand id_9
    , id_15,
    output tri1 id_10,
    input wand id_11,
    input tri0 id_12
);
  always_comb @(posedge id_0 or posedge 1) $unsigned(76);
  ;
  assign id_8 = id_11;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_4,
      id_6,
      id_9,
      id_4,
      id_7,
      id_11,
      id_1,
      id_12,
      id_9,
      id_2,
      id_7,
      id_8,
      id_8,
      id_1,
      id_4,
      id_12,
      id_9,
      id_7,
      id_9,
      id_2,
      id_0,
      id_3,
      id_8
  );
  assign modCall_1.id_20 = 0;
  assign id_14 = -1;
  wire id_16;
  assign id_15 = id_0;
endmodule

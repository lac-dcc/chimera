// Seed: 1547507905
module module_0 (
    input wand id_0
    , id_19,
    output wire id_1,
    input wand id_2,
    output uwire id_3,
    input wand id_4,
    input tri0 id_5,
    input supply1 id_6,
    input tri id_7,
    input uwire id_8,
    input uwire id_9
    , id_20, id_21,
    output wire id_10,
    output uwire id_11,
    output uwire id_12,
    output uwire id_13,
    input supply0 id_14,
    input wand id_15,
    output wor id_16,
    input tri0 id_17
);
  generate
    always @(posedge (-1)) id_19 -= id_20;
  endgenerate
endmodule
module module_1 (
    input tri1 id_0,
    input uwire id_1,
    output wire id_2,
    output wand id_3,
    input tri1 id_4,
    input wand id_5,
    input wor id_6,
    input tri1 id_7,
    input tri1 id_8,
    input supply1 id_9,
    input tri id_10,
    output wor id_11,
    output tri1 id_12,
    output wand id_13
);
  assign {{-1, id_7}, -1 < id_10} = 1;
  module_0 modCall_1 (
      id_8,
      id_12,
      id_6,
      id_12,
      id_5,
      id_9,
      id_6,
      id_5,
      id_4,
      id_6,
      id_12,
      id_3,
      id_2,
      id_13,
      id_0,
      id_4,
      id_11,
      id_1
  );
  assign modCall_1.id_5 = 0;
endmodule

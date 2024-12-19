// Seed: 3543247841
module module_0 (
    output supply1 id_0,
    output wand id_1,
    input supply1 id_2,
    input supply0 id_3,
    input wor id_4,
    output wire id_5,
    input wand id_6,
    output supply0 id_7,
    input supply1 id_8
    , id_11,
    output tri id_9
);
  wire id_12;
  id_13(
      .id_0(1)
  );
endmodule
module module_1 (
    input tri1 id_0,
    output wand id_1,
    output supply1 id_2,
    output supply0 id_3,
    output wire id_4,
    input tri0 id_5,
    output tri1 id_6,
    input tri0 id_7,
    output tri1 id_8,
    input wor id_9
    , id_21,
    input supply1 id_10,
    input supply0 id_11,
    input tri0 id_12,
    output supply1 id_13,
    output tri0 id_14,
    output tri id_15,
    input tri1 id_16,
    input tri0 id_17,
    output wor id_18,
    output supply0 id_19
);
  wire id_22;
  nand primCall (id_13, id_11, id_10, id_9, id_12, id_5, id_22, id_7, id_21, id_0, id_16, id_17);
  assign id_3 = id_10;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_9,
      id_11,
      id_9,
      id_19,
      id_0,
      id_3,
      id_17,
      id_13
  );
endmodule

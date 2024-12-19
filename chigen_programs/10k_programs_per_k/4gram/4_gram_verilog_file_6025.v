// Seed: 854112087
module module_0 (
    input tri0 id_0,
    input wire id_1,
    output supply0 id_2,
    input tri0 id_3,
    input wor id_4,
    input supply0 id_5,
    input wire id_6,
    output wor id_7,
    input tri1 id_8,
    input tri1 id_9
    , id_21,
    input wand id_10,
    input supply1 id_11,
    input tri1 id_12,
    output wor id_13,
    output supply1 id_14,
    input supply0 id_15,
    input tri0 id_16,
    output supply1 id_17,
    input supply0 id_18,
    output supply1 id_19
);
endmodule
module module_2 (
    output tri0 id_0,
    output wor id_1,
    output supply0 id_2,
    output tri0 id_3,
    input tri1 id_4,
    input wand id_5,
    input wire id_6,
    input supply1 id_7,
    input tri id_8,
    input tri0 id_9,
    output wor id_10,
    input supply0 id_11,
    output tri0 id_12,
    input tri0 id_13,
    input wand id_14,
    output uwire id_15,
    input supply1 id_16,
    output wire id_17,
    input tri0 module_1,
    output tri1 id_19,
    output uwire id_20,
    input tri0 id_21
);
  id_23(
      .id_0(1), .id_1(id_15), .id_2()
  );
  nor primCall (
      id_19, id_9, id_6, id_8, id_4, id_11, id_5, id_13, id_21, id_23, id_14, id_7, id_16
  );
  module_0 modCall_1 (
      id_9,
      id_16,
      id_20,
      id_4,
      id_9,
      id_11,
      id_4,
      id_12,
      id_7,
      id_13,
      id_9,
      id_8,
      id_9,
      id_0,
      id_0,
      id_16,
      id_4,
      id_10,
      id_16,
      id_19
  );
  assign modCall_1.id_3 = 0;
endmodule

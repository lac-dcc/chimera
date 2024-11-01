// Seed: 900963290
module module_0 (
    input wor id_0,
    input tri id_1,
    input supply1 id_2,
    input tri id_3,
    input wand id_4,
    input supply1 id_5,
    input wand id_6,
    input wire id_7,
    input tri1 id_8,
    input supply0 id_9,
    input supply1 id_10,
    input wand id_11,
    output supply1 id_12,
    output supply0 id_13
    , id_21,
    input wor id_14,
    output wire id_15,
    output wand id_16,
    output tri id_17,
    input wand id_18,
    input tri id_19
);
endmodule
module module_1 (
    output wire id_0,
    input supply0 id_1,
    input tri1 id_2
);
  uwire id_4 = id_2;
  id_5(
      .id_0(1 - id_1), .id_1(1), .id_2(1 << id_0), .id_3(), .id_4(1)
  );
  xor (id_0, id_5, id_1, id_2, id_4);
  module_0(
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_1,
      id_2,
      id_1,
      id_4,
      id_2,
      id_2,
      id_1,
      id_4,
      id_0,
      id_4,
      id_0,
      id_4,
      id_4,
      id_2,
      id_1
  );
endmodule

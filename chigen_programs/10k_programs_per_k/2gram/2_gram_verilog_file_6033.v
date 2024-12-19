// Seed: 3393697286
module module_0 (
    output tri1 id_0,
    input supply1 id_1
    , id_23,
    input supply1 id_2,
    output tri1 id_3,
    output tri id_4,
    input wire id_5,
    input wire id_6,
    input tri id_7,
    output wand id_8,
    input supply0 id_9,
    input wand id_10,
    input wor id_11,
    input wire id_12,
    input wire id_13,
    input tri0 id_14
    , id_24,
    input supply1 id_15,
    output tri id_16,
    input supply0 id_17,
    input uwire id_18,
    input uwire id_19,
    input uwire id_20,
    input wor id_21
);
  id_25(
      .id_0(1'b0)
  );
  assign id_16 = 1'b0;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    input wor id_2,
    output supply0 id_3
);
  wire  id_5;
  uwire id_6 = ~1 ? 1 && 1 : 1;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_3,
      id_3,
      id_2,
      id_1,
      id_0,
      id_3,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_3,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0
  );
  assign modCall_1.id_4 = 0;
  wire id_7;
endmodule

// Seed: 4253343901
module module_0 (
    input tri1 id_0,
    output tri0 id_1,
    input wire id_2,
    input tri1 id_3,
    input tri id_4,
    input tri0 id_5,
    input tri0 id_6,
    output supply1 id_7,
    output wire id_8,
    input wand id_9,
    input tri0 id_10,
    input supply0 id_11,
    input tri1 id_12,
    output wor id_13,
    inout tri0 id_14,
    input uwire id_15,
    input supply1 id_16,
    input tri id_17,
    output tri0 id_18
    , id_22#(
        .id_23(1)
    ),
    output supply0 id_19,
    input supply1 id_20
);
endmodule
module module_1 (
    input supply0 id_0,
    output wor id_1,
    output wire id_2,
    output wor id_3,
    input logic id_4,
    input supply0 id_5,
    input supply1 id_6,
    output tri0 id_7,
    input tri1 id_8,
    output tri0 id_9,
    input wire id_10,
    output supply0 id_11,
    output tri1 id_12,
    input wand id_13,
    input supply1 id_14,
    input tri1 id_15,
    output wor id_16,
    output tri id_17,
    output supply1 id_18,
    input wor id_19,
    input tri id_20,
    output uwire id_21,
    input tri0 id_22,
    input wand id_23
    , id_27,
    output tri0 id_24,
    input wand id_25
);
  wire id_28 = id_20;
  always_latch if (id_20) id_27 <= {id_4{1}};
  module_0 modCall_1 (
      id_8,
      id_28,
      id_25,
      id_13,
      id_6,
      id_13,
      id_13,
      id_1,
      id_28,
      id_25,
      id_5,
      id_23,
      id_25,
      id_9,
      id_28,
      id_22,
      id_28,
      id_20,
      id_2,
      id_12,
      id_0
  );
  assign modCall_1.type_2 = 0;
  assign id_3 = id_22;
  assign id_12 = 1;
endmodule

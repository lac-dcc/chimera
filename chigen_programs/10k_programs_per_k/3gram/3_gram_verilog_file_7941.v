// Seed: 2735097746
module module_0 (
    input tri1 id_0,
    output tri0 id_1,
    input wand id_2,
    input tri1 id_3,
    input wand id_4,
    input tri0 id_5,
    output wor id_6
    , id_32,
    input tri id_7,
    output wire id_8,
    output uwire id_9,
    input wand id_10,
    input tri0 id_11,
    input tri0 id_12,
    output tri0 id_13,
    output supply0 id_14,
    input wor id_15,
    output tri0 id_16,
    input wand id_17,
    output tri id_18,
    input wire id_19,
    input uwire id_20,
    output wor id_21,
    output uwire id_22,
    output tri0 id_23,
    input tri id_24,
    output wor id_25,
    input supply1 id_26,
    input uwire id_27,
    output tri1 id_28,
    input wire id_29,
    input supply1 id_30
);
  id_33(
      .id_0(1), .id_1(), .id_2(1), .id_3(id_25), .id_4(id_9 + 1'b0 / 1 - id_1), .id_5(1), .id_6(1)
  );
endmodule
module module_1 (
    input tri0 id_0,
    output wor id_1,
    output supply1 id_2,
    input wand id_3,
    input wor id_4,
    input wor id_5,
    input supply1 id_6,
    output wor id_7,
    input tri0 id_8,
    input wire id_9,
    input wire id_10,
    output wire id_11,
    input wire id_12
    , id_15, id_16,
    input tri0 id_13
);
  pullup (1'b0, id_3);
  module_0 modCall_1 (
      id_6,
      id_2,
      id_10,
      id_5,
      id_5,
      id_3,
      id_11,
      id_4,
      id_11,
      id_11,
      id_12,
      id_8,
      id_6,
      id_11,
      id_1,
      id_8,
      id_7,
      id_3,
      id_1,
      id_12,
      id_3,
      id_7,
      id_7,
      id_7,
      id_5,
      id_2,
      id_0,
      id_5,
      id_7,
      id_12,
      id_12
  );
  assign modCall_1.id_16 = 0;
  wire id_17, id_18;
endmodule

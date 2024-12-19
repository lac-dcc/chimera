// Seed: 1554087344
module module_0 (
    output tri0 id_0,
    input wire id_1,
    input wire id_2,
    output wor id_3,
    output tri0 id_4,
    output supply1 id_5,
    output wor id_6,
    output supply1 id_7,
    input wire id_8,
    output wire id_9,
    input tri0 id_10,
    input supply0 id_11,
    input tri1 id_12,
    input wand id_13,
    output uwire id_14,
    input tri0 id_15
);
  assign id_4 = 1'b0;
  wire id_17;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    output tri0 id_2,
    output tri1 id_3,
    input wor id_4,
    output wor id_5,
    input wire id_6,
    output tri0 id_7,
    input tri id_8,
    output wand id_9,
    output wand id_10
);
  wire id_12;
  assign id_9 = 1;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_5,
      id_2,
      id_5,
      id_5,
      id_7,
      id_1,
      id_7,
      id_0,
      id_1,
      id_1,
      id_0,
      id_10,
      id_0
  );
  assign modCall_1.type_21 = 0;
  id_13(
      .id_0(1),
      .id_1(id_0),
      .id_2(id_1),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6(1),
      .id_7(1'd0),
      .id_8(1),
      .id_9(id_0),
      .id_10(1),
      .id_11(id_7),
      .id_12(1'b0),
      .id_13(1),
      .id_14(1),
      .id_15(1),
      .id_16(id_2),
      .id_17(1'b0),
      .id_18(id_8)
  );
endmodule

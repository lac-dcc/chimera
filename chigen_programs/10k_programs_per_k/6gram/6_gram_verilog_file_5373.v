// Seed: 889504552
module module_0 (
    input wand id_0,
    input supply0 id_1,
    output tri1 id_2,
    output wor id_3,
    output supply0 id_4,
    input supply1 id_5,
    input wire id_6
    , id_17,
    output supply1 id_7,
    input wor id_8,
    input wand id_9,
    input tri0 id_10,
    output uwire id_11,
    output wor id_12,
    output uwire id_13,
    input wor id_14,
    output supply1 id_15
);
  id_18(
      .id_0(1),
      .id_1(id_7),
      .id_2(id_9),
      .id_3(),
      .id_4(1),
      .id_5(1'b0),
      .id_6(1),
      .id_7(1),
      .id_8(id_3),
      .id_9(1),
      .id_10(id_3),
      .id_11(1),
      .id_12(1'd0),
      .id_13(1 >= 1),
      .id_14(id_13),
      .id_15(1),
      .id_16(1),
      .id_17(id_13)
  );
  assign id_2 = 1;
  wire id_19;
  id_20(
      .id_0(1 == id_1), .id_1(1), .id_2(1 - id_14), .id_3(1), .id_4((1'b0 ==? 1)), .id_5(1'b0)
  );
  assign module_1.type_19 = 0;
endmodule
module module_1 (
    input uwire id_0,
    output wire id_1,
    input uwire id_2,
    input wand id_3,
    output supply1 id_4,
    input uwire id_5,
    input supply1 id_6,
    input wire id_7,
    input tri1 id_8
    , id_12,
    output wand id_9,
    input wor id_10
);
  wire id_13;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_1,
      id_4,
      id_1,
      id_8,
      id_7,
      id_9,
      id_10,
      id_8,
      id_5,
      id_1,
      id_9,
      id_9,
      id_8,
      id_4
  );
  wire id_14;
  or primCall (id_4, id_10, id_5, id_2, id_8, id_12, id_3, id_6);
endmodule

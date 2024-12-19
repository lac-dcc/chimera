// Seed: 284822235
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output supply1 id_2,
    output supply0 id_3,
    output supply1 id_4,
    output supply0 id_5,
    output wor id_6,
    output wire id_7,
    input wand id_8,
    input tri id_9,
    output uwire id_10
);
  id_12(
      .id_0(id_6),
      .id_1(1'b0),
      .id_2(id_9),
      .id_3(id_7),
      .id_4(1'd0),
      .id_5(1),
      .id_6(1 * id_6),
      .id_7(1),
      .id_8(id_4),
      .id_9(1'h0),
      .id_10(id_6),
      .id_11(id_9),
      .id_12(id_7),
      .id_13(id_0 * 1 - 1),
      .id_14(1),
      .id_15(1)
  );
  assign module_1.type_2 = 0;
  wire id_13;
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    input wor id_2,
    input wire id_3,
    output uwire id_4,
    output tri1 id_5,
    output wand id_6,
    input supply1 id_7
);
  uwire id_9, id_10 = id_7;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_4,
      id_9,
      id_4,
      id_5,
      id_6,
      id_10,
      id_10,
      id_1,
      id_6
  );
endmodule

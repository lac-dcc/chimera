// Seed: 3241972737
module module_0 (
    output supply0 id_0,
    output tri0 id_1,
    input tri1 id_2,
    input supply1 id_3,
    input wire id_4,
    input tri1 id_5,
    output uwire id_6,
    output wand id_7,
    output tri id_8,
    output supply1 id_9
);
endmodule
module module_1 (
    output wor id_0,
    output uwire id_1,
    input tri1 id_2,
    input tri id_3,
    output uwire id_4,
    output supply0 id_5,
    input wire id_6,
    input wor id_7,
    input supply1 id_8,
    input tri1 id_9,
    input wor id_10,
    input wire id_11,
    input tri id_12,
    input tri0 id_13,
    input tri id_14,
    input wand id_15,
    input supply1 id_16
);
  id_18(
      .id_0(id_0),
      .id_1(1'd0),
      .id_2(id_0),
      .id_3(id_8 == 1'h0),
      .id_4(1),
      .id_5(1),
      .id_6(id_13),
      .id_7(1'd0),
      .id_8(1 + 1'b0),
      .id_9(1),
      .id_10(1),
      .id_11(1),
      .id_12(id_4),
      .id_13(1)
  );
  module_0 modCall_1 (
      id_4,
      id_0,
      id_6,
      id_2,
      id_2,
      id_13,
      id_4,
      id_5,
      id_1,
      id_5
  );
  assign modCall_1.type_5 = 0;
  assign id_1 = 1;
endmodule

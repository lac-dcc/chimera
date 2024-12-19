// Seed: 2516967819
module module_0 (
    input wor id_0,
    output wor id_1,
    input supply0 id_2,
    output tri0 id_3,
    input supply0 id_4,
    input tri id_5,
    input tri0 id_6,
    input supply0 id_7,
    input supply1 id_8
);
  generate
    id_10(
        .id_0(1'b0),
        .id_1(1'b0),
        .id_2(!1),
        .id_3(id_2),
        .id_4(id_5),
        .id_5(1),
        .id_6(id_4),
        .id_7(1),
        .id_8(id_1),
        .id_9(1'b0),
        .id_10(1'h0),
        .id_11(id_7),
        .id_12(1'h0 * 1 - 1),
        .id_13(id_3),
        .id_14(id_2),
        .id_15(id_4)
    );
  endgenerate
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1
);
  supply1 id_3;
  wire id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_3,
      id_3,
      id_1,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.id_2 = 0;
  assign id_3 = id_1 ? 1 : id_1;
endmodule

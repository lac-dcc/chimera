// Seed: 3720601
module module_0;
  tri id_1, id_2;
  generate
    id_3(
        .id_0(1),
        .id_1(id_1 == 1),
        .id_2(id_1),
        .id_3(1),
        .id_4(1),
        .id_5(id_1),
        .id_6({1, id_1, id_4}),
        .id_7(id_4),
        .id_8(id_4),
        .id_9(1),
        .id_10(1 + 1),
        .id_11(1),
        .id_12(1),
        .id_13(1)
    );
  endgenerate
endmodule
module module_1;
  supply0 id_1;
  assign id_1 = 1 ? 1 : 1'd0;
  tri id_2;
  module_0 modCall_1 ();
  assign modCall_1.type_5 = 0;
  assign id_1 = id_2 ? 1 : id_2;
endmodule

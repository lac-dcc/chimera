// Seed: 1323114697
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output tri id_2,
    output wor id_3,
    output tri1 id_4,
    input supply1 id_5,
    input uwire id_6,
    input wor id_7,
    output wor id_8
);
  wire id_10;
  id_11(
      .id_0(1),
      .id_1(1),
      .id_2(1),
      .id_3({1, 1}),
      .id_4(id_10),
      .id_5(id_7),
      .id_6(1),
      .id_7(1),
      .id_8(1),
      .id_9(1),
      .id_10(id_8),
      .id_11(id_2),
      .id_12(1),
      .id_13(1),
      .id_14(1'd0 - id_7),
      .id_15(id_10),
      .id_16((~id_0 ? id_4 : id_8)),
      .id_17(id_5)
  );
endmodule
module module_1 (
    inout logic id_0,
    output logic id_1,
    input logic id_2,
    input tri0 id_3,
    output wor id_4,
    output supply1 id_5
);
  always @(*)
    if (1) id_1 <= 1;
    else if ((1 && 1 == 1 ? id_3 : 1'b0 + "") && 1 && id_3 && 1 == 1) id_0 <= id_2;
    else id_1 <= 1'h0 !== id_0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_5,
      id_5,
      id_3,
      id_3,
      id_3,
      id_5
  );
  assign modCall_1.type_2 = 0;
endmodule

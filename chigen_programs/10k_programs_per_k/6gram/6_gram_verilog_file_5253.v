// Seed: 1849018036
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    input tri0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    input tri id_5,
    input tri1 id_6,
    output tri0 id_7
);
  wire id_9;
  wor id_10;
  tri1 id_11, id_12 = {1, ~id_4, 1'b0 & id_4};
  supply1 id_13, id_14 = 1 - id_10;
  wire id_15, id_16, id_17;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    input supply0 id_2,
    input wor id_3,
    input wire id_4,
    output tri id_5,
    input supply0 id_6,
    output wor id_7,
    output supply1 id_8
);
  assign id_8 = 1;
  wor id_10, id_11;
  uwire id_12;
  assign id_12 = id_3;
  assign id_10 = 1;
  tri0 id_13;
  assign id_5  = 1'b0;
  assign id_13 = 1;
  wire id_14;
  module_0 modCall_1 (
      id_2,
      id_12,
      id_12,
      id_6,
      id_4,
      id_0,
      id_13,
      id_13
  );
  assign modCall_1.type_18 = 0;
  id_15(
      .id_0(id_6),
      .id_1(""),
      .id_2(id_6 - 1),
      .id_3(1),
      .id_4(),
      .id_5(1),
      .id_6(id_1),
      .id_7(id_5),
      .id_8(id_14),
      .id_9(1),
      .id_10(1),
      .id_11(1),
      .id_12(1)
  );
endmodule

// Seed: 3024456472
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri id_3,
    output tri1 id_4,
    output tri1 id_5,
    input supply1 id_6,
    input uwire id_7
    , id_14,
    output tri1 id_8,
    input supply0 id_9,
    input wor id_10,
    output wor id_11,
    input supply0 id_12
);
  assign id_14 = 1'h0;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    input wand id_2,
    output supply1 id_3,
    input tri id_4,
    input wor id_5,
    output tri1 id_6
);
  wire id_8;
  wire id_9, id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_1,
      id_3,
      id_6,
      id_1,
      id_1,
      id_6,
      id_1,
      id_1,
      id_3,
      id_2
  );
  assign modCall_1.type_7 = 0;
  wire id_11;
  id_12(
      .id_0(1),
      .id_1(1),
      .id_2(id_4),
      .id_3(id_2),
      .id_4(1),
      .id_5(~1),
      .id_6(id_0),
      .id_7(1),
      .id_8(id_2),
      .id_9(1),
      .id_10(id_5)
  );
endmodule

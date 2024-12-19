// Seed: 4205007781
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    input uwire id_2,
    input tri id_3,
    output supply0 id_4,
    input wor id_5,
    input tri id_6,
    output supply1 id_7,
    input uwire id_8,
    input wand id_9,
    input tri0 id_10
);
  integer id_12 (
      .id_0(1),
      .id_1(id_1),
      .id_2({1, id_2}),
      .id_3(1'b0),
      .id_4(1)
  );
  wire id_13;
  tri0 id_14 = 1 + id_6 - 1;
  wire id_15;
endmodule
module module_1 (
    output wire id_0,
    input wor id_1,
    input tri id_2,
    input wor id_3,
    output supply1 id_4,
    input wor id_5,
    output uwire id_6,
    input wor id_7,
    output wor id_8,
    output wor id_9,
    input tri1 id_10,
    input tri1 id_11
    , id_14,
    input wand id_12
);
  assign id_6 = id_3;
  assign id_4 = 1;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_12,
      id_7,
      id_9,
      id_11,
      id_11,
      id_8,
      id_11,
      id_2,
      id_10
  );
  assign modCall_1.type_0 = 0;
endmodule

// Seed: 1161047818
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input supply1 id_2,
    output wor id_3,
    input uwire id_4,
    output tri1 id_5,
    output tri0 id_6,
    input uwire id_7,
    input tri id_8,
    output tri id_9,
    output supply0 id_10,
    output wor id_11,
    output tri0 id_12,
    input supply1 id_13,
    input supply0 id_14
    , id_22,
    input tri id_15,
    input wor id_16,
    input tri1 id_17,
    output uwire id_18,
    input tri id_19
    , id_23,
    output tri id_20
);
  wire id_24;
  assign id_9 = id_7;
  id_25(
      .id_0(id_8),
      .id_1(1),
      .id_2(1 ^ 1),
      .id_3(id_22),
      .id_4(1'b0),
      .id_5(1),
      .id_6({id_16, id_22}),
      .id_7(1),
      .id_8('b0)
  );
  wire id_26;
endmodule
module module_1 (
    input  wor   id_0,
    output tri   id_1,
    output uwire id_2,
    output wire  id_3,
    output wor   id_4,
    output tri   id_5,
    input  tri   id_6,
    output wand  id_7,
    input  uwire id_8,
    output tri0  id_9
);
  assign id_7 = id_8 - id_8;
  wire id_11;
  wire id_12;
  module_0 modCall_1 (
      id_8,
      id_0,
      id_8,
      id_5,
      id_6,
      id_5,
      id_5,
      id_8,
      id_6,
      id_7,
      id_9,
      id_1,
      id_5,
      id_0,
      id_0,
      id_0,
      id_6,
      id_8,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.id_16 = 0;
  wor  id_13 = 1;
  wire id_14;
endmodule

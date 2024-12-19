// Seed: 2160278484
module module_0 (
    output tri0 id_0,
    input supply1 id_1,
    input tri1 id_2,
    output supply0 id_3,
    output wor id_4,
    output wor id_5,
    input supply0 id_6,
    input tri id_7,
    input tri1 id_8,
    input tri1 id_9,
    input supply1 id_10,
    input uwire id_11,
    output tri1 id_12,
    input supply1 id_13,
    output tri1 id_14
    , id_16
);
  wire id_17;
  assign id_3 = 1;
  id_18(
      .id_0(1),
      .id_1(id_13),
      .id_2(id_16),
      .id_3(1'b0),
      .id_4(1),
      .id_5(id_16),
      .id_6(id_16),
      .id_7(1'd0)
  );
  supply0 id_19;
  assign id_19 = id_13;
  wire id_20, id_21, id_22, id_23, id_24, id_25, id_26, id_27;
  wire id_28;
  wire id_29;
endmodule
module module_1 (
    input  tri0  id_0,
    input  uwire id_1,
    input  tri1  id_2,
    output wor   id_3,
    output tri   id_4,
    input  tri1  id_5,
    input  tri0  id_6,
    input  wor   id_7,
    output tri1  id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_1,
      id_8,
      id_4,
      id_8,
      id_6,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_8,
      id_1,
      id_8
  );
  assign modCall_1.type_9 = 0;
endmodule

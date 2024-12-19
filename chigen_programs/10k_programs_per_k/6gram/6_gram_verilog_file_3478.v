// Seed: 2481449560
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    input tri id_2,
    output wor id_3,
    output supply1 id_4,
    output supply0 id_5
    , id_26,
    input wire id_6,
    input wire id_7,
    input uwire id_8,
    input supply0 id_9,
    output wand id_10,
    input tri id_11
    , id_27,
    output tri0 id_12,
    output uwire id_13,
    input tri1 id_14,
    input tri1 id_15,
    output supply1 id_16,
    input wor id_17,
    input uwire id_18,
    output tri1 id_19,
    input tri id_20,
    input wor id_21,
    output tri1 id_22,
    input uwire id_23,
    output tri id_24
);
  logic [7:0] id_28;
  assign id_28[1] = id_27;
  id_29(
      .id_0(id_16),
      .id_1(id_20 - 1),
      .id_2(1),
      .id_3(1),
      .id_4(1),
      .id_5(1'b0),
      .id_6(),
      .id_7(!id_5),
      .id_8(id_17),
      .id_9(1),
      .id_10((1) < id_4 - 1'b0)
  );
  tri id_30 = id_8;
  assign module_1.id_5 = 0;
  id_31(
      id_26, id_5, id_9
  );
  logic [7:0] id_32;
  assign id_32[1] = id_29;
  assign id_5 = 1 < id_7;
  assign id_30 = id_15;
endmodule
module module_1 (
    output tri0 id_0,
    output supply1 id_1,
    output uwire id_2,
    output tri id_3,
    input wor id_4,
    input supply0 id_5,
    output supply0 id_6
);
  reg id_8;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_5,
      id_0,
      id_6,
      id_6,
      id_5,
      id_5,
      id_4,
      id_5,
      id_0,
      id_5,
      id_6,
      id_3,
      id_4,
      id_5,
      id_0,
      id_4,
      id_5,
      id_6,
      id_4,
      id_5,
      id_1,
      id_4,
      id_0
  );
  id_9(
      .id_0(id_5),
      .id_1(1),
      .id_2(1),
      .id_3(id_2),
      .id_4(id_2),
      .id_5(id_4),
      .id_6(id_6 !== (id_6)),
      .id_7(1),
      .id_8(1'b0),
      .id_9(1),
      .id_10(id_6),
      .id_11(id_0)
  );
  always disable id_10;
  always id_8 <= #id_8 1'b0;
endmodule

// Seed: 2627617408
module module_0 (
    output tri1 id_0,
    input supply0 id_1,
    output wor id_2,
    input wor id_3,
    input supply0 id_4,
    input wor id_5,
    input supply0 id_6,
    output uwire id_7,
    input supply0 id_8,
    input tri1 id_9,
    output supply0 id_10
    , id_35,
    input wor id_11,
    input tri0 id_12,
    output tri0 id_13,
    input uwire id_14,
    output tri0 id_15,
    input uwire id_16,
    input wor id_17,
    output uwire id_18,
    input supply0 id_19,
    input tri0 id_20,
    output tri id_21,
    output tri0 id_22,
    input tri id_23,
    input tri0 id_24,
    output tri0 id_25,
    output tri0 id_26,
    input tri id_27,
    input uwire id_28,
    output tri id_29,
    output supply1 id_30,
    input tri id_31,
    input wand id_32,
    input wand id_33
);
  id_36(
      .id_0(1), .id_1(1), .id_2(1), .id_3(id_1 + id_35[1]), .id_4(""), .id_5(id_33)
  );
  wire id_37;
endmodule
module module_1 (
    input tri1 id_0,
    input uwire id_1,
    output tri id_2,
    output supply1 id_3,
    inout supply0 id_4,
    output uwire id_5,
    input supply1 id_6
    , id_11,
    input uwire id_7,
    input wor id_8,
    input supply1 id_9
);
  wire id_12;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_4,
      id_8,
      id_6,
      id_7,
      id_4,
      id_3,
      id_1,
      id_0,
      id_2,
      id_1,
      id_1,
      id_3,
      id_0,
      id_5,
      id_6,
      id_8,
      id_2,
      id_0,
      id_1,
      id_2,
      id_2,
      id_1,
      id_7,
      id_5,
      id_4,
      id_7,
      id_6,
      id_3,
      id_5,
      id_6,
      id_6,
      id_8
  );
  assign modCall_1.type_5 = 0;
  wire id_13;
  assign id_11 = 1;
  wire id_14;
  wor  id_15 = id_7 - id_11;
  id_16(
      .product(1 - id_0), .id_0(id_9 - 1'b0)
  );
  tri  id_17 = id_4;
  wire id_18;
endmodule

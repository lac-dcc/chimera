// Seed: 1329048036
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    input wor id_2,
    input supply0 id_3
    , id_12,
    output wire id_4,
    output wire id_5
    , id_13,
    output uwire id_6,
    input supply0 id_7,
    input supply0 id_8,
    input tri id_9,
    output tri id_10
);
  tri0 id_14 = id_9;
  wire id_15;
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    input tri1 id_2,
    input wor id_3,
    output tri0 id_4,
    output wire id_5,
    input tri0 id_6,
    output tri1 id_7,
    input wand id_8,
    output wor id_9,
    output tri0 id_10,
    input wire id_11,
    input supply0 id_12,
    input tri id_13,
    input tri1 id_14,
    output uwire id_15,
    input wand id_16,
    output tri0 id_17,
    input supply0 id_18,
    input supply1 id_19,
    input tri1 id_20,
    input wor id_21
);
  wire id_23;
  module_0 modCall_1 (
      id_5,
      id_11,
      id_19,
      id_6,
      id_4,
      id_15,
      id_7,
      id_19,
      id_19,
      id_20,
      id_7
  );
  assign modCall_1.type_22 = 0;
  id_24(
      .id_0(id_13), .id_1(1), .id_2(1), .id_3(id_7 == ~(id_2))
  );
endmodule

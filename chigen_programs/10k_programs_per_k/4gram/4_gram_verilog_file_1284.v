// Seed: 1978647117
module module_0 (
    output wor id_0,
    input wor id_1,
    output tri1 id_2,
    output wand id_3,
    output uwire id_4,
    input supply1 id_5,
    output wor id_6,
    output tri0 id_7,
    input uwire id_8
    , id_21,
    input tri id_9,
    input wor id_10,
    input wor id_11,
    output uwire id_12,
    output wire id_13,
    input supply1 id_14,
    input wor id_15,
    input supply1 id_16,
    output tri0 id_17,
    input wor id_18,
    input tri0 id_19
);
  assign id_17 = id_11;
  id_22(
      .id_0(1),
      .id_1(1),
      .id_2({1, 1'b0}),
      .id_3(1),
      .id_4((id_17) & id_16),
      .id_5(1),
      .id_6(1),
      .id_7(1),
      .id_8(1)
  );
  wire id_23;
  wire id_24;
endmodule
module module_1 (
    output wor id_0,
    output supply0 id_1,
    input supply0 id_2,
    output wire id_3,
    output supply1 id_4,
    output wor id_5,
    input tri0 id_6
);
  wire id_8;
  wire id_9;
  wire id_10;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_4,
      id_1,
      id_4,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_6,
      id_2,
      id_5,
      id_1,
      id_2,
      id_2,
      id_2,
      id_5,
      id_6,
      id_6
  );
  assign modCall_1.type_5 = 0;
  wire id_11;
endmodule

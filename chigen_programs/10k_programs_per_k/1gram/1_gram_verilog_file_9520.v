// Seed: 4032052964
module module_0 (
    input tri1 id_0,
    input wand id_1,
    input tri id_2,
    output uwire id_3,
    inout wand id_4,
    output uwire id_5,
    input wand id_6,
    input tri1 id_7,
    input supply1 id_8,
    input tri0 id_9,
    output tri1 id_10,
    output wor id_11,
    input wor id_12,
    input wire id_13,
    input tri0 id_14,
    input tri id_15,
    input wand id_16,
    input wand id_17,
    output tri0 id_18
);
  wire id_20;
  assign id_3 = 1;
  assign id_10 = 1 - 1;
  assign module_1.type_9 = 0;
  `define pp_21 0
endmodule
module module_1 (
    input wand id_0,
    input wor id_1,
    input tri1 id_2,
    output supply1 id_3,
    output tri1 id_4,
    output supply1 id_5,
    output tri0 id_6,
    output wire id_7
    , id_22,
    output tri id_8,
    inout wire id_9,
    input supply0 id_10,
    output tri id_11,
    input supply1 id_12,
    input wor id_13,
    input wire id_14,
    input supply0 id_15,
    input uwire id_16,
    input tri id_17,
    input tri1 id_18,
    input wor id_19,
    output uwire id_20
);
  tri0 id_23;
  tri  id_24;
  assign id_8 = 1 | "";
  id_25(
      .id_0(id_11),
      .id_1(id_14),
      .id_2(id_0),
      .id_3(1),
      .id_4(id_13),
      .id_5(1),
      .id_6(1),
      .id_7(id_15 / 1),
      .id_8(1),
      .id_9(1),
      .id_10(1 - id_23.sum)
  );
  assign id_20 = id_24;
  assign id_4  = id_14;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_18,
      id_8,
      id_9,
      id_9,
      id_2,
      id_17,
      id_16,
      id_24,
      id_3,
      id_5,
      id_17,
      id_24,
      id_14,
      id_19,
      id_17,
      id_1,
      id_4
  );
  always id_22 <= 1;
endmodule

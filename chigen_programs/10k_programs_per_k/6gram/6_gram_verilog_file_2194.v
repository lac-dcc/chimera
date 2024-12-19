// Seed: 3527480722
module module_0 (
    input supply1 id_0,
    output wand id_1,
    input uwire id_2,
    input wor id_3,
    output uwire id_4,
    output wire id_5,
    input wand id_6,
    output wire id_7,
    input wire id_8,
    output wand id_9,
    input supply0 id_10,
    input supply1 id_11,
    input supply0 id_12,
    input supply1 id_13,
    output uwire id_14
);
  wire id_16;
  wire id_17;
  wire id_18;
  tri0 id_19, id_20, id_21 = 1;
  wire id_22;
  supply1 id_23 = 'b0;
  id_24(
      1, id_19, 1
  );
endmodule
module module_1 (
    input supply0 id_0
    , id_15,
    input supply0 id_1,
    output supply0 id_2,
    output wor id_3,
    output tri id_4,
    input supply1 id_5
    , id_16,
    input tri0 id_6,
    output uwire id_7
    , id_17,
    input wor id_8,
    input wor id_9,
    output supply1 id_10,
    input tri1 id_11,
    output tri0 id_12,
    output tri0 id_13
);
  id_18(
      .id_0(id_8 + id_3),
      .id_1(!id_6),
      .id_2(id_0),
      .id_3(1),
      .id_4(1),
      .id_5(1),
      .id_6(1),
      .id_7(id_8),
      .id_8(id_11),
      .id_9(1),
      .id_10(1),
      .id_11(id_17 - 1 | id_10),
      .id_12(),
      .id_13(1'b0),
      .id_14(id_12),
      .id_15(1),
      .id_16(id_12)
  );
  wire id_19;
  assign id_3 = id_9 > id_1;
  module_0 modCall_1 (
      id_0,
      id_10,
      id_6,
      id_5,
      id_3,
      id_3,
      id_6,
      id_10,
      id_9,
      id_3,
      id_9,
      id_9,
      id_9,
      id_6,
      id_4
  );
  assign modCall_1.type_29 = 0;
  assign id_4 = id_0 == id_11;
  and primCall (id_4, id_11, id_5, id_6, id_0, id_8, id_16, id_19, id_9, id_17, id_15, id_18, id_1);
  wire id_20;
endmodule

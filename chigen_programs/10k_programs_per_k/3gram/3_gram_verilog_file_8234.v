// Seed: 2764325366
module module_0 (
    input supply0 id_0,
    input supply1 id_1
    , id_25,
    output tri1 id_2,
    input supply0 id_3,
    output wire id_4,
    input tri0 id_5,
    output wor id_6,
    input supply1 id_7,
    input wand id_8,
    input supply1 id_9,
    input tri1 id_10,
    output tri0 id_11,
    input tri id_12,
    output tri1 id_13,
    input tri0 id_14,
    input tri0 id_15,
    input tri1 id_16,
    output tri0 id_17,
    input wor id_18,
    input supply0 id_19,
    output wire id_20,
    input wor id_21,
    input supply0 id_22,
    output supply1 id_23
);
  assign id_23 = id_22;
  id_26(
      .id_0(),
      .id_1(id_20),
      .id_2(id_0),
      .id_3(),
      .id_4(id_25 - id_16),
      .id_5(1'b0 ^ id_9),
      .id_6(1),
      .id_7(1 & 1'h0),
      .id_8(1)
  );
endmodule
module module_1 (
    input  tri0  id_0,
    output wor   id_1,
    input  uwire id_2,
    input  tri0  id_3
);
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_3,
      id_1,
      id_3,
      id_2,
      id_0,
      id_0,
      id_1,
      id_3,
      id_1,
      id_0,
      id_0,
      id_3,
      id_1,
      id_2,
      id_0,
      id_1,
      id_3,
      id_0,
      id_1
  );
  assign modCall_1.id_0 = 0;
  wand id_5;
  assign id_1 = id_3;
  always_ff @(id_0 or posedge 1 - id_5) assign id_1 = 1;
endmodule

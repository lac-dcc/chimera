// Seed: 3336329125
module module_0 (
    output tri id_0,
    output wand id_1,
    input tri1 id_2,
    output wire id_3,
    input uwire id_4,
    input supply0 id_5,
    input tri0 id_6,
    output wand id_7,
    output supply0 id_8
);
  wire id_10;
  id_11(
      .id_0(id_5), .id_1((1) | id_4), .id_2(id_0), .id_3((id_7)), .id_4(id_8)
  );
endmodule
module module_1 (
    input tri1 id_0,
    output tri0 id_1,
    input wand id_2,
    input supply1 id_3,
    input tri1 id_4,
    output supply1 id_5,
    input tri0 id_6
    , id_20, id_21,
    input supply0 id_7,
    output tri1 id_8,
    output tri0 id_9,
    output tri id_10,
    output tri0 id_11,
    input wand id_12,
    output wor id_13,
    input wire id_14,
    input supply1 id_15,
    input wand id_16,
    input wire id_17,
    output uwire id_18
);
  uwire id_22 = id_20;
  id_23(
      .id_0(id_4),
      .id_1(id_16),
      .id_2(1 ? 1 : 1'b0),
      .id_3(id_6 & 1),
      .id_4(id_20 - id_22),
      .id_5(id_17),
      .id_6(id_15)
  ); module_0(
      id_18, id_11, id_2, id_10, id_3, id_0, id_14, id_11, id_10
  );
endmodule

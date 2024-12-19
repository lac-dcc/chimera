// Seed: 1202351429
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    output wor id_2,
    input tri1 id_3,
    input supply1 id_4,
    input wand id_5,
    output supply0 id_6,
    output supply1 id_7,
    output tri0 id_8,
    input tri id_9,
    input tri1 id_10,
    input tri0 id_11,
    output uwire id_12,
    input tri1 id_13,
    output tri0 id_14,
    output wire id_15,
    input wire id_16,
    input tri1 id_17,
    output supply0 id_18,
    input wire id_19,
    output tri0 id_20,
    input tri1 id_21,
    input tri0 id_22,
    output wor id_23,
    input supply0 id_24
);
  for (id_26 = 1; 1; id_15 = 1) always_ff #1;
  assign module_1.type_0 = 0;
  initial id_23 = 1'b0;
  wire id_27 = 1;
  assign id_15 = id_22 - id_4;
endmodule
module module_1 (
    output tri id_0,
    input wand id_1,
    input wand id_2,
    input uwire id_3,
    output tri0 id_4,
    output supply1 id_5,
    output tri0 id_6
);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_6,
      id_2,
      id_3,
      id_3,
      id_5,
      id_0,
      id_0,
      id_2,
      id_3,
      id_2,
      id_6,
      id_2,
      id_6,
      id_6,
      id_1,
      id_3,
      id_4,
      id_3,
      id_5,
      id_3,
      id_2,
      id_4,
      id_2
  );
  id_8(
      .id_0(id_3),
      .id_1(1),
      .id_2(),
      .id_3(id_6),
      .id_4(1),
      .id_5(1 ? ({1, ""}) != id_2 : 1),
      .id_6(id_0)
  );
endmodule

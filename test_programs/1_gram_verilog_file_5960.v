// Seed: 1928809347
program module_0 (
    output tri1 id_0,
    input supply1 id_1,
    output tri1 id_2,
    id_20,
    input wire id_3,
    output wire id_4,
    input tri id_5,
    input wand id_6,
    output supply0 id_7,
    id_21,
    input wand id_8,
    output wor id_9,
    input wire id_10,
    input wire id_11,
    output tri0 id_12,
    output supply1 id_13,
    output supply1 id_14,
    output tri id_15,
    input tri id_16,
    input supply0 id_17,
    output uwire id_18
);
  integer id_22 (
      .sum (id_17),
      .id_0(id_9)
  );
  id_23(
      .id_0(id_21),
      .id_1(id_20),
      .id_2(id_22),
      .id_3(id_2),
      .id_4(1'b0 & -1),
      .id_5(1),
      .id_6(""),
      .id_7(1)
  );
  wire id_24;
endmodule
module module_1 (
    output tri1 id_0,
    output wire id_1,
    input tri0 id_2,
    output uwire id_3,
    output tri1 id_4,
    input wire id_5,
    input supply0 id_6,
    output wor id_7,
    input uwire id_8,
    input tri id_9,
    output supply1 id_10,
    input supply1 id_11,
    input wand id_12,
    input uwire id_13,
    input uwire id_14,
    output wire id_15,
    output wand id_16,
    output tri id_17,
    input tri0 id_18,
    output wand id_19,
    output supply0 id_20
);
  uwire id_22, id_23;
  wire id_24, id_25, id_26;
  module_0 modCall_1 (
      id_19,
      id_2,
      id_4,
      id_9,
      id_1,
      id_18,
      id_14,
      id_16,
      id_14,
      id_0,
      id_18,
      id_5,
      id_19,
      id_16,
      id_4,
      id_7,
      id_5,
      id_11,
      id_1
  );
  assign modCall_1.type_26 = 0;
  assign id_4 = id_12;
  parameter id_27 = id_22;
endmodule

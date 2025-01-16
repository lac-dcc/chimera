// Seed: 3730089004
program module_0 (
    input uwire id_0,
    input uwire id_1,
    input supply0 id_2,
    output tri id_3,
    input tri id_4,
    output uwire id_5,
    output supply1 id_6,
    output wor id_7,
    input wor id_8,
    output uwire id_9,
    input uwire id_10
);
  wire id_12;
  tri id_13, id_14;
  assign id_5 = id_14;
  parameter id_15 = -1;
  wire id_16;
  id_17(
      .id_0(1)
  );
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    input supply1 id_2,
    input wor id_3,
    inout tri0 id_4,
    input wire id_5,
    input wire id_6,
    output wire id_7,
    input wand id_8,
    output wor id_9,
    id_31,
    input wor id_10,
    input uwire id_11,
    output tri0 id_12,
    output supply1 id_13,
    input tri1 id_14,
    output wor id_15,
    input tri0 id_16,
    input uwire id_17,
    output wire id_18,
    input tri0 id_19,
    input supply0 id_20,
    output tri1 id_21,
    output wand id_22,
    input uwire id_23,
    output tri0 id_24,
    output wor id_25,
    input supply1 id_26,
    input wire id_27,
    input wor id_28,
    input supply0 id_29
);
  wire id_32;
  module_0 modCall_1 (
      id_4,
      id_23,
      id_27,
      id_4,
      id_19,
      id_9,
      id_4,
      id_13,
      id_14,
      id_12,
      id_14
  );
  assign modCall_1.type_20 = 0;
  always_comb @(*) if (id_11) id_15 = 1'b0;
  wire id_33;
endmodule

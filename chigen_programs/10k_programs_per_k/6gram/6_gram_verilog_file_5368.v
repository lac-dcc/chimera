// Seed: 2458575859
program module_0 (
    output wire id_0,
    output supply1 id_1,
    output tri1 id_2,
    input wire id_3,
    output uwire id_4,
    input wire id_5,
    output tri0 id_6,
    input tri1 id_7,
    input tri1 id_8,
    output wor id_9,
    output wor id_10,
    output uwire id_11,
    input tri1 id_12,
    output supply1 id_13,
    input wor id_14,
    input wor id_15,
    output supply0 id_16,
    input supply1 id_17,
    input wor id_18,
    output wor id_19,
    input tri0 id_20,
    output tri1 id_21,
    output tri id_22,
    output wor id_23
);
  tri1 id_25 = 1 | 1;
  wire id_26;
  assign id_10 = ~&id_17;
  assign id_22 = 1;
endprogram
module module_1 (
    output wor  id_0,
    input  tri  id_1,
    output wand id_2
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.type_6 = 0;
endmodule

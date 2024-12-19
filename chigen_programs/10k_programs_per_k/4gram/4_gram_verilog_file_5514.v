// Seed: 2274693044
module module_0 (
    input tri id_0,
    output supply1 id_1,
    output supply0 id_2,
    output tri id_3,
    input wand id_4,
    output supply1 id_5,
    output wand id_6,
    output wire id_7,
    input tri1 id_8,
    output supply1 id_9,
    output wand id_10,
    output supply1 id_11,
    input supply0 id_12,
    input wor id_13,
    input wire id_14,
    input wand id_15,
    output tri id_16,
    input uwire id_17,
    output wor id_18,
    input wand id_19
);
  wire id_21;
  wire id_22;
endmodule
module module_1 (
    output supply0 id_0,
    input tri id_1,
    input uwire id_2
);
  assign id_0 = 1 << id_1;
  assign id_0 = 1;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_1,
      id_2,
      id_1,
      id_2,
      id_0,
      id_2,
      id_0,
      id_1
  );
  assign modCall_1.type_23 = 0;
endmodule

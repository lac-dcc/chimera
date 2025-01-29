// Seed: 2047942637
module module_0 (
    input tri id_0,
    output uwire id_1,
    input wand id_2,
    input tri0 id_3,
    input wand id_4,
    output tri1 id_5,
    input tri id_6,
    output uwire id_7,
    input uwire id_8,
    input uwire id_9,
    output tri id_10,
    input tri0 id_11,
    output wand id_12,
    output wor id_13,
    input tri0 id_14,
    output supply1 id_15,
    output supply0 id_16,
    input wor id_17,
    output wor id_18
);
  assign id_12 = -1;
  wire id_20, id_21;
  if (1) wand id_22 = -1, id_23;
  else wire id_24 = -1'h0;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1,
    input wand void id_2,
    output supply0 id_3,
    output wire id_4,
    input supply0 id_5,
    input supply1 id_6,
    output tri id_7
);
  assign id_7 = id_5;
  tri id_9;
  assign id_7 = ~id_6;
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_1,
      id_1,
      id_5,
      id_7,
      id_6,
      id_4,
      id_1,
      id_1,
      id_7,
      id_2,
      id_3,
      id_4,
      id_5,
      id_3,
      id_7,
      id_2,
      id_3
  );
  assign modCall_1.type_6 = 0;
endmodule

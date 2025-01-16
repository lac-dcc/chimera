// Seed: 265636445
module module_0 (
    output tri1 id_0,
    input tri1 id_1,
    output tri0 id_2,
    input tri0 id_3,
    input wand id_4,
    output supply1 id_5,
    output tri id_6,
    output wire id_7,
    output tri id_8,
    output tri id_9,
    input wire id_10,
    output wire id_11,
    output wand id_12,
    output wand id_13,
    input wand id_14,
    output supply0 id_15,
    input supply1 id_16,
    input wand id_17,
    output wor id_18
);
  assign id_0 = id_17;
  wire id_20;
  wire id_21, id_22;
  wire id_23;
endmodule
module module_1 (
    input uwire id_0,
    input wand id_1,
    output tri0 id_2,
    output wand id_3,
    input wand id_4,
    output wire id_5,
    output tri id_6,
    input uwire id_7,
    output supply1 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_5,
      id_1,
      id_4,
      id_5,
      id_6,
      id_5,
      id_5,
      id_8,
      id_1,
      id_2,
      id_2,
      id_2,
      id_4,
      id_3,
      id_7,
      id_7,
      id_3
  );
  assign modCall_1.id_16 = 0;
  assign id_2 = 1;
endmodule

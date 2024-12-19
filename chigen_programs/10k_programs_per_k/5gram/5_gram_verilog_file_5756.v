// Seed: 1334189407
module module_0 (
    input wor id_0,
    input tri0 id_1,
    input uwire id_2,
    input tri1 id_3,
    input uwire id_4,
    input uwire id_5,
    input tri id_6,
    input wand id_7,
    input uwire id_8,
    output wire id_9,
    output wand id_10,
    input supply1 id_11,
    input supply1 id_12,
    input supply1 id_13,
    output wand id_14,
    output tri0 id_15,
    output tri1 id_16,
    input wire id_17,
    input wire id_18,
    input uwire id_19,
    input uwire id_20
);
  wire id_22;
  assign id_15 = 1;
  assign module_1.id_3 = 0;
  wire id_23;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    input supply1 id_2,
    output wor id_3,
    input wand id_4,
    input tri0 id_5,
    output tri id_6,
    input tri0 id_7
);
  assign id_6 = id_0;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_0,
      id_4,
      id_5,
      id_5,
      id_7,
      id_3,
      id_3,
      id_7,
      id_5,
      id_7,
      id_3,
      id_6,
      id_3,
      id_7,
      id_7,
      id_7,
      id_4
  );
endmodule

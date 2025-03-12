// Seed: 4173897199
module module_0 (
    output tri0 id_0,
    output wor id_1,
    output tri1 id_2,
    output wand id_3,
    input tri0 id_4,
    output wire id_5,
    output wire id_6,
    input wor id_7,
    output wor id_8,
    input wor id_9,
    input supply1 id_10,
    output tri0 id_11,
    output wor id_12,
    input wire id_13,
    input tri id_14,
    input tri id_15,
    input tri0 id_16,
    output tri1 id_17,
    input tri0 id_18,
    output wire id_19,
    output tri0 id_20,
    input wand id_21,
    input uwire id_22,
    input tri1 id_23
);
  wire id_25;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    output tri1 id_0,
    output wor id_1,
    input tri id_2,
    input tri0 id_3,
    output uwire id_4,
    output tri1 id_5,
    input wand id_6,
    input supply1 id_7,
    output tri1 id_8,
    input tri0 id_9,
    output wor id_10,
    output wor id_11,
    input supply1 id_12,
    input tri0 id_13,
    input uwire id_14
);
  logic id_16;
  ;
  wire id_17;
  wire id_18;
  nor primCall (id_4, id_2, id_6, id_16, id_7, id_18, id_9, id_14, id_13, id_3, id_17);
  assign id_0 = 1;
  module_0 modCall_1 (
      id_4,
      id_11,
      id_4,
      id_4,
      id_2,
      id_5,
      id_4,
      id_7,
      id_11,
      id_2,
      id_2,
      id_4,
      id_8,
      id_12,
      id_7,
      id_12,
      id_3,
      id_10,
      id_6,
      id_4,
      id_1,
      id_13,
      id_6,
      id_12
  );
endmodule

// Seed: 2990221391
module module_0 (
    input uwire id_0,
    input wor id_1,
    output wor id_2,
    input wor id_3,
    input wire id_4,
    input uwire id_5,
    output tri id_6,
    output wire id_7,
    input uwire id_8,
    output tri0 id_9,
    output wor id_10,
    input wire id_11,
    output uwire id_12,
    input tri0 id_13,
    input supply1 id_14,
    input wand id_15,
    output uwire id_16,
    input tri1 id_17,
    input uwire id_18,
    input supply0 id_19,
    input uwire id_20,
    input wand id_21
);
  assign id_16 = 1;
  wire id_23;
  assign module_1.id_14 = 0;
endmodule
macromodule module_1 (
    input supply0 id_0,
    input wire id_1,
    input wand id_2,
    input uwire id_3,
    input wand id_4,
    input tri0 id_5,
    input tri id_6,
    input tri1 id_7,
    output wand id_8,
    output supply1 id_9,
    input wire id_10,
    input tri1 id_11,
    input supply0 id_12,
    input tri id_13,
    output wand id_14
);
  assign id_8 = id_3;
  wire id_16;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_14,
      id_5,
      id_1,
      id_3,
      id_8,
      id_9,
      id_0,
      id_14,
      id_14,
      id_6,
      id_9,
      id_10,
      id_1,
      id_11,
      id_9,
      id_3,
      id_13,
      id_7,
      id_3,
      id_13
  );
endmodule

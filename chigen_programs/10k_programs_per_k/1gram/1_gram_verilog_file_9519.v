// Seed: 298834694
macromodule module_0 (
    input tri id_0,
    input tri id_1,
    input supply0 id_2,
    output tri1 id_3,
    input tri0 id_4,
    input wire id_5,
    input uwire id_6,
    input uwire id_7,
    input wor id_8,
    output wire id_9,
    input supply0 id_10,
    output tri id_11,
    output tri1 id_12,
    output tri1 id_13,
    output wand id_14
    , id_30,
    output tri id_15
    , id_31,
    input wand id_16,
    output uwire id_17,
    input supply1 id_18,
    output tri1 id_19,
    input supply0 id_20,
    input tri0 id_21,
    input uwire id_22,
    output wor id_23,
    input wor id_24,
    input tri1 id_25,
    output tri1 id_26,
    output wand id_27,
    input uwire id_28
);
  assign id_26 = 1;
  supply0 id_32 = id_16;
  assign module_1.id_11 = 0;
  assign id_32 = 0;
endmodule
module module_1 (
    input wand id_0,
    inout tri1 id_1,
    output supply1 id_2,
    input tri0 id_3,
    output tri1 id_4,
    output wor id_5,
    input wor id_6,
    output tri id_7,
    input uwire id_8,
    output wand id_9
);
  assign id_9 = id_6;
  assign id_9 = 1;
  uwire id_11 = id_0;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_1,
      id_9,
      id_8,
      id_1,
      id_11,
      id_8,
      id_3,
      id_11,
      id_11,
      id_9,
      id_9,
      id_4,
      id_4,
      id_9,
      id_11,
      id_7,
      id_0,
      id_1,
      id_11,
      id_1,
      id_11,
      id_4,
      id_6,
      id_6,
      id_5,
      id_9,
      id_3
  );
endmodule

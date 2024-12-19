// Seed: 478637544
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input tri id_2,
    input wire id_3,
    input tri0 id_4,
    input uwire id_5,
    input supply0 id_6,
    input wor id_7,
    input tri0 id_8,
    output wire id_9,
    input wire id_10,
    input uwire id_11,
    output wor id_12,
    input tri0 id_13,
    output wand id_14,
    input wire id_15,
    input uwire id_16
    , id_30,
    output supply0 id_17,
    input wire id_18,
    input wand id_19,
    input tri id_20,
    input supply0 id_21,
    input tri1 id_22,
    output wire id_23,
    input supply1 id_24,
    input wand id_25,
    output tri1 id_26,
    input wire id_27,
    input supply0 id_28
);
  assign id_12 = id_4;
  assign id_17 = 1'b0;
  assign module_1.type_11 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    input supply1 id_2,
    input wire id_3,
    output wor id_4,
    output wor id_5,
    input supply1 id_6,
    input tri0 id_7
);
  xor primCall (id_5, id_6, id_7);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_6,
      id_0,
      id_6,
      id_6,
      id_1,
      id_6,
      id_3,
      id_5,
      id_0,
      id_7,
      id_5,
      id_3,
      id_4,
      id_2,
      id_0,
      id_4,
      id_3,
      id_6,
      id_0,
      id_3,
      id_1,
      id_4,
      id_7,
      id_7,
      id_4,
      id_1,
      id_0
  );
endmodule

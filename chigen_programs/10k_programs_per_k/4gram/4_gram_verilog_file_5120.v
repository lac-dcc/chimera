// Seed: 1350899784
module module_0 (
    input supply1 id_0,
    input tri id_1,
    input supply0 id_2,
    input wire id_3,
    output wand id_4,
    input tri id_5,
    output tri1 id_6,
    input tri0 id_7,
    input tri id_8,
    input tri0 id_9,
    output tri id_10,
    output supply1 id_11,
    output tri id_12,
    input wire id_13,
    input uwire id_14,
    input wor id_15,
    output tri0 id_16,
    input supply0 id_17,
    output wor id_18,
    output tri id_19,
    input wand id_20,
    output wor id_21,
    output supply0 id_22,
    input wand id_23,
    input tri id_24
    , id_31,
    input wor id_25,
    input supply0 id_26,
    output wand id_27,
    input supply0 id_28,
    input tri1 id_29
);
  wire id_32, id_33, id_34, id_35;
  assign module_1.id_7 = 0;
  assign id_19 = -1'b0;
endmodule
module module_1 (
    input wire id_0,
    input tri1 id_1,
    output supply0 id_2,
    input tri id_3,
    output wire id_4,
    output wand id_5,
    output wor id_6,
    input tri0 id_7
);
  wire [1 : 1] id_9;
  nand primCall (id_5, id_9, id_3);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_0,
      id_5,
      id_3,
      id_6,
      id_1,
      id_3,
      id_0,
      id_4,
      id_5,
      id_5,
      id_1,
      id_3,
      id_0,
      id_2,
      id_0,
      id_4,
      id_5,
      id_7,
      id_2,
      id_2,
      id_7,
      id_0,
      id_0,
      id_3,
      id_6,
      id_3,
      id_0
  );
endmodule

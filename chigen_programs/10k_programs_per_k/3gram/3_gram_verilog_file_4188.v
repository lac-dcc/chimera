// Seed: 3202424325
module module_0 (
    input wor id_0,
    input tri0 id_1,
    output tri1 id_2,
    output supply0 id_3,
    input wire id_4,
    input wor id_5,
    input supply0 id_6,
    input supply1 id_7,
    input tri0 id_8,
    input wire id_9,
    input supply0 id_10
    , id_32,
    input tri1 id_11,
    input wand id_12,
    output supply1 id_13,
    input tri1 id_14,
    input wor id_15
    , id_33,
    output supply1 id_16,
    input tri id_17,
    output supply1 id_18,
    output wor id_19,
    output tri id_20,
    input uwire id_21,
    input tri0 id_22,
    input wand id_23,
    output tri0 id_24
    , id_34,
    input wand id_25,
    input wire id_26,
    input wor id_27,
    input tri0 id_28,
    output supply1 id_29,
    input tri1 id_30
);
  wire id_35;
  ;
  assign module_1.id_6 = 0;
  assign id_19 = -1'd0;
  wire [-1 : -1] id_36;
endmodule
module module_1 (
    input uwire id_0,
    input wor id_1,
    input wor id_2,
    output uwire id_3,
    input uwire id_4,
    output supply0 id_5,
    output tri id_6,
    output tri id_7,
    output uwire id_8,
    input uwire id_9,
    output tri id_10,
    input wand id_11,
    input wire id_12
);
  assign id_7 = 1 ? 1 : ~id_4;
  nand primCall (id_6, id_9, id_12, id_0, id_1, id_2);
  module_0 modCall_1 (
      id_11,
      id_11,
      id_8,
      id_5,
      id_11,
      id_12,
      id_9,
      id_12,
      id_11,
      id_9,
      id_1,
      id_0,
      id_2,
      id_8,
      id_4,
      id_12,
      id_7,
      id_9,
      id_7,
      id_7,
      id_6,
      id_1,
      id_0,
      id_1,
      id_3,
      id_1,
      id_12,
      id_11,
      id_0,
      id_10,
      id_4
  );
endmodule

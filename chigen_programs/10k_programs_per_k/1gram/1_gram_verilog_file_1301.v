// Seed: 497318774
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    input tri id_2,
    input tri0 id_3,
    output tri id_4,
    output wire id_5,
    input tri0 id_6,
    input tri1 id_7,
    input supply1 id_8,
    input tri0 id_9,
    output wor id_10,
    input wire id_11,
    output wand id_12,
    output tri0 id_13
);
  wand id_15, id_16, id_17;
  wire id_18, id_19;
  logic [7:0][1  ^ ""] id_20;
  assign id_15 = id_11;
endmodule
module module_1 (
    output wor id_0,
    input tri1 id_1,
    output wire id_2,
    input supply0 id_3,
    input supply0 id_4,
    input supply0 id_5,
    output wire id_6,
    output wire id_7,
    input tri id_8,
    output supply1 id_9,
    input wand id_10,
    output tri0 id_11,
    input tri1 id_12,
    input tri1 id_13,
    input tri id_14,
    output tri id_15,
    input tri0 id_16,
    input wire id_17,
    output supply1 id_18,
    input uwire id_19,
    input supply1 id_20,
    output wand id_21,
    input tri1 id_22,
    input uwire id_23,
    output wire id_24,
    output uwire id_25,
    output wand id_26,
    output wor id_27,
    input uwire id_28
);
  wire id_30;
  assign id_24 = id_14 | 1;
  assign id_9  = 1;
  wire id_31;
  generate
    assign id_21 = id_13;
  endgenerate
  module_0 modCall_1 (
      id_8,
      id_1,
      id_5,
      id_4,
      id_24,
      id_0,
      id_8,
      id_28,
      id_4,
      id_22,
      id_25,
      id_12,
      id_21,
      id_27
  );
  assign modCall_1.id_2 = 0;
  tri id_32 = 1 & id_16;
endmodule

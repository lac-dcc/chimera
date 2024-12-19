// Seed: 2231324370
module module_0 (
    input wand id_0,
    output wand id_1,
    input tri id_2,
    input wor id_3,
    input supply1 id_4,
    input tri0 id_5,
    input tri0 id_6,
    input uwire id_7,
    input wire id_8
    , id_25,
    input wand id_9,
    output wand id_10,
    input tri0 id_11,
    output wire id_12,
    input wor id_13,
    output wand id_14,
    input tri id_15,
    input uwire id_16,
    output wor id_17,
    input wire id_18,
    output wand id_19,
    input supply1 id_20,
    input wor id_21,
    input wire id_22,
    input supply1 id_23
);
  wire id_26;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output uwire id_0,
    output tri0 id_1,
    input tri id_2,
    output wand id_3,
    output supply1 id_4
);
  always @(1) begin : LABEL_0
    id_4 = 1 - 1;
  end
  module_0 modCall_1 (
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_4,
      id_2,
      id_3,
      id_2,
      id_3,
      id_2,
      id_2,
      id_3,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2
  );
endmodule

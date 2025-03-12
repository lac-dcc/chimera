// Seed: 379951213
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input wor id_2,
    input tri1 id_3,
    input tri1 id_4,
    output wand id_5,
    input tri0 id_6,
    input tri0 id_7,
    input wor id_8,
    input wire id_9,
    output tri1 id_10,
    input tri1 id_11,
    output tri void id_12,
    output tri0 id_13,
    output wor id_14,
    input tri id_15,
    input tri id_16,
    input uwire id_17,
    input wand id_18,
    input wand id_19,
    input wand id_20,
    input supply0 id_21,
    output logic id_22,
    output wor id_23,
    input wor id_24,
    input tri0 id_25
    , id_29,
    output supply0 id_26,
    input tri id_27
);
  always id_22 <= #1 id_25;
endmodule
module module_1 (
    output wor id_0,
    output tri0 id_1,
    input tri0 id_2,
    output wand id_3,
    input wand id_4,
    output logic id_5,
    input supply0 id_6,
    input tri0 id_7,
    input wire id_8,
    output supply1 id_9,
    input tri id_10
);
  assign id_3 = id_4;
  always_latch id_5 = 1 && 1;
  logic id_12;
  ;
  logic [7:0] id_13;
  assign id_12 = id_2;
  module_0 modCall_1 (
      id_8,
      id_7,
      id_8,
      id_7,
      id_2,
      id_9,
      id_7,
      id_10,
      id_10,
      id_8,
      id_1,
      id_10,
      id_0,
      id_9,
      id_0,
      id_7,
      id_7,
      id_8,
      id_7,
      id_2,
      id_6,
      id_2,
      id_5,
      id_1,
      id_2,
      id_7,
      id_3,
      id_2
  );
  assign modCall_1.id_0 = 0;
  assign id_13[1] = 1 || (id_8);
endmodule

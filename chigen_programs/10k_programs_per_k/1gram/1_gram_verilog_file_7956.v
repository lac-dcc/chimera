// Seed: 1012286510
module module_0 (
    output uwire id_0,
    input wire id_1,
    output wire id_2,
    input tri1 id_3,
    input supply1 id_4,
    output wor id_5
    , id_32,
    input supply0 id_6,
    output tri0 id_7,
    output tri0 id_8,
    input supply1 id_9,
    input wand id_10,
    input wor id_11,
    input tri id_12,
    input wire id_13,
    input wire id_14,
    input wor id_15,
    input tri id_16,
    output supply0 id_17,
    output supply0 id_18,
    input wor id_19,
    output tri1 id_20,
    output tri1 id_21,
    output wand id_22,
    output logic id_23,
    output tri0 id_24,
    input wand id_25,
    output wand id_26,
    output wire id_27,
    input wor id_28,
    input supply0 id_29,
    input wand id_30
);
  always begin : LABEL_0
    if (1) id_23 = -1;
  end
  integer id_33, id_34;
endmodule
module module_1 (
    output tri1 id_0,
    output logic id_1,
    output wire id_2,
    input uwire id_3,
    input tri0 id_4,
    input supply1 id_5,
    input wire id_6,
    input wire id_7,
    input supply1 id_8,
    output tri1 id_9
);
  logic id_11;
  tri1 id_12, id_13;
  assign id_13 = 1'b0;
  wire id_14;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_0,
      id_7,
      id_5,
      id_9,
      id_6,
      id_9,
      id_9,
      id_3,
      id_5,
      id_3,
      id_4,
      id_3,
      id_4,
      id_4,
      id_6,
      id_0,
      id_0,
      id_3,
      id_0,
      id_2,
      id_9,
      id_1,
      id_9,
      id_4,
      id_2,
      id_9,
      id_4,
      id_5,
      id_4
  );
  assign modCall_1.id_22 = 0;
  logic id_15;
  ;
  always_ff begin : LABEL_0
    id_1 <= id_14;
  end
endmodule

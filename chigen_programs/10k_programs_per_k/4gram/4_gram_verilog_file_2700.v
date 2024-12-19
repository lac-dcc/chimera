// Seed: 3277454531
module module_0 (
    output supply1 id_0,
    input tri0 id_1,
    output tri id_2,
    input supply1 id_3,
    input uwire id_4,
    output wor id_5 id_27,
    input tri1 id_6,
    input wor id_7,
    output wor id_8,
    input wor id_9,
    input supply1 id_10,
    input wire id_11,
    output tri1 id_12,
    input uwire id_13,
    input supply1 id_14,
    input wor id_15,
    output tri id_16,
    output wand id_17,
    output uwire id_18,
    output tri1 id_19,
    input supply1 id_20,
    input wand id_21,
    input wor id_22,
    input supply0 id_23,
    input wand id_24,
    output wor id_25
);
  always_latch @(id_21 or 1) begin : LABEL_0
    id_16 = 1;
  end
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    input supply0 id_2,
    inout uwire id_3,
    input tri1 id_4,
    input supply1 id_5,
    output tri1 id_6,
    output supply0 id_7
);
  supply1 id_9 = id_3;
  module_0 modCall_1 (
      id_3,
      id_9,
      id_1,
      id_9,
      id_5,
      id_3,
      id_5,
      id_0,
      id_3,
      id_2,
      id_9,
      id_0,
      id_7,
      id_4,
      id_3,
      id_0,
      id_7,
      id_9,
      id_9,
      id_6,
      id_2,
      id_2,
      id_2,
      id_5,
      id_2,
      id_9
  );
  assign modCall_1.id_22 = 0;
endmodule

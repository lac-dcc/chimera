// Seed: 2818488
module module_0;
  reg
      id_1,
      id_2,
      id_3,
      id_4,
      id_5,
      id_6,
      id_7,
      id_8,
      id_9,
      id_10,
      id_11,
      id_12,
      id_13,
      id_14,
      id_15,
      id_16,
      id_17,
      id_18,
      id_19,
      id_20,
      id_21,
      id_22,
      id_23,
      id_24,
      id_25;
  assign id_21 = id_25 & id_7;
  always @(posedge id_4) begin : LABEL_0
    id_2 <= 1;
  end
endmodule
module module_1 (
    input wor id_0,
    input wor id_1,
    output supply1 id_2,
    output supply1 id_3
);
  always @(posedge 1 or posedge id_0 & ~id_0 & id_1) begin : LABEL_0
    id_2 = id_1;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_22 = 0;
endmodule

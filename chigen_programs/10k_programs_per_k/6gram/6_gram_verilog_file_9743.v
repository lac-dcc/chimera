// Seed: 2805337887
module module_0 (
    input supply1 id_0,
    input tri1 id_1
);
  assign id_3[1] = 1'd0;
  reg
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
      id_25,
      id_26,
      id_27,
      id_28,
      id_29,
      id_30,
      id_31;
  wire id_32;
  always @(*) begin : LABEL_0
    id_8 <= id_24;
  end
endmodule
module module_1 (
    input  wand  id_0,
    input  wire  id_1,
    output uwire id_2
);
  always @(negedge id_1) begin : LABEL_0
    #1 $display;
  end
  module_0 modCall_1 (
      id_0,
      id_1
  );
  assign modCall_1.id_10 = 0;
endmodule

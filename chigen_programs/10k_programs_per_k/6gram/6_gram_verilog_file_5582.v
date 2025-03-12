// Seed: 2385396382
module module_0 (
    input wand id_0,
    input wand id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    input uwire id_5
);
  bit
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
      id_31,
      id_32,
      id_33,
      id_34,
      id_35,
      id_36,
      id_37,
      id_38,
      id_39,
      id_40,
      id_41,
      id_42,
      id_43,
      id_44,
      id_45;
  always @(posedge -1'b0 or posedge id_12 - 1) begin : LABEL_0
    id_9 = id_34;
  end
  assign module_1.id_2 = 0;
  always id_17 = @(1) id_4;
endmodule
module module_1 (
    input  wire  id_0,
    input  wire  id_1,
    input  wor   id_2
    , id_5,
    output logic id_3
);
  always @(id_1 == -1) begin : LABEL_0
    id_3 <= -1;
  end
  logic id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2
  );
endmodule

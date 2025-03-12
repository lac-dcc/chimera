// Seed: 1547879948
module module_0 (
    input  tri0 id_0,
    output wand id_1,
    input  wand id_2,
    input  wand id_3,
    output wire id_4
);
  assign id_1 = -1;
  assign id_4 = 1;
  assign id_1 = id_0;
endmodule
module module_1 #(
    parameter id_50 = 32'd26
) (
    input  tri   id_0,
    input  uwire id_1,
    input  wand  id_2,
    input  wire  id_3,
    output wor   id_4
);
  logic [7:0]
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
      id_45,
      id_46,
      id_47,
      id_48,
      id_49,
      _id_50,
      id_51,
      id_52;
  parameter id_53 = 1;
  assign id_39 = id_51[id_50!=1];
  wire [1 : -1] id_54;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_2,
      id_2,
      id_4
  );
  assign modCall_1.id_1 = 0;
  wire id_55;
  ;
  always @(negedge id_23 or posedge id_48) begin : LABEL_0
    id_41[(-1'b0)] <= 1;
  end
endmodule

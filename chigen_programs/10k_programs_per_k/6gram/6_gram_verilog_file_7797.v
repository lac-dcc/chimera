// Seed: 3799194881
module module_0 #(
    parameter id_22 = 32'd15
) (
    output tri   id_0,
    input  tri0  id_1,
    output uwire id_2,
    input  uwire id_3,
    input  tri   id_4,
    input  tri1  id_5,
    output uwire id_6,
    input  tri0  id_7,
    input  wand  id_8,
    input  wor   id_9,
    input  tri0  id_10,
    output tri   id_11,
    input  tri0  id_12,
    output tri0  id_13,
    input  uwire id_14,
    output tri   id_15,
    input  wire  id_16,
    input  uwire id_17,
    input  tri   id_18,
    output uwire id_19
);
  logic [7:0]
      id_21,
      _id_22,
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
      id_50,
      id_51,
      id_52,
      id_53,
      id_54,
      id_55,
      id_56;
  assign id_43[-1'b0|id_22] = id_45;
  logic id_57, id_58, id_59;
  assign id_34 = id_37;
  assign id_25 = id_18;
endmodule
module module_1 #(
    parameter id_1 = 32'd62,
    parameter id_8 = 32'd27
) (
    output wand id_0,
    input supply0 _id_1,
    output wor id_2,
    output wire id_3
    , _id_8,
    input supply1 id_4,
    input wand id_5,
    output supply1 id_6
);
  always @(posedge 1) begin : LABEL_0
    $signed(56);
    ;
  end
  wire [~  id_8 : id_1  ==  1] id_9, id_10;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_6,
      id_5,
      id_4,
      id_4,
      id_6,
      id_5,
      id_4,
      id_5,
      id_4,
      id_0,
      id_5,
      id_3,
      id_4,
      id_2,
      id_5,
      id_4,
      id_5,
      id_6
  );
  assign id_0 = -1;
endmodule

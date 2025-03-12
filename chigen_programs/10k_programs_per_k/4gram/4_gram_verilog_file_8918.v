// Seed: 3306734423
module module_0 (
    output wand id_0,
    input supply1 id_1,
    output supply0 id_2,
    input tri id_3,
    input wire id_4,
    input wor id_5,
    input wand id_6
    , id_18,
    output tri0 id_7,
    output uwire id_8,
    output wand id_9,
    input supply0 id_10,
    output tri id_11,
    output wor id_12,
    input supply1 id_13,
    input supply1 id_14,
    output wand id_15,
    input tri0 id_16
);
  wire id_19;
  parameter id_20 = -1;
  wire id_21;
  supply1 id_22;
  assign module_1.id_6 = 0;
  wire id_23;
  wire  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  , module_0 ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ,  id_46  ,  id_47  ,  id_48  ,  id_49  ,  id_50  ,  id_51  ,  id_52  ,  id_53  ,  id_54  ;
  assign id_22 = -1'd0;
endmodule
module module_1 #(
    parameter id_4 = 32'd19
) (
    output supply1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    output tri0 id_3,
    input tri0 _id_4
);
  initial begin : LABEL_0
    $unsigned(61);
    ;
  end
  logic [1 'd0 : id_4] id_6;
  ;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_3,
      id_1,
      id_2,
      id_1,
      id_2,
      id_0,
      id_3,
      id_0,
      id_2,
      id_0,
      id_3,
      id_2,
      id_1,
      id_0,
      id_1
  );
  always @(posedge id_1 || 1) begin : LABEL_1
    if (1) begin : LABEL_2
      id_6 <= -1;
    end
  end
endmodule

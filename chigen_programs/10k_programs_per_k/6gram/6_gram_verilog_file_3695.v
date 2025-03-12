// Seed: 617333298
module module_0 #(
    parameter id_30 = 32'd20
) (
    input tri0 id_0,
    input supply1 id_1,
    output tri0 id_2,
    output wand id_3,
    input wand id_4,
    input tri0 id_5,
    input wire id_6,
    input supply0 id_7,
    output tri0 id_8,
    input tri0 id_9,
    input tri1 id_10,
    input tri0 module_0,
    output uwire id_12,
    input tri1 id_13,
    input wire id_14,
    input tri id_15,
    output tri1 id_16,
    output tri id_17,
    output uwire id_18,
    input uwire id_19,
    input wire id_20,
    input wand id_21,
    output tri0 id_22,
    output wor id_23,
    input wand id_24,
    output uwire id_25,
    input supply1 id_26,
    input supply0 id_27,
    output wand id_28
);
  wire [-1 : 1] _id_30;
  wire  [  -1  :  -1  ==  id_30  ]  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ;
  logic id_44;
  assign module_1.id_11 = 0;
endmodule
module module_1 (
    input tri id_0,
    input tri1 id_1,
    output logic id_2,
    input wor id_3,
    output tri id_4,
    input supply1 id_5,
    input wor id_6,
    output uwire id_7,
    input tri1 id_8,
    input wor id_9,
    input supply1 id_10,
    input wor id_11,
    output tri1 id_12,
    input wor id_13,
    input supply0 id_14,
    input supply0 id_15,
    output tri1 id_16,
    input wor id_17,
    input supply1 id_18,
    input wor id_19,
    input tri1 id_20
);
  module_0 modCall_1 (
      id_20,
      id_15,
      id_7,
      id_16,
      id_3,
      id_3,
      id_14,
      id_18,
      id_16,
      id_10,
      id_14,
      id_15,
      id_4,
      id_13,
      id_0,
      id_17,
      id_12,
      id_7,
      id_4,
      id_8,
      id_8,
      id_6,
      id_7,
      id_4,
      id_14,
      id_4,
      id_6,
      id_6,
      id_16
  );
  always @(posedge id_14) begin : LABEL_0
    id_2 <= -1;
  end
endmodule

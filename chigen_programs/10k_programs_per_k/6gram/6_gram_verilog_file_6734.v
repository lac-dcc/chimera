// Seed: 259136015
module module_0 #(
    parameter id_33 = 32'd56,
    parameter id_40 = 32'd73
) (
    input tri0 id_0,
    output wire id_1,
    input wor id_2,
    input supply0 id_3,
    output supply1 id_4,
    output supply0 id_5,
    input uwire id_6,
    input wand id_7,
    output tri1 id_8,
    input supply0 id_9,
    output tri0 id_10,
    output wire id_11,
    input wire id_12,
    output wire id_13,
    output wor id_14,
    output wire id_15,
    output supply1 id_16
);
  supply1  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  _id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  _id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ;
  assign id_19 = -1'd0;
  wire id_46[-1 : id_33];
  logic [1 'd0 : id_40  *  -1  +  1] id_47;
endmodule
module module_1 #(
    parameter id_8 = 32'd64
) (
    input uwire id_0,
    input tri1 id_1,
    output logic id_2,
    input supply1 id_3,
    output tri1 id_4,
    output supply0 id_5,
    output supply1 id_6,
    output tri0 id_7
    , id_13,
    input supply0 _id_8,
    input wire id_9,
    output tri1 id_10,
    input wand id_11
);
  assign id_6 = (id_1) ? id_0 == id_13[-1&1!=-1] : -1;
  logic ["" : id_8] id_14;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_1,
      id_3,
      id_7,
      id_7,
      id_9,
      id_9,
      id_10,
      id_9,
      id_4,
      id_10,
      id_0,
      id_7,
      id_7,
      id_6,
      id_6
  );
  assign modCall_1.id_42 = 0;
  initial begin : LABEL_0
    id_2 <= id_9;
  end
endmodule

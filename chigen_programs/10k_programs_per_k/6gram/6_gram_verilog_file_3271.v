// Seed: 699536166
module module_0 (
    input  tri1  id_0,
    input  tri0  id_1,
    input  wor   id_2,
    input  wand  id_3,
    output tri0  id_4,
    output tri0  id_5,
    output tri0  id_6,
    output wor   id_7,
    output uwire id_8,
    output wand  id_9,
    output tri1  id_10,
    output wire  id_11
);
  supply0  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ;
  assign id_6 = id_43;
endmodule
module module_1 (
    output uwire id_0,
    input tri id_1,
    output supply1 id_2,
    output tri0 id_3,
    output supply0 id_4,
    input wand id_5,
    input wire id_6,
    input supply0 id_7
);
  assign id_4 = 1;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_5,
      id_1,
      id_3,
      id_4,
      id_0,
      id_2,
      id_3,
      id_3,
      id_0,
      id_0
  );
  assign modCall_1.type_0 = 0;
endmodule

// Seed: 2716736345
module module_0 (
    output tri0 id_0,
    input wor id_1,
    input wor id_2,
    output tri id_3,
    input tri0 id_4,
    output supply0 id_5,
    output supply1 id_6,
    output supply0 id_7,
    output supply0 id_8,
    input supply0 id_9
);
  wire  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ;
endmodule
module module_1 (
    input wor id_0#(
        .id_9 (1),
        .id_10(1)
    ),
    output tri1 id_1,
    input supply1 id_2,
    input uwire id_3,
    input wand id_4,
    input tri0 id_5,
    output wand id_6,
    output tri id_7
);
  assign id_6 = {1{id_2 ? id_2 : -1'b0}};
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_1,
      id_4,
      id_7,
      id_6,
      id_1,
      id_1,
      id_2
  );
  assign id_6 = ~id_3;
endmodule

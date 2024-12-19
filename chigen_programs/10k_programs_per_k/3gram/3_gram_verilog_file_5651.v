// Seed: 2202507650
module module_0 (
    input wor id_0,
    input tri id_1,
    input tri id_2,
    output supply1 id_3,
    input tri0 id_4,
    input tri1 id_5,
    output tri1 id_6,
    output uwire id_7,
    input wire id_8,
    output supply0 id_9,
    output tri id_10,
    input wor id_11,
    input tri0 id_12,
    input uwire id_13,
    input wand id_14,
    input wand id_15,
    output uwire id_16,
    input wire id_17,
    output wand id_18,
    input supply1 id_19,
    input wire id_20,
    output wand id_21,
    input tri0 id_22,
    output tri0 id_23,
    output tri id_24,
    input supply1 id_25
);
  id_27 :
  assert property (@(|1) id_17)
  else cover (1 - 1);
  wire  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  ,  id_44  ,  id_45  ,  id_46  ,  id_47  ,  id_48  ,  id_49  ,  id_50  ,  id_51  ,  id_52  ,  id_53  ,  id_54  ,  id_55  ,  id_56  ,  id_57  ,  id_58  ,  id_59  ,  id_60  ,  id_61  ;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    input  tri0 id_0,
    output wor  id_1,
    input  tri1 id_2
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_1,
      id_2,
      id_0,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_1,
      id_2,
      id_1,
      id_0,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0
  );
endmodule

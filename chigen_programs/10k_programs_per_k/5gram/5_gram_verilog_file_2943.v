// Seed: 2378756920
module module_0 (
    output wor id_0,
    output wor id_1,
    input tri id_2
    , id_17,
    output wand id_3,
    input wire id_4,
    input wor id_5,
    output uwire id_6,
    input uwire id_7,
    output uwire id_8,
    output uwire id_9,
    output supply0 id_10,
    input tri id_11,
    input uwire id_12,
    output tri id_13,
    output supply1 id_14,
    output wire id_15
);
  wire id_18, id_19;
  assign module_1.id_2 = 0;
  wire id_20;
  wire id_21;
  supply0  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  ,  id_33  ,  id_34  ,  id_35  ,  id_36  ,  id_37  ,  id_38  ,  id_39  ,  id_40  ,  id_41  ,  id_42  ,  id_43  =  !  id_40  ;
  wire id_44;
  supply1 id_45 = (id_7);
  assign id_43 = id_33 | id_25;
  wire id_46;
  wire id_47;
  assign id_41 = 1;
endmodule
module module_1 (
    input wand id_0,
    input supply0 id_1,
    output wand id_2,
    input tri id_3,
    input tri1 id_4,
    output supply1 id_5,
    input tri1 id_6
);
  wire id_8 = 1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_5,
      id_6,
      id_4,
      id_5,
      id_6,
      id_2,
      id_5,
      id_2,
      id_0,
      id_6,
      id_5,
      id_2,
      id_2
  );
endmodule

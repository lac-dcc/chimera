// Seed: 2396387045
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input wand id_2,
    output wor id_3,
    input supply0 id_4,
    input wand id_5,
    input wor id_6,
    input uwire id_7,
    input wand id_8,
    input tri1 id_9,
    input wor id_10,
    input uwire id_11,
    output supply1 id_12,
    input tri id_13,
    input wor id_14,
    input tri0 id_15,
    input supply1 id_16,
    output tri id_17,
    input uwire id_18,
    output supply0 id_19
);
  supply0  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ,  id_31  ,  id_32  =  id_2  ?  1  :  1  ?  1 'b0 :  id_24  ,  id_33  ;
endmodule
module module_1 (
    output supply1 id_0,
    input tri1 id_1,
    output tri0 id_2,
    output wire id_3,
    output wand id_4
    , id_7,
    input tri id_5
);
  wire id_8 = id_8;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_0,
      id_1,
      id_1,
      id_5,
      id_5,
      id_5,
      id_5,
      id_1,
      id_5,
      id_3,
      id_1,
      id_1,
      id_5,
      id_5,
      id_3,
      id_5,
      id_3
  );
  assign modCall_1.id_24 = 0;
endmodule

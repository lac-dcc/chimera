// Seed: 1500310527
module module_0 (
    input tri id_0,
    output uwire id_1,
    output supply0 id_2,
    input tri1 id_3,
    output wor id_4,
    output uwire id_5,
    output tri0 id_6,
    output tri id_7,
    input wire id_8,
    input wor id_9
    , id_16,
    output supply1 id_10,
    input tri1 id_11,
    input wor id_12,
    input wire id_13,
    input tri id_14
);
  wand  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  =  1  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  =  1  ,  id_31  ,  id_32  ,  id_33  ;
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    input supply1 id_2,
    input wire id_3,
    output tri id_4,
    input tri1 id_5,
    input supply1 id_6,
    output wand id_7,
    input supply1 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_8,
      id_4,
      id_0,
      id_0,
      id_4,
      id_1,
      id_1,
      id_7,
      id_2,
      id_2,
      id_1,
      id_8
  );
  assign modCall_1.id_10 = 0;
endmodule

// Seed: 3722196743
module module_0 (
    input tri0 id_0,
    output supply1 id_1,
    output supply0 id_2,
    output wand id_3,
    input wire id_4,
    input tri id_5
);
  supply0  id_7  ,  id_8  ,  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ;
  assign id_10 = 1;
  tri0 id_22, id_23, id_24, id_25, id_26, id_27, id_28;
  assign id_12 = id_25;
  wire id_29;
endmodule
module module_1 (
    output supply1 id_0,
    input supply0 id_1,
    output wand id_2,
    input supply1 id_3,
    input supply0 id_4,
    output wor id_5,
    input wire id_6,
    input supply1 id_7,
    input tri id_8,
    output wor id_9,
    input tri1 id_10,
    input tri id_11,
    input wand id_12
);
  assign id_9 = 1;
  assign id_5 = id_1 ? id_10 & 1 & id_7 & 1 : 1;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_5,
      id_5,
      id_11,
      id_12
  );
  assign modCall_1.id_18 = 0;
endmodule

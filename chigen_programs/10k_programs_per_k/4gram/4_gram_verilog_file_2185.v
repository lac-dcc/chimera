// Seed: 3102941637
module module_0 (
    input tri1 id_0,
    input supply1 id_1,
    output wor id_2,
    input uwire id_3,
    input wor id_4,
    output wor id_5,
    input tri1 id_6,
    output tri1 id_7,
    output wor module_0,
    output supply0 id_9
);
  tri  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ,  id_28  ,  id_29  ,  id_30  ;
  id_31 :
  assert property (@(posedge 1) id_15)
  else $display;
  wire id_32;
  wire id_33;
endmodule
module module_1 (
    output tri id_0,
    output tri0 id_1,
    input wor id_2,
    input wor id_3,
    output supply0 id_4,
    input tri1 id_5,
    output supply1 id_6,
    input tri0 id_7,
    input uwire id_8,
    output wand id_9,
    input wand id_10
);
  assign id_1 = !id_2;
  assign id_0 = id_7;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_7,
      id_7,
      id_1,
      id_10,
      id_6,
      id_0,
      id_6
  );
  assign modCall_1.id_15 = 0;
endmodule

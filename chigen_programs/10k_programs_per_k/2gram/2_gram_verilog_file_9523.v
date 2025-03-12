// Seed: 1926053307
module module_0 (
    input tri id_0,
    output supply1 id_1,
    output tri1 id_2,
    output tri0 id_3,
    output wor id_4,
    input supply1 id_5
);
  wire id_7;
  initial disable id_8;
  assign module_1.id_8 = 0;
  id_9 :
  assert property (@(id_0) -1)
  else disable id_10;
  wire id_11;
  assign id_9 = 1 == -1;
  wire id_12;
endmodule
module module_1 #(
    parameter id_11 = 32'd16,
    parameter id_12 = 32'd92,
    parameter id_5  = 32'd21
) (
    input wor id_0,
    output tri1 id_1,
    input supply1 id_2,
    output tri0 id_3,
    input uwire id_4,
    output wor _id_5,
    input wor id_6,
    input supply1 id_7,
    output supply1 id_8,
    output tri id_9
);
  supply1  [  -1  :  -1  ]  _id_11  ,  _id_12  ,  id_13  ,  id_14  [  id_12  :  (  id_5  ?  id_11  :  id_5  )  ]  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ;
  assign id_14 = 1;
  module_0 modCall_1 (
      id_0,
      id_9,
      id_3,
      id_3,
      id_9,
      id_0
  );
endmodule

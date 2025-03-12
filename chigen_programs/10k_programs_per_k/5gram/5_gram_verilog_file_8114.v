// Seed: 3643435578
module module_0 (
    input tri id_0,
    input tri0 module_0,
    output wand id_2,
    input wor id_3,
    input tri id_4,
    input tri0 id_5,
    input wand id_6,
    output tri1 id_7,
    input supply0 id_8,
    output tri0 id_9
);
  assign id_9 = id_0 ? id_3#(.id_1(-1)) : 1;
  wire  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ,  id_24  ,  id_25  ,  id_26  ,  id_27  ;
endmodule
module module_1 #(
    parameter id_3 = 32'd80
) (
    input  tri  id_0,
    input  tri  id_1,
    output wand id_2,
    input  tri0 _id_3
);
  wire id_5;
  wire id_6;
  genvar id_7;
  string id_8 = "";
  tri0   id_9;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_2,
      id_0,
      id_0,
      id_1,
      id_1,
      id_2,
      id_0,
      id_2
  );
  assign modCall_1.id_5 = 0;
  assign  (  strong1  ,  weak0  )  id_9  =  id_8  ?  id_7  [  1  :  !  (  (  -1 'b0 )  )  ]  !=?  -1  :  id_7  [  {  {  -1 'b0 }  ,  id_3  }  ==  1  +:  1  ]  ==  -1 'b0 ?  id_7  :  id_6  ;
endmodule

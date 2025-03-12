// Seed: 1667193901
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    output supply1 id_2
);
  wand  id_4  =  id_0  ,  id_5  =  1  &  -1 'b0 ,  id_6  =  -1  ,  id_7  =  id_0  ,  id_8  =  id_6  ,  id_9  =  id_5  ?  id_4  :  id_9  ,  id_10  =  id_9  &  id_5  ,  id_11  =  id_11  ,  id_12  =  id_11  ?  1  :  -1  ,  id_13  =  id_13  ;
endmodule
module module_1 (
    output tri1 id_0,
    input  wire id_1,
    output tri0 id_2,
    output tri1 id_3,
    input  wire id_4,
    output wor  id_5,
    input  tri0 id_6,
    output wand id_7,
    output wire id_8
);
  module_0 modCall_1 (
      id_4,
      id_1,
      id_0
  );
  assign modCall_1.id_8 = 0;
endmodule

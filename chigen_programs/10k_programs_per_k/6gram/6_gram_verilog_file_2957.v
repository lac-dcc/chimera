// Seed: 1583502425
module module_0 (
    output uwire id_0,
    input uwire id_1,
    input wor id_2,
    input uwire id_3,
    output supply0 id_4,
    output tri id_5,
    input tri id_6,
    output supply1 id_7,
    input wor id_8,
    output uwire id_9,
    output uwire id_10,
    input tri id_11,
    input wand id_12,
    output wire id_13,
    output wor id_14,
    input supply0 id_15,
    input supply1 id_16,
    input wand id_17
);
  assign id_9 = 1'b0;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_0 = 32'd22,
    parameter id_3 = 32'd99
) (
    output tri0 _id_0,
    output wand id_1,
    input tri0 id_2,
    input supply1 _id_3
    , id_6,
    output tri0 id_4
);
  assign id_4 = $realtime == id_2 ? id_6 : id_3;
  tri0 id_7;
  ;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_4,
      id_2,
      id_1,
      id_2,
      id_4,
      id_4,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2
  );
  logic [-1 : id_0] id_8;
  ;
  assign  id_7  =  id_8  ?  id_6  ===  1  :  1  ?  id_8  :  id_2  ?  id_6  ==  id_8  :  id_3  ?  id_2  :  id_8  [  id_3  ]  ?  -1  :  id_6  ?  id_3  :  (  -1  +  id_7  )  ?  id_7  :  id_8  ?  id_3  :  -1  -  1  ?  -1 'b0 :  1 'b0 ?  id_6  :  id_6  ?  id_6  :  id_8  ?  1  :  id_8  !=  -1 'h0 ?  1  -  1 'b0 :  id_8  ;
endmodule

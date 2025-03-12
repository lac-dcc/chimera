// Seed: 1476139506
module module_0 (
    input  tri1  id_0,
    output tri0  id_1,
    output tri0  id_2,
    input  tri0  id_3,
    output uwire id_4,
    input  tri1  id_5,
    input  wire  id_6,
    output tri   id_7
);
  wire id_9;
  assign module_2.id_0 = 0;
endmodule
module module_1 (
    input  wor  id_0,
    output wire id_1,
    output wire id_2
);
  xor primCall (id_1, id_0, id_5, id_6, id_4, id_7);
  wire id_4, id_5;
  wire id_6, id_7;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_7 = 0;
endmodule
module module_0 (
    input  wand id_0,
    inout  tri0 id_1,
    output wire id_2
);
  tri0  [  1  :  1  ]  id_4  =  id_1  ,  id_5  =  -1  ?  -1  :  1  ,  id_6  =  id_1  , module_2 =  1  ,  id_7  =  id_4  ,  id_8  =  id_5  ,  id_9  =  id_6  ,  id_10  =  id_7  ,  id_11  =  id_4  ,  id_12  =  id_7  ,  id_13  =  (  1 'b0 )  ;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1
  );
endmodule

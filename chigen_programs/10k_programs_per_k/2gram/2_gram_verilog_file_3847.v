// Seed: 3494715236
module module_0 (
    input supply0 id_0,
    output uwire id_1,
    input tri id_2,
    output supply1 id_3,
    output wire id_4,
    output tri id_5
);
  parameter id_7 = 1;
  localparam  id_8  =  id_7  ,  id_9  =  -1  |  id_0  |  id_7  ,  id_10  =  id_7  +  1  *  id_8  ,  id_11  =  -1  ,  id_12  =  id_10  ;
  assign module_1.id_1 = 0;
  wire id_13;
endmodule
module module_1 (
    input  wand id_0,
    input  tri  id_1,
    output wire id_2,
    output wor  id_3
);
  integer id_5;
  assign id_2 = 1;
  assign id_3 = -1;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_0,
      id_3,
      id_3,
      id_3
  );
  assign id_2 = 1'd0;
endmodule

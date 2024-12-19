// Seed: 1882491660
module module_0 (
    output tri   id_0,
    output tri1  id_1,
    inout  uwire id_2,
    input  uwire id_3,
    input  wor   id_4,
    output uwire id_5,
    input  tri   id_6
);
  supply1 id_8;
  assign id_8 = 1;
  tri  id_9  ,  id_10  ,  id_11  ,  id_12  ,  id_13  ,  id_14  ,  id_15  ,  id_16  ,  id_17  ,  id_18  ,  id_19  ,  id_20  ,  id_21  ,  id_22  ,  id_23  ;
  assign module_1.id_2 = 0;
  assign id_14 = 1;
  assign id_22 = id_6;
endmodule
module module_1 (
    inout wor id_0,
    output wor id_1,
    input supply0 id_2,
    input wire id_3,
    output tri1 id_4,
    input tri1 id_5,
    input tri id_6,
    input tri0 id_7,
    output wand id_8,
    input wor id_9
);
  assign id_1 = id_9;
  wire id_11;
  module_0 modCall_1 (
      id_0,
      id_8,
      id_0,
      id_9,
      id_7,
      id_1,
      id_6
  );
endmodule

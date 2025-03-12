// Seed: 1025012429
module module_0 (
    output tri1 id_0,
    output wire id_1,
    output supply1 id_2,
    input tri1 id_3,
    input tri0 id_4,
    output supply0 id_5,
    output supply1 id_6,
    output wand id_7,
    output wor id_8,
    input tri0 id_9,
    output wire id_10,
    input tri id_11,
    input supply0 id_12,
    output tri id_13,
    input tri0 id_14,
    input tri id_15
);
  tri0 [1 : 1  &  -1] id_17 = id_14;
  assign id_17 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd40,
    parameter id_4 = 32'd25
) (
    input  wand  id_0,
    input  tri0  _id_1,
    output wire  id_2,
    input  wire  id_3,
    input  wand  _id_4,
    output wor   id_5,
    output wire  id_6,
    input  uwire id_7
);
  logic [{  (  1  )  {  id_1  *  id_4  }  } : 1] id_9;
  ;
  assign id_9 = id_7;
  wire id_10;
  wire id_11;
  ;
  initial $clog2(58);
  ;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_5,
      id_0,
      id_3,
      id_2,
      id_6,
      id_6,
      id_2,
      id_0,
      id_6,
      id_0,
      id_7,
      id_6,
      id_7,
      id_0
  );
  assign modCall_1.id_11 = 0;
endmodule

// Seed: 2376691271
module module_0 (
    input supply0 id_0,
    input wand id_1,
    output wand id_2,
    input tri1 id_3,
    input uwire id_4,
    output wire id_5,
    input tri0 id_6
);
  bit id_8;
  for (id_9 = 1; id_6; id_8 = id_0) parameter id_10 = 1;
  wire id_11, id_12, id_13, id_14, id_15;
  assign id_5 = 1;
  wire id_16;
  assign module_1.id_7 = 0;
  parameter id_17 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd56,
    parameter id_7 = 32'd88
) (
    output wire  id_0,
    input  uwire id_1,
    input  tri   _id_2,
    input  tri   id_3,
    input  wire  id_4 [-1 'h0 : (  1 'b0 )],
    input  tri0  id_5,
    input  wire  id_6,
    output tri1  _id_7
    , id_9
);
  wire id_10[-1 : -1  !=?  id_7  +  ~  id_2  -  id_2], id_11;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_1,
      id_4,
      id_0,
      id_5
  );
endmodule

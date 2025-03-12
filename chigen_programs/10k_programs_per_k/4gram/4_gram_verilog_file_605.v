// Seed: 272502641
module module_0 (
    input  tri1  id_0,
    output wor   id_1,
    output tri   id_2,
    output wire  id_3,
    output wor   id_4,
    input  wor   id_5,
    input  wor   id_6,
    input  tri1  id_7,
    input  wand  id_8,
    input  uwire id_9
);
  logic [-1 : 1] id_11;
  logic id_12 = 1;
  wire id_13;
  id_14 :
  assert property (@(negedge 1'h0) 1)
  else $signed(80);
  ;
  wire id_15;
  assign id_12 = 1;
endmodule
module module_1 #(
    parameter id_3 = 32'd41
) (
    input supply1 id_0,
    output wire id_1,
    output wire id_2,
    input tri _id_3,
    output wire id_4,
    input wand id_5,
    output tri0 id_6,
    input supply1 id_7,
    input supply1 id_8
);
  logic [1  -  ~  id_3 : 1] id_10;
  assign id_4 = 1'b0;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_2,
      id_2,
      id_5,
      id_5,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_7 = 0;
endmodule

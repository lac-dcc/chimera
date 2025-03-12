// Seed: 4061926063
module module_0 (
    output supply0 id_0,
    input supply0 id_1,
    input wor id_2,
    input wor id_3,
    input wire id_4,
    output supply0 id_5,
    output tri0 id_6,
    input supply1 id_7,
    input supply1 id_8,
    output wire id_9,
    input tri0 id_10,
    output tri0 id_11,
    input tri0 id_12
);
  id_14 :
  assert property (@(negedge -1) id_4)
  else $clog2(79);
  ;
endmodule
module module_1 #(
    parameter id_6 = 32'd56
) (
    output uwire id_0,
    input  tri   id_1,
    output tri1  id_2,
    input  uwire id_3,
    input  wor   id_4,
    input  tri0  id_5,
    input  uwire _id_6,
    input  uwire id_7,
    output wand  id_8,
    input  wire  id_9,
    output uwire id_10,
    input  uwire id_11
);
  wire [-1 : id_6] id_13;
  wire id_14;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_1,
      id_4,
      id_11,
      id_8,
      id_10,
      id_9,
      id_5,
      id_8,
      id_1,
      id_0,
      id_5
  );
  assign modCall_1.id_8 = 0;
  wire id_15;
endmodule

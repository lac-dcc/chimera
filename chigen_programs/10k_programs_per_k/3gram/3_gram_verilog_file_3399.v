// Seed: 2774530192
module module_0 (
    input  wor   id_0,
    input  wor   id_1,
    output uwire id_2,
    output wire  id_3,
    input  tri   id_4,
    output tri   id_5,
    input  wand  id_6,
    input  tri   id_7
    , id_11,
    input  uwire id_8,
    input  tri0  id_9
    , id_12
);
  logic [-1 : -1] id_13;
  ;
  always_ff @(-1 or "") deassign id_11;
  wire id_14;
  ;
  assign id_2 = id_12;
  wire id_15;
  wire id_16;
  wire id_17;
endmodule
module module_1 #(
    parameter id_2 = 32'd57,
    parameter id_3 = 32'd32
) (
    input supply1 id_0,
    input tri1 id_1,
    input tri _id_2,
    output uwire _id_3,
    output supply0 id_4
);
  logic id_6;
  assign id_6 = id_2 == -1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_4,
      id_4,
      id_1,
      id_4,
      id_1,
      id_1,
      id_1,
      id_0
  );
  logic [id_2 : id_3] id_7;
  xnor primCall (id_4, id_6, id_1);
endmodule

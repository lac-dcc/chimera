// Seed: 151195349
module module_0 (
    input  tri0  id_0,
    input  wand  id_1,
    output tri   id_2,
    output uwire id_3
    , id_10,
    input  tri0  id_4,
    input  wor   id_5,
    input  tri0  id_6,
    input  uwire id_7,
    input  tri0  id_8
);
  wire id_11;
  wire id_12, id_13;
endmodule
module module_1 #(
    parameter id_3 = 32'd72,
    parameter id_8 = 32'd8
) (
    output tri1 id_0,
    input  tri1 id_1,
    input  tri  id_2,
    input  tri0 _id_3,
    input  wor  id_4,
    input  tri  id_5,
    input  tri  id_6,
    input  wire id_7,
    input  wor  _id_8
);
  integer id_10;
  ;
  assign id_10[id_3] = id_6;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_0,
      id_0,
      id_6,
      id_4,
      id_5,
      id_6,
      id_2
  );
  assign modCall_1.id_7 = 0;
  wire [-1  <=  id_8 : 1] id_11;
endmodule

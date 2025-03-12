// Seed: 2396663668
module module_0 (
    output uwire id_0,
    output uwire id_1,
    input wand id_2,
    input supply0 id_3
);
  assign module_1.id_2 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd3,
    parameter id_7 = 32'd0
) (
    output tri1  id_0,
    output tri0  id_1,
    output uwire _id_2,
    output tri1  id_3,
    input  tri0  id_4,
    input  wand  id_5,
    input  tri0  id_6,
    input  tri0  _id_7,
    input  tri0  id_8
);
  integer [(  id_7  ) : id_2] id_10 = id_6, id_11;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4,
      id_8
  );
  assign id_3 = id_4;
endmodule

// Seed: 2714414271
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    input uwire id_2,
    output tri id_3,
    output supply1 id_4,
    input tri0 id_5,
    input tri id_6,
    output tri id_7,
    input tri0 id_8,
    input tri id_9,
    input tri0 id_10#(
        .id_12(-1),
        .id_13(-1)
    )
);
  assign id_3 = id_12;
  reg id_14;
  ;
  logic id_15;
  ;
  initial begin : LABEL_0
    if (1) id_14 = 1 - 1;
  end
endmodule
module module_1 #(
    parameter id_0 = 32'd54
) (
    input  wand  _id_0,
    output tri1  id_1,
    input  wand  id_2,
    input  uwire id_3,
    input  wire  id_4#(.id_10(1), .id_11(1'b0 ? -1'h0 : 1), .id_12(1), .id_13(1), .id_14((1))),
    output wand  id_5,
    input  tri   id_6,
    input  tri0  id_7,
    output tri1  id_8
);
  assign id_11[id_0] = id_6;
  module_0 modCall_1 (
      id_7,
      id_8,
      id_7,
      id_5,
      id_8,
      id_7,
      id_6,
      id_8,
      id_3,
      id_7,
      id_4
  );
  assign modCall_1.id_10 = 0;
endmodule

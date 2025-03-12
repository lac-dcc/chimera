// Seed: 1116867887
module module_0 (
    output wand  id_0,
    output uwire id_1,
    input  tri1  id_2,
    input  tri1  id_3,
    input  wor   id_4
);
  localparam id_6 = 1;
  genvar id_7;
  genvar id_8;
  logic id_9;
  logic [7:0] id_10, id_11;
  assign id_10[-1] = 1;
endmodule
module module_1 #(
    parameter id_11 = 32'd33,
    parameter id_8  = 32'd48
) (
    input tri1 id_0,
    output supply1 id_1,
    input tri1 id_2,
    input uwire id_3,
    output tri0 id_4[id_8 : id_11],
    input tri id_5,
    input tri id_6,
    input wor id_7,
    output uwire _id_8,
    input tri1 id_9,
    output tri id_10,
    input wor _id_11,
    input tri1 id_12
);
  logic id_14;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_7,
      id_7,
      id_5
  );
  assign modCall_1.id_2 = 0;
  logic id_15;
endmodule

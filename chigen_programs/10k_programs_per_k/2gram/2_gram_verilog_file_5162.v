// Seed: 3724303797
module module_0 (
    input wand id_0,
    output tri id_1,
    input supply0 id_2,
    output tri1 id_3
);
endmodule
module module_1 #(
    parameter id_4 = 32'd32,
    parameter id_8 = 32'd94
) (
    input  tri0  id_0,
    input  tri1  id_1,
    input  wand  id_2,
    output wand  id_3,
    input  tri0  _id_4,
    output logic id_5,
    output tri   id_6,
    output wire  id_7,
    input  tri   _id_8,
    input  tri0  id_9,
    output uwire id_10,
    input  tri0  id_11
);
  wire [1  |  id_4 : id_8] id_13;
  assign id_5 = id_11;
  module_0 modCall_1 (
      id_11,
      id_6,
      id_1,
      id_6
  );
  assign modCall_1.id_3 = 0;
  always id_5 <= 1;
endmodule

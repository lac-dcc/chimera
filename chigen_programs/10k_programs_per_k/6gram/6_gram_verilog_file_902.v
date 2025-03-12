// Seed: 2864225184
module module_0 #(
    parameter id_12 = 32'd81
) (
    input wand id_0,
    output tri1 id_1,
    output tri1 id_2,
    output wor id_3,
    input supply1 id_4,
    input supply0 id_5,
    output supply1 id_6,
    output supply0 id_7,
    input wire id_8,
    input tri0 id_9
);
  assign id_3 = id_5;
  logic id_11;
  wire _id_12;
  wire [-1 'b0 : 1] id_13;
  logic [id_12 : 1 'b0] id_14;
endmodule
module module_1 #(
    parameter id_0 = 32'd32
) (
    input  wor  _id_0,
    input  tri  id_1
    , id_6,
    input  wire id_2,
    input  tri0 id_3,
    output wor  id_4
);
  assign id_4 = id_6[1 : id_0];
  module_0 modCall_1 (
      id_1,
      id_4,
      id_4,
      id_4,
      id_1,
      id_2,
      id_4,
      id_4,
      id_2,
      id_3
  );
  assign modCall_1.id_8 = 0;
endmodule

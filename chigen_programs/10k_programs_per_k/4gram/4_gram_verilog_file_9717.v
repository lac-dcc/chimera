// Seed: 759569275
module module_0 (
    input  tri0  id_0,
    input  wor   id_1,
    output tri0  id_2,
    input  uwire id_3,
    output tri   id_4,
    input  tri0  id_5,
    input  wand  id_6,
    input  wire  id_7
);
endmodule
module module_1 #(
    parameter id_11 = 32'd41
) (
    input wand id_0,
    input wand id_1,
    input tri0 id_2,
    input wire id_3,
    input wor id_4,
    input wand id_5,
    input tri id_6,
    input tri id_7,
    input wand id_8,
    input wand id_9,
    input wire id_10,
    output wor _id_11,
    output supply1 id_12
);
  parameter id_14 = -1;
  localparam id_15 = id_14#(.id_14(1));
  module_0 modCall_1 (
      id_8,
      id_10,
      id_12,
      id_9,
      id_12,
      id_9,
      id_6,
      id_5
  );
  assign modCall_1.id_0 = 0;
  logic [id_11 : -1 'd0] id_16 = id_6;
endmodule

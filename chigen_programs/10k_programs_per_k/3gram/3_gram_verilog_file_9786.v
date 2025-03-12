// Seed: 1736538306
module module_0 (
    input  tri   id_0,
    input  wand  id_1,
    output tri0  id_2,
    input  wire  id_3,
    input  uwire id_4
);
  assign id_2 = 1 | -1'b0;
endmodule
module module_1 #(
    parameter id_0 = 32'd66,
    parameter id_3 = 32'd84
) (
    input wire _id_0,
    input tri0 id_1,
    output wand id_2,
    input wor _id_3,
    input wor id_4,
    input supply0 id_5,
    output wor id_6,
    input wor id_7,
    output supply0 id_8,
    input wor id_9
);
  wire id_11;
  logic [-1 : id_3  |  -1] id_12;
  ;
  wire [id_0 : id_0] id_13;
  assign id_2 = id_0;
  wire id_14, id_15;
  xnor primCall (id_8, id_11, id_12, id_9, id_7, id_14, id_1, id_5, id_4);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_8,
      id_5,
      id_9
  );
  assign modCall_1.id_2 = 0;
  wire id_16;
  ;
  wire  id_17;
  logic id_18;
  ;
  always_latch @(id_13, 1) id_12 = id_4;
endmodule

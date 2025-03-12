// Seed: 3537258270
module module_0 (
    output wand  id_0,
    output uwire id_1,
    input  wand  id_2,
    input  uwire id_3,
    input  wire  id_4
);
  localparam id_6 = 1, id_7 = 1 & -1, id_8 = -1, id_9 = {-1, -1 < id_6, 1}, id_10 = id_2;
  assign id_0 = id_7;
  assign id_0 = id_8;
  logic id_11 = id_3;
endmodule
module module_1 (
    output supply1 id_0,
    output tri1 id_1,
    output tri id_2,
    inout uwire id_3,
    output tri id_4,
    input tri id_5,
    output supply1 id_6,
    output tri id_7,
    output supply1 id_8,
    output supply0 id_9,
    output wor id_10
);
  localparam integer id_12 = 1;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_3,
      id_5,
      id_5
  );
  assign modCall_1.id_9 = 0;
endmodule

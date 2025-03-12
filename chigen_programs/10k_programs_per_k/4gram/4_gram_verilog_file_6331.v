// Seed: 2179441937
module module_0 (
    input  uwire id_0,
    input  uwire id_1,
    output wor   id_2,
    input  wire  id_3,
    output uwire id_4,
    input  tri0  id_5,
    output tri1  id_6,
    input  tri0  id_7
);
endmodule
module module_1 #(
    parameter id_9 = 32'd65
) (
    input  supply1 id_0,
    output supply0 id_1,
    input  supply0 id_2,
    input  supply1 id_3
);
  wire id_5;
  wire id_6;
  parameter id_7 = -1'b0;
  logic id_8;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1,
      id_0,
      id_1,
      id_3,
      id_1,
      id_2
  );
  assign modCall_1.id_5 = 0;
  assign #_id_9 id_8 = id_2;
  assign id_8 = id_7[1==id_9];
endmodule

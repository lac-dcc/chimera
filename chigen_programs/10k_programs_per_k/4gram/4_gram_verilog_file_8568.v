// Seed: 2259698611
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    input tri0 id_2,
    input wand id_3,
    input tri id_4,
    input supply1 id_5,
    input supply0 module_0,
    output supply1 id_7,
    input uwire id_8,
    input wire id_9,
    output tri1 id_10,
    output uwire id_11,
    output uwire id_12,
    input wire id_13,
    input wor id_14,
    input tri0 id_15,
    input wire id_16
);
  parameter id_18 = 1;
endmodule
module module_1 (
    input  tri  id_0,
    output wand id_1
);
  logic [7:0] id_3;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.id_3 = 0;
  assign id_1 = id_3[1 : 1];
endmodule

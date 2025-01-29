// Seed: 1631135482
module module_0 (
    input wand id_0
);
  wire id_2;
endmodule
module module_1 (
    input wand id_0,
    output supply1 id_1,
    output tri1 id_2,
    output tri0 id_3,
    input uwire id_4,
    output wor id_5,
    output tri1 id_6,
    output tri id_7,
    output tri id_8,
    input tri id_9,
    input wire id_10,
    output supply1 id_11,
    output supply0 id_12,
    output supply1 id_13,
    input supply1 id_14
);
  nor primCall (id_8, id_0, id_4, id_14, id_9, id_10);
  module_0 modCall_1 (id_0);
  assign modCall_1.type_0 = 0;
endmodule
module module_2 (
    input wor id_0,
    input uwire id_1,
    input wire id_2,
    input supply1 id_3,
    output tri1 id_4
);
  always id_4 = id_1;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_0 = 0;
endmodule

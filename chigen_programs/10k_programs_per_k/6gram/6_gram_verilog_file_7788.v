// Seed: 757637830
module module_0 (
    output uwire id_0,
    input wor id_1,
    input uwire id_2,
    input tri id_3,
    output wand id_4,
    input tri0 id_5,
    output wand id_6,
    input tri1 id_7,
    input wire id_8,
    input tri0 id_9,
    input tri id_10,
    input wor id_11,
    input supply1 id_12,
    input uwire id_13,
    input tri1 id_14,
    output wire id_15
);
  wire id_17 = id_17;
endmodule
module module_1 (
    output tri  id_0,
    input  tri1 id_1,
    input  wand id_2
);
  assign id_0 = id_1 ~^ id_2;
  initial $display(1, id_2, 1, id_2);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1,
      id_0
  );
  assign modCall_1.type_9 = 0;
endmodule

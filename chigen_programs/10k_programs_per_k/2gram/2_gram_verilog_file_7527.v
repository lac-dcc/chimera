// Seed: 3297726663
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    input tri0 id_2,
    input wire id_3,
    input uwire id_4,
    input supply0 id_5,
    input wand id_6,
    input tri0 id_7,
    output wire id_8,
    input wor id_9,
    output supply0 id_10,
    output tri id_11,
    output tri id_12,
    input tri0 id_13
);
endmodule
module module_1 (
    input supply1 id_0,
    output wand id_1,
    input tri id_2,
    input wire id_3
);
  assign id_1 = (1);
  module_0 modCall_1 (
      id_2,
      id_1,
      id_3,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_3
  );
  assign modCall_1.type_8 = 0;
  always id_1 = id_0;
endmodule

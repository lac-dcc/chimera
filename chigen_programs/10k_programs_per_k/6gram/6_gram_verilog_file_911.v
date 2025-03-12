// Seed: 1326781556
module module_0 (
    output tri1 id_0,
    output tri id_1,
    input tri1 id_2,
    input wand id_3,
    input tri id_4,
    input wand id_5,
    input uwire id_6,
    input wire id_7,
    output wor id_8,
    input tri id_9,
    input supply0 id_10,
    output tri id_11,
    input tri1 id_12,
    input supply0 id_13,
    input tri0 id_14,
    input wire id_15
);
  uwire [1 : 1] id_17;
  assign id_17 = 1;
  assign id_1  = id_4;
endmodule
module module_1 (
    input tri id_0,
    output wor id_1,
    output tri1 id_2,
    input supply1 id_3,
    input supply0 id_4,
    output supply0 id_5
);
  assign id_2 = -1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_0,
      id_3,
      id_0,
      id_3,
      id_4,
      id_4,
      id_2,
      id_3,
      id_4,
      id_1,
      id_3,
      id_3,
      id_3,
      id_4
  );
  assign modCall_1.id_14 = 0;
  assign id_2 = -1;
endmodule

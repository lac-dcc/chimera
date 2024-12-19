// Seed: 2046649515
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input wand id_2,
    input wor id_3,
    output supply0 id_4,
    output supply1 id_5,
    output supply0 id_6,
    input supply0 id_7,
    output wor id_8,
    input supply0 id_9,
    output wor id_10,
    output wire id_11,
    output wand id_12,
    output wand id_13,
    output tri0 id_14,
    input wand id_15,
    input tri1 id_16,
    input tri1 id_17,
    output uwire id_18
);
  timeunit 1ps;
endmodule
module module_1 (
    output supply1 id_0,
    input wire id_1,
    output supply1 id_2,
    output tri0 id_3
);
  assign id_2 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_3,
      id_2,
      id_1,
      id_2,
      id_1,
      id_0,
      id_0,
      id_3,
      id_3,
      id_0,
      id_1,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_15 = 0;
endmodule

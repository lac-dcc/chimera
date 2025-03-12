// Seed: 3587955819
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input tri id_2,
    input wire id_3,
    input uwire id_4,
    output wand id_5,
    input wor id_6,
    output tri0 id_7,
    input tri0 id_8,
    input wand id_9,
    input tri1 id_10,
    output wand id_11,
    output tri0 id_12,
    output wand id_13,
    output tri id_14
);
  assign id_14 = id_2 ? id_0 ? -1 : id_10 : -1;
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    output wor id_2,
    output wor id_3,
    output supply1 id_4,
    input wire id_5,
    input tri1 id_6,
    input uwire id_7,
    output wor id_8,
    input tri id_9,
    output supply1 id_10,
    input uwire id_11,
    output wor id_12
);
  timeunit 1ps;
  reg id_14;
  module_0 modCall_1 (
      id_6,
      id_9,
      id_6,
      id_9,
      id_5,
      id_8,
      id_6,
      id_8,
      id_11,
      id_6,
      id_5,
      id_3,
      id_4,
      id_3,
      id_2
  );
  assign modCall_1.id_9 = 0;
  always_comb @(id_14) id_14 = -1;
  wire id_15;
endmodule

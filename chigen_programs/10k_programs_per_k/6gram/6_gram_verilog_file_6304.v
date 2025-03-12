// Seed: 247726299
module module_0 (
    input uwire id_0,
    output supply1 id_1,
    output wand id_2,
    input tri1 id_3,
    output tri1 id_4,
    output wor id_5,
    input uwire id_6,
    output wand id_7,
    output wor id_8,
    input supply0 id_9,
    input wand id_10,
    input wor id_11,
    output tri id_12
);
  realtime ["" : -1] id_14 = id_0;
  timeunit 1ps;
endmodule
module module_1 (
    input tri1 id_0,
    output wor id_1,
    input tri0 id_2,
    input tri0 id_3,
    input uwire id_4,
    input supply1 id_5,
    output tri id_6,
    input tri0 id_7,
    input wire id_8,
    input tri0 id_9,
    output wire id_10,
    input wor id_11,
    input wire id_12,
    output tri1 id_13
);
  logic [1 : 1] id_15 = id_11 == -1;
  module_0 modCall_1 (
      id_8,
      id_6,
      id_1,
      id_4,
      id_1,
      id_1,
      id_7,
      id_13,
      id_1,
      id_12,
      id_9,
      id_7,
      id_10
  );
  assign modCall_1.id_9 = 0;
endmodule

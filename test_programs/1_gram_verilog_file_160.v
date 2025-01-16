// Seed: 2602592407
module module_0 (
    input tri0 void id_0,
    output tri0 id_1,
    input wand id_2,
    input tri1 id_3,
    output tri1 id_4,
    input wor id_5,
    input wand id_6,
    input supply0 id_7,
    input wand id_8,
    input wand id_9,
    input supply0 id_10,
    input wor id_11
);
  assign id_4 = 1'b0;
  timeunit 1ps / 1ps;
  wire id_13;
  wire id_14;
endmodule
module module_1 (
    input tri0 id_0,
    output supply1 id_1,
    input supply0 id_2,
    output wire id_3
);
  assign id_3 = id_0;
  assign id_1 = id_0;
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_2,
      id_0,
      id_3,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.type_2 = 0;
  tri1 id_6 = -1'h0;
endmodule

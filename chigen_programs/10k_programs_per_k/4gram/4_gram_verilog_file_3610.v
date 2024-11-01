// Seed: 895769427
module module_0 (
    output supply1 id_0,
    output tri id_1,
    input uwire id_2,
    input tri0 id_3,
    output tri1 id_4,
    output wand id_5,
    input uwire id_6,
    input wand id_7,
    output tri0 id_8,
    output supply0 id_9
);
  assign id_8 = id_2 ? 1 : id_6;
  wire id_11;
  assign id_4 = id_2;
endmodule
module module_1 (
    output wor id_0,
    input tri0 id_1,
    output tri1 id_2,
    input wand id_3,
    output tri1 id_4,
    output wire id_5,
    input supply0 id_6,
    input tri0 id_7,
    output uwire id_8,
    input wand id_9,
    input tri0 id_10,
    output tri0 id_11,
    input tri0 id_12,
    input wor id_13,
    input tri id_14
);
  timeunit 1ps; module_0(
      id_8, id_11, id_14, id_13, id_4, id_4, id_7, id_14, id_4, id_5
  );
endmodule

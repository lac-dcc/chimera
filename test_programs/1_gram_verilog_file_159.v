// Seed: 1517050740
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input tri1 id_2,
    input tri0 id_3,
    input tri1 id_4,
    input wor id_5,
    output wor id_6,
    input wire id_7,
    output tri id_8,
    input uwire id_9,
    output wand id_10,
    input uwire id_11,
    input wand id_12,
    output tri1 id_13,
    input tri0 id_14,
    output supply1 id_15,
    output tri id_16
);
  initial
    if (1) $display;
    else;
  assign id_16 = -1;
  wire id_18;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    output supply1 id_2,
    input tri1 id_3,
    input wire id_4
);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_1,
      id_2,
      id_4,
      id_2,
      id_4,
      id_2,
      id_1,
      id_3,
      id_2,
      id_3,
      id_2,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule

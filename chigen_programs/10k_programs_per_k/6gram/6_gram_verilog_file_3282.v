// Seed: 4114581774
module module_0 (
    output wand id_0,
    output supply1 id_1,
    output wand id_2,
    output tri id_3,
    input tri1 id_4,
    output wor id_5,
    output tri id_6,
    input supply1 id_7,
    output wire id_8
);
  assign id_1 = id_4;
endmodule
module module_1 (
    output supply1 id_0,
    output supply0 id_1,
    input uwire id_2,
    output tri0 id_3,
    input tri0 id_4,
    input wire id_5,
    input wire id_6,
    output wand id_7,
    output wire id_8,
    output tri id_9,
    input wire id_10,
    input wand id_11,
    output supply1 id_12,
    output supply0 id_13
);
  tri0 id_15;
  assign id_3 = (1) - id_10;
  module_0 modCall_1 (
      id_8,
      id_3,
      id_12,
      id_13,
      id_4,
      id_0,
      id_7,
      id_4,
      id_1
  );
  assign modCall_1.id_7 = 0;
  wire id_16 = 1;
  tri1 id_17 = id_2 < 1 ? 1 : (1) / id_10;
  assign id_9 = id_10 ? id_5 : id_15 & 1 ? 1 : !id_15;
  wor id_18;
  assign id_16 = id_18;
  assign id_17 = id_10;
endmodule

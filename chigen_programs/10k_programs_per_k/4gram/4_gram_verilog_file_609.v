// Seed: 1781627260
module module_0 (
    output wire id_0,
    input tri0 id_1,
    output wire id_2,
    input wire id_3,
    input wire id_4,
    output tri0 id_5,
    input supply0 id_6,
    output wor id_7,
    input tri0 id_8,
    input supply1 id_9,
    output wor id_10,
    output supply1 id_11,
    output wand id_12,
    input wor id_13,
    output wor id_14,
    input uwire id_15,
    input tri1 id_16,
    output wand id_17,
    output uwire id_18
);
  assign id_12 = -1 == id_1 ? id_8 : !id_3;
  logic [-1 : 1] id_20;
  ;
  initial $clog2(85);
  ;
  tri0 [-1 : -1] id_21 = -1;
endmodule
module module_1 (
    input  wire id_0,
    input  wor  id_1,
    input  wire id_2,
    input  wire id_3,
    inout  tri0 id_4,
    input  tri1 id_5,
    output wor  id_6,
    input  tri0 id_7,
    input  tri0 id_8
);
  logic id_10;
  ;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_8,
      id_4,
      id_6,
      id_1,
      id_4,
      id_1,
      id_1,
      id_6,
      id_4,
      id_6,
      id_1,
      id_4,
      id_3,
      id_7,
      id_4,
      id_6
  );
  assign modCall_1.id_3 = 0;
endmodule

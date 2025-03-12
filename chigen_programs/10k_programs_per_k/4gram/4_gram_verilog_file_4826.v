// Seed: 104609282
module module_0 (
    input  tri   id_0
    , id_8,
    input  tri1  id_1,
    output uwire id_2,
    output tri   id_3,
    input  tri1  id_4,
    input  tri1  id_5,
    output tri   id_6
);
  logic id_9;
endmodule
module module_1 (
    output tri0 id_0,
    input tri id_1,
    input tri0 id_2,
    inout uwire id_3,
    input tri0 id_4,
    input wand id_5,
    output supply0 id_6,
    input supply0 id_7,
    output tri1 id_8,
    input wire id_9,
    output tri id_10,
    input wire id_11,
    output wand id_12,
    input wor id_13,
    output tri0 id_14,
    input supply1 id_15,
    input wire id_16
);
  wire id_18;
  module_0 modCall_1 (
      id_4,
      id_16,
      id_6,
      id_3,
      id_2,
      id_13,
      id_6
  );
  assign modCall_1.id_3 = 0;
  wire id_19;
  nand primCall (id_6, id_18, id_13, id_3, id_5, id_7, id_9, id_15, id_11, id_2, id_1, id_16);
  always @(-1'd0 > -1 or id_15) $clog2(37);
  ;
  wire id_20;
  wire id_21;
  wire id_22;
  ;
endmodule

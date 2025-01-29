// Seed: 3161562361
module module_0 (
    input wand id_0,
    output uwire id_1,
    output tri1 id_2,
    input tri0 id_3,
    output supply1 id_4,
    input tri id_5,
    input uwire id_6,
    input tri0 id_7,
    input wand id_8,
    input uwire id_9,
    output tri id_10,
    output tri1 id_11,
    output wand id_12,
    input supply1 id_13,
    output tri0 id_14,
    input tri1 id_15,
    input wor id_16
);
  assign id_11 = 1;
  assign id_10 = -1;
  wire id_18;
endmodule
module module_1 (
    input wand id_0,
    id_13,
    input wor id_1,
    input supply1 id_2,
    output supply0 id_3,
    input tri0 id_4,
    input supply1 id_5,
    input wire id_6,
    output tri1 id_7,
    output tri id_8,
    input tri0 id_9,
    input supply1 id_10,
    input logic id_11
);
  logic id_14, id_15, id_16 = id_11, id_17;
  module_0 modCall_1 (
      id_6,
      id_8,
      id_3,
      id_5,
      id_3,
      id_5,
      id_0,
      id_1,
      id_2,
      id_4,
      id_7,
      id_8,
      id_3,
      id_0,
      id_8,
      id_2,
      id_2
  );
  assign modCall_1.type_21 = 0;
  assign id_13 = ~-1;
  always id_15 <= 1'b0 & id_1;
  xnor primCall (
      id_3, id_10, id_14, id_11, id_16, id_0, id_15, id_5, id_1, id_6, id_4, id_13, id_9, id_17
  );
endmodule

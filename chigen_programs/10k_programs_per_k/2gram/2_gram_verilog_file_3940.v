// Seed: 1000229540
module module_0 (
    output wand id_0,
    input tri id_1,
    input tri1 id_2,
    input supply1 id_3,
    output wand id_4,
    input wire id_5
);
  wand id_7 = id_3;
endmodule
module module_1 (
    output tri1 id_0,
    output tri0 id_1,
    input tri0 id_2,
    input tri0 id_3,
    input tri id_4,
    input tri id_5,
    input uwire id_6,
    input uwire id_7
    , id_15,
    output supply1 id_8,
    input supply0 id_9,
    output supply1 id_10,
    input tri0 id_11,
    input wire id_12,
    input wire id_13
);
  logic [7:0] id_16;
  nand primCall (id_1, id_6, id_2, id_11, id_12, id_16, id_3);
  wire id_17;
  assign id_16[1] = 1'b0;
  module_0 modCall_1 (
      id_0,
      id_11,
      id_3,
      id_5,
      id_1,
      id_5
  );
  assign modCall_1.type_0 = 0;
endmodule

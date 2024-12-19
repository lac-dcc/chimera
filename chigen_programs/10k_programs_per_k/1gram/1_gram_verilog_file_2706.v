// Seed: 3002916462
module module_0 (
    id_1
);
  output wire id_1;
  assign id_1 = (1);
endmodule
module module_1 (
    output tri0 id_0,
    output tri1 id_1,
    output wire id_2,
    input supply0 id_3,
    output tri1 id_4,
    output tri0 id_5,
    output tri id_6,
    output tri0 id_7,
    input tri1 id_8,
    output tri0 id_9,
    input wand id_10,
    input supply1 id_11,
    input supply1 id_12,
    output supply1 id_13,
    input wand id_14,
    input wire id_15
);
  wire id_17;
  xnor primCall (id_6, id_3, id_17, id_14, id_8, id_12, id_10, id_11, id_15);
  module_0 modCall_1 (id_17);
  assign modCall_1.id_1 = 0;
  assign id_2 = 1;
endmodule

// Seed: 2453475543
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    output tri0 id_2,
    output wand id_3,
    output tri1 id_4,
    input wand id_5,
    input tri0 id_6,
    input wand id_7,
    input tri1 id_8,
    output wor id_9,
    input tri id_10,
    input wire id_11,
    input uwire id_12,
    output wand id_13,
    output tri0 id_14,
    output tri0 id_15,
    output tri0 id_16,
    input wor id_17,
    output tri id_18,
    input wire id_19,
    input uwire id_20
);
  assign id_9  = id_20 & id_17;
  assign id_14 = 1;
endmodule
module module_1 (
    input  uwire id_0,
    output uwire id_1,
    output tri   id_2
);
  always @(posedge id_0, posedge 1'b0) id_1 = 1;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_1,
      id_2,
      id_1,
      id_0,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.type_27 = 0;
endmodule

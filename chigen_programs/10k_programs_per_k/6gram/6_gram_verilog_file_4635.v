// Seed: 1126328845
module module_0 (
    input uwire id_0,
    input tri1 id_1,
    input uwire id_2,
    output tri id_3,
    input wand id_4,
    input wire id_5,
    input uwire id_6,
    input uwire id_7,
    input wor id_8,
    input tri0 id_9,
    output uwire id_10,
    output uwire id_11,
    output wire id_12,
    input wand id_13,
    input supply1 id_14,
    output supply1 id_15,
    input supply1 id_16,
    output wand id_17,
    input supply1 id_18,
    output supply1 id_19
);
  assign {id_1 - id_16} = -1;
endmodule
module module_1 (
    input  wire id_0,
    input  tri0 id_1,
    output wor  id_2
);
  reg id_4;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_2,
      id_2,
      id_2,
      id_1,
      id_0,
      id_2,
      id_0,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_8 = 0;
  always @(posedge 1) id_4 = id_4;
endmodule

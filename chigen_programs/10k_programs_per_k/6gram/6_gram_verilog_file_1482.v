// Seed: 2247683453
module module_0 (
    input wand id_0,
    input uwire id_1,
    output tri1 id_2,
    output supply0 id_3,
    input tri0 id_4,
    output wire id_5,
    input wire id_6,
    input tri0 id_7,
    output wor id_8
);
  reg id_10;
  initial #1 id_10 <= id_4 & id_1;
endmodule
module module_1 (
    input  uwire id_0,
    input  wire  id_1,
    output wor   id_2,
    input  tri   id_3,
    output wand  id_4,
    input  tri0  id_5,
    input  wand  id_6,
    output tri1  id_7
);
  uwire id_9;
  always @(posedge id_3 or posedge id_5) begin : LABEL_0
    id_9 = 1;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_2,
      id_5,
      id_4,
      id_6,
      id_1,
      id_7
  );
  assign modCall_1.type_5 = 0;
endmodule

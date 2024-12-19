// Seed: 162377126
module module_0 (
    input wand id_0,
    input tri id_1,
    output tri1 id_2,
    input supply1 id_3,
    input wand id_4,
    input wire id_5,
    output wand id_6,
    input tri id_7
);
endmodule
module module_1 (
    output wor   id_0,
    output tri1  id_1,
    output tri0  id_2,
    input  uwire id_3,
    output tri   id_4,
    output wor   id_5,
    input  wor   id_6
);
  wire id_8;
  always @(posedge id_6 or posedge 1) $display(1);
  wire id_9;
  supply1 id_10;
  uwire id_11;
  generate
    assign id_1 = id_10;
  endgenerate
  assign id_2 = id_11;
  wire id_12;
  module_0 modCall_1 (
      id_10,
      id_3,
      id_2,
      id_11,
      id_11,
      id_11,
      id_4,
      id_6
  );
  assign modCall_1.id_6 = 0;
endmodule

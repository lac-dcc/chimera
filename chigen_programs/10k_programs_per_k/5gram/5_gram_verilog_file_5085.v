// Seed: 1088881704
module module_0 (
    output tri1 id_0,
    output tri0 id_1,
    input wor module_0,
    output wor id_3,
    input wire id_4,
    input tri0 id_5,
    input tri id_6,
    output wand id_7,
    input supply1 id_8,
    input wand id_9,
    input tri1 id_10
);
  assign id_1 = id_2;
  always @(*) id_7 = 1;
  integer id_12;
endmodule
module module_1 (
    input  wire id_0,
    input  wor  id_1,
    output tri1 id_2
);
  assign id_2 = id_0;
  generate
    always @(posedge 1 or posedge 1) begin : LABEL_0
      id_2 = id_0 == id_0;
    end
  endgenerate
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule

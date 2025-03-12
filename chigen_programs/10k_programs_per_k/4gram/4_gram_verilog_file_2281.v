// Seed: 1433152752
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    input wire id_2,
    input tri id_3,
    output uwire id_4,
    input supply1 id_5
    , id_7
);
  logic [1 : -1] id_8;
  ;
  generate
    always @(posedge -1) begin : LABEL_0
      id_8[1 :-1] = 1;
    end
  endgenerate
endmodule
module module_1 (
    output tri   id_0,
    output uwire id_1,
    output uwire id_2,
    input  tri0  id_3,
    output wand  id_4,
    input  wor   id_5,
    input  tri0  id_6,
    output tri   id_7,
    output tri   id_8,
    input  tri1  id_9,
    input  uwire id_10
);
  assign id_7 = id_6 - id_10;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_9,
      id_7,
      id_6
  );
  assign modCall_1.id_5 = 0;
endmodule

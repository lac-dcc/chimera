// Seed: 2578423975
module module_0 (
    input tri0 id_0
    , id_9,
    input supply1 id_1,
    input tri1 id_2,
    input wor id_3,
    output wire id_4,
    input wand id_5,
    input tri0 id_6,
    input wand id_7
);
  wire id_10;
endmodule
module module_1 (
    input  tri   id_0,
    output wire  id_1,
    input  uwire id_2
    , id_10,
    output wor   id_3,
    input  wor   id_4,
    input  wand  id_5,
    output wire  id_6,
    output tri1  id_7,
    input  tri0  id_8
);
  id_11 :
  assert property (@(posedge 1) id_4)
  else $unsigned(40);
  ;
  logic id_12;
  ;
  assign id_10 = {id_5 >= 1'h0{-1}};
  bit id_13;
  always_comb @(negedge 1) begin : LABEL_0
    assign id_7 = -1;
    id_13 <= 1;
  end
  wire id_14;
  generate
    assign id_3 = id_5;
    assign id_1 = id_10 !=? id_11#(.id_13(-1'b0), .id_10(1), .id_8(1));
  endgenerate
  module_0 modCall_1 (
      id_2,
      id_8,
      id_5,
      id_8,
      id_7,
      id_8,
      id_5,
      id_4
  );
endmodule

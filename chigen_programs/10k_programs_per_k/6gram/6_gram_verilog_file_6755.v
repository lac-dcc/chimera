// Seed: 3271804769
module module_0 (
    input  tri0  id_0,
    input  tri0  id_1,
    input  wor   id_2
    , id_10,
    input  wand  id_3,
    input  tri0  id_4
    , id_11,
    output wand  id_5,
    output uwire id_6,
    input  wire  id_7,
    output tri   id_8
);
  assign id_10 = id_1;
  wire id_12;
  always @(posedge id_1 - id_0 | id_3 or posedge -1'b0) begin : LABEL_0
    $clog2(57);
    ;
  end
endmodule
module module_1 (
    output tri1  id_0,
    input  tri   id_1,
    output uwire id_2
    , id_8,
    input  tri0  id_3,
    output tri   id_4,
    output uwire id_5,
    output wand  id_6
);
  assign id_2 = 'h0;
  assign id_5 = 1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_3,
      id_1,
      id_3,
      id_4,
      id_5,
      id_3,
      id_6
  );
  assign modCall_1.id_1 = 0;
endmodule

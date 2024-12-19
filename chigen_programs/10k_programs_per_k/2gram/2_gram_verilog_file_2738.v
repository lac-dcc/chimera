// Seed: 2091593833
module module_0 (
    input  tri1  id_0,
    output uwire id_1,
    output tri0  id_2
);
endmodule
module module_1 (
    input  uwire id_0,
    input  uwire id_1,
    input  wor   id_2,
    input  tri0  id_3
    , id_15,
    input  tri1  id_4,
    output uwire id_5,
    output uwire id_6,
    output tri   id_7,
    input  wand  id_8,
    output logic id_9,
    input  wire  id_10,
    input  uwire id_11,
    input  uwire id_12,
    output wand  id_13
);
  always_latch begin : LABEL_0
    #1
    @(posedge 1'b0) begin : LABEL_0
      id_9 <= 1;
      #1 id_13 = {id_15, 1, id_1};
    end
  end
  module_0 modCall_1 (
      id_8,
      id_6,
      id_15
  );
  assign modCall_1.id_1 = 0;
endmodule

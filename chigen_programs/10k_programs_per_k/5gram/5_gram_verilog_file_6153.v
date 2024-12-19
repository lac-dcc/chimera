// Seed: 3077333042
module module_0 (
    input tri0 id_0,
    inout wor  id_1
);
  assign id_1 = 1;
  for (id_3 = id_0; 1 == id_1 + 1; id_3 = 1) begin : LABEL_0
    wire id_4;
  end
  wire id_5;
  wire id_6;
endmodule
module module_1 (
    input  uwire id_0,
    input  wor   id_1,
    input  wor   id_2,
    input  wire  id_3,
    input  tri   id_4,
    input  tri   id_5,
    input  wand  id_6,
    input  wire  id_7,
    input  tri   id_8,
    output uwire id_9
);
  wire id_11, id_12;
  tri0 id_13;
  module_0 modCall_1 (
      id_0,
      id_13
  );
  assign modCall_1.id_3 = 0;
  generate
    assign {1, 1, id_13} = id_0;
  endgenerate
endmodule

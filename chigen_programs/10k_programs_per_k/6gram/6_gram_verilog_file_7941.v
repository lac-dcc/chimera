// Seed: 59090312
module module_0 (
    input  wor   id_0,
    input  wor   id_1,
    input  uwire id_2,
    input  wire  id_3,
    input  tri   id_4,
    input  tri   id_5,
    input  wand  id_6,
    output tri   id_7,
    output uwire id_8
);
  always @(posedge "") release id_7["" : 1+1];
  assign id_7 = -1'b0;
endmodule
module module_1 (
    output logic id_0,
    input  wand  id_1,
    output tri0  id_2,
    output wand  id_3,
    input  wire  id_4,
    input  wor   id_5,
    input  uwire id_6,
    output tri   id_7,
    input  tri0  id_8
);
  always @(*) begin : LABEL_0
    if (1'h0) if (1) id_0 = id_5;
  end
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_8,
      id_5,
      id_5,
      id_6,
      id_3,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule

// Seed: 3004353901
module module_0 (
    input  tri  id_0,
    output tri0 id_1,
    input  tri  id_2,
    input  wire id_3,
    input  wire id_4,
    input  wand id_5,
    output wand id_6,
    input  wand id_7
);
  generate
    assign id_6 = id_0;
    assign id_1 = 1;
  endgenerate
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    output tri1  id_0,
    output uwire id_1
    , id_11,
    output wor   id_2,
    input  tri0  id_3,
    input  uwire id_4,
    input  uwire id_5,
    input  wire  id_6,
    output logic id_7,
    output uwire id_8,
    input  tri   id_9
);
  wire id_12;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_9,
      id_5,
      id_6,
      id_5,
      id_8,
      id_9
  );
  always @(posedge id_11) begin : LABEL_0
    id_7 <= 1;
  end
endmodule

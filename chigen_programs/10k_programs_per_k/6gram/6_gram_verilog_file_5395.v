// Seed: 2754323339
module module_0 (
    input  wor  id_0,
    input  tri  id_1,
    input  tri1 id_2,
    output tri0 id_3,
    input  tri  id_4,
    output wand id_5,
    output tri  id_6
);
  initial begin : LABEL_0
    if ("") disable id_8;
  end
  assign module_1.type_15 = 0;
endmodule
module module_1 (
    output wor   id_0,
    input  wand  id_1,
    input  tri   id_2,
    input  uwire id_3,
    input  wor   id_4,
    input  wand  id_5,
    input  wire  id_6,
    output logic id_7,
    input  tri0  id_8,
    output wand  id_9
);
  always @(*) begin : LABEL_0
    id_9 = ~id_8 ? id_3 : ~id_3;
  end
  wire id_11, id_12, id_13;
  always @(id_5 or id_6) begin : LABEL_0
    id_7 <= 1'b0;
    @(posedge 1);
    disable id_14;
  end
  initial id_7 = 1;
  module_0 modCall_1 (
      id_8,
      id_4,
      id_6,
      id_9,
      id_5,
      id_9,
      id_14
  );
endmodule

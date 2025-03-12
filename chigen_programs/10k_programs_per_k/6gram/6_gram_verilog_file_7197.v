// Seed: 3781792062
module module_0 (
    input  wand  id_0,
    output logic id_1,
    output wire  id_2,
    output wor   id_3,
    output wor   id_4,
    input  wor   id_5,
    input  tri0  id_6,
    input  wand  id_7,
    input  uwire id_8,
    output tri0  id_9
);
  parameter id_11 = -1;
  wire  id_12;
  logic id_13;
  ;
  initial begin : LABEL_0
    disable id_14;
  end
  generate
    for (id_15 = -1; -1'd0; id_1 = -1) begin : LABEL_1
      assign id_15 = -1'b0 + -1'b0 ? 1'd0 : id_8 > id_11;
    end
  endgenerate
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    input wand id_2,
    output wand id_3,
    output logic id_4
);
  always @(1'b0 == id_1 or negedge id_2) begin : LABEL_0
    id_4 <= id_2;
  end
  module_0 modCall_1 (
      id_2,
      id_4,
      id_3,
      id_3,
      id_3,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_0 = 0;
  assign id_0 = id_2;
endmodule

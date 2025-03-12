// Seed: 2062218084
module module_0 (
    input  tri0  id_0,
    input  wor   id_1,
    input  uwire id_2,
    output tri1  id_3,
    input  wand  id_4,
    output logic id_5
);
  parameter id_7 = 1;
  always @(posedge 1) begin : LABEL_0
    id_5 <= id_4;
  end
endmodule
module module_1 (
    output tri   id_0,
    output wor   id_1,
    input  tri1  id_2,
    output wire  id_3,
    input  uwire id_4,
    output logic id_5
);
  generate
    for (id_7 = 1; 1; id_5 = id_2) begin : LABEL_0
      logic id_8;
      ;
    end
  endgenerate
  module_0 modCall_1 (
      id_4,
      id_2,
      id_4,
      id_0,
      id_2,
      id_5
  );
  assign modCall_1.id_3 = 0;
endmodule

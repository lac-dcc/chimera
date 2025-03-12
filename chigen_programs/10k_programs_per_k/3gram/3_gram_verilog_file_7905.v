// Seed: 1634718763
module module_0 (
    input  tri0  id_0,
    input  wor   id_1,
    output tri   id_2,
    output tri   id_3,
    output uwire id_4,
    output tri1  id_5,
    output wor   id_6,
    input  tri   id_7
);
  for (id_9 = 1; -1; id_9 = -1 & -1) begin : LABEL_0
    assign id_9 = id_1;
    assign id_9 = 1;
  end
  assign id_9 = -1;
endmodule
module module_1 (
    input  tri   id_0,
    output uwire id_1,
    output tri1  id_2,
    input  tri0  id_3,
    output logic id_4
);
  wire [-1 : -1] id_6;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_3
  );
  assign modCall_1.id_3 = 0;
  initial begin : LABEL_0
    if (1) begin : LABEL_1
      id_4 <= id_0;
    end
  end
endmodule

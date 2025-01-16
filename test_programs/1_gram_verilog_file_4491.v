// Seed: 3107065372
module module_0 (
    output logic id_0,
    id_3,
    input  uwire id_1
);
  initial begin : LABEL_0
    id_0 <= 1;
    if (id_3) id_0 = (-1);
  end
  assign module_1.type_7 = 0;
endmodule
module module_1 (
    input  logic id_0,
    input  tri0  id_1,
    output uwire id_2,
    output wor   id_3,
    output logic id_4
);
  always id_4 <= #1{id_0{1}};
  module_0 modCall_1 (
      id_4,
      id_1
  );
endmodule
module module_2 (
    output tri   id_0,
    input  uwire id_1
);
  for (id_3 = -1'b0; 1'h0; id_0 = id_3) begin : LABEL_0
    assign id_0 = id_1;
    wire id_4, id_5, id_6;
    genvar id_7;
  end
endmodule
module module_3 (
    output wand  id_0,
    output tri1  id_1,
    output uwire id_2,
    input  tri0  id_3
);
  wire id_5;
  module_2 modCall_1 (
      id_0,
      id_3
  );
endmodule

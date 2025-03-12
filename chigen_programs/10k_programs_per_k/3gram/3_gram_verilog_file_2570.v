// Seed: 668919362
module module_0 (
    input  uwire id_0,
    input  wire  id_1,
    output tri   id_2,
    input  wor   id_3
);
  parameter id_5 = 1'h0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output logic id_0,
    output tri0  id_1,
    input  wor   id_2
);
  always_ff @({1{id_2}} or posedge -1) begin : LABEL_0
    id_0 = 1;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_2
  );
endmodule
module module_2 (
    output tri  id_0,
    input  wire id_1,
    input  wor  id_2
);
  generate
    wire id_4 = id_1;
  endgenerate
  assign id_4 = -1;
  logic id_5 = 1 != id_1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_1
  );
  assign modCall_1.id_2 = 0;
endmodule

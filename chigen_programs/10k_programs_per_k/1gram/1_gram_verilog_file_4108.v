// Seed: 1513755524
module module_0 (
    output logic id_0
);
  initial id_0 = 1;
  wire id_2;
  module_2 modCall_1 (id_2);
  assign modCall_1.id_5 = 0;
endmodule
module module_1 (
    input  tri   id_0,
    inout  logic id_1,
    input  uwire id_2,
    output uwire id_3,
    input  wor   id_4,
    output wor   id_5
);
  assign id_1 = 1'b0;
  module_0 modCall_1 (id_1);
  always @(posedge 1 or posedge 1 or negedge -1) begin : LABEL_0
    id_1 = 'b0;
  end
  assign id_3 = -1;
  wire id_7, id_8;
endmodule
module module_2 (
    id_1
);
  inout wire id_1;
  assign id_1 = id_1;
  wire [1 : -1] id_2, id_3;
  supply0 id_4, id_5;
  assign id_5 = id_3 && id_2;
endmodule : SymbolIdentifier

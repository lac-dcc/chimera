// Seed: 2035584350
module module_0;
  always @(posedge 1 or negedge 1'b0) begin : LABEL_0
    id_1 = 1;
  end
  wire id_2;
endmodule
module module_1 (
    input wor  id_0,
    input wire id_1
);
  logic [7:0] id_3;
  module_0 modCall_1 ();
  assign id_3[1'b0] = 1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2[1] = id_1;
  buf primCall (id_1, id_2);
  module_0 modCall_1 ();
  always @(1) begin : LABEL_0
    deassign id_5;
  end
endmodule

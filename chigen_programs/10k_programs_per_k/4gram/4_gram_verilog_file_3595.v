// Seed: 2331675542
module module_0 ();
  logic id_1, id_2;
  parameter id_3 = 1;
  wire id_4;
  always @(posedge -1) id_2 = -1;
  module_2 modCall_1 ();
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input logic [7:0] id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
  always @(posedge id_5 or posedge 1) begin : LABEL_0
    assert (id_4);
  end
  parameter id_6 = -1;
endmodule
module module_2;
  wire id_1;
endmodule

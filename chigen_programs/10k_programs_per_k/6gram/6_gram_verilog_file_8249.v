// Seed: 1465262870
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
endmodule
module module_1 #(
    parameter id_4 = 32'd22
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  input wire _id_4;
  input logic [7:0] id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_3[-1!==-1**id_4];
  wire  id_5;
  logic id_6;
  ;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6
  );
  always @(posedge -1 or posedge 1) begin : LABEL_0
    wait (id_2);
  end
endmodule

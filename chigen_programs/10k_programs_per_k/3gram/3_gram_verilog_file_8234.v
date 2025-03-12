// Seed: 4012181519
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input logic [7:0] id_3;
  inout wire id_2;
  inout reg id_1;
  always_latch @(posedge id_1) begin : LABEL_0
    id_1 = id_4;
  end
  module_0 modCall_1 (
      id_4,
      id_5,
      id_4,
      id_2
  );
endmodule

// Seed: 4263141915
module module_0 (
    id_1,
    id_2,
    id_3
);
  output reg id_3;
  output logic [7:0] id_2;
  input wire id_1;
  wire  id_4;
  logic id_5;
  localparam id_6 = 1;
  always @(1) begin : LABEL_0
    id_3 = id_5;
  end
endmodule
module module_1 #(
    parameter id_4 = 32'd76
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5
);
  input wire id_5;
  input wire _id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  inout reg id_1;
  assign id_3[{id_4, id_4}] = id_2;
  logic [7:0] id_6;
  module_0 modCall_1 (
      id_5,
      id_3,
      id_1
  );
  always @(-1 or id_6[1]) begin : LABEL_0
    id_1 <= -1;
  end
endmodule

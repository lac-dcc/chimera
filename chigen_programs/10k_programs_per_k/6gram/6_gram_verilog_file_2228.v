// Seed: 1836403086
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire  id_5;
  logic id_6;
endmodule
module module_1 #(
    parameter id_1 = 32'd89,
    parameter id_6 = 32'd83
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6
);
  input wire _id_6;
  output wire id_5;
  output reg id_4;
  inout logic [7:0] id_3;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_2
  );
  inout wire id_2;
  inout wire _id_1;
  always @(posedge id_2) begin : LABEL_0
    id_4 <= id_3[-1&id_1 : id_6];
  end
  wire [-1 : -1] id_7 = id_7;
  assign id_4 = ~id_7;
endmodule

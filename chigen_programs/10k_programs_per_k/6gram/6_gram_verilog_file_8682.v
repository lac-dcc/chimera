// Seed: 1168287164
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  input logic [7:0] id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_8;
  ;
  logic id_9, id_10;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout logic [7:0] id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_4,
      id_3,
      id_3,
      id_3
  );
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always @(id_2) begin : LABEL_0
    id_4[1] <= id_2;
  end
endmodule

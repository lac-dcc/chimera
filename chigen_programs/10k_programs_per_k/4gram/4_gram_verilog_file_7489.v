// Seed: 1441049186
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  logic id_3 = id_2;
  logic id_4, id_5;
  parameter id_6 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  output reg id_4;
  inout wire id_3;
  module_0 modCall_1 (
      id_5,
      id_3
  );
  inout wire id_2;
  inout logic [7:0] id_1;
  always @(posedge id_1[-1]) begin : LABEL_0
    id_4 = 1 ^ id_3;
    id_4 = id_1;
    id_4 = 1;
  end
endmodule

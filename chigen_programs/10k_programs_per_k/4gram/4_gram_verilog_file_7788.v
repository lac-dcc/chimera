// Seed: 3778163653
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input logic [7:0] id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = id_4[1];
  assign id_1 = id_4;
endmodule
module module_1 (
    output logic id_0,
    output wire  id_1,
    output wor   id_2,
    output logic id_3,
    output tri0  id_4
    , id_6
);
  parameter id_7 = 1;
  logic [7:0] id_8;
  nand primCall (id_0, id_8, id_6, id_7);
  logic id_9 = 1;
  always_ff @(id_8[1] or posedge id_9) begin : LABEL_0
    id_0 <= -1;
    id_3 <= 1;
  end
  module_0 modCall_1 (
      id_6,
      id_9,
      id_6,
      id_8
  );
  assign id_0 = id_6 ? id_8 : 1 ? id_6 : 1;
endmodule

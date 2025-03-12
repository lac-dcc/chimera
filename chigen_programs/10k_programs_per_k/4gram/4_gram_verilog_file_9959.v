// Seed: 1441152487
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  assign module_1.id_4 = 0;
  output wire id_2;
  input wire id_1;
  logic [7:0] id_7;
  assign id_4 = id_7[-1];
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output logic [7:0] id_3;
  inout reg id_2;
  input logic [7:0] id_1;
  initial begin : LABEL_0
    id_3[1] <= -1;
  end
  for (id_4 = id_2; -1; id_2 = -1) begin : LABEL_1
    wire id_5;
    assign id_4 = 1'b0;
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign id_3[1'h0-:-1] = {id_1, -1} + -1 ? 1'b0 : -1 - id_1[1'b0];
endmodule

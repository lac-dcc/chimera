// Seed: 3469782933
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_3 = 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  always @(posedge id_2) begin : LABEL_0
  end
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  assign id_4 = 1'd0;
  reg id_5 = 1;
  always @(*) begin : LABEL_0
    id_5 <= 1;
  end
endmodule

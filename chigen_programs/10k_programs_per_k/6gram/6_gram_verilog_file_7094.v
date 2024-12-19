// Seed: 1010740742
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_3;
  wire id_5;
  reg  id_6;
  always @(posedge id_3) begin : LABEL_0
    if (1'b0) id_6 <= {1'h0, 1, 1, 1};
  end
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always id_2 <= #1 1;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_5,
      id_3
  );
endmodule

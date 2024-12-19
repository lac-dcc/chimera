// Seed: 3172946702
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  reg  id_5;
  wire id_6;
  always @(negedge id_5 or negedge 1'b0) begin : LABEL_0
    id_5 <= 1;
  end
  module_0 modCall_1 (
      id_6,
      id_1,
      id_1,
      id_6,
      id_1,
      id_1
  );
endmodule

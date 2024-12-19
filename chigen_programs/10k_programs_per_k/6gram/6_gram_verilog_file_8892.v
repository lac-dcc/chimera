// Seed: 2326181100
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always @(negedge 1'b0) begin : LABEL_0
    deassign id_4;
  end
  wire id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  reg id_5;
  assign id_5 = 1;
  always begin : LABEL_0
    id_4 <= id_5;
  end
  wire id_6;
  assign id_5 = id_3;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_2,
      id_2,
      id_1,
      id_6
  );
endmodule

// Seed: 2270426634
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = id_4;
  wire id_5;
  parameter id_6 = -1;
  wire id_7;
  id_8(
      id_5
  );
  always begin : LABEL_0
    if (1) if (1'b0) @($display) id_2 <= id_4;
  end
  logic [7:0] id_9 = id_9[""];
  wire id_10;
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
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always id_3 = #1{id_5, -1};
  module_0 modCall_1 (
      id_1,
      id_3,
      id_1
  );
  always return 1;
  assign id_3 = id_7;
endmodule

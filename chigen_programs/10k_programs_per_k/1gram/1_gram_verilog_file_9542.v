// Seed: 2563196303
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic [7:0] id_10, id_11, id_12, id_13, id_14;
  assign id_4 = 1;
  assign module_1.id_2 = 0;
  wire id_15;
  tri  id_16 = 1;
  assign id_1 = 1;
  logic [7:0][1 'b0] id_17;
  assign id_6 = id_10[1];
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    id_2 <= 1;
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_4,
      id_4
  );
endmodule

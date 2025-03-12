// Seed: 1387544172
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
  output wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout reg id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_3,
      id_6,
      id_4,
      id_3,
      id_4,
      id_4,
      id_8,
      id_6,
      id_4
  );
  logic [7:0] id_9;
  wire id_10;
  logic [7:0] id_11;
  assign id_11[-1] = id_9[1'b0];
  wire id_12;
  initial begin : LABEL_0
    force id_12 = 1 | -1'h0 | -1;
    id_7 <= -1'b0;
  end
endmodule

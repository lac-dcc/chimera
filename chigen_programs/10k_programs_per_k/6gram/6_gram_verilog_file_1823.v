// Seed: 1760034336
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_6 = id_11 == 1'b0;
  wire id_13;
  initial id_4 = (1);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(id_6) begin : LABEL_0
    id_1 <= 1 != id_11;
  end
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_13,
      id_9,
      id_5,
      id_9,
      id_6,
      id_14,
      id_4,
      id_2,
      id_11,
      id_2
  );
  wire id_15 = 1'd0;
  always @(*) begin : LABEL_0
    id_7 <= id_12;
  end
endmodule

// Seed: 14026105
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
    id_10
);
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  always_latch @(posedge id_3) begin : LABEL_0
    id_5 <= id_9;
    id_3 <= 1;
    id_8 <= 1;
  end
  wire id_11;
  assign module_1.id_11 = 0;
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
    id_13,
    id_14,
    id_15,
    id_16
);
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always disable id_17;
  module_0 modCall_1 (
      id_6,
      id_17,
      id_3,
      id_17,
      id_3,
      id_4,
      id_14,
      id_3,
      id_8,
      id_17
  );
  assign id_13 = id_3;
  initial begin : LABEL_0
    if (1 - 1) id_11 <= 1;
  end
  wire id_18;
  integer id_19;
endmodule

// Seed: 468146273
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
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  input wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_9 = 1 - id_9;
  assign id_5 = 1;
  id_18(
      .id_0(1), .id_1(1'h0), .id_2(1 & !id_16), .id_3(id_3), .id_4(1), .id_5(id_10), .id_6(id_13)
  );
  assign id_13 = 1;
  wire id_19;
  wire id_20;
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
  output wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_14;
  assign id_6 = {1'h0, 1};
  wire id_15 = id_5[1'd0];
  reg  id_16;
  wire id_17;
  id_18(
      .id_0(1), .id_1(1)
  );
  always @(*) begin : LABEL_0
    id_16 <= id_12;
    $display;
  end
  always @(posedge 1) begin : LABEL_0
    id_16 <= 1;
  end
  wire id_19;
  module_0 modCall_1 (
      id_4,
      id_19,
      id_10,
      id_9,
      id_10,
      id_8,
      id_7,
      id_15,
      id_2,
      id_3,
      id_15,
      id_14,
      id_14,
      id_6,
      id_4,
      id_9,
      id_17
  );
endmodule

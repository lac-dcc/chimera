// Seed: 3210474024
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
  inout wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  genvar id_18;
  always @(posedge -1) begin : LABEL_0
    id_18 <= -1'b0;
    $clog2(64);
    ;
  end
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
    id_16,
    id_17,
    id_18
);
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  output wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  module_0 modCall_1 (
      id_16,
      id_17,
      id_18,
      id_4,
      id_2,
      id_14,
      id_18,
      id_5,
      id_17,
      id_18,
      id_5,
      id_4,
      id_17,
      id_13,
      id_4,
      id_12,
      id_17
  );
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(id_1 + -1'd0) id_4 += -1;
endmodule

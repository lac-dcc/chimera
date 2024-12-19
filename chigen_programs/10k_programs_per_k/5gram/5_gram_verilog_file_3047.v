// Seed: 3236681414
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
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  genvar id_11;
  reg id_12, id_13, id_14, id_15;
  always @(negedge 1'h0)
    if (id_11) begin : LABEL_0
      if (id_15) assign id_8 = id_13 * id_14 - id_6;
    end else id_13 <= 1;
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
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always_latch @(posedge 1) begin : LABEL_0
    id_10 = id_6[1];
  end
  module_0 modCall_1 (
      id_4,
      id_17,
      id_18,
      id_2,
      id_4,
      id_17,
      id_4,
      id_13,
      id_17,
      id_18
  );
  wor  id_19 = 1;
  wire id_20;
endmodule

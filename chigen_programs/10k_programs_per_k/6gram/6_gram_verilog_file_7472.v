// Seed: 691346600
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
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26
);
  output wire id_26;
  inout wire id_25;
  input wire id_24;
  input wire id_23;
  output wire id_22;
  inout wire id_21;
  inout wire id_20;
  output wire id_19;
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  output wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(negedge id_8) id_6 = #1 id_12 - id_14;
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
    id_10
);
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_10 = 1'd0;
  wire id_11, id_12;
  always @(posedge id_1 or posedge id_4) begin : LABEL_0
    id_9 <= 1;
    $display;
  end
  module_0 modCall_1 (
      id_11,
      id_11,
      id_8,
      id_5,
      id_6,
      id_9,
      id_5,
      id_8,
      id_12,
      id_1,
      id_1,
      id_10,
      id_5,
      id_1,
      id_11,
      id_1,
      id_5,
      id_8,
      id_8,
      id_11,
      id_2,
      id_1,
      id_2,
      id_11,
      id_8,
      id_5
  );
endmodule

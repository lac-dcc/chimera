// Seed: 476395000
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
    id_22
);
  output wire id_22;
  inout wire id_21;
  input wire id_20;
  input wire id_19;
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_13 = 1 ? id_1 : id_7;
  assign module_1.id_15 = 0;
  wire id_23, id_24;
  id_25(
      1, 1, id_19
  );
  wire id_26;
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
    id_15
);
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  always @(negedge id_15 or posedge 1) begin : LABEL_0
    id_10 = 1;
  end
  module_0 modCall_1 (
      id_8,
      id_6,
      id_12,
      id_14,
      id_9,
      id_2,
      id_14,
      id_8,
      id_10,
      id_9,
      id_9,
      id_6,
      id_3,
      id_8,
      id_8,
      id_10,
      id_4,
      id_3,
      id_15,
      id_7,
      id_9,
      id_10
  );
endmodule

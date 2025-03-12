// Seed: 4157632556
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  assign module_1.id_24 = 0;
  input wire id_2;
  input wire id_1;
  assign id_6 = id_2;
  logic id_8;
  assign id_6 = id_2;
endmodule
module module_1 #(
    parameter id_24 = 32'd71,
    parameter id_5  = 32'd2
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
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
    _id_24,
    id_25,
    id_26,
    id_27,
    id_28,
    id_29
);
  input wire id_29;
  output wire id_28;
  output wire id_27;
  output wire id_26;
  input wire id_25;
  input wire _id_24;
  inout wire id_23;
  input wire id_22;
  output wire id_21;
  inout wire id_20;
  output wire id_19;
  input wire id_18;
  input wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  input wire id_13;
  inout wire id_12;
  inout wire id_11;
  output logic [7:0] id_10;
  module_0 modCall_1 (
      id_2,
      id_12,
      id_27,
      id_12,
      id_13,
      id_2,
      id_17
  );
  inout wire id_9;
  nand primCall (
      id_12,
      id_8,
      id_29,
      id_2,
      id_18,
      id_25,
      id_20,
      id_22,
      id_23,
      id_11,
      id_7,
      id_3,
      id_13,
      id_4,
      id_9,
      id_6
  );
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire _id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wor [1  <=  id_5 : id_24] id_30 = -1'b0 ==? (id_29);
  always_ff @(id_29 or id_8) begin : LABEL_0
    id_10[1/-1] = 1'b0;
  end
  wire id_31 = id_9++;
endmodule

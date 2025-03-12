// Seed: 2590602448
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
    id_14
);
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_15;
  uwire id_16 = -1'h0;
  always @(posedge id_12 or posedge !id_2 | id_1) begin : LABEL_0
    $clog2(53);
    ;
  end
  assign id_15 = 1'b0;
endmodule
module module_1 #(
    parameter id_19 = 32'd91,
    parameter id_20 = 32'd10
) (
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
    _id_19,
    _id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26
);
  inout wire id_26;
  output wire id_25;
  output wire id_24;
  input wire id_23;
  output wire id_22;
  inout wire id_21;
  inout wire _id_20;
  inout wire _id_19;
  inout reg id_18;
  input wire id_17;
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  module_0 modCall_1 (
      id_7,
      id_2,
      id_16,
      id_6,
      id_13,
      id_8,
      id_2,
      id_26,
      id_25,
      id_9,
      id_25,
      id_2,
      id_8,
      id_21
  );
  inout wire id_4;
  output logic [7:0] id_3;
  inout wire id_2;
  output wire id_1;
  always @(-1) begin : LABEL_0
    id_18 <= -1;
    id_3[id_20==id_19] <= 1;
  end
endmodule

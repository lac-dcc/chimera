// Seed: 1866310907
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
    id_18
);
  output wire id_18;
  output wire id_17;
  input wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  always @(id_7 !=? 1 or posedge id_5) begin : LABEL_0
    wait (id_16);
  end
  wire id_19;
  wire id_20;
endmodule
module module_1 #(
    parameter id_12 = 32'd59
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
    _id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  output wire id_13;
  inout wire _id_12;
  output logic [7:0] id_11;
  module_0 modCall_1 (
      id_8,
      id_13,
      id_4,
      id_4,
      id_2,
      id_2,
      id_7,
      id_5,
      id_4,
      id_5,
      id_4,
      id_7,
      id_7,
      id_8,
      id_8,
      id_10,
      id_4,
      id_3
  );
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always disable id_17;
  assign id_11[id_12] = 1;
endmodule

// Seed: 3637766833
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
    id_15
);
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  output logic [7:0] id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always_ff @(1) begin : LABEL_0
    if (1) id_12[""] <= 1;
  end
endmodule
module module_0 #(
    parameter id_1 = 32'd57
) (
    _id_1,
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
    module_1,
    id_13,
    id_14
);
  input wire id_14;
  output logic [7:0] id_13;
  input wire id_12;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_5,
      id_11,
      id_5,
      id_4,
      id_7,
      id_2,
      id_8,
      id_9,
      id_13,
      id_11,
      id_7,
      id_3
  );
  input wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire _id_1;
  assign id_13[id_1] = 1;
endmodule

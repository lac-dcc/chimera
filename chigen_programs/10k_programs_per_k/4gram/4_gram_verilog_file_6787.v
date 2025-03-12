// Seed: 3443385598
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
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  initial begin : LABEL_0
    if (1) begin : LABEL_1
      if (1) begin : LABEL_2
        disable id_16;
      end
    end
  end
  assign id_7 = id_9;
  assign id_2 = ~id_9;
  parameter id_17 = 1;
  wire id_18;
  always @(*);
endmodule
module module_1 #(
    parameter id_12 = 32'd76
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
    _id_12
);
  input wire _id_12;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_10,
      id_11,
      id_7,
      id_11,
      id_11,
      id_8,
      id_11,
      id_11,
      id_11,
      id_5,
      id_4,
      id_4,
      id_4
  );
  inout uwire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output supply1 id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = 1 - id_12;
  wire id_13;
  assign id_11 = 1;
  parameter id_14 = 1;
  wire [-1 : id_12  /  1] id_15;
  wire [-1 : 1] id_16;
endmodule

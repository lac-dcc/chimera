// Seed: 119021837
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
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_16;
  wire id_17;
endmodule
module module_1 #(
    parameter id_1  = 32'd17,
    parameter id_11 = 32'd41,
    parameter id_6  = 32'd35
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout reg id_10;
  input wire id_9;
  output reg id_8;
  output wire id_7;
  inout wire _id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire _id_1;
  parameter id_11 = 1;
  wire [id_11 : !  id_1] id_12;
  parameter id_13 = id_11;
  assign id_7 = id_12;
  module_0 modCall_1 (
      id_13,
      id_2,
      id_13,
      id_9,
      id_13,
      id_13,
      id_12,
      id_5,
      id_2,
      id_12,
      id_12,
      id_12,
      id_5,
      id_2,
      id_5
  );
  initial begin : LABEL_0
    if (id_11) begin : LABEL_1
      if (-1) id_8 <= id_6;
    end else begin : LABEL_2
      if (id_11)
        if (1) id_10 <= 1 ? id_12 : id_2;
        else begin : LABEL_3
          id_8 = -1;
        end
    end
  end
  assign id_8 = id_10;
  logic [-1 : ~  id_6] id_14 = 1;
  logic id_15, id_16 = id_9;
  parameter id_17 = id_13;
  wire id_18, id_19, id_20;
endmodule

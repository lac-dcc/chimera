// Seed: 4248018091
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  assign id_2 = id_1;
  logic [-1 'b0 : -1] id_3 = id_2;
  wire id_4;
  ;
  wire id_5;
  generate
    bit id_6;
    always id_6 <= -1;
  endgenerate
endmodule
module module_1 #(
    parameter id_3 = 32'd80,
    parameter id_5 = 32'd8
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  output reg id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire _id_5;
  input wire id_4;
  inout wire _id_3;
  output wire id_2;
  input wire id_1;
  initial
    if (1) begin : LABEL_0
      id_9 <= 1;
    end
  wire id_11;
  module_0 modCall_1 (
      id_1,
      id_11
  );
  wire id_12 = id_5;
  struct packed {logic id_13;} [id_3  &  -1 : id_5] id_14;
  parameter id_15 = -1'b0;
endmodule

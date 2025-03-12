// Seed: 3415784652
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout logic [7:0] id_1;
  assign id_8 = id_1[1];
endmodule
module module_1 #(
    parameter id_4 = 32'd91
) (
    id_1,
    id_2,
    id_3,
    _id_4,
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
    id_16
);
  input wire id_16;
  input wire id_15;
  inout reg id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  inout logic [7:0] id_10;
  input wire id_9;
  output wire id_8;
  module_0 modCall_1 (
      id_10,
      id_12,
      id_3,
      id_6,
      id_9,
      id_3,
      id_7,
      id_5
  );
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire _id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_10[id_4] = -1'b0;
  always @(posedge id_13) begin : LABEL_0
    id_14 <= 1'b0;
  end
  assign id_6 = id_9;
endmodule

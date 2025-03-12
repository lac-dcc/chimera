// Seed: 1598482613
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
  output wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_16;
  always @(posedge id_1) begin : LABEL_0
    `define pp_17 0
  end
  assign id_4 = id_8;
endmodule
module module_1 #(
    parameter id_2 = 32'd59
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout logic [7:0] id_5;
  input wire id_4;
  input wire id_3;
  input wire _id_2;
  inout wire id_1;
  logic id_7, id_8;
  assign id_1 = id_3;
  always @(posedge id_3#(.id_1(-1), .id_2(1), .id_8(1 == 1 ^ 1'b0)) or posedge 1);
  assign id_5[id_2+:id_2] = 1'b0;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_8,
      id_1,
      id_7,
      id_1,
      id_7,
      id_3,
      id_1,
      id_7,
      id_1,
      id_1,
      id_8,
      id_1,
      id_8
  );
  wire id_9;
  wire id_10;
  wire [-1 : id_2] id_11;
  wire id_12;
  wire id_13;
endmodule

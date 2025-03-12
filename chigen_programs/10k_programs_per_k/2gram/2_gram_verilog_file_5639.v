// Seed: 4006530746
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
    id_13
);
  input wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  parameter id_14 = 1;
endmodule
macromodule module_1 #(
    parameter id_14 = 32'd67,
    parameter id_7  = 32'd46
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    _id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  input wire id_15;
  input wire _id_14;
  output wire id_13;
  module_0 modCall_1 (
      id_5,
      id_18,
      id_18,
      id_11,
      id_4,
      id_10,
      id_12,
      id_3,
      id_1,
      id_17,
      id_2,
      id_5,
      id_5
  );
  input wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire _id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout uwire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_19;
  wire  id_20;
  ;
  assign id_18 = id_2;
  logic [id_7  +  1 : -1] id_21;
  wire [id_14 : -1] id_22;
  assign id_3 = 1'd0 ? id_6 : -1 ? (1) : id_8#(
      .id_8 (1'h0),
      .id_22({1 & 1{1 / 1}}),
      .id_4 (-1),
      .id_4 (1)
  );
endmodule

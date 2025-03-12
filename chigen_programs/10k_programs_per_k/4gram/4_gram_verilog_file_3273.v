// Seed: 3842196018
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  localparam id_6 = -1'b0;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output reg id_1;
  parameter id_3 = 1;
  localparam id_4 = id_3;
  always @(negedge id_4) id_1 = -1'b0;
  wire id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4
  );
endmodule
module module_2 #(
    parameter id_15 = 32'd14,
    parameter id_18 = 32'd82,
    parameter id_3  = 32'd82
) (
    id_1,
    id_2,
    _id_3,
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
    _id_15,
    id_16,
    id_17,
    _id_18,
    id_19,
    id_20
);
  input wire id_20;
  input wire id_19;
  input wire _id_18;
  output wire id_17;
  input wire id_16;
  module_0 modCall_1 (
      id_1,
      id_12,
      id_14,
      id_5,
      id_17
  );
  inout wire _id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout logic [7:0] id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire _id_3;
  inout wire id_2;
  inout wire id_1;
  logic [-1 : id_18] id_21;
  initial begin : LABEL_0
    id_7#(
        .id_18(1),
        .id_12(1),
        .id_9 (1),
        .id_1 (1),
        .id_5 (-1),
        .id_3 (1),
        .id_9 (-1),
        .id_8 (-1),
        .id_13(-1)
    ) [id_15 : id_3] <= id_7;
    release id_14;
  end
  logic \id_22 ;
  ;
endmodule

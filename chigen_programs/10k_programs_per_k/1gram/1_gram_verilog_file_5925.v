// Seed: 685976927
module module_0 #(
    parameter id_7 = 32'd91
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output logic [7:0] id_3;
  output wire id_2;
  inout wire id_1;
  wire id_5;
  ;
  logic id_6;
  logic _id_7;
  parameter id_8 = -1;
  wire id_9;
  uwire [id_7 : -1] id_10;
  always @(id_9) begin : LABEL_0
    id_3[1] <= -1;
  end
  wire id_11, id_12, id_13;
  tri0 id_14;
  parameter id_15 = {id_8, -1 >>> -1'b0, -1, 1};
  wire [1 : 'b0] id_16, id_17[-1 : -1 'd0], id_18, id_19;
  initial {id_6 - id_1, id_10} <= 1;
  assign id_14 = -1;
  wire  id_20;
  logic id_21;
  assign id_10 = -1;
endmodule
module module_1 #(
    parameter id_11 = 32'd68,
    parameter id_2  = 32'd41,
    parameter id_8  = 32'd7
) (
    id_1,
    _id_2,
    id_3[id_11 : 1],
    id_4#(
        .id_5  (id_6),
        .id_7  (_id_8),
        .id_9  (id_10),
        ._id_11(id_12)
    ) [id_2+-1 : id_8],
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  input wire id_12;
  output wire _id_11;
  inout wire id_10;
  input wire id_9;
  nor primCall (id_1, id_18, id_7, id_17, id_3, id_4, id_13, id_14);
  output wire _id_8;
  inout wire id_7;
  output wire id_6;
  input wire id_5;
  input logic [7:0] id_4;
  inout logic [7:0] id_3;
  output wire _id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_7,
      id_14,
      id_3,
      id_16
  );
  assign modCall_1.id_7 = 0;
  assign id_3 = id_9;
  logic id_21 = id_17;
  tri1 [-1 : 1 'b0] id_22 = id_12 - 1;
  logic id_23;
  wor id_24 = id_18, id_25 = (id_15), id_26 = -1;
  parameter id_27 = -1;
  wire id_28 = -1;
endmodule

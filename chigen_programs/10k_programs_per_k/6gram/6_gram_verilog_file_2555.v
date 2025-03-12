// Seed: 3745271832
module module_0 #(
    parameter id_26 = 32'd5
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
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wor id_8;
  inout wire id_7;
  input wire id_6;
  inout tri0 id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire [1 'd0 : -1] id_17;
  assign id_8 = 1;
  logic [7:0] id_18, id_19, id_20, id_21, id_22, id_23, id_24, id_25, _id_26, id_27;
  assign id_14 = id_21;
  wire [1 : id_26] id_28;
  assign id_5 = "" ? id_25 + -1 : -1;
  wire  id_29;
  logic id_30 = id_15;
  assign id_26 = id_9;
  parameter id_31 = 1;
  wire id_32;
  wire id_33;
  always @(*) begin : LABEL_0
    id_19[-1] <= id_29;
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd70,
    parameter id_4 = 32'd68
) (
    id_1,
    id_2,
    _id_3,
    _id_4,
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
  output wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire _id_4;
  module_0 modCall_1 (
      id_12,
      id_7,
      id_10,
      id_9,
      id_7,
      id_10,
      id_8,
      id_8,
      id_11,
      id_6,
      id_11,
      id_8,
      id_6,
      id_9,
      id_8,
      id_9
  );
  inout wire _id_3;
  output logic [7:0] id_2;
  output wire id_1;
  wire id_14;
  assign id_7 = id_11;
  logic [id_3 : id_4] \id_15 ;
  always @(id_6 or -1) begin : LABEL_0
    id_2[1'h0] = id_11;
  end
endmodule

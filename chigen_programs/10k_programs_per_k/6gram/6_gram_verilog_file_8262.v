// Seed: 911531355
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
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  output wire id_19;
  inout wire id_18;
  output tri id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wand id_2;
  inout wire id_1;
  assign id_2  = 1;
  assign id_17 = 1 & -1;
  parameter id_20 = -1;
  bit id_21;
  logic id_22;
  wire [-1 'b0 : -1] id_23;
  wire [1 : 1 'b0 +  -1 'b0 &  -1] id_24;
  wire id_25;
  parameter id_26 = -1 == -1;
  always @(*) begin : LABEL_0
    id_21 <= id_8;
  end
  wire id_27;
  assign id_21 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd95,
    parameter id_5 = 32'd80
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6,
    id_7
);
  input wire id_7;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_3,
      id_2,
      id_7,
      id_6,
      id_4,
      id_6,
      id_4,
      id_6,
      id_2,
      id_6,
      id_2,
      id_6,
      id_6,
      id_2
  );
  assign modCall_1.id_17 = 0;
  inout wire id_6;
  input wire _id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire _id_1;
  parameter id_8 = 1;
  logic [id_5 : id_1] id_9;
  assign id_6 = id_5;
endmodule

// Seed: 695871908
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
    id_18
);
  output wire id_18;
  input wire id_17;
  output wire id_16;
  inout wire id_15;
  inout wire id_14;
  output wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  logic id_19;
endmodule
module module_1 #(
    parameter id_1 = 32'd70,
    parameter id_7 = 32'd13,
    parameter id_8 = 32'd26,
    parameter id_9 = 32'd91
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    _id_8,
    _id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  inout logic [7:0] id_12;
  inout wire id_11;
  module_0 modCall_1 (
      id_13,
      id_11,
      id_11,
      id_13,
      id_13,
      id_13,
      id_13,
      id_11,
      id_13,
      id_11,
      id_11,
      id_13,
      id_10,
      id_11,
      id_13,
      id_10,
      id_11,
      id_6
  );
  output wire id_10;
  inout wire _id_9;
  inout wire _id_8;
  input wire _id_7;
  output wire id_6;
  output logic [7:0] id_5;
  output uwire id_4;
  output logic [7:0] id_3;
  output reg id_2;
  input wire _id_1;
  assign id_12 = id_7;
  assign id_12[1] = id_1;
  assign id_4 = -1;
  wire  [1 : id_7] id_14;
  logic [1 : id_1] id_15;
  assign id_13 = -1'h0;
  assign id_3[-1] = id_1;
  wire id_16;
  generate
    always @(posedge id_8) begin : LABEL_0
      id_2 <= -1 == -1;
    end
    assign id_5[id_8] = -1;
  endgenerate
  logic [1 'h0 : id_9] id_17, id_18;
endmodule

// Seed: 2448297289
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output logic [7:0] id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
  assign id_7 = (id_6) ? id_1 : id_2;
  logic id_8;
  ;
  assign id_4[1] = "";
endmodule
module module_1 #(
    parameter id_8 = 32'd16
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
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
    id_19,
    id_20,
    id_21,
    id_22
);
  inout reg id_22;
  inout wire id_21;
  output wire id_20;
  output wire id_19;
  inout wire id_18;
  inout wire id_17;
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire _id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output logic [7:0] id_1;
  wire [1 : ""] id_23;
  logic id_24;
  module_0 modCall_1 (
      id_21,
      id_11,
      id_2,
      id_1,
      id_24,
      id_13
  );
  localparam ["" : 1 'd0] id_25 = -1'b0;
  assign id_23 = id_13;
  assign id_1[(id_8)] = id_8;
  always @(*) begin : LABEL_0
    id_22 = -1;
  end
endmodule

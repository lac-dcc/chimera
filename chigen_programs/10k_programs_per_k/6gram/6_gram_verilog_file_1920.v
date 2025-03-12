// Seed: 508836047
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
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_16;
endmodule
module module_1 #(
    parameter id_12 = 32'd32,
    parameter id_20 = 32'd36,
    parameter id_23 = 32'd94,
    parameter id_4  = 32'd49
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
    _id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    _id_20,
    id_21,
    id_22,
    _id_23
);
  inout wire _id_23;
  output wire id_22;
  output wire id_21;
  input wire _id_20;
  input wire id_19;
  input wire id_18;
  input wire id_17;
  inout wire id_16;
  inout reg id_15;
  output wire id_14;
  inout wire id_13;
  input wire _id_12;
  output wire id_11;
  input wire id_10;
  output logic [7:0] id_9;
  output reg id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  module_0 modCall_1 (
      id_1,
      id_11,
      id_6,
      id_5,
      id_1,
      id_22,
      id_6,
      id_16,
      id_17,
      id_1,
      id_16,
      id_21,
      id_2,
      id_6,
      id_13
  );
  inout wire _id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  logic [7:0][id_20  -  id_4 : -1] id_24;
  generate
    for (id_25 = -1'b0 == 1; -1; id_8 = id_24) begin : LABEL_0
      always @((id_20) or id_24) id_15 = ~id_5;
    end
  endgenerate
  assign id_9[id_12 : ""] = -1;
  assign id_24[1&id_23]   = 1'b0 * 1'b0 - -1;
endmodule

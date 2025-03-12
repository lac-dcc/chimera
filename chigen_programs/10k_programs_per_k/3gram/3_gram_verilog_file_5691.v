// Seed: 1512070971
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
    id_19,
    id_20,
    id_21
);
  output wire id_21;
  output wire id_20;
  output wire id_19;
  input wire id_18;
  output wire id_17;
  output wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_22;
  parameter id_23 = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd40
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
    id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_19;
  output wire id_18;
  input wire id_17;
  input wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout reg id_6;
  inout wire id_5;
  module_0 modCall_1 (
      id_7,
      id_19,
      id_8,
      id_19,
      id_19,
      id_14,
      id_2,
      id_7,
      id_12,
      id_18,
      id_5,
      id_16,
      id_8,
      id_13,
      id_1,
      id_12,
      id_2,
      id_11,
      id_8,
      id_13,
      id_9
  );
  input wire _id_4;
  inout logic [7:0] id_3;
  inout wire id_2;
  output wire id_1;
  wire id_20;
  ;
  tri1 id_21 = 1;
  always @(posedge 1 or id_16) begin : LABEL_0
    id_6 = id_3[1'b0 : id_4||1'h0];
  end
endmodule

// Seed: 2973964265
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(~id_2) begin : LABEL_0
    {1, 1} <= 1;
  end
  reg id_4;
  always @(posedge id_2) begin : LABEL_0
    id_4 <= 1 == id_2;
  end
endmodule
module module_1 #(
    parameter id_20 = 32'd88,
    parameter id_21 = 32'd84,
    parameter id_22 = 32'd3,
    parameter id_23 = 32'd51,
    parameter id_24 = 32'd54,
    parameter id_25 = 32'd99,
    parameter id_26 = 32'd32,
    parameter id_27 = 32'd60,
    parameter id_28 = 32'd76,
    parameter id_29 = 32'd68,
    parameter id_30 = 32'd39,
    parameter id_31 = 32'd12
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
    id_16,
    id_17
);
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_18;
  wire id_19 = id_11;
  xnor primCall (
      id_1,
      id_11,
      id_24,
      id_23,
      id_29,
      id_26,
      id_28,
      id_15,
      id_31,
      id_20,
      id_10,
      id_4,
      id_17,
      id_19,
      id_22,
      id_27,
      id_30,
      id_25,
      id_13
  );
  assign id_11 = id_19;
  defparam id_20.id_21 = id_15, id_22.id_23 = 1, id_24.id_25 = 1, id_26.id_27 = 1'b0 - 1,
      id_28.id_29 = id_15, id_30.id_31 = 1;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_18
  );
endmodule

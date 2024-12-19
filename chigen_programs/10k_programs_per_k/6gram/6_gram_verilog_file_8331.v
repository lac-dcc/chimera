// Seed: 3317233169
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
    id_17
);
  output wire id_17;
  input wire id_16;
  input wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_10 = id_10;
  always @(posedge 1 or posedge 1) begin : LABEL_0
    assume (id_4);
  end
endmodule
module module_1 #(
    parameter id_18 = 32'd37,
    parameter id_19 = 32'd33,
    parameter id_20 = 32'd84,
    parameter id_21 = 32'd17,
    parameter id_22 = 32'd12,
    parameter id_23 = 32'd31,
    parameter id_24 = 32'd17,
    parameter id_25 = 32'd9,
    parameter id_26 = 32'd65,
    parameter id_27 = 32'd56,
    parameter id_28 = 32'd8,
    parameter id_29 = 32'd69
) (
    id_1,
    id_2,
    id_3,
    .id_15(id_4),
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  tri1 id_16, id_17;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_14,
      id_17,
      id_16,
      id_4,
      id_8,
      id_13,
      id_17,
      id_16,
      id_17,
      id_16,
      id_11,
      id_1,
      id_7,
      id_13,
      id_2
  );
  defparam id_18.id_19 = 1'b0 & 1 & 1 & id_16 & {!id_7, id_4}, id_20.id_21 = (id_10),
      id_22.id_23 = id_3, id_24.id_25 = !1, id_26.id_27 = !id_1, id_28.id_29 = 1;
endmodule

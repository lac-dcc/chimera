// Seed: 2665930330
`timescale 1ps / 1ps
module module_0 #(
    parameter id_12 = 32'd70,
    parameter id_13 = 32'd13,
    parameter id_7  = 32'd26,
    parameter id_9  = 32'd91
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    _id_9,
    id_10,
    id_11,
    _id_12,
    _id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  output id_17;
  output id_16;
  input id_15;
  input id_14;
  output _id_13;
  input _id_12;
  output id_11;
  input id_10;
  input _id_9;
  output id_8;
  output _id_7;
  input id_6;
  input id_5;
  input id_4;
  input id_3;
  output id_2;
  input id_1;
  assign id_4 = 1;
  type_21(
      1, ~id_11, 1'b0
  );
  assign id_3 = 1;
  assign id_16[id_9] = 1 ? id_15 : id_12;
  assign id_3[id_12] = 1 ? 1 : id_9[id_13];
  logic id_18;
  type_23 id_20 (
      .id_0(id_2 - 1),
      .id_1(id_11),
      .id_2(1),
      .id_3(id_13),
      .id_4(id_7),
      .id_5(id_4),
      .id_6(id_9),
      .id_7(1)
  );
  assign id_18 = 1;
  type_24(
      id_11[1-id_7], id_19, (1)
  );
  always @(negedge id_1) begin
    id_16 <= id_3;
  end
  rnmos #(id_2, 1) (1, id_16, id_5);
endmodule

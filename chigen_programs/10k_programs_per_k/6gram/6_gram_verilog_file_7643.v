// Seed: 533253000
module module_0 #(
    parameter id_13 = 32'd16,
    parameter id_14 = 32'd83,
    parameter id_15 = 32'd77,
    parameter id_17 = 32'd87
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
    _id_13,
    _id_14,
    _id_15,
    id_16
);
  input wire id_16;
  input wire _id_15;
  input wire _id_14;
  input wire _id_13;
  output logic [7:0] id_12;
  input wire id_11;
  input wire id_10;
  output tri id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout logic [7:0] id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_12[id_15] = -1'b0;
  wire _id_17;
  assign id_5[id_17] = id_7#(
      .id_11(1'd0),
      .id_10(-1 < 1),
      .id_5 (-1 == 1)
  ) ? id_16 : {id_16 ? id_7 - id_1 : 1'b0} != -1 ? 1 : {id_6, 1'h0};
  wire id_18;
  assign id_12[{id_13{id_14}}] = id_16;
  assign id_9 = ~id_10 ? id_13 : 1;
  integer id_19;
endmodule
module module_1 #(
    parameter id_3 = 32'd2
) (
    id_1,
    id_2,
    _id_3
);
  inout wire _id_3;
  output wire id_2;
  inout logic [7:0] id_1;
  assign id_2 = id_1[-1];
  wire id_4;
  ;
  wire [id_3 : 1] id_5;
  assign id_3 = id_3;
  assign id_5 = id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_1,
      id_4,
      id_4,
      id_5,
      id_4,
      id_5,
      id_5,
      id_1,
      id_3,
      id_3,
      id_3,
      id_5
  );
endmodule

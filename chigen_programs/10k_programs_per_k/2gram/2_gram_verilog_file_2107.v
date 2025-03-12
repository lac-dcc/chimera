// Seed: 1927028052
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  inout reg id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always_comb id_4 <= -1 - id_4;
  logic id_9;
  assign id_3 = 1'b0;
  wire id_10;
endmodule
module module_1 #(
    parameter id_23 = 32'd71,
    parameter id_25 = 32'd36,
    parameter id_28 = 32'd60,
    parameter id_4  = 32'd86,
    parameter id_6  = 32'd76
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14#(
        .id_15(-1),
        .id_16(1'b0),
        .id_17(-1),
        .id_18(-1),
        .id_19(id_20)
    ),
    id_21,
    id_22,
    _id_23,
    id_24,
    _id_25,
    id_26,
    id_27,
    _id_28,
    id_29,
    id_30,
    id_31,
    id_32,
    id_33
);
  inout wire id_27;
  inout wire id_26;
  output wire _id_25;
  output wire id_24;
  inout wire _id_23;
  inout wire id_22;
  output wire id_21;
  output wire id_20;
  output wire id_19;
  inout wire id_18;
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input logic [7:0] id_10;
  input wire id_9;
  input wire id_8;
  output wire id_7;
  inout wire _id_6;
  inout wire id_5;
  inout wire _id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  tri id_34 = id_10[id_28] - id_6;
  module_0 modCall_1 (
      id_32,
      id_3,
      id_3,
      id_30,
      id_5,
      id_27,
      id_32,
      id_22
  );
  initial id_30 = 1 & 1;
  struct packed {
    logic [id_25 : 1] id_35;
    logic [id_23 : 1] id_36;
    logic id_37;
    struct packed {
      struct packed {
        logic id_38;
        logic [id_4 : id_6] id_39;
        logic id_40;
      } id_41;
    } [1 : -1 'b0] id_42;
    id_43 id_44;
  } id_45;
endmodule

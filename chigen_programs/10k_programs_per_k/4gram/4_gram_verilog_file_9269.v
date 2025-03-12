// Seed: 2596587524
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_14 = 32'd51,
    parameter id_15 = 32'd97,
    parameter id_17 = 32'd32,
    parameter id_23 = 32'd34,
    parameter id_26 = 32'd81,
    parameter id_3  = 32'd6
) (
    id_1,
    id_2,
    _id_3,
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
    _id_14,
    _id_15,
    id_16,
    _id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    _id_23,
    id_24,
    id_25
);
  input wire id_25;
  inout wire id_24;
  input wire _id_23;
  output wire id_22;
  output wire id_21;
  output wire id_20;
  input wire id_19;
  inout logic [7:0] id_18;
  input wire _id_17;
  inout logic [7:0] id_16;
  input wire _id_15;
  inout wire _id_14;
  inout wire id_13;
  output wire id_12;
  input wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output logic [7:0] id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire _id_3;
  inout tri id_2;
  inout wire id_1;
  logic _id_26[$realtime : -1];
  ;
  logic [7:0][id_14 : 1] id_27, id_28;
  assign (pull1, weak0) id_27[id_15-:id_17] = id_18[id_3+:id_26];
  assign id_7[-1'b0] = 1;
  logic id_29;
  assign id_24 = id_15;
  logic id_30;
  initial begin : LABEL_0
    id_16[-1&id_23 : id_14] = -1'b0;
  end
  module_0 modCall_1 (
      id_24,
      id_21
  );
  assign id_2 = 1;
endmodule

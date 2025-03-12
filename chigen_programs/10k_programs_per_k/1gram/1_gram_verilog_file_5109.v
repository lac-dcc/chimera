// Seed: 2507104330
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
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_9;
endmodule
module module_1 #(
    parameter id_1  = 32'd99,
    parameter id_10 = 32'd69,
    parameter id_28 = 32'd33,
    parameter id_4  = 32'd17,
    parameter id_8  = 32'd87
) (
    _id_1,
    id_2,
    id_3[-1 :-1],
    _id_4,
    id_5,
    id_6,
    id_7,
    _id_8,
    id_9,
    _id_10,
    id_11,
    id_12,
    id_13,
    id_14[-1 : ""],
    id_15,
    id_16,
    id_17,
    id_18[1 : id_4],
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    id_26,
    id_27
);
  output wire id_27;
  inout wire id_26;
  output wire id_25;
  inout wire id_24;
  inout wire id_23;
  output logic [7:0] id_22;
  input wire id_21;
  output wire id_20;
  output wire id_19;
  output logic [7:0] id_18;
  input wire id_17;
  output wire id_16;
  input wire id_15;
  output logic [7:0] id_14;
  input wire id_13;
  output logic [7:0] id_12;
  inout wire id_11;
  inout wire _id_10;
  input wire id_9;
  inout wire _id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  inout wire _id_4;
  module_0 modCall_1 (
      id_23,
      id_25,
      id_16,
      id_13,
      id_26,
      id_11,
      id_16,
      id_6
  );
  output logic [7:0] id_3;
  inout reg id_2;
  input wire _id_1;
  always id_2 = #1 id_1;
  assign id_22[-1'b0][-1] = 1;
  logic _id_28;
  ;
  parameter id_29 = 1;
  assign id_12[id_1&1'h0][id_28#(.id_10(1)) : id_8] = id_10;
endmodule

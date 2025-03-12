// Seed: 3256115559
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
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input logic [7:0] id_1;
  assign id_14 = id_1[-1'b0 :-1'b0];
endmodule
module module_1 #(
    parameter id_12 = 32'd43,
    parameter id_2  = 32'd4,
    parameter id_26 = 32'd56
) (
    id_1,
    _id_2,
    id_3,
    id_4,
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
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25,
    _id_26
);
  input wire _id_26;
  input wire id_25;
  output wire id_24;
  input logic [7:0] id_23;
  input wire id_22;
  output wire id_21;
  output wire id_20;
  inout logic [7:0] id_19;
  input wire id_18;
  inout wire id_17;
  output wire id_16;
  module_0 modCall_1 (
      id_23,
      id_6,
      id_15,
      id_6,
      id_3,
      id_1,
      id_15,
      id_13,
      id_6,
      id_6,
      id_16,
      id_8,
      id_7,
      id_8,
      id_6
  );
  inout wire id_15;
  output wire id_14;
  input wire id_13;
  output wire _id_12;
  input wire id_11;
  output wire id_10;
  output logic [7:0] id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire _id_2;
  inout wire id_1;
  localparam id_27 = 1, id_28 = 1;
  assign id_9[1-:1'b0] = id_23[id_26];
  assign id_19[1] = -1;
  wire [id_12 : id_2] id_29;
endmodule

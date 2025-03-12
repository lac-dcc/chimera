// Seed: 765968167
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
    id_18
);
  output wire id_18;
  inout wire id_17;
  output wire id_16;
  input wire id_15;
  output wire id_14;
  input wire id_13;
  output wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  initial $clog2(53);
  ;
endmodule
module module_1 #(
    parameter id_15 = 32'd61,
    parameter id_20 = 32'd42,
    parameter id_6  = 32'd60
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    _id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    _id_20
);
  inout wire _id_20;
  output wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  module_0 modCall_1 (
      id_2,
      id_12,
      id_2,
      id_18,
      id_10,
      id_16,
      id_8,
      id_13,
      id_18,
      id_7,
      id_18,
      id_9,
      id_11,
      id_13,
      id_10,
      id_13,
      id_2,
      id_7
  );
  inout wire _id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire _id_6;
  input wire id_5;
  output logic [7:0] id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_18 = (id_20);
  logic [7:0][1 : id_20] id_21;
  parameter id_22 = 1;
  assign id_15 = id_1;
  wire id_23 = id_21[id_15];
  wire id_24;
  wire [id_6 : id_20] id_25;
  assign id_4[-1] = 1'b0;
  wire id_26;
endmodule

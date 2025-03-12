// Seed: 704146484
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
endmodule
module module_1 #(
    parameter id_18 = 32'd90,
    parameter id_2  = 32'd99,
    parameter id_21 = 32'd72,
    parameter id_7  = 32'd25
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
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
    _id_18,
    id_19,
    id_20,
    _id_21,
    id_22,
    id_23,
    id_24,
    id_25
);
  inout wire id_25;
  inout logic [7:0] id_24;
  inout wire id_23;
  inout wire id_22;
  input wire _id_21;
  output wire id_20;
  inout wire id_19;
  input wire _id_18;
  output wire id_17;
  input wire id_16;
  inout wire id_15;
  input wire id_14;
  inout wire id_13;
  inout wire id_12;
  input wire id_11;
  inout logic [7:0] id_10;
  input wire id_9;
  input logic [7:0] id_8;
  input wire _id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire _id_2;
  output wire id_1;
  wire id_26;
  module_0 modCall_1 (
      id_23,
      id_11,
      id_23,
      id_22,
      id_15
  );
  assign id_24[id_2] = id_8[id_7];
  wire id_27;
  ;
  wire [id_18 : id_21] id_28, id_29;
  xor primCall (
      id_15,
      id_12,
      id_4,
      id_5,
      id_19,
      id_24,
      id_22,
      id_13,
      id_23,
      id_26,
      id_14,
      id_3,
      id_25,
      id_6,
      id_10,
      id_16,
      id_11,
      id_8
  );
  assign id_26 = id_19;
  logic id_30;
  assign id_10[-1'b0*1] = 1;
endmodule

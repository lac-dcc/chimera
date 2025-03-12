// Seed: 2578677412
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
    id_12
);
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  struct packed {logic id_13;} id_14;
endmodule
module module_1 #(
    parameter id_15 = 32'd84,
    parameter id_7  = 32'd58
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5[id_7 : id_15],
    id_6,
    _id_7,
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
    id_20,
    id_21,
    id_22
);
  inout wire id_22;
  output wire id_21;
  inout wire id_20;
  output wire id_19;
  module_0 modCall_1 (
      id_4,
      id_12,
      id_12,
      id_9,
      id_11,
      id_21,
      id_14,
      id_9,
      id_9,
      id_9,
      id_16,
      id_2
  );
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  input wire _id_15;
  input wire id_14;
  output wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire _id_7;
  input wire id_6;
  input logic [7:0] id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  or primCall (id_2, id_12, id_18, id_14, id_16, id_20, id_5, id_6, id_9, id_22, id_11);
  assign id_19 = -1'h0;
  logic id_23 = id_22, id_24;
endmodule

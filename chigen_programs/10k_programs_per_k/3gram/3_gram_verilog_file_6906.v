// Seed: 3110471995
module module_0 #(
    parameter id_4 = 32'd66
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  output wire _id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  logic [1 : id_4] id_5;
endmodule
module module_1 #(
    parameter id_13 = 32'd88,
    parameter id_17 = 32'd61
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
    id_14,
    id_15,
    id_16
);
  input wire id_16;
  input wire id_15;
  inout wire id_14;
  input wire _id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  or primCall (
      id_5, id_18, id_14, id_10, id_12, id_8, id_3, id_15, id_7, id_17, id_16, id_6, id_9, id_11
  );
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output logic [7:0] id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  parameter id_17 = -1'b0, id_18 = id_16;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_2,
      id_18
  );
  assign id_4[-1&id_13 : 1] = -1'b0;
  wire [id_17 : -1] id_19;
endmodule

// Seed: 676850212
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
    id_13
);
  input wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_14;
  wire id_15;
  localparam id_16 = 1;
  localparam id_17 = id_16;
endmodule
module module_1 #(
    parameter id_3 = 32'd66
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
    id_12
);
  output wire id_12;
  input wire id_11;
  input wire id_10;
  inout wand id_9;
  output logic [7:0] id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  output wire id_4;
  input wire _id_3;
  output wire id_2;
  inout wire id_1;
  wire id_13;
  assign id_8[id_3%1'b0!==-1] = id_11;
  wire id_14;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_10,
      id_13,
      id_12,
      id_13,
      id_7,
      id_13,
      id_6,
      id_9,
      id_10,
      id_1,
      id_14
  );
  assign id_9 = (-1'd0) - id_1;
endmodule

// Seed: 3502024353
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
    id_17
);
  output wire id_17;
  output wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  input wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wand id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_6 = id_5 && !id_2;
endmodule
module module_1 #(
    parameter id_17 = 32'd21,
    parameter id_2  = 32'd9
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
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    _id_17
);
  input wire _id_17;
  output wire id_16;
  output wire id_15;
  input logic [7:0] id_14;
  output wire id_13;
  output wire id_12;
  inout logic [7:0] id_11;
  output logic [7:0] id_10;
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  input wire _id_2;
  inout wire id_1;
  always #(-1'b0) id_10[-1'h0] = id_14[id_17 : id_2];
  logic id_18;
  wire  id_19;
  wire  id_20;
  assign id_18 = 1;
  logic id_21 = id_2 | id_14;
  module_0 modCall_1 (
      id_1,
      id_20,
      id_6,
      id_9,
      id_1,
      id_21,
      id_4,
      id_9,
      id_21,
      id_3,
      id_9,
      id_19,
      id_20,
      id_9,
      id_1,
      id_9,
      id_18
  );
  assign id_11[id_2 : 1'b0] = id_4;
endmodule

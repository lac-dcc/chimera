// Seed: 446753384
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
  inout wire id_16;
  output wire id_15;
  output wire id_14;
  inout wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_19;
endmodule
module module_1 #(
    parameter id_13 = 32'd9,
    parameter id_2  = 32'd48
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
    id_10
);
  output wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_9,
      id_4,
      id_4,
      id_7,
      id_3,
      id_1,
      id_3,
      id_6,
      id_1,
      id_3,
      id_10,
      id_4,
      id_3,
      id_3,
      id_5
  );
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout supply0 id_3;
  inout wire _id_2;
  input wire id_1;
  wire  id_11;
  logic id_12;
  wire  _id_13;
  assign id_9 = 1;
  wire [id_2 : 1] id_14;
  parameter id_15 = -1;
  wire id_16;
  initial @(id_13 - id_11) assign id_12[1 :-1] = 1;
  assign id_12[id_13+:-1] = -1;
  logic id_17;
endmodule

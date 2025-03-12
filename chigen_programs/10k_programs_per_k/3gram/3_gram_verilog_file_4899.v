// Seed: 477268399
module module_0 (
    output tri1 id_0,
    output wand id_1,
    output tri  id_2,
    input  wire id_3
);
  wire id_5;
  wire id_6;
endmodule
module module_1 #(
    parameter id_0 = 32'd73
) (
    input tri1 _id_0,
    output tri1 id_1,
    output tri1 id_2,
    input wand id_3,
    output tri0 id_4,
    input supply1 id_5,
    input supply0 id_6,
    output wire id_7
);
  wire [id_0 : -1] id_9;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_7,
      id_6
  );
endmodule
module module_2 (
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
    id_18,
    id_19
);
  inout wire id_19;
  output wire id_18;
  input wire id_17;
  input wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  input wire id_12;
  assign module_3.id_12 = 0;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_20;
  assign id_11 = id_9;
endmodule
module module_3 #(
    parameter id_10 = 32'd68,
    parameter id_12 = 32'd91,
    parameter id_9  = 32'd20
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    _id_10,
    id_11,
    _id_12,
    id_13
);
  inout wire id_13;
  inout wire _id_12;
  module_2 modCall_1 (
      id_13,
      id_5,
      id_4,
      id_8,
      id_4,
      id_5,
      id_13,
      id_13,
      id_13,
      id_8,
      id_1,
      id_4,
      id_5,
      id_13,
      id_8,
      id_3,
      id_5,
      id_5,
      id_5
  );
  output logic [7:0] id_11;
  input wire _id_10;
  input wire _id_9;
  output wire id_8;
  output logic [7:0] id_7;
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  assign id_6 = id_9;
  parameter id_14 = 1;
  assign id_2[id_10 : id_12] = -1;
  parameter id_15 = id_14;
  wire  id_16;
  logic id_17 = id_5;
  assign id_11[id_9] = id_17;
  generate
    logic id_18;
    ;
  endgenerate
  assign id_7[1] = id_10;
endmodule

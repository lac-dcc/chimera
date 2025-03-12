// Seed: 550261593
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
    id_14
);
  output wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  assign module_1.id_8 = 0;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_15;
endmodule
module module_1 (
    inout  logic id_0,
    output logic id_1,
    input  tri0  id_2,
    input  tri   id_3,
    input  uwire id_4,
    input  tri0  id_5,
    input  wor   id_6,
    output wand  id_7,
    input  wire  id_8,
    input  uwire id_9,
    input  tri1  id_10
);
  wire id_12;
  wire id_13;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_13,
      id_13,
      id_12,
      id_13,
      id_12,
      id_13,
      id_12,
      id_12,
      id_12,
      id_13,
      id_13,
      id_12
  );
  logic id_14;
  localparam id_15 = 1;
  initial begin : LABEL_0
    id_0 <= 1 - id_5;
  end
  always @* id_14 = id_2;
  final begin : LABEL_1
    id_1 <= -1;
  end
endmodule

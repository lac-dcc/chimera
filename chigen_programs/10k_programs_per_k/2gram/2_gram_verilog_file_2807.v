// Seed: 1934367199
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
    id_10
);
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_11 = id_9;
endmodule
module module_1 (
    output logic id_0,
    output logic id_1
    , id_4,
    input  logic id_2
);
  logic id_5;
  assign id_0 = id_2;
  assign id_5 = 1'b0;
  always_ff #1 id_0 <= 1;
  wire id_6;
  reg  id_7;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_6,
      id_4,
      id_6,
      id_4,
      id_6,
      id_6,
      id_6,
      id_6
  );
  wire id_8;
  final begin : LABEL_0
    id_4 = 1;
    #1 id_7 <= id_2;
    id_0 = id_5;
    id_7 = -1;
  end
  wire id_9;
  assign id_7 = id_7;
  wire id_10;
  wire id_11;
  wire id_12 = id_12;
  wire id_13;
endmodule

// Seed: 4143487096
module module_0 (
    output logic id_0,
    input  logic id_1,
    input  uwire id_2,
    input  logic id_3,
    input  uwire id_4,
    input  wire  id_5
);
  wire id_7;
  always if (id_3) id_0 <= id_1;
  parameter id_8 = 1;
  wand id_9;
  tri0 id_10;
  wor  id_11;
  assign id_9 = id_4;
  wire id_12;
  always id_0 <= id_3;
  assign id_11 = 1;
  wand id_13 = 1, id_14, id_15 = -1'b0;
  assign id_14 = id_13;
  wire id_16;
  assign module_1.id_2 = 0;
  assign id_10 = id_2;
endmodule
module module_1 (
    input  supply0 id_0,
    input  logic   id_1,
    output logic   id_2
);
  wire id_4;
  assign id_2 = 1 | -1;
  final id_2 <= id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0
  );
endmodule

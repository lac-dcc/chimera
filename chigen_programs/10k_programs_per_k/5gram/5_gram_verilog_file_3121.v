// Seed: 729039656
module module_0 (
    output wand id_0,
    input uwire id_1,
    input tri1 id_2,
    input supply0 id_3,
    output logic id_4,
    input wire id_5,
    output wor id_6,
    output wor id_7,
    output logic id_8,
    input tri1 id_9
);
  final begin : LABEL_0
    id_8 <= id_5;
    id_4 = "";
  end
  assign module_1.id_11 = 0;
  wire id_11;
  timeprecision 1ps;
endmodule
module module_1 #(
    parameter id_0  = 32'd81,
    parameter id_13 = 32'd20
) (
    input  wor   _id_0,
    input  wire  id_1,
    input  tri0  id_2,
    input  tri   id_3,
    output wire  id_4,
    input  uwire id_5,
    input  tri0  id_6,
    output wand  id_7,
    output wire  id_8,
    output logic id_9,
    input  uwire id_10,
    input  wand  id_11,
    input  wand  id_12,
    input  tri1  _id_13,
    output uwire id_14
);
  always #1 begin : LABEL_0
    id_9 <= 1;
  end
  wire id_16, id_17;
  wire [id_13 : id_0] id_18;
  module_0 modCall_1 (
      id_14,
      id_11,
      id_2,
      id_5,
      id_9,
      id_3,
      id_8,
      id_4,
      id_9,
      id_12
  );
endmodule

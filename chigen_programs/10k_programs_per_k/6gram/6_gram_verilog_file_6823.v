// Seed: 3246163457
module module_0 (
    output tri0 id_0,
    input  tri  id_1,
    output wand id_2
);
  assign id_0 = id_1;
  assign {1, 1, 1} = 1 - id_1;
  assign id_2 = 1;
  assign module_1.type_15 = 0;
  wire id_4;
endmodule
module module_1 (
    input  wire  id_0,
    output tri0  id_1,
    output tri0  id_2,
    input  uwire id_3,
    input  tri1  id_4,
    input  uwire id_5,
    input  wire  id_6,
    output logic id_7,
    input  uwire id_8,
    input  uwire id_9,
    input  logic id_10,
    output wor   id_11
);
  assign id_2 = 1'b0;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_2
  );
  tri0 id_13 = id_9;
  always @(1'b0 or posedge (id_5)) if (id_8) id_7 <= id_10;
  id_14(
      id_6
  );
endmodule

// Seed: 3150668571
module module_0 (
    output tri   id_0,
    output wire  id_1,
    input  uwire id_2,
    input  wand  id_3,
    input  wire  id_4,
    input  tri1  id_5,
    input  tri0  id_6,
    output wire  id_7,
    input  tri   id_8,
    output wor   id_9
);
  wire id_11;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input  wor  id_1
);
  wire id_3;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0
  );
endmodule
module module_2 (
    input logic id_0,
    output logic id_1,
    input supply0 id_2,
    output wand id_3
);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_3
  );
  assign modCall_1.type_8 = 0;
  wire id_5;
  id_6(
      .id_0(-1 - id_1)
  );
  always #1 id_1 <= id_0;
  assign id_3 = (1);
endmodule

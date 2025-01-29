// Seed: 1009377392
module module_0 (
    output wire  id_0,
    input  tri0  id_1,
    output tri   id_2,
    input  uwire id_3,
    input  wor   id_4,
    output tri0  id_5,
    output wand  id_6,
    output wire  id_7,
    output wire  id_8
);
  wire id_10;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    input wire id_2,
    input tri1 id_3,
    output uwire id_4,
    id_14,
    input tri1 id_5,
    output tri id_6,
    output supply1 id_7,
    input supply1 id_8,
    output wand id_9,
    input uwire id_10,
    input uwire id_11,
    inout wire id_12
);
  wire id_15;
  parameter id_16 = 'b0;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_12,
      id_5,
      id_1,
      id_7,
      id_4,
      id_4,
      id_12
  );
  assign id_6 = -1 & id_5 | id_8;
  assign id_4 = id_12;
  final $display(-1);
  id_17(
      id_6
  );
endmodule

// Seed: 503616038
macromodule module_0 (
    input  wand  id_0,
    input  tri0  id_1,
    input  uwire id_2,
    output wand  id_3,
    input  tri   id_4,
    input  tri0  id_5
);
  rtran (.id_0(-1), .id_1(id_2 < 1), .id_2(1), .id_3(id_1), .id_4(id_5), .id_5(id_1), .id_6(1'h0));
  parameter id_7 = 1;
  always assign id_3[-1 : 1] = ~1'b0;
  assign id_3 = (id_2);
  assign id_3 = -1;
  assign id_3 = 1;
  wire id_8, id_9;
endmodule
module module_1 (
    output wand id_0,
    output wire id_1,
    input  tri1 id_2,
    output tri  id_3,
    output tri  id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2
  );
  wire id_7, id_8 = id_8;
endmodule

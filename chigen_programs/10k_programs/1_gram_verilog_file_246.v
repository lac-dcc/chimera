// Seed: 1787057336
module module_0 (
    input  tri0 id_0,
    input  tri  id_1,
    input  wor  id_2,
    output tri  id_3,
    input  wand id_4
);
  wire id_6;
  initial assign id_6 = 1'b0;
  assign id_3 = id_4;
  wire id_7;
  wire id_8;
  wire id_9;
  wire id_10;
  assign id_3 = 1;
endmodule
module module_1 (
    input  tri0  id_0,
    input  wand  id_1,
    input  tri1  id_2,
    output wand  id_3,
    output tri   id_4,
    output wire  id_5,
    output uwire id_6
);
  assign id_6 = id_0;
  xnor (id_5, id_2, id_1, id_0);
  module_0(
      id_0, id_1, id_0, id_3, id_2
  );
endmodule

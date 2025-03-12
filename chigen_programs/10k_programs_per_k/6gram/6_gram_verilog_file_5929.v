// Seed: 1990388088
module module_0 (
    input  tri0  id_0,
    input  tri1  id_1,
    input  tri0  id_2,
    input  uwire id_3,
    input  wire  id_4,
    output tri0  id_5,
    input  uwire id_6,
    input  tri0  id_7,
    output uwire id_8,
    output wire  id_9
);
  assign id_9 = id_4;
  assign module_1.id_6 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1,
    input wand id_2,
    input wor id_3,
    output supply0 id_4,
    input wand id_5,
    output uwire id_6,
    output wand id_7,
    input supply0 id_8,
    output wire id_9,
    output tri0 id_10,
    output wire id_11
);
  assign id_7 = id_0;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_8,
      id_5,
      id_1,
      id_11,
      id_5,
      id_3,
      id_11,
      id_7
  );
  assign id_9 = -id_3;
  assign id_9 = -1'h0;
endmodule

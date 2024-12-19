// Seed: 306069184
module module_0 (
    input tri id_0,
    input wor id_1,
    input tri1 id_2,
    output supply1 id_3,
    input supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    output tri id_7,
    input wand id_8
);
  logic [7:0] id_10;
  assign id_3 = id_6;
  assign id_10[(1)+:1] = id_2;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input  uwire id_0,
    input  wor   id_1,
    inout  wor   id_2,
    input  uwire id_3,
    output tri   id_4,
    input  wand  id_5,
    input  wire  id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_2,
      id_6,
      id_6,
      id_5,
      id_2,
      id_3
  );
endmodule

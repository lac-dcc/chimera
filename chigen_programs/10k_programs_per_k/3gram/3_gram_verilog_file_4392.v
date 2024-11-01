// Seed: 4197778174
module module_0 (
    input tri id_0,
    input wor id_1,
    input supply0 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input supply0 id_5,
    input tri1 id_6,
    input wand id_7,
    input supply0 id_8,
    input wor id_9,
    input wand id_10,
    input supply1 id_11,
    input tri1 id_12
);
  logic [7:0] id_14;
  uwire id_15;
  assign id_15 = id_6;
  uwire id_16 = id_1;
  assign id_14[1] = 1;
  wire id_17;
  wire id_18;
endmodule
module module_1 (
    input  tri1  id_0,
    input  wand  id_1,
    input  tri0  id_2,
    input  wor   id_3,
    output uwire id_4,
    input  wand  id_5,
    input  tri1  id_6,
    output wire  id_7,
    input  tri0  id_8,
    input  tri0  id_9,
    output tri0  id_10,
    input  wor   id_11,
    input  tri   id_12
);
  wire id_14;
  module_0(
      id_8, id_12, id_6, id_9, id_5, id_9, id_6, id_5, id_11, id_2, id_12, id_3, id_9
  );
endmodule

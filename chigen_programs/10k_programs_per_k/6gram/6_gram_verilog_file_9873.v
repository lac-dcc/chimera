// Seed: 2114195545
module module_0 (
    output tri1  id_0,
    input  tri   id_1
    , id_6,
    input  wor   id_2,
    input  uwire id_3
    , id_7,
    output tri1  id_4
);
  wire id_8;
  wand id_9 = 1;
  assign id_0 = id_8;
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    input tri id_2,
    input wand id_3,
    input wire id_4,
    input supply1 id_5,
    input wire id_6,
    input supply1 id_7,
    input uwire id_8,
    input wand id_9,
    output tri0 id_10,
    input tri1 id_11,
    input supply0 id_12,
    output wand id_13,
    output tri1 id_14
);
  wire id_16;
  wire id_17;
  or primCall (
      id_13, id_8, id_4, id_16, id_11, id_3, id_18, id_9, id_0, id_1, id_7, id_17, id_12, id_6, id_5
  );
  wire id_18 = id_3;
  module_0 modCall_1 (
      id_14,
      id_2,
      id_6,
      id_2,
      id_13
  );
endmodule

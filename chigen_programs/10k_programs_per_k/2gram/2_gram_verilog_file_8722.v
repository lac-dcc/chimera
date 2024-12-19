// Seed: 1644916007
module module_0 (
    output tri1  id_0,
    output uwire id_1,
    input  wor   id_2,
    output tri0  id_3,
    output uwire id_4,
    input  uwire id_5,
    output wire  id_6,
    output uwire id_7,
    input  tri   id_8,
    input  wand  id_9,
    input  wire  id_10,
    input  uwire id_11,
    output uwire id_12
);
  assign id_1 = 1;
  wire id_14;
  assign module_1.id_9 = 0;
  wire id_15;
  assign id_4 = !id_8;
endmodule
module module_1 (
    output supply0 id_0,
    input wand id_1,
    input wire id_2,
    input uwire id_3,
    output tri id_4,
    input supply1 id_5,
    inout tri0 id_6,
    input tri1 id_7,
    input tri0 id_8,
    input supply0 id_9,
    output uwire id_10,
    input wire id_11,
    input wor id_12,
    output uwire id_13,
    output supply1 id_14,
    output wand id_15
);
  module_0 modCall_1 (
      id_6,
      id_10,
      id_2,
      id_10,
      id_13,
      id_3,
      id_14,
      id_4,
      id_12,
      id_11,
      id_12,
      id_8,
      id_6
  );
  wor id_17 = id_11;
endmodule

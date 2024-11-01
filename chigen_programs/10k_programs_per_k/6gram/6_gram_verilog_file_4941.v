// Seed: 3169865691
module module_0 (
    output wor id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri1 id_3,
    input supply0 id_4,
    input tri0 id_5,
    input wand id_6,
    input wire id_7,
    output tri id_8,
    output tri0 id_9,
    input wor id_10,
    input supply0 id_11,
    output tri0 id_12,
    input tri0 id_13,
    input wand id_14,
    input uwire id_15,
    output supply1 id_16,
    input tri id_17
);
  wire id_19;
  wire id_20 = id_10, id_21;
  assign id_12 = 1;
endmodule
module module_1 (
    output wand  id_0,
    output tri0  id_1,
    input  wand  id_2,
    input  tri0  id_3,
    output uwire id_4,
    input  tri   id_5,
    input  wor   id_6
);
  module_0(
      id_0,
      id_5,
      id_6,
      id_2,
      id_5,
      id_3,
      id_5,
      id_5,
      id_0,
      id_4,
      id_3,
      id_2,
      id_4,
      id_6,
      id_2,
      id_6,
      id_1,
      id_3
  );
  integer id_8 (
      .id_0(id_4),
      .id_1(1 - id_3),
      .id_2(1 - 1)
  );
endmodule

// Seed: 1476571955
module module_0 (
    output wor id_0,
    input tri0 id_1,
    input supply1 id_2,
    output tri1 id_3,
    input wire id_4,
    output uwire id_5,
    output wand id_6,
    output tri0 id_7,
    output wand id_8,
    output tri0 id_9,
    input uwire id_10,
    output tri id_11,
    input wor id_12,
    input supply1 id_13,
    input tri id_14,
    input supply1 id_15
);
  wire id_17, id_18;
  id_19(
      1 - 1, id_15, 1, id_14
  );
  tri  id_20 = id_14 % id_13 == id_13;
  wire id_21;
  id_22(
      .id_0(1), .id_1(1 == id_0), .id_2(1)
  );
  wire id_23;
  wire id_24;
endmodule
module module_1 (
    output wand  id_0,
    input  tri   id_1,
    input  wire  id_2,
    input  tri0  id_3,
    output wand  id_4,
    output tri1  id_5,
    input  wand  id_6,
    input  tri0  id_7,
    output uwire id_8,
    output wor   id_9,
    input  uwire id_10,
    output tri0  id_11
);
  module_0(
      id_5,
      id_10,
      id_2,
      id_5,
      id_6,
      id_5,
      id_5,
      id_9,
      id_11,
      id_0,
      id_2,
      id_0,
      id_1,
      id_7,
      id_10,
      id_3
  );
  wire id_13 = id_13;
  wire id_14;
  always_ff @(id_3 or posedge id_2) id_4 = !id_7;
endmodule

// Seed: 3437291954
module module_0 (
    output wand id_0,
    input wor id_1,
    input tri id_2,
    input supply1 id_3,
    output uwire id_4,
    input tri1 id_5,
    output wire id_6,
    input wire id_7,
    output tri0 id_8,
    output tri0 id_9,
    output uwire id_10
);
  wire id_12;
  supply1 id_13 = id_7;
  wire id_14;
  id_15(
      .id_0(1 << id_2),
      .id_1(id_6),
      .id_2(id_4),
      .id_3(1),
      .id_4('b0),
      .id_5(id_3),
      .id_6(id_2 - 1),
      .id_7(1'd0),
      .id_8(id_0 | id_7),
      .id_9(id_13),
      .id_10(1)
  );
  wire id_16;
endmodule
module module_1 (
    input wand id_0,
    input supply1 id_1,
    output uwire id_2,
    input supply0 id_3,
    input uwire id_4,
    input tri0 id_5,
    input wand id_6,
    input supply0 id_7,
    input wor id_8
);
  wire id_10;
  not (id_2, id_8);
  module_0(
      id_2, id_5, id_4, id_8, id_2, id_5, id_2, id_1, id_2, id_2, id_2
  );
  wire id_11, id_12;
endmodule

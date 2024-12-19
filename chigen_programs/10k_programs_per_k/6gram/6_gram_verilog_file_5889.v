// Seed: 2288147891
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    input supply1 id_2,
    output wand id_3,
    input supply1 id_4,
    output supply0 id_5,
    output tri id_6,
    input wor id_7,
    output tri1 id_8,
    input tri id_9,
    output wand id_10
);
  integer id_12 (
      .id_0(1 == id_6),
      .id_1(id_9),
      .id_2(id_7),
      .id_3(1),
      .id_4(id_6),
      .id_5(1'd0),
      .id_6(1)
  );
  assign id_0 = 1;
endmodule
module module_1 (
    output wire id_0,
    input  wire id_1,
    output tri0 id_2,
    output tri1 id_3,
    input  wor  id_4,
    output tri0 id_5,
    input  tri0 id_6,
    input  wor  id_7,
    output wire id_8,
    output tri1 id_9
);
  supply0 id_11 = 1'b0;
  wand id_12;
  assign id_9  = id_4 ? 1 : id_12;
  assign id_11 = 1;
  module_0 modCall_1 (
      id_11,
      id_4,
      id_4,
      id_5,
      id_6,
      id_5,
      id_5,
      id_7,
      id_12,
      id_7,
      id_0
  );
  assign modCall_1.id_4 = 0;
  wire id_13;
  assign id_11 = id_7;
  wire id_14;
endmodule

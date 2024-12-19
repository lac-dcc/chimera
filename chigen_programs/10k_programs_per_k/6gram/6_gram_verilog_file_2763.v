// Seed: 4281554141
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    output wor id_2,
    input wire id_3,
    input tri id_4,
    input wand id_5,
    output uwire id_6,
    input wand id_7,
    output supply1 id_8,
    output supply0 id_9,
    output supply1 id_10,
    input tri id_11,
    input wor id_12,
    output tri1 id_13
);
  assign id_8 = id_4 ? id_7 : id_3;
  wire id_15;
  assign module_1.id_1 = 0;
  assign id_10 = id_1;
  wire id_16;
  wire id_17;
  assign id_9 = 1'h0;
endmodule
module module_1 (
    output wor   id_0,
    input  wand  id_1,
    input  tri0  id_2,
    input  tri   id_3,
    output uwire id_4
);
  id_6(
      .id_0(), .id_1({1, 1'h0}), .id_2(0)
  );
  module_0 modCall_1 (
      id_4,
      id_2,
      id_0,
      id_1,
      id_2,
      id_3,
      id_4,
      id_3,
      id_4,
      id_0,
      id_4,
      id_1,
      id_1,
      id_0
  );
endmodule

// Seed: 3635015379
macromodule module_0 (
    input wor id_0,
    input wire id_1,
    output tri1 id_2,
    output tri0 id_3,
    input wire id_4,
    output tri0 id_5,
    input tri1 id_6,
    input wor id_7,
    input wire id_8,
    output supply0 id_9,
    input wand id_10
);
endmodule
module module_1 (
    input  uwire id_0,
    input  wor   id_1,
    input  tri1  id_2,
    input  tri   id_3,
    input  tri1  id_4,
    input  uwire id_5,
    input  tri   id_6,
    output tri   id_7,
    output wor   id_8
);
  id_10(
      .id_0(id_8), .id_1(1), .id_2(id_8), .id_3(id_5), .id_4(1'b0), .id_5(id_8), .id_6(id_2)
  );
  module_0 modCall_1 (
      id_6,
      id_5,
      id_7,
      id_8,
      id_4,
      id_7,
      id_6,
      id_1,
      id_1,
      id_8,
      id_1
  );
  assign modCall_1.id_7 = 0;
  assign id_7 = 1;
endmodule

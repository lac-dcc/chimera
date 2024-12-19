// Seed: 1401872346
module module_0 (
    input wand id_0,
    input uwire id_1,
    input supply0 id_2,
    output tri0 id_3,
    input tri0 id_4,
    output wire id_5,
    output tri id_6,
    input supply1 id_7,
    input supply0 id_8,
    input supply1 id_9,
    input supply0 id_10,
    output tri1 id_11,
    input wire id_12,
    input wire id_13,
    input tri0 id_14
);
  assign id_5 = 1'b0;
  assign module_1.type_0 = 0;
  wire id_16;
  id_17(
      .id_0(id_2), .id_1(1)
  );
  tri1 id_18 = id_8 ^ id_14;
  wire id_19;
  wire id_20;
endmodule
macromodule module_1 (
    input  uwire id_0,
    output tri1  id_1,
    output wor   id_2,
    input  tri   id_3,
    output tri   id_4,
    output wor   id_5
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_1,
      id_0,
      id_2,
      id_4,
      id_3,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_3,
      id_3
  );
endmodule

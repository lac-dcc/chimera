// Seed: 1735578109
macromodule module_0 (
    input wor id_0,
    input tri1 id_1,
    input wor id_2,
    input wand id_3,
    output supply1 id_4,
    inout tri id_5,
    output tri id_6,
    output supply0 id_7,
    output tri0 id_8,
    input tri1 id_9,
    output uwire id_10,
    input tri1 id_11,
    input supply0 id_12,
    output tri id_13,
    input wand module_0,
    output tri1 id_15,
    output supply1 id_16,
    output wire id_17,
    input tri1 id_18
);
  wire id_20;
  assign id_7 = 1 == 1;
  id_21(
      .id_0(1), .id_1(id_6), .id_2(id_15)
  );
  assign id_5 = id_12 ==? 1;
  uwire id_22 = 1;
  assign id_4 = 1 != 1;
  genvar id_23;
  wire id_24;
endmodule
module module_1 (
    output uwire id_0,
    input  tri0  id_1,
    output tri   id_2,
    output tri   id_3,
    input  wand  id_4,
    inout  tri0  id_5,
    output tri   id_6,
    output wor   id_7,
    input  wor   id_8
);
  wire id_10;
  wire id_11;
  module_0 modCall_1 (
      id_8,
      id_5,
      id_1,
      id_8,
      id_6,
      id_5,
      id_7,
      id_7,
      id_2,
      id_5,
      id_2,
      id_8,
      id_5,
      id_2,
      id_1,
      id_3,
      id_2,
      id_6,
      id_4
  );
  assign modCall_1.id_11 = 0;
endmodule

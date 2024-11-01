// Seed: 1995357048
module module_0 (
    input wor id_0,
    input tri1 id_1,
    input uwire id_2,
    output tri id_3,
    input uwire id_4,
    input supply0 id_5,
    input wire id_6,
    input wor id_7,
    output tri0 id_8,
    input tri id_9,
    output wand id_10,
    input supply1 id_11
);
  wire id_13 = id_13, id_14;
  assign id_8 = 1;
  wire id_15;
endmodule
module module_1 (
    output wor id_0,
    output uwire id_1,
    input tri id_2,
    input wand id_3,
    input wor id_4,
    input wire id_5,
    input wand id_6,
    input uwire id_7,
    input wire id_8,
    input uwire id_9,
    output tri1 id_10,
    output wand id_11,
    output supply1 id_12,
    input uwire id_13,
    output supply1 id_14
);
  genvar id_16;
  nor (id_14, id_2, id_16, id_8, id_3, id_6, id_13, id_17, id_5, id_4, id_7);
  assign id_12 = id_4;
  id_17(
      .id_0(id_10), .id_1(id_5), .id_2(1 & 1), .id_3(id_14)
  );
  assign id_10 = id_4;
  module_0(
      id_6, id_5, id_3, id_12, id_4, id_5, id_8, id_4, id_1, id_7, id_14, id_9
  );
endmodule

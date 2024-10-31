// Seed: 1350200849
module module_0 (
    input uwire id_0,
    input uwire id_1,
    output uwire id_2,
    output supply0 id_3
    , id_13,
    output wire id_4,
    input uwire id_5,
    input uwire id_6,
    input tri id_7,
    input wire id_8,
    input wand id_9,
    output wand id_10,
    input uwire id_11
);
  wire id_14;
  id_15(
      1 < 1, id_1
  );
  genvar id_16;
endmodule
module module_1 (
    input  tri0  id_0,
    input  tri1  id_1,
    input  wire  id_2,
    input  wire  id_3,
    input  wand  id_4,
    output tri0  id_5,
    input  uwire id_6,
    output tri0  id_7
);
  id_9(
      .id_0(id_1), .id_1(id_4), .id_2(id_1), .id_3(1), .id_4(id_0), .id_5(1)
  ); module_0(
      id_3, id_1, id_5, id_7, id_5, id_3, id_6, id_1, id_3, id_2, id_5, id_0
  );
  wire id_10;
  nand (id_5, id_9, id_4, id_3, id_1, id_2, id_6);
endmodule

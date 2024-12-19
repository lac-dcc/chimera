// Seed: 159659453
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    input tri1 id_2,
    input supply1 id_3,
    output tri id_4,
    input tri id_5,
    output supply0 id_6,
    input supply0 id_7,
    output supply0 id_8
);
  wand id_10 = 1;
  id_11(
      .id_0(id_3), .id_1(id_8), .id_2(id_5)
  );
  assign id_1 = 1;
  wire id_12;
  wire id_13 = id_12;
  wire id_14;
  assign id_6 = id_10;
endmodule
module module_1 (
    input logic id_0,
    input supply1 id_1,
    output tri id_2,
    output wor id_3
);
  logic id_5, id_6, id_7, id_8 = id_0;
  always force id_7 = id_8;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3,
      id_1,
      id_3
  );
  assign modCall_1.type_6 = 0;
endmodule

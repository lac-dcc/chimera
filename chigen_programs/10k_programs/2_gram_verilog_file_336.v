// Seed: 554739701
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output tri1 id_2,
    input wor id_3,
    input uwire id_4,
    output tri0 id_5,
    input supply0 id_6,
    output tri1 id_7,
    input supply0 id_8,
    output tri id_9,
    input tri1 id_10,
    input tri id_11
);
  wire id_13;
  wire id_14;
  id_15(
      .id_0(1), .id_1(id_2 % (1'd0)), .id_2(), .id_3(1), .id_4(""), .id_5(id_10), .id_6()
  );
  genvar id_16;
  assign id_2 = id_6 - 1;
endmodule
module module_1 (
    input  wor   id_0,
    output tri1  id_1,
    input  tri   id_2,
    input  uwire id_3,
    input  tri0  id_4,
    input  tri   id_5
);
  wand id_7 = id_2;
  module_0(
      id_3, id_5, id_7, id_2, id_5, id_1, id_5, id_1, id_2, id_1, id_3, id_2
  );
endmodule

// Seed: 2313369257
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input wand id_2,
    input uwire id_3,
    input tri id_4,
    input wand id_5,
    input tri0 id_6,
    input supply1 id_7,
    input tri id_8,
    input uwire id_9,
    output tri0 id_10
);
  supply0 id_12 = 1;
  id_13(
      .id_0(id_5), .id_1(1), .id_2(1), .id_3(id_0), .id_4(id_5)
  );
  wand id_14 = 1'b0 + 1'b0;
  wire id_15;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output tri id_1,
    input supply1 id_2,
    input supply0 id_3,
    output uwire id_4,
    input supply0 id_5,
    input wor id_6,
    output wand id_7,
    output tri id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_6,
      id_5,
      id_0,
      id_2,
      id_1
  );
endmodule

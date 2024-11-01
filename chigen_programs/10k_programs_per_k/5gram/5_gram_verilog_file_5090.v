// Seed: 2156559887
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    input tri id_2,
    input supply0 id_3,
    input supply1 id_4,
    input tri0 id_5,
    output tri id_6,
    input uwire id_7,
    input tri1 id_8,
    input wor id_9,
    input supply1 id_10,
    output uwire id_11,
    input wor id_12,
    output supply1 id_13,
    output tri id_14
);
  assign id_13 = id_0;
  id_16(
      .id_0(1), .id_1(id_4), .id_2(id_3)
  );
  supply0 id_17 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input uwire id_1,
    output tri0 id_2,
    output tri0 id_3,
    output tri0 id_4,
    input wand id_5
    , id_9,
    input tri1 id_6,
    input supply1 id_7
);
  assign id_3 = 1 ? id_0 : id_6 ? id_1 == id_7 : 1;
  assign id_2 = id_6 + 1;
  wire id_10;
  wire id_11, id_12;
  module_0(
      id_7, id_0, id_7, id_7, id_5, id_6, id_4, id_6, id_1, id_0, id_0, id_3, id_1, id_2, id_2
  );
endmodule

// Seed: 2542315950
module module_0 (
    input tri1 id_0,
    input tri id_1,
    output uwire id_2,
    input wand id_3
    , id_15,
    output supply1 id_4,
    input tri0 id_5,
    input tri1 id_6,
    input wor id_7,
    input wand id_8,
    output uwire id_9,
    input wand id_10,
    input tri1 id_11,
    output tri0 id_12,
    input supply1 id_13
);
endmodule
module module_1 (
    input tri id_0,
    output tri id_1,
    input uwire id_2,
    input supply0 id_3
);
  wire id_5;
  tri  id_6;
  assign id_1 = 1'b0 ? id_5 : id_2;
  assign id_5 = id_6;
  module_0(
      id_2, id_0, id_1, id_3, id_1, id_3, id_5, id_5, id_2, id_6, id_6, id_0, id_1, id_3
  );
  wor id_7 = id_3 && id_5;
endmodule

// Seed: 3296498088
module module_0 (
    output tri0 id_0,
    input wor id_1,
    input tri0 id_2,
    output wand id_3,
    input supply0 id_4,
    input wor id_5,
    input tri1 id_6,
    output uwire id_7
);
  wire id_9;
  wire id_10;
  wire id_11;
  wire id_12, id_13;
  wire id_14;
endmodule
module module_1 (
    input wor id_0,
    input tri id_1,
    output wor id_2,
    output uwire id_3,
    input uwire id_4,
    output wand id_5,
    output tri0 id_6,
    output wor id_7,
    input supply0 id_8,
    input tri id_9,
    input tri id_10,
    input wand id_11
);
  wire id_13;
  assign id_2 = id_11;
  assign id_7 = id_4;
  xnor (id_6, id_1, id_8, id_11, id_0, id_4);
  module_0(
      id_7, id_11, id_8, id_5, id_11, id_9, id_9, id_6
  );
endmodule

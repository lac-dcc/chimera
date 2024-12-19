// Seed: 3499687418
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    output wor id_2,
    input tri0 id_3,
    output tri id_4,
    output supply1 id_5,
    output tri0 id_6,
    input wand id_7,
    input uwire id_8,
    output supply1 id_9,
    output tri id_10,
    output supply1 id_11,
    input tri id_12,
    input supply0 id_13,
    input uwire id_14
);
  supply0 id_16, id_17, id_18;
  assign id_18 = id_1;
  tri0 id_19 = 1;
  assign module_1.id_1 = 0;
  assign id_6 = 1;
  wire id_20;
endmodule
module module_1 (
    input  uwire id_0,
    output tri   id_1,
    input  wor   id_2,
    input  tri0  id_3,
    output wand  id_4,
    output tri0  id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_5,
      id_2,
      id_5,
      id_1,
      id_1,
      id_0,
      id_2,
      id_5,
      id_1,
      id_4,
      id_2,
      id_0,
      id_2
  );
endmodule

// Seed: 227953087
module module_0 (
    input tri id_0,
    input supply1 id_1,
    input uwire id_2,
    input supply0 id_3,
    input supply0 id_4,
    input wor id_5,
    input wand id_6,
    output tri id_7,
    output supply1 id_8,
    input uwire id_9,
    output wand id_10,
    output tri0 id_11
);
  assign id_10 = id_5 ? id_6 : -1;
  assign module_1.id_10 = 0;
  assign id_11 = id_1;
  tri0 id_13 = 1, id_14;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    output supply1 id_2,
    input tri1 id_3,
    output tri1 id_4,
    inout tri0 id_5,
    output supply0 id_6,
    output wor id_7,
    input wire id_8,
    input supply1 id_9,
    input wire id_10,
    output wor id_11,
    input tri1 id_12,
    input uwire id_13,
    input wire id_14,
    output wand id_15
);
  assign id_7 = id_9;
  module_0 modCall_1 (
      id_9,
      id_10,
      id_14,
      id_5,
      id_1,
      id_3,
      id_8,
      id_4,
      id_0,
      id_14,
      id_15,
      id_6
  );
endmodule

// Seed: 1843700461
module module_0 (
    output supply1 id_0,
    input supply1 id_1,
    input wand id_2,
    output supply1 id_3,
    input wand id_4,
    output tri0 id_5,
    input tri1 id_6,
    id_10,
    input wire id_7,
    input wire id_8
);
  uwire id_11 = 1;
  assign module_1.type_15 = 0;
endmodule
module module_1 (
    input tri id_0,
    input tri0 id_1,
    input tri id_2,
    input wor id_3,
    output tri0 id_4,
    output tri0 id_5,
    output tri0 id_6,
    input wand id_7,
    input supply1 id_8,
    input uwire id_9,
    input tri0 id_10,
    input wor id_11
);
  assign id_6 = id_0;
  assign id_6 = id_3;
  or primCall (id_6, id_10, id_3, id_2, id_7, id_8, id_0, id_9);
  module_0 modCall_1 (
      id_5,
      id_10,
      id_8,
      id_5,
      id_1,
      id_5,
      id_3,
      id_7,
      id_11
  );
endmodule

// Seed: 4094632408
module module_0 (
    input wand id_0,
    output uwire id_1,
    input wand id_2,
    input wire id_3,
    input tri id_4,
    output uwire id_5,
    input uwire id_6,
    output wire id_7,
    input wand id_8,
    input tri0 id_9,
    input supply1 id_10,
    output wor id_11,
    input tri0 id_12,
    output wand id_13
);
  wire id_15;
endmodule
module module_1 (
    input uwire id_0
);
  assign id_2 = id_0;
  module_0(
      id_2, id_2, id_0, id_2, id_2, id_2, id_2, id_2, id_2, id_2, id_0, id_2, id_0, id_2
  );
endmodule
module module_2 (
    input wor id_0,
    input uwire id_1,
    input tri0 id_2,
    output tri1 id_3,
    input tri id_4,
    input uwire id_5,
    output supply0 id_6,
    output wire id_7,
    input tri id_8,
    output wand id_9,
    output supply1 id_10,
    output tri1 id_11
);
  assign id_7 = id_5 - id_8;
  nor (id_7, id_0, id_1, id_5, id_4, id_2, id_8);
  module_0(
      id_5, id_10, id_8, id_5, id_1, id_11, id_5, id_7, id_1, id_0, id_0, id_10, id_5, id_7
  );
  assign id_3 = id_5;
endmodule

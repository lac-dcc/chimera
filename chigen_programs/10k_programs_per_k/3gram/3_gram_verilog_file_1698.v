// Seed: 4107004522
module module_0 (
    output supply1 id_0,
    input wand id_1,
    output wand id_2,
    input tri0 id_3,
    input uwire id_4
);
  wire id_6;
  wire id_7;
  wire id_8;
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    output wand id_2,
    output supply1 id_3,
    input tri id_4,
    input wor id_5
);
  wire id_7;
  module_0(
      id_3, id_5, id_3, id_0, id_5
  );
endmodule
module module_2 (
    output tri1 id_0,
    input  tri0 id_1,
    input  wor  id_2,
    output wand id_3,
    output tri0 id_4,
    input  tri0 id_5
);
  assign id_0 = id_5;
  nor (id_0, id_2, id_1, id_5);
  module_0(
      id_3, id_5, id_0, id_1, id_2
  );
endmodule

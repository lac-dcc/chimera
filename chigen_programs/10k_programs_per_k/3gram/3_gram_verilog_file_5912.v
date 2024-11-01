// Seed: 1150076329
module module_0 (
    input wand id_0,
    output uwire id_1,
    input supply0 id_2,
    input supply0 id_3,
    output supply1 id_4,
    input supply0 id_5,
    output tri0 id_6,
    input tri id_7,
    input supply0 id_8,
    input tri id_9,
    input tri id_10,
    input wor id_11
);
endmodule
module module_1 (
    output wand id_0,
    input wand id_1,
    input supply0 id_2,
    output tri0 id_3,
    output tri0 id_4,
    output wand id_5,
    output tri1 id_6,
    input tri1 id_7
);
  always
  fork
  join_none
  module_0(
      id_2, id_5, id_1, id_1, id_6, id_1, id_5, id_2, id_7, id_1, id_2, id_7
  );
  assign id_6 = id_1;
  wire id_9;
  wire id_10;
endmodule

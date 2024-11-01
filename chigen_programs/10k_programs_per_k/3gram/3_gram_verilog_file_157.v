// Seed: 3315648277
module module_0 (
    output supply1 id_0,
    output tri1 id_1,
    input uwire id_2,
    input wor id_3,
    input uwire id_4,
    input supply1 id_5,
    input tri1 id_6
);
  wire id_8 = id_2;
endmodule
module module_1 (
    output tri1 id_0,
    output tri0 id_1,
    output wire id_2,
    output wire id_3,
    output wand id_4,
    input tri id_5,
    output supply0 id_6,
    input tri1 id_7
);
  module_0(
      id_2, id_0, id_5, id_5, id_7, id_5, id_5
  );
  assign id_4 = ~&1;
endmodule

// Seed: 2042373891
module module_0 (
    output tri1 id_0,
    input wand id_1,
    input uwire id_2,
    input wand id_3,
    input wor id_4,
    input tri1 id_5,
    output supply1 id_6
);
  wire id_8;
  wire id_9;
endmodule
module module_1 (
    output wor id_0,
    output wor id_1,
    output tri1 id_2,
    input supply1 id_3,
    output supply0 id_4,
    inout tri0 id_5,
    output supply0 id_6,
    output tri id_7,
    input supply0 id_8,
    input wor id_9,
    input wor id_10,
    input wire id_11
);
  module_0(
      id_5, id_10, id_8, id_5, id_9, id_5, id_5
  );
  wire id_13;
  assign id_4 = 1;
  xnor (id_5, id_3, id_11, id_8, id_9, id_10);
  assign {1, id_10} = id_9;
endmodule

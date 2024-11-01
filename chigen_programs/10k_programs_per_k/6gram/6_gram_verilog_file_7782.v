// Seed: 4024635848
module module_0 (
    output uwire id_0,
    input tri0 id_1,
    output wor id_2,
    input supply1 id_3,
    input tri id_4,
    output tri0 id_5,
    input tri id_6,
    input wor id_7,
    output tri1 id_8,
    input tri0 id_9
);
  assign id_2 = id_1;
endmodule
module module_1 (
    output wand id_0,
    input tri id_1,
    output uwire id_2,
    input wire id_3,
    input uwire id_4,
    input uwire id_5,
    input wand id_6,
    output supply1 id_7
);
  assign id_7 = {id_5 + id_4{id_1}};
  module_0(
      id_2, id_5, id_0, id_1, id_6, id_7, id_5, id_6, id_7, id_3
  );
endmodule

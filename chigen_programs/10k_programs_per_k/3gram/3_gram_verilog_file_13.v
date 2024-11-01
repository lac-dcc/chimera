// Seed: 796755099
module module_0 (
    output supply1 id_0,
    input uwire id_1,
    input tri id_2,
    input wand id_3,
    output wor id_4,
    output tri1 id_5,
    output wire id_6,
    input wire id_7,
    output tri0 id_8,
    input tri0 id_9
);
  assign id_5 = 1 - id_2;
  wor id_11 = id_1;
endmodule
module module_1 (
    output wand id_0,
    output supply0 id_1,
    output tri0 id_2,
    input supply0 id_3,
    output supply1 id_4,
    input tri1 id_5
);
  assign id_1 = 1;
  not (id_1, id_3);
  module_0(
      id_2, id_5, id_3, id_3, id_0, id_2, id_4, id_5, id_2, id_5
  );
endmodule

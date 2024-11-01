// Seed: 1909116829
module module_0 (
    output tri id_0,
    output wand id_1,
    output supply1 id_2,
    input tri1 id_3,
    output wor id_4,
    output tri id_5,
    input supply1 id_6,
    input supply0 id_7,
    input wand id_8,
    output wire id_9,
    output wand id_10
);
  assign id_1 = 0;
endmodule
module module_1 (
    output wor id_0,
    output supply0 id_1,
    output wor id_2,
    input supply0 id_3,
    output tri1 id_4,
    output supply1 id_5
);
  assign id_0 = id_3;
  assign id_5 = 1 - {id_3 + 1'b0};
  wire id_7, id_8;
  module_0(
      id_2, id_5, id_5, id_3, id_0, id_4, id_3, id_3, id_3, id_0, id_0
  );
  wire id_9, id_10;
endmodule

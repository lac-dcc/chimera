// Seed: 3379071939
module module_0 (
    output supply1 id_0,
    output wand id_1,
    input uwire id_2,
    output wor id_3,
    output wire id_4,
    input uwire id_5,
    output supply0 id_6,
    output wire id_7
);
  assign id_0 = 1;
  always #1;
endmodule
module module_1 (
    output wand id_0,
    input uwire id_1,
    input supply1 id_2,
    input tri1 id_3,
    inout uwire id_4,
    output tri id_5,
    output tri0 id_6,
    input tri1 id_7,
    output tri id_8,
    output tri id_9,
    input supply1 id_10
);
  final $display(1);
  or primCall (id_8, id_2, id_4, id_10, id_7, id_3, id_1);
  module_0 modCall_1 (
      id_0,
      id_6,
      id_1,
      id_9,
      id_9,
      id_1,
      id_8,
      id_8
  );
  assign modCall_1.id_4 = 0;
endmodule

// Seed: 3676658100
module module_0 (
    output tri1 id_0,
    input wand id_1,
    input uwire id_2,
    output tri1 id_3,
    output wor id_4,
    output wor id_5,
    input tri id_6,
    output tri1 id_7,
    input wor id_8,
    input tri0 id_9,
    input supply1 id_10
);
  always #1 $unsigned(39);
  ;
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    output supply1 id_2
);
  assign id_2 = -1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_0 = 0;
  assign #(1, 1) id_2 = 1;
  logic id_4;
  ;
endmodule

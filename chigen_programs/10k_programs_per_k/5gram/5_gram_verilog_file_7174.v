// Seed: 1186812568
module module_0 (
    input tri id_0,
    input wor id_1,
    input supply1 id_2,
    input supply0 id_3,
    output supply1 id_4,
    output wand id_5,
    output supply1 id_6,
    input supply0 id_7,
    input tri1 id_8,
    output tri id_9
);
  always @(1) $clog2(10);
  ;
endmodule
module module_1 (
    input  uwire id_0,
    input  wand  id_1,
    output wire  id_2,
    input  tri1  id_3,
    output wor   id_4
);
  assign id_4 = id_1 ^ id_0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_4,
      id_2,
      id_2,
      id_0,
      id_3,
      id_4
  );
  assign modCall_1.id_3 = 0;
endmodule

// Seed: 2279540939
program module_0 (
    input wor id_0,
    output tri0 id_1,
    input tri1 id_2,
    input uwire id_3,
    input wand id_4,
    output tri1 id_5,
    input wire id_6,
    input supply0 id_7,
    input wand id_8,
    output tri0 id_9,
    input tri0 id_10,
    output tri0 id_11
);
  always_latch $clog2(16);
  ;
endprogram
module module_1 (
    output supply0 id_0,
    input tri0 id_1,
    input tri1 id_2,
    input tri0 id_3[1 : -1  &  1  -  1],
    input tri id_4,
    input tri1 id_5,
    input tri0 id_6,
    input wand id_7,
    output wire id_8
);
  parameter id_10 = 1;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_1,
      id_4,
      id_0,
      id_6,
      id_1,
      id_1,
      id_8,
      id_1,
      id_0
  );
  assign modCall_1.id_8 = 0;
endmodule

// Seed: 383258354
module module_0 (
    input  tri0  id_0,
    output tri1  id_1,
    input  uwire id_2,
    output wire  id_3
);
  assign module_1.id_8 = 0;
  assign id_3 = id_2;
  always_latch foreach (id_5[-1]) $clog2(3);
  ;
endmodule
module module_1 (
    input tri0 id_0,
    input wire id_1,
    input wand id_2,
    input supply0 id_3,
    output uwire id_4,
    output wire id_5,
    input wor id_6,
    input supply1 id_7,
    input tri0 id_8,
    input wire id_9,
    output tri0 id_10,
    input wand id_11
    , id_14,
    input tri1 id_12
);
  nor primCall (id_4, id_0, id_2, id_8, id_14, id_6, id_1);
  module_0 modCall_1 (
      id_8,
      id_10,
      id_6,
      id_4
  );
endmodule

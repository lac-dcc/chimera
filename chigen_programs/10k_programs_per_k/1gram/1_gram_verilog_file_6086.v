// Seed: 2402112519
module module_0 (
    input tri1 id_0,
    output wor id_1,
    input tri id_2,
    input uwire id_3,
    input wor id_4,
    input supply1 id_5,
    output tri1 id_6,
    input tri1 id_7,
    input tri1 id_8,
    input uwire id_9
);
  assign id_6 = id_0;
  tri id_11;
  always_latch id_11 = id_0;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output tri id_0,
    input tri1 id_1,
    input wor id_2,
    input tri id_3,
    input supply1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    input wand id_7,
    output supply1 id_8,
    input wand id_9
);
  nor primCall (id_8, id_5, id_4);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_9,
      id_5,
      id_6,
      id_0,
      id_1,
      id_2,
      id_1
  );
  wire id_11, id_12, id_13;
  id_14(
      "", 1, 1'h0
  );
  wire id_15;
endmodule

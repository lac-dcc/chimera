// Seed: 1915123910
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    input supply0 id_2,
    input wand id_3,
    output tri id_4,
    output supply1 id_5,
    input tri id_6,
    input supply1 id_7,
    output wand id_8,
    output uwire id_9
);
  parameter id_11 = 1 - 1;
endmodule
module module_1 (
    input wand id_0,
    inout tri  id_1,
    input tri0 id_2,
    input wand id_3,
    inout tri1 id_4,
    input wand id_5,
    input tri0 id_6,
    input tri0 id_7
);
  assign id_4 = id_1 && 1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_4,
      id_4,
      id_5,
      id_6,
      id_4,
      id_1
  );
  assign modCall_1.id_3 = 0;
endmodule

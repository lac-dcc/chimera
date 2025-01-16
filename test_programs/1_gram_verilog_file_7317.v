// Seed: 444608893
module module_0 (
    output wand id_0,
    input uwire id_1,
    output tri1 id_2,
    input wor id_3,
    input uwire id_4,
    input supply1 id_5,
    output tri id_6,
    output wor id_7,
    output tri1 id_8,
    input supply1 id_9,
    input wand id_10
);
  wire id_12, id_13;
  wire id_14;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input tri1 id_1,
    input uwire id_2,
    input supply0 id_3,
    input supply1 id_4,
    output tri1 id_5,
    input supply0 id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_5,
      id_0,
      id_6,
      id_4,
      id_5,
      id_5,
      id_5,
      id_3,
      id_0
  );
  parameter id_9 = id_1 && 1;
endmodule

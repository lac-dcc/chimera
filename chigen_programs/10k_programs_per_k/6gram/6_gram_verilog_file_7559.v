// Seed: 3602320209
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    input tri1 id_2,
    input tri0 id_3,
    input tri0 id_4,
    input tri0 id_5,
    output supply1 id_6,
    output wor id_7
);
  assign id_6 = 1;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input wor id_0,
    input supply0 id_1,
    output supply1 id_2,
    input supply1 id_3,
    output tri id_4,
    input wand id_5
    , id_12,
    output supply0 id_6
    , id_13,
    input wand id_7,
    input uwire id_8,
    input tri0 id_9,
    output supply1 id_10
);
  wand id_14;
  assign id_14 = id_3 + id_12;
  module_0 modCall_1 (
      id_6,
      id_8,
      id_5,
      id_9,
      id_5,
      id_9,
      id_6,
      id_4
  );
  assign id_4 = 1;
endmodule

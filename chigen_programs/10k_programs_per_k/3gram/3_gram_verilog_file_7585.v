// Seed: 4120058218
module module_0 (
    output wand id_0,
    input tri0 id_1,
    input tri0 id_2,
    input tri1 id_3,
    input wand id_4,
    input tri1 id_5,
    input tri0 id_6,
    output supply0 id_7,
    output tri id_8,
    output tri id_9,
    output supply1 id_10
);
  wor id_12, id_13;
  assign id_10 = 1;
  assign id_12 = {id_3, 1, 1} | id_1;
  wire id_14;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    input tri0 id_2,
    inout wire id_3,
    output uwire id_4,
    output tri1 id_5
);
  wire id_7;
  assign id_4 = id_3;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_0,
      id_2,
      id_3,
      id_0,
      id_1,
      id_4,
      id_5,
      id_5,
      id_3
  );
  assign modCall_1.id_5 = 0;
  assign id_4 = id_3;
endmodule

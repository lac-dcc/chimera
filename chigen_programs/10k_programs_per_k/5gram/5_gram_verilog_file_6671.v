// Seed: 2238626705
module module_0 (
    output supply0 id_0,
    output tri id_1,
    output tri0 id_2,
    input supply1 id_3,
    input tri id_4,
    output tri1 id_5,
    input tri0 id_6,
    input wor id_7,
    output wor id_8,
    output wire id_9,
    input wor id_10
);
  wand id_12 = 1;
  assign id_0 = 1;
  timeprecision 1ps;
endmodule
module module_1 (
    input  tri0  id_0,
    output uwire id_1,
    inout  tri1  id_2,
    input  tri   id_3
);
  assign id_2 = id_3 !== 1;
  assign id_1 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2,
      id_3,
      id_2,
      id_2,
      id_0
  );
  assign modCall_1.type_3 = 0;
endmodule

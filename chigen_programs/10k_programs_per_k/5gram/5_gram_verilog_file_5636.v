// Seed: 3359254373
module module_0 (
    output uwire id_0,
    output uwire id_1,
    output tri id_2,
    output supply1 id_3,
    output supply1 id_4,
    input supply0 id_5,
    input supply0 id_6,
    output wor id_7,
    input wire id_8,
    input tri id_9,
    output tri0 id_10,
    input tri1 id_11,
    input tri0 id_12
);
  assign id_10 = id_8;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input tri id_1,
    output tri id_2,
    input uwire id_3,
    input wand id_4,
    output supply0 id_5,
    input supply0 id_6,
    inout supply1 id_7
);
  assign id_5 = 1 ? 1 : -1;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_0,
      id_4,
      id_1,
      id_5,
      id_3,
      id_3,
      id_0,
      id_7,
      id_6
  );
endmodule

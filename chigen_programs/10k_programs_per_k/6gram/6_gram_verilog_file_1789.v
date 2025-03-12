// Seed: 1101897787
module module_0 (
    input wor id_0,
    input tri1 id_1,
    output tri id_2,
    output tri id_3,
    output supply1 id_4,
    input supply0 id_5,
    input supply1 id_6,
    output wand id_7,
    output wand id_8
);
  assign id_2 = id_1;
endmodule
module module_1 (
    input wor id_0,
    input tri0 id_1,
    input supply1 id_2,
    output supply1 id_3,
    output supply0 id_4,
    output supply0 id_5,
    input uwire id_6,
    input tri id_7,
    output supply1 id_8
);
  timeunit 1ps;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_4,
      id_8,
      id_5,
      id_1,
      id_6,
      id_8,
      id_3
  );
  assign modCall_1.id_5 = 0;
endmodule

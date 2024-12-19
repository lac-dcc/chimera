// Seed: 56648687
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    input supply0 id_2,
    output tri1 id_3,
    input supply1 id_4,
    output tri1 id_5,
    input uwire id_6,
    output supply1 id_7
);
  assign id_7 = 1;
endmodule
module module_1 (
    input wand id_0,
    output tri id_1,
    output tri1 id_2,
    input supply1 id_3,
    output wand id_4,
    output wire id_5,
    input wand id_6,
    input tri id_7
);
  timeunit 1ps;
  module_0 modCall_1 (
      id_7,
      id_0,
      id_6,
      id_1,
      id_6,
      id_4,
      id_7,
      id_5
  );
  assign modCall_1.id_5 = 0;
endmodule

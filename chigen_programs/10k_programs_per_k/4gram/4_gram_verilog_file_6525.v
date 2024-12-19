// Seed: 1281917601
module module_0 (
    output uwire id_0,
    output tri1 id_1,
    output supply1 id_2,
    input wand id_3,
    input tri1 id_4,
    input wor id_5,
    input uwire id_6,
    output supply1 id_7
);
  wand id_9 = id_3;
  wor  id_10 = 1'b0;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    inout wire id_2,
    input tri id_3,
    input tri1 id_4,
    output wor id_5,
    input tri id_6,
    input supply1 id_7,
    output wand id_8,
    input wand id_9,
    input tri id_10
);
  timeunit 1ps;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2,
      id_9,
      id_7,
      id_1,
      id_10,
      id_8
  );
  assign modCall_1.id_10 = 0;
endmodule

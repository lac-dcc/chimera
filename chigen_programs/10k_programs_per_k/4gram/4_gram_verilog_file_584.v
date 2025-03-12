// Seed: 1783194442
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    output uwire id_2,
    input tri1 id_3,
    input uwire id_4,
    input tri0 id_5,
    input tri1 id_6,
    input wor id_7,
    input wand id_8,
    output supply1 id_9,
    input wand id_10
    , id_12
);
  wire id_13;
  timeunit 1ps;
endmodule
module module_1 (
    output wand id_0,
    input tri id_1,
    input tri1 id_2,
    input supply1 id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_3,
      id_3,
      id_1,
      id_2,
      id_1,
      id_3,
      id_0,
      id_2
  );
  assign modCall_1.id_7 = 0;
  assign id_0 = 1'b0;
endmodule

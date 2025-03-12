// Seed: 170290517
module module_0 (
    output wand id_0,
    input tri1 id_1,
    input wand id_2,
    output wor id_3,
    output tri1 id_4,
    output supply1 id_5
);
  assign id_0 = !id_2 & id_2;
  parameter id_7 = 1;
  logic [-1 : -1] id_8;
  wire id_9;
  ;
endmodule
module module_1 (
    input supply1 id_0,
    output tri0 id_1,
    output wand id_2,
    input tri1 id_3,
    input tri0 id_4,
    output tri1 id_5
);
  logic id_7;
  ;
  wire id_8 = $clog2(82);
  ;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_4,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_5 = 0;
endmodule

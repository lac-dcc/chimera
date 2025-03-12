// Seed: 116472316
module module_0 (
    input  tri0 id_0,
    output tri1 id_1,
    output wor  id_2,
    input  tri  id_3,
    output wand id_4,
    input  tri  id_5,
    output tri0 id_6,
    output tri  id_7,
    input  tri0 id_8,
    output tri  id_9,
    output wire id_10,
    input  tri  id_11,
    input  wire id_12
);
  wire id_14 = id_3, id_15;
  wire id_16;
  assign id_2 = id_3;
endmodule
module module_1 (
    input tri0 id_0,
    output tri0 id_1,
    input uwire id_2,
    input supply1 id_3
);
  wire id_5;
  parameter id_6 = 1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0,
      id_2
  );
  assign modCall_1.id_6 = 0;
  always @(posedge ~id_6 or posedge id_3) $clog2(6);
  ;
  xor primCall (id_1, id_2, id_3, id_0, id_6, id_5);
  wire [-1 : 1] id_7;
  wire id_8;
endmodule

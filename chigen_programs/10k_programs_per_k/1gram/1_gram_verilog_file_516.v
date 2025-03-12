// Seed: 535453454
module module_0 (
    output uwire id_0,
    output wor id_1,
    input wor id_2,
    output tri1 id_3,
    input supply1 id_4
);
  logic id_6;
  assign id_3 = 1;
  struct packed {
    union packed {
      logic id_7;
      logic id_8 = 1;
      logic id_9;
      logic id_10[-1 : 1];
    } id_11;
  } id_12;
  logic id_13;
  parameter id_14 = 1;
  assign id_12.id_11 = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd80
) (
    input tri1 id_0,
    output wand id_1,
    input logic id_2,
    input tri0 id_3[id_4 : 1],
    input tri _id_4,
    input supply1 id_5
);
  bit [-1 : 1] id_7;
  always id_7.id_2 <= $clog2(46);
  ;
  always $unsigned(11);
  ;
  nand primCall (id_1, id_7, id_5, id_3);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_1,
      id_0
  );
endmodule

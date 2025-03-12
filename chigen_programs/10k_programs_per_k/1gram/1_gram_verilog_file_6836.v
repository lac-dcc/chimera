// Seed: 4245245956
module module_0 (
    input supply1 id_0,
    output supply0 id_1,
    input supply1 id_2,
    input tri id_3,
    output supply1 id_4,
    output wire id_5,
    input tri1 id_6
);
  logic id_8;
  parameter id_9[-1 : -1] = -1;
  logic [7:0][1 'h0] id_10 = -1;
  assign id_1 = (1);
  if (id_9) assign id_1 = 1;
  else wire id_11[-1 : -1];
  wire id_12, id_13;
  assign id_12 = id_9;
endmodule
module module_1 (
    input  wand id_0,
    output tri1 id_1,
    input  tri0 id_2
);
  assign id_1 = 1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule

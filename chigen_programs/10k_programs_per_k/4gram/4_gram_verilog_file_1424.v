// Seed: 2693581356
module module_0 (
    input wand id_0,
    input wire id_1,
    input tri1 id_2,
    input tri1 id_3,
    input wor id_4,
    input tri id_5,
    input supply1 id_6,
    input tri1 id_7
);
  wire [-1 : -1 'h0] id_9;
  parameter id_10 = 1;
  assign module_1.id_1 = 0;
  localparam id_11 = id_10;
endmodule
module module_1 (
    input  wire id_0,
    output tri  id_1,
    input  tri  id_2
);
  parameter id_4 = -1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0
  );
  supply1 id_5;
  xor primCall (id_1, id_4, id_0, id_2);
  assign id_5 = 1;
endmodule

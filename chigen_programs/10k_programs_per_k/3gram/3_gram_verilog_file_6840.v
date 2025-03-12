// Seed: 1952272198
module module_0 (
    input supply1 id_0,
    input wor id_1,
    input tri1 id_2
);
  logic id_4, id_5, id_6, id_7;
  assign id_5 = id_7;
  logic [7:0] id_8;
  assign module_1.id_10 = 0;
  assign id_8[1] = id_8;
endmodule
module module_1 (
    input  tri0  id_0,
    input  tri   id_1,
    input  tri0  id_2,
    output tri1  id_3,
    input  wand  id_4,
    input  tri0  id_5,
    output wand  id_6,
    output wire  id_7,
    input  tri   id_8,
    output tri0  id_9,
    input  uwire id_10,
    input  tri0  id_11
);
  logic id_13;
  wire [1 : 1] id_14;
  and primCall (id_6, id_13, id_5, id_0, id_1, id_11, id_4, id_14, id_10, id_8, id_2);
  module_0 modCall_1 (
      id_8,
      id_10,
      id_5
  );
  always @(posedge -1) deassign id_3;
  logic [~  1 'b0 : -1] id_15 = 1;
  integer id_16;
  ;
  assign id_3 = (id_2);
endmodule

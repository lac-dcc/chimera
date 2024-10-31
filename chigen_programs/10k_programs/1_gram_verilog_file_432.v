// Seed: 3005394723
module module_0 (
    input supply1 id_0,
    input wand id_1,
    input supply0 id_2,
    output wor id_3,
    input wire id_4,
    output wand id_5,
    input tri id_6,
    output uwire id_7,
    input supply1 id_8,
    input supply0 id_9
);
  supply1 id_11, id_12, id_13;
  assign id_12 = id_0 - 'b0;
  assign id_12 = id_4 ==? (id_11) / id_9;
  wire id_14;
  wire id_15 = id_14;
endmodule
module module_2 (
    input tri1 id_0,
    output wor id_1,
    output uwire id_2,
    output supply1 module_1,
    input tri id_4,
    input wor id_5,
    input tri0 id_6,
    input supply1 id_7,
    output wand id_8,
    input uwire id_9,
    input tri1 id_10,
    output supply1 id_11,
    input logic id_12,
    input wand id_13
);
  module_0(
      id_0, id_5, id_6, id_2, id_13, id_8, id_7, id_1, id_10, id_5
  ); id_15 :
  assert property (@(id_15 - id_7 or id_12) id_12) id_15 <= 1;
endmodule

// Seed: 1480184167
module module_0 (
    input tri id_0,
    input uwire id_1,
    input wire id_2,
    output wor id_3,
    input supply0 id_4,
    input supply1 id_5,
    input wand id_6,
    input uwire id_7,
    output wor id_8,
    input wor id_9,
    output uwire id_10,
    input uwire id_11,
    output uwire id_12,
    output supply0 id_13,
    input tri id_14
);
  assign id_13 = id_2;
  tri  id_16 = 'b0;
  wand id_17 = 1, id_18;
  always @(posedge 1) id_17 = id_9;
  supply1 id_19;
  supply0 id_20 = 1 + id_19;
  wire id_21;
endmodule
module module_1 (
    output wand id_0,
    input wand id_1,
    input supply0 id_2,
    output supply1 id_3,
    output wand id_4,
    input wand id_5,
    output tri id_6,
    output wand id_7
);
  wire id_9;
  logic [7:0] id_10;
  assign id_10[1] = id_2;
  id_11 :
  assert property (@(1) id_11)
  else assert (1);
  wire id_12;
  wire id_13;
  always @(posedge 1);
  wire id_14;
  module_0(
      id_2, id_1, id_5, id_6, id_2, id_5, id_5, id_1, id_3, id_2, id_4, id_2, id_3, id_6, id_2
  );
endmodule

// Seed: 956468362
module module_0 (
    output wor id_0,
    input uwire id_1,
    output tri id_2,
    input wor id_3,
    output uwire id_4,
    output tri0 id_5,
    output wor id_6,
    input wire id_7,
    input tri id_8,
    input tri id_9,
    input wand id_10,
    input wire id_11,
    output tri1 id_12,
    output tri0 id_13,
    output wire id_14,
    input tri id_15,
    output tri0 id_16,
    input tri1 id_17,
    output supply1 id_18,
    output uwire id_19,
    input wor id_20
);
  wor id_22 = id_3;
  assign id_19 = 1 & 1;
  assign id_4  = 1;
endmodule
module module_1 (
    input supply0 id_0,
    output supply1 id_1,
    input wor id_2,
    input wire id_3,
    input wand id_4,
    input tri id_5,
    input uwire id_6,
    output uwire id_7,
    input wand id_8,
    input supply1 id_9,
    input supply0 id_10,
    output supply1 id_11,
    output tri id_12,
    output wor id_13
);
  id_15 :
  assert property (@(posedge (id_9) - {1, id_4}) id_3)
  else $display(1, {id_5, 1, {id_9, id_5}, id_4}, id_8);
  module_0(
      id_13,
      id_6,
      id_11,
      id_4,
      id_1,
      id_11,
      id_7,
      id_4,
      id_4,
      id_5,
      id_9,
      id_10,
      id_7,
      id_12,
      id_7,
      id_15,
      id_1,
      id_3,
      id_15,
      id_7,
      id_10
  );
endmodule

// Seed: 2035366042
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input tri1 id_2,
    input tri1 id_3,
    output tri id_4,
    input wor id_5,
    input tri1 id_6,
    input uwire id_7,
    input uwire id_8,
    output uwire id_9,
    input tri0 id_10,
    input tri id_11,
    output tri id_12,
    output supply0 id_13,
    input wor id_14,
    output tri0 id_15,
    input supply1 id_16,
    input supply0 id_17,
    input wor id_18,
    output tri id_19
    , id_37,
    input tri id_20,
    output wor id_21,
    input tri0 id_22,
    output tri id_23,
    output tri1 id_24,
    output tri1 id_25,
    input wire id_26,
    output wor id_27
    , id_38,
    input wor id_28,
    input supply0 id_29,
    input wand id_30,
    input wor id_31,
    output tri1 id_32,
    input tri1 id_33,
    input wand id_34,
    input tri0 id_35
);
endmodule
module module_1 (
    output wire  id_0,
    output tri   id_1,
    input  wand  id_2,
    input  wand  id_3
    , id_6,
    input  uwire id_4
);
  id_7 :
  assert property (@(1) 1)
  else id_6 = id_2;
  wand id_8 = 1;
  xor (id_0, id_6, id_2, id_4, id_8, id_3, id_7);
  module_0(
      id_2,
      id_6,
      id_6,
      id_6,
      id_0,
      id_4,
      id_6,
      id_6,
      id_3,
      id_0,
      id_3,
      id_6,
      id_6,
      id_1,
      id_2,
      id_6,
      id_3,
      id_3,
      id_3,
      id_0,
      id_4,
      id_0,
      id_4,
      id_1,
      id_0,
      id_1,
      id_4,
      id_1,
      id_3,
      id_4,
      id_6,
      id_3,
      id_0,
      id_4,
      id_3,
      id_6
  );
endmodule

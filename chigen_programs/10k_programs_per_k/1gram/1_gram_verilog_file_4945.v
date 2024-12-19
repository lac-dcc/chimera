// Seed: 4221264187
module module_0 (
    input tri id_0,
    input tri1 id_1,
    input wand id_2,
    output uwire id_3,
    input wand id_4,
    input uwire id_5,
    input wand id_6,
    output tri1 id_7,
    input supply1 id_8,
    input tri0 id_9,
    output tri1 id_10,
    input wor id_11,
    input wor id_12,
    input wire id_13,
    input tri0 id_14,
    output tri id_15,
    input wand id_16,
    input wand id_17,
    output tri0 id_18,
    input supply1 id_19,
    output tri id_20,
    input uwire id_21,
    input tri0 id_22
);
  assign id_20 = 1;
endmodule
module module_1 (
    output logic id_0,
    output supply1 id_1,
    output wand id_2,
    output supply1 id_3,
    input supply0 id_4
    , id_9,
    input wor id_5,
    input logic id_6,
    input supply0 id_7
);
  supply1 id_10;
  and primCall (id_1, id_7, id_10, id_9, id_6, id_4, id_5);
  module_0 modCall_1 (
      id_10,
      id_5,
      id_4,
      id_1,
      id_4,
      id_5,
      id_10,
      id_1,
      id_10,
      id_5,
      id_1,
      id_4,
      id_5,
      id_10,
      id_10,
      id_3,
      id_7,
      id_5,
      id_3,
      id_10,
      id_3,
      id_10,
      id_7
  );
  assign modCall_1.id_10 = 0;
  assign id_9 = id_6;
  initial if (1) #1 #id_11 id_9 <= id_6;
  assign id_0 = id_9;
  always id_10 = id_4;
endmodule

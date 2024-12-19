// Seed: 1593430627
module module_0 (
    output wire id_0,
    input wire id_1,
    output tri0 id_2,
    input supply0 id_3,
    input tri1 id_4,
    input wand id_5,
    input uwire id_6,
    output wire id_7,
    output wire id_8,
    input tri0 id_9,
    input wor id_10,
    input tri0 id_11,
    input supply1 id_12,
    output wor id_13,
    input supply1 id_14,
    input wand id_15,
    input wor id_16
);
  assign id_13 = 1;
  wire id_18;
  tri0 id_19;
  id_20 :
  assert property (@(negedge 1) id_19)
  else;
  wire id_21;
endmodule
module module_1 (
    input tri1 id_0,
    input tri1 id_1,
    output tri id_2,
    input supply1 id_3,
    input uwire id_4,
    input tri1 id_5,
    output supply1 id_6,
    input tri1 id_7,
    input supply0 id_8,
    output tri0 id_9,
    input supply1 id_10,
    output tri1 id_11,
    input supply0 id_12,
    output wor id_13,
    input wor id_14,
    output supply0 id_15,
    output wor id_16
);
  assign id_2 = id_3;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_13,
      id_5,
      id_1,
      id_5,
      id_8,
      id_11,
      id_16,
      id_7,
      id_4,
      id_14,
      id_10,
      id_2,
      id_1,
      id_12,
      id_3
  );
  assign modCall_1.type_11 = 0;
  assign id_9 = 1;
endmodule

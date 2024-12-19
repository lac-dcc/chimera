// Seed: 2550285538
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input wor id_2,
    input supply0 id_3,
    input supply0 id_4,
    output wor id_5,
    input wand id_6,
    output wor id_7,
    output supply1 id_8,
    input uwire id_9,
    input wor id_10,
    input tri1 id_11,
    output wand id_12,
    input supply0 id_13,
    output wor id_14,
    output wire id_15,
    output wand id_16,
    output wand id_17,
    input supply0 id_18,
    output wor id_19,
    input uwire id_20,
    input wand id_21,
    output tri id_22,
    input wand id_23
);
  assign id_8 = id_20;
  tri1 id_25 = id_18;
  wire id_26;
endmodule
module module_1 (
    input tri id_0,
    output tri id_1,
    input tri0 id_2,
    output supply0 id_3,
    output uwire id_4,
    input tri id_5
);
  logic [7:0] id_7;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_5,
      id_2,
      id_5,
      id_3,
      id_5,
      id_1,
      id_1,
      id_5,
      id_0,
      id_2,
      id_4,
      id_0,
      id_1,
      id_1,
      id_1,
      id_3,
      id_2,
      id_3,
      id_5,
      id_5,
      id_3,
      id_2
  );
  assign modCall_1.type_11 = 0;
  assign id_4 = {id_2{1}} < id_7[1];
  wire id_8;
  wire id_9;
  wire id_10;
  and primCall (id_4, id_2, id_0, id_7, id_5);
  wire id_11;
endmodule

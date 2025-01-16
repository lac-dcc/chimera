// Seed: 2144180044
module module_0 (
    input supply1 id_0,
    output wand id_1,
    input wand id_2,
    input wire id_3,
    output uwire id_4,
    input supply1 id_5,
    input uwire id_6,
    input tri0 id_7,
    input tri1 id_8,
    input supply1 id_9,
    input wire id_10,
    output tri1 id_11,
    output tri0 id_12,
    input supply0 id_13,
    input tri1 id_14,
    output tri0 id_15,
    input tri id_16,
    input tri0 id_17,
    output wor id_18,
    output tri1 id_19,
    output uwire id_20,
    input uwire id_21,
    input tri id_22,
    output wand id_23
);
  assign id_18 = id_0 >= id_21;
  assign id_4  = id_0;
  wire  id_25 = id_9 + 1;
  wire  id_26;
  uwire id_27 = 1, id_28;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input wand id_0,
    input tri1 id_1,
    input uwire id_2,
    input supply1 id_3,
    input uwire id_4,
    output supply1 id_5,
    output wire id_6,
    output supply0 id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_1,
      id_0,
      id_5,
      id_3,
      id_0,
      id_1,
      id_3,
      id_2,
      id_4,
      id_5,
      id_5,
      id_1,
      id_3,
      id_6,
      id_2,
      id_4,
      id_5,
      id_5,
      id_7,
      id_2,
      id_2,
      id_5
  );
endmodule

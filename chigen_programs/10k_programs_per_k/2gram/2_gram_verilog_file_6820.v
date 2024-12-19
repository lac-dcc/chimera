// Seed: 4151590726
module module_0 (
    output tri id_0,
    input supply1 id_1,
    input supply0 id_2,
    input tri id_3,
    input wand id_4,
    output supply1 id_5,
    input wand id_6,
    output wire id_7,
    output tri1 id_8,
    output supply1 id_9,
    input wand id_10,
    input supply1 id_11,
    input supply0 id_12,
    output wor id_13,
    output wire id_14,
    input wand id_15,
    output tri id_16,
    output uwire id_17,
    output wor id_18,
    output wand id_19,
    input tri id_20
);
  assign module_1.type_2 = 0;
  wire id_22;
endmodule
module module_1 (
    output supply1 id_0,
    output wor id_1,
    input tri id_2,
    output uwire id_3,
    input tri1 id_4,
    input wire id_5
);
  supply1 id_7;
  assign id_7 = id_2 >= id_4;
  xor primCall (id_0, id_7, id_8, id_5, id_2);
  wire id_8;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_5,
      id_4,
      id_1,
      id_5,
      id_3,
      id_3,
      id_3,
      id_4,
      id_5,
      id_5,
      id_3,
      id_3,
      id_2,
      id_0,
      id_3,
      id_3,
      id_3,
      id_4
  );
endmodule

// Seed: 3258704960
module module_0 (
    output tri1 id_0,
    input wor id_1,
    input tri id_2,
    input supply0 id_3,
    input tri0 id_4,
    input tri0 id_5,
    output wand id_6,
    output tri1 id_7,
    input wire id_8,
    input uwire id_9,
    input wand id_10,
    output tri0 id_11,
    output tri0 id_12,
    output tri0 id_13,
    input wor id_14,
    input wand id_15,
    output tri0 id_16,
    input wire id_17,
    output wand id_18,
    input tri0 id_19,
    input wand id_20,
    input tri id_21,
    inout wire id_22
);
  assign id_16 = id_9;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input supply1 id_1,
    input supply0 id_2,
    output supply0 id_3,
    input wor id_4
);
  assign id_3 = id_0;
  wire id_6;
  supply1 id_7;
  assign id_3 = 1 ^ 1;
  assign id_3 = id_7;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_7,
      id_2,
      id_7,
      id_0,
      id_7,
      id_3,
      id_2,
      id_4,
      id_0,
      id_7,
      id_7,
      id_7,
      id_1,
      id_7,
      id_7,
      id_7,
      id_3,
      id_7,
      id_1,
      id_0,
      id_7
  );
  assign {id_4, id_2, id_6 & id_0, 1} = id_0;
  specify
    (id_8 => id_9) = 1;
    $setup(posedge id_10, negedge id_11, id_8);
  endspecify
endmodule

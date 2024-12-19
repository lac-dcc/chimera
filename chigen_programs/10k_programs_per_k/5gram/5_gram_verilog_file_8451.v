// Seed: 2256589682
module module_0 (
    output supply0 id_0,
    input tri1 id_1,
    output supply1 id_2,
    input supply0 id_3,
    output supply0 id_4,
    output uwire id_5,
    input tri id_6,
    input wor id_7,
    output supply1 id_8
);
  wire id_10, id_11;
endmodule
module module_1 (
    output wor id_0,
    input tri0 id_1,
    input wand id_2,
    input supply0 id_3,
    output supply0 id_4,
    output uwire id_5,
    input tri id_6,
    output wand id_7,
    output supply1 id_8,
    input wire id_9,
    output tri id_10,
    output wire id_11,
    input wire id_12,
    inout supply1 id_13,
    output supply1 id_14
);
  supply1 id_16 = id_13;
  module_0 modCall_1 (
      id_16,
      id_9,
      id_14,
      id_3,
      id_5,
      id_7,
      id_2,
      id_12,
      id_14
  );
  assign modCall_1.id_8 = 0;
endmodule

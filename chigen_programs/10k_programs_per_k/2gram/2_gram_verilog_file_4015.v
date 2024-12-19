// Seed: 851326872
module module_0 (
    input uwire id_0,
    output uwire id_1,
    output wire id_2,
    input supply0 id_3,
    input wire id_4,
    input tri0 id_5,
    input wand id_6,
    input wand id_7,
    output wand id_8,
    input tri0 id_9,
    input wor id_10,
    output wand id_11,
    input uwire id_12,
    input supply1 id_13,
    output supply0 id_14,
    input wand id_15,
    input wire id_16
);
  assign id_1 = 1'h0;
  assign module_1.type_6 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input tri1 id_3
);
  supply0 id_5 = id_0;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_3,
      id_3,
      id_1,
      id_0,
      id_5,
      id_5,
      id_5,
      id_2,
      id_5,
      id_3,
      id_0,
      id_5,
      id_5,
      id_3
  );
endmodule

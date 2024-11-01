// Seed: 154282607
module module_0 (
    output tri id_0,
    input uwire id_1,
    input uwire id_2,
    input wand id_3,
    output wire id_4,
    input wor id_5,
    input supply0 module_0,
    input supply1 id_7,
    input wor id_8,
    input wor id_9,
    input uwire id_10,
    input uwire id_11,
    output uwire id_12,
    output supply0 id_13,
    input tri id_14,
    output tri id_15,
    input supply1 id_16,
    output wire id_17,
    output wand id_18,
    input supply1 id_19,
    input supply0 id_20,
    output supply1 id_21,
    input tri id_22
);
  assign id_21 = id_19 && id_1;
  wire id_24;
  wire id_25;
endmodule
module module_1 (
    output uwire id_0,
    input wire id_1,
    output wor id_2,
    output wire id_3,
    input tri0 id_4,
    input supply0 id_5
);
  wand id_7;
  module_0(
      id_3,
      id_5,
      id_5,
      id_1,
      id_3,
      id_1,
      id_1,
      id_1,
      id_5,
      id_5,
      id_1,
      id_4,
      id_2,
      id_0,
      id_1,
      id_2,
      id_1,
      id_3,
      id_2,
      id_5,
      id_1,
      id_3,
      id_5
  );
  assign id_7 = 1;
  xor (id_2, id_7, id_5, id_4, id_1);
endmodule

// Seed: 2362890019
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    output tri id_2,
    input wor id_3,
    input tri1 id_4,
    input tri0 id_5,
    output wire id_6,
    input tri0 id_7,
    input tri0 id_8,
    output tri id_9,
    input wor id_10,
    output tri0 id_11,
    input tri0 id_12,
    input tri0 id_13,
    input wand id_14,
    output tri1 id_15,
    output tri0 id_16,
    input wor id_17,
    input tri0 id_18,
    input wire id_19,
    output wor id_20,
    output wire id_21,
    output tri1 id_22,
    input supply0 id_23,
    input wand id_24
);
  wire id_26;
  assign id_6 = 1;
  wire id_27;
  wire id_28;
endmodule
module module_1 (
    output wand id_0,
    input tri id_1,
    input tri1 id_2,
    input supply1 id_3,
    output wand id_4,
    input wire id_5,
    input wand id_6
);
  assign id_4 = 1 + 1'h0;
  nor (id_4, id_5, id_6, id_3);
  module_0(
      id_0,
      id_5,
      id_4,
      id_2,
      id_5,
      id_3,
      id_4,
      id_1,
      id_2,
      id_4,
      id_3,
      id_4,
      id_6,
      id_6,
      id_1,
      id_4,
      id_0,
      id_3,
      id_2,
      id_6,
      id_0,
      id_0,
      id_4,
      id_2,
      id_2
  );
endmodule

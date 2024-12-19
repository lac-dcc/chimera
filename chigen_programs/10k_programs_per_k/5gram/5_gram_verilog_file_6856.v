// Seed: 616300086
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    input uwire id_2,
    input uwire id_3,
    input tri id_4,
    input tri id_5,
    input wire id_6,
    input supply0 id_7,
    input supply0 id_8,
    input wor id_9,
    input wire id_10,
    output supply1 id_11,
    output wor id_12,
    output tri0 id_13,
    output uwire id_14,
    output wand id_15,
    input tri1 id_16,
    output tri0 id_17,
    output tri1 id_18,
    input tri0 id_19,
    output tri0 id_20,
    input supply1 id_21,
    output supply0 id_22,
    output supply1 id_23,
    input tri0 id_24
);
  assign id_17 = "" < id_9;
  assign id_12 = (1);
endmodule
module module_1 (
    input  tri  id_0,
    input  wire id_1,
    input  wire id_2,
    input  wand id_3,
    output tri0 id_4
);
  wire id_6, id_7, id_8;
  wire id_9 = ~id_2;
  wire id_10 = 0 ==? id_0;
  wire id_11, id_12;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_1,
      id_1,
      id_3,
      id_3,
      id_2,
      id_1,
      id_0,
      id_0,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_2,
      id_4,
      id_0,
      id_4,
      id_4,
      id_3
  );
  assign modCall_1.type_6 = 0;
endmodule

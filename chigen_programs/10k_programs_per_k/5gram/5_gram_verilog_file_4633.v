// Seed: 4069991631
module module_0 (
    output wor id_0,
    input tri0 id_1,
    input wand id_2,
    input tri1 id_3,
    output supply1 id_4,
    output wire id_5,
    input supply1 id_6,
    input wand id_7,
    input wor id_8,
    output wor id_9,
    input uwire id_10,
    output tri id_11,
    input supply1 id_12,
    input tri id_13,
    input tri id_14,
    input wand id_15,
    input wor id_16,
    input wire id_17,
    input tri0 id_18,
    input supply0 id_19,
    input tri id_20,
    input supply1 id_21,
    input tri0 id_22,
    output tri1 id_23,
    output tri1 id_24,
    input supply1 id_25,
    input supply0 id_26,
    output wand id_27
);
  assign id_23 = {1, id_22, 1, 1, id_10 * 1 - !id_7, id_25, 1, 1};
  tri1 id_29;
  assign id_5 = id_6;
  id_30(
      .id_0(id_13 ==? id_4), .id_1(id_29++), .id_2(1), .id_3(id_6 + 1), .id_4(1)
  );
endmodule
module module_1 (
    input  tri  id_0,
    output wire id_1,
    output wand id_2,
    input  tri0 id_3,
    input  wand id_4,
    output tri1 id_5,
    output wand id_6
);
  assign id_5 = 1;
  assign id_1 = 1;
  uwire id_8 = (1), id_9;
  module_0(
      id_5,
      id_3,
      id_4,
      id_0,
      id_5,
      id_5,
      id_0,
      id_0,
      id_3,
      id_2,
      id_4,
      id_5,
      id_0,
      id_4,
      id_3,
      id_0,
      id_3,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_3,
      id_5,
      id_2,
      id_0,
      id_3,
      id_6
  );
  assign id_6 = 1'b0 == id_3;
endmodule

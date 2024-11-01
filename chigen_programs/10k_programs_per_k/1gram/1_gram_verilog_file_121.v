// Seed: 130368236
module module_0 (
    input wor id_0,
    input wor id_1,
    output supply0 id_2,
    output wand id_3,
    input wor id_4,
    input tri1 id_5,
    input tri1 id_6,
    input wire id_7,
    output tri1 id_8,
    input tri1 id_9,
    input tri id_10,
    input tri0 id_11,
    output wor id_12,
    output tri id_13,
    output tri id_14,
    input uwire id_15,
    output tri1 id_16,
    output wand id_17,
    input tri0 id_18,
    input tri0 id_19,
    input wand id_20,
    output wand id_21,
    output supply0 id_22,
    input wor id_23
);
  assign id_16 = {id_18 * 1{id_6}} && 1;
  wor id_25 = 1, id_26, id_27;
  wire id_28;
  wire id_29;
  wire id_30, id_31;
  integer id_32 (.id_0(1));
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    output supply0 id_2,
    input supply1 id_3,
    input uwire id_4,
    output tri1 id_5
);
  assign id_2 = id_4;
  tri1 id_7 = id_3;
  wire id_8, id_9, id_10;
  wire id_11, id_12;
  module_0(
      id_4,
      id_3,
      id_2,
      id_5,
      id_1,
      id_4,
      id_4,
      id_7,
      id_5,
      id_0,
      id_0,
      id_1,
      id_2,
      id_7,
      id_2,
      id_0,
      id_5,
      id_5,
      id_4,
      id_0,
      id_1,
      id_7,
      id_5,
      id_1
  );
endmodule

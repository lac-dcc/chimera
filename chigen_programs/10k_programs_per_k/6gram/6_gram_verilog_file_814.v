// Seed: 264004862
module module_0 (
    input wand id_0,
    inout wire id_1,
    input supply0 id_2,
    inout tri0 id_3,
    input wor id_4,
    output supply0 id_5,
    input supply1 id_6,
    output wor id_7,
    inout tri0 id_8,
    input wire id_9,
    input supply1 id_10,
    input tri1 id_11,
    input tri id_12,
    input wand id_13,
    output wor id_14,
    inout tri1 id_15,
    input supply1 id_16,
    output uwire id_17
    , id_22,
    input tri id_18,
    inout tri0 id_19,
    output wand id_20
);
  assign id_20 = 1'b0;
  assign id_5  = id_15;
endmodule
module module_1 (
    input supply1 id_0,
    output supply1 id_1,
    input wire id_2,
    input supply1 id_3,
    input wire id_4,
    input wire id_5,
    input tri id_6,
    input wire id_7,
    input wor id_8,
    output tri1 id_9
);
  wire id_11;
  assign id_1 = id_3;
  tri1 id_12 = id_2;
  nor (id_1, id_6, id_0, id_3, id_7, id_4, id_8, id_5, id_12);
  module_0(
      id_5,
      id_12,
      id_8,
      id_12,
      id_6,
      id_12,
      id_5,
      id_9,
      id_12,
      id_0,
      id_0,
      id_6,
      id_5,
      id_7,
      id_12,
      id_12,
      id_5,
      id_12,
      id_8,
      id_12,
      id_1
  );
endmodule

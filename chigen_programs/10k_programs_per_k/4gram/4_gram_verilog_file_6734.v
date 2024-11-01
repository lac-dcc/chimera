// Seed: 3872893848
module module_0 (
    input wand id_0,
    input supply0 id_1
    , id_22,
    output wor id_2,
    input tri1 id_3,
    input tri1 id_4,
    input wand id_5,
    input tri0 id_6,
    output tri0 id_7,
    input wor id_8,
    input wor id_9,
    output wire id_10,
    input tri1 id_11,
    output tri1 id_12,
    output tri id_13,
    input tri0 id_14,
    input wor id_15,
    input tri id_16,
    input tri id_17,
    input wand id_18,
    input wand id_19,
    output supply0 id_20
);
  wor id_23 = 1'h0;
  assign id_20 = $display;
endmodule
module module_1 (
    input uwire id_0,
    output wand id_1,
    output supply1 id_2,
    output uwire id_3,
    input wire id_4,
    input wand id_5,
    output tri id_6,
    input uwire id_7,
    output supply1 id_8
    , id_10
);
  assign id_10 = id_7 && id_5 || 1 - id_4 && 1;
  nor (id_6, id_5, id_0, id_10, id_4, id_7);
  module_0(
      id_5,
      id_5,
      id_1,
      id_4,
      id_4,
      id_5,
      id_0,
      id_1,
      id_7,
      id_5,
      id_1,
      id_0,
      id_2,
      id_1,
      id_4,
      id_5,
      id_7,
      id_5,
      id_7,
      id_7,
      id_6
  );
endmodule

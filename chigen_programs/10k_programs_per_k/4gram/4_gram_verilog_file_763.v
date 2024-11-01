// Seed: 2095211143
module module_0 (
    input wand id_0,
    input uwire id_1,
    input tri0 id_2,
    input uwire id_3,
    input wire id_4,
    input supply0 id_5,
    input wire id_6,
    input uwire id_7,
    input wand id_8
);
endmodule
module module_1 (
    input tri0 id_0,
    input wand id_1,
    input wand id_2,
    input wire id_3,
    output wor id_4,
    input wand id_5,
    output tri id_6,
    input uwire id_7,
    output tri id_8,
    input wand id_9,
    input wand id_10,
    output wire id_11,
    input wor id_12,
    output supply1 id_13,
    input tri0 id_14,
    output tri0 id_15,
    input uwire id_16
);
  logic [7:0] id_18;
  xor (id_11, id_2, id_1, id_16, id_5, id_3, id_18, id_0, id_7, id_9, id_12, id_14, id_10);
  assign id_18[1] = id_0;
  module_0(
      id_7, id_16, id_0, id_2, id_2, id_3, id_3, id_10, id_2
  );
endmodule

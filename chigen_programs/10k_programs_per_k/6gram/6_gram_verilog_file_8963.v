// Seed: 4184545273
module module_0 (
    input tri id_0,
    output wor id_1,
    input tri1 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input wand id_5,
    output supply1 id_6,
    input supply0 id_7,
    input supply1 id_8,
    input tri id_9,
    input wand id_10,
    output supply1 id_11,
    output wand id_12,
    input wire id_13,
    output wand id_14,
    output tri id_15
);
  wire id_17;
endmodule
module module_1 (
    input  wire  id_0,
    output logic id_1,
    output uwire id_2,
    input  tri0  id_3,
    output tri1  id_4
);
  always @(id_3 - -id_0 or 1) if (id_0) id_1 <= ~id_3;
  logic [7:0] id_6;
  nand (id_4, id_0, id_6, id_3);
  assign id_1 = id_6[1];
  module_0(
      id_3, id_4, id_0, id_3, id_0, id_3, id_4, id_3, id_3, id_3, id_3, id_2, id_2, id_3, id_4, id_4
  );
  assign id_4 = id_3;
endmodule

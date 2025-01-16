// Seed: 216985846
module module_0 (
    input wor id_0,
    input tri1 id_1,
    output tri1 id_2,
    input supply0 id_3,
    input supply0 id_4,
    input supply0 id_5,
    input wor id_6,
    output wire id_7,
    input wand id_8,
    output tri0 id_9,
    input wand id_10,
    input wand id_11,
    input wire id_12,
    input wor id_13,
    output supply0 id_14,
    input wand id_15,
    input tri1 id_16,
    input wor id_17
);
  assign id_2 = -1;
  assign module_1.id_3 = 0;
endmodule
module module_1 #(
    parameter id_12 = 32'd43,
    parameter id_13 = 32'd11
) (
    input wand id_0,
    output wand id_1,
    input tri0 id_2,
    input supply1 id_3,
    input uwire id_4,
    input wand id_5,
    input wand id_6,
    input tri id_7,
    input tri0 id_8,
    input wire id_9,
    input wor id_10
);
  defparam id_12 = -1, id_13 = -1;
  xnor primCall (id_1, id_5, id_0, id_14, id_12, id_8, id_7, id_6, id_2, id_9, id_13, id_4, id_10);
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_1,
      id_9,
      id_5,
      id_9,
      id_6,
      id_1,
      id_4,
      id_1,
      id_10,
      id_3,
      id_4,
      id_3,
      id_1,
      id_4,
      id_6,
      id_3
  );
endmodule

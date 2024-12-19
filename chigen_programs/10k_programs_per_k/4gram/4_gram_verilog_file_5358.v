// Seed: 164388212
module module_0;
  wire id_1 = id_1;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_19 = 32'd93,
    parameter id_20 = 32'd58
) (
    input wand id_0,
    input tri id_1,
    input supply0 id_2,
    output wand id_3,
    output supply1 id_4,
    input wand id_5,
    output wand id_6,
    input tri id_7,
    input supply0 id_8,
    input wor id_9,
    output tri id_10,
    output wor id_11,
    input uwire id_12,
    input uwire id_13,
    output wand id_14,
    input wand id_15,
    output tri0 id_16
);
  wire id_18;
  assign id_3 = id_2;
  nand primCall (id_10, id_12, id_13, id_15, id_18, id_19, id_2, id_20, id_5, id_7, id_8, id_9);
  defparam id_19.id_20 = 1;
  module_0 modCall_1 ();
endmodule

// Seed: 2583770437
module module_0 (
    input wor id_0,
    input uwire id_1,
    output supply1 id_2,
    input wor id_3
);
  assign module_1.id_8 = 0;
endmodule
module module_1 #(
    parameter id_13 = 32'd12,
    parameter id_14 = 32'd26,
    parameter id_4  = 32'd86,
    parameter id_8  = 32'd94
) (
    input tri id_0,
    input tri0 id_1,
    input tri id_2,
    input wire id_3,
    output tri1 _id_4,
    input supply1 id_5,
    input tri0 id_6,
    output wor id_7[id_4 : id_8],
    input wire _id_8,
    output logic id_9,
    input wand id_10,
    output tri0 id_11,
    input wand id_12,
    input uwire _id_13,
    input tri0 _id_14
);
  wire [id_14  <->  -1 : id_13] id_16, id_17, id_18;
  assign id_17 = id_0.id_10;
  nand primCall (id_9, id_5, id_12, id_1, id_6, id_0, id_3, id_18, id_10, id_16);
  wire id_19, id_20, id_21;
  id_22 :
  assert property (@(1 or -1) id_10) id_9 <= 1 & id_21;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_7,
      id_2
  );
endmodule

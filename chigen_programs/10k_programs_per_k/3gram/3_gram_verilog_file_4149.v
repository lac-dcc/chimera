// Seed: 814618137
module module_0 (
    output tri1 id_0,
    input wand id_1,
    output tri0 id_2,
    output tri0 id_3,
    output wand id_4,
    input uwire id_5,
    input supply1 id_6,
    input wand id_7,
    input tri1 id_8,
    input wand id_9
);
  wire id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18, id_19, id_20;
endmodule
module module_1 #(
    parameter id_4 = 32'd86
) (
    output supply1 id_0,
    output tri0 id_1,
    input tri0 id_2,
    input supply0 id_3,
    input supply1 _id_4,
    input tri id_5,
    input tri1 id_6,
    input tri0 id_7,
    input uwire id_8,
    output tri1 id_9,
    input tri0 id_10
);
  assign id_0 = -1;
  assign id_0 = id_8;
  parameter id_12 = (1) == 1;
  genvar id_13;
  assign id_0 = 1;
  parameter id_14 = id_12[id_4];
  assign id_9 = 1;
  and primCall (id_9, id_2, id_6, id_12, id_14, id_10, id_7, id_3, id_13);
  assign id_0 = id_8.id_10;
  always #(-1) id_13#(.id_14(id_12)) = ~1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_1,
      id_1,
      id_1,
      id_8,
      id_7,
      id_10,
      id_10,
      id_8
  );
endmodule

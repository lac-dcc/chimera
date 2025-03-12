// Seed: 4240725669
module module_0 (
    input wire id_0,
    input uwire id_1,
    output tri1 id_2,
    output wand id_3,
    input tri id_4,
    output uwire id_5,
    input supply0 id_6
);
  wire id_8;
endmodule
module module_1 #(
    parameter id_1 = 32'd45,
    parameter id_2 = 32'd95,
    parameter id_6 = 32'd22
) (
    output tri id_0,
    input tri0 _id_1,
    input wand _id_2,
    input wire id_3,
    output uwire id_4,
    output supply0 id_5,
    input supply1 _id_6,
    output tri0 id_7,
    input supply1 id_8,
    output tri0 id_9,
    input uwire id_10,
    input supply0 id_11,
    input uwire id_12,
    input supply1 id_13
);
  wire [id_6 : 1] id_15;
  nand primCall (id_4, id_3, id_15, id_12, id_8, id_13, id_11, id_10);
  module_0 modCall_1 (
      id_11,
      id_3,
      id_9,
      id_4,
      id_10,
      id_4,
      id_3
  );
  assign modCall_1.id_2 = 0;
  wire [id_2 : id_1] id_16;
endmodule

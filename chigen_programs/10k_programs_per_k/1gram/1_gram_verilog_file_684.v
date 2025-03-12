// Seed: 2600242440
module module_0 (
    output supply1 id_0,
    input tri id_1,
    input uwire id_2
    , id_16,
    input tri id_3,
    output wire id_4,
    output wire id_5,
    input tri1 id_6,
    output uwire id_7,
    input wire id_8,
    input tri1 id_9,
    input tri1 id_10,
    output wor id_11,
    output wand id_12,
    output tri0 id_13,
    output uwire id_14
);
  assign id_16 = 1;
  genvar id_17;
endmodule
module module_1 #(
    parameter id_1 = 32'd52,
    parameter id_4 = 32'd20,
    parameter id_5 = 32'd57
) (
    input supply0 id_0,
    input wor _id_1,
    output tri1 id_2
);
  assign id_2 = id_1 <-> 1;
  logic _id_4;
  ;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_0,
      id_2,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_16 = 0;
  wire _id_5[id_4 : id_1];
  wire [-1  >>  id_5 : 1] id_6;
endmodule

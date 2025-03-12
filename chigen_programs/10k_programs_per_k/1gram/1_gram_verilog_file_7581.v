// Seed: 1920978282
module module_0 (
    input tri1 id_0,
    output wor id_1,
    input supply0 id_2,
    output supply1 id_3,
    input tri0 id_4,
    input supply0 id_5,
    input tri id_6
);
  wire id_8;
  wire id_9, id_10;
  wor id_11;
  assign id_11 = -1 == id_0;
endmodule
module module_1 #(
    parameter id_11 = 32'd26,
    parameter id_4  = 32'd72
) (
    input uwire id_0,
    input supply0 id_1,
    output tri id_2,
    output tri id_3[id_4  |  1  ^  1 : id_11],
    input supply1 _id_4,
    input wire id_5,
    input uwire id_6,
    input uwire id_7,
    input wor id_8,
    input wor id_9,
    input uwire id_10,
    output uwire _id_11,
    input tri id_12
);
  assign id_3 = id_0;
  module_0 modCall_1 (
      id_12,
      id_2,
      id_1,
      id_2,
      id_7,
      id_1,
      id_10
  );
  assign modCall_1.id_4 = 0;
endmodule

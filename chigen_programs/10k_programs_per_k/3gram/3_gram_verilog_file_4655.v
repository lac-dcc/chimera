// Seed: 3873532713
module module_0 (
    output wor id_0,
    output tri1 id_1,
    output tri1 id_2,
    input supply0 id_3,
    input supply0 id_4,
    input wor id_5,
    output tri1 id_6,
    input tri0 id_7,
    output wor id_8,
    input uwire id_9,
    output supply0 id_10,
    input uwire id_11,
    input wor id_12,
    output uwire id_13,
    input tri0 id_14,
    output wand id_15,
    input wor id_16,
    input wor id_17,
    input supply1 id_18
);
  wor id_20 = -1;
  assign id_10 = id_5;
  tri1 id_21 = 1;
  assign id_21 = id_14;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_1 = 32'd7,
    parameter id_3 = 32'd92
) (
    output supply0 id_0,
    output supply0 _id_1,
    input supply1 id_2,
    output tri1 _id_3,
    output supply1 id_4
);
  logic [7:0] id_6 = id_2;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_0,
      id_2,
      id_2,
      id_2,
      id_4,
      id_2,
      id_4,
      id_2,
      id_0,
      id_2,
      id_2,
      id_4,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2
  );
  wire id_7 = id_2;
  logic [-1 : id_1] id_8;
  ;
endmodule

// Seed: 3112007002
module module_0 (
    input supply1 id_0,
    output wor id_1,
    output wire id_2,
    input tri1 id_3,
    input uwire id_4,
    input supply1 id_5,
    input wor id_6,
    output wor id_7,
    output supply1 id_8,
    input tri0 id_9,
    output wor id_10
);
  logic [-1 : 1] id_12;
  ;
  logic id_13;
  logic id_14;
  ;
  assign module_1.id_3 = 0;
  generate
    assign id_12 = id_9 ? id_4 > id_13 : -1;
  endgenerate
endmodule
module module_1 #(
    parameter id_5 = 32'd92
) (
    output wand id_0,
    input tri0 id_1,
    input uwire id_2,
    output tri id_3,
    output wor id_4,
    input supply1 _id_5,
    output tri id_6,
    input tri0 id_7,
    input wand id_8
);
  wire [id_5  ==  1 : id_5] id_10;
  wire id_11;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_3,
      id_8,
      id_8,
      id_7,
      id_1,
      id_3,
      id_0,
      id_1,
      id_0
  );
endmodule

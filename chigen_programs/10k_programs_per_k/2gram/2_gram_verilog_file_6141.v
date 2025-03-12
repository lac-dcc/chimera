// Seed: 2171790840
module module_0 (
    output supply0 id_0,
    input uwire id_1,
    output tri0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    input wor id_5,
    output wor id_6,
    output wire id_7
);
  wire id_9;
  wire id_10;
  wire [(  1  ) : 1] id_11;
endmodule
module module_1 #(
    parameter id_5 = 32'd77
) (
    input tri id_0,
    output wand id_1,
    input supply0 id_2,
    input tri0 id_3,
    input tri1 id_4,
    input uwire _id_5,
    output tri1 id_6,
    input tri1 id_7,
    output wor id_8
);
  assign id_1 = id_5;
  module_0 modCall_1 (
      id_8,
      id_0,
      id_6,
      id_0,
      id_7,
      id_4,
      id_6,
      id_6
  );
  assign modCall_1.id_0 = 0;
  logic [id_5 : -1 'b0] id_10;
  ;
endmodule

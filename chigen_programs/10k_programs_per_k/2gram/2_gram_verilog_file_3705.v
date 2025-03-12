// Seed: 1393931471
module module_0 (
    output tri0 id_0,
    output wor id_1,
    output uwire id_2,
    input wor id_3,
    input uwire id_4,
    output uwire id_5,
    input wire id_6,
    output uwire id_7,
    input tri1 id_8,
    output wor id_9,
    output supply0 id_10,
    input wand id_11
);
  assign id_5 = id_11;
  assign module_2.id_4 = 0;
endmodule
module module_1 (
    output wire  id_0,
    input  uwire id_1
);
  wire id_3;
  wire id_4;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_8 = 0;
endmodule
module module_2 #(
    parameter id_3 = 32'd77,
    parameter id_4 = 32'd90
) (
    input tri1 id_0,
    output supply0 id_1,
    input tri id_2,
    input wand _id_3,
    output tri0 _id_4,
    input tri1 id_5,
    input uwire id_6,
    input tri1 id_7,
    input supply0 id_8#(
        .id_11(1 > 1),
        .id_12(1),
        .id_13(-1)
    ),
    input tri id_9
);
  logic id_14;
  ;
  assign id_12 = id_14;
  wire id_15;
  logic [id_4 : id_3] id_16;
  ;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_9,
      id_5,
      id_1,
      id_6,
      id_1,
      id_2,
      id_1,
      id_1,
      id_9
  );
endmodule

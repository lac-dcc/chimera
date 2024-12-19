// Seed: 2940577571
module module_0 (
    output wor id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri0 id_3,
    input wire id_4,
    output wire id_5
);
  wire id_7, id_8;
  module_2 modCall_1 (
      id_2,
      id_5,
      id_4,
      id_1,
      id_3,
      id_4
  );
  assign modCall_1.id_12 = 0;
endmodule
module module_1 (
    output wor id_0,
    input  tri id_1
);
  uwire id_3;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_1,
      id_3,
      id_0
  );
  assign modCall_1.type_1 = 0;
  assign id_0 = id_3;
  wire id_4;
  assign id_3 = id_1 - 1'b0;
  id_5(
      1'b0, 1'b0, 1'b0
  );
endmodule
module module_2 #(
    parameter id_12 = 32'd78,
    parameter id_13 = 32'd88
) (
    input  uwire id_0,
    output tri0  id_1
    , id_7,
    input  wor   id_2,
    input  wor   id_3,
    input  tri   id_4,
    input  uwire id_5
);
  assign id_1 = id_7[1 : 1];
  wor id_8;
  tri1 id_9, id_10, id_11 = 1;
  defparam id_12 = id_8 > 1'b0, id_13 = ~1;
endmodule

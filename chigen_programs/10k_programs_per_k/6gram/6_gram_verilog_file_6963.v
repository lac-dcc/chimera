// Seed: 2470385433
module module_0 (
    input  uwire id_0,
    input  tri   id_1,
    input  wor   id_2,
    input  tri0  id_3,
    output wor   id_4,
    output tri1  id_5
);
endmodule
module module_1 #(
    parameter id_10 = 32'd29,
    parameter id_11 = 32'd73
) (
    output supply0 id_0,
    input tri0 id_1,
    input tri1 id_2,
    output supply1 id_3,
    input tri0 id_4,
    output tri0 id_5,
    input supply1 id_6,
    output tri0 id_7
);
  wire id_9 = 1 && id_6 == 1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_1,
      id_5,
      id_3
  );
  assign modCall_1.type_2 = 0;
  defparam id_10.id_11 = 1 == id_9;
  wire id_12;
  id_13(
      .id_0(id_5), .id_1(1'd0), .id_2(~id_0), .id_3(id_4), .id_4(id_6)
  );
endmodule

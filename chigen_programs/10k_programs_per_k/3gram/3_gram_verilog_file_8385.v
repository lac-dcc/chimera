// Seed: 1037029943
module module_0 (
    output supply0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    output tri id_3
    , id_13,
    input tri1 id_4,
    output tri1 id_5,
    input supply1 id_6,
    output uwire id_7,
    input tri1 id_8,
    output supply0 id_9,
    output wor id_10,
    output wor id_11
);
  wire id_14;
  generate
    assign id_5 = 1;
  endgenerate
endmodule
module module_1 (
    input  wor  id_0,
    output wand id_1
);
  always @(1'b0) id_1 = id_0;
  assign id_1 = 1'b0;
  tri1 id_3;
  if (id_3 == 1) assign #1 id_3 = 1;
  else wire id_4;
  wire id_5;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.type_4 = 0;
  id_6(
      .id_0(1'b0), .id_1(1), .id_2(1), .id_3(1'b0)
  );
endmodule

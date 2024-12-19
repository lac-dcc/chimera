// Seed: 1810186599
module module_0 (
    input uwire id_0,
    input tri0 id_1,
    output supply1 id_2
    , id_14,
    input wire id_3,
    input tri1 id_4,
    input wire id_5,
    input wire id_6,
    input supply1 id_7,
    input wor id_8,
    input wor id_9,
    output tri0 id_10,
    output tri1 id_11,
    input tri id_12
);
  assign id_2 = 1'h0;
endmodule
module module_1 (
    input wor id_0,
    output supply0 id_1,
    input tri id_2,
    input tri0 id_3,
    input tri0 id_4,
    input tri0 id_5,
    input wire id_6,
    output wor id_7,
    output supply1 id_8,
    input tri1 id_9,
    input uwire id_10
);
  wire id_12;
  wire id_13;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_8,
      id_5,
      id_2,
      id_9,
      id_9,
      id_10,
      id_10,
      id_5,
      id_1,
      id_1,
      id_6
  );
  assign modCall_1.id_11 = 0;
  id_14(
      .id_0(id_4), .id_1(!1), .id_2('b0)
  );
endmodule

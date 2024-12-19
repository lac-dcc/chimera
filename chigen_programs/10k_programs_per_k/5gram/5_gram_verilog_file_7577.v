// Seed: 3103054516
module module_0 #(
    parameter id_15 = 32'd45,
    parameter id_16 = 32'd14
) (
    output supply1 id_0,
    input tri0 id_1,
    input wor id_2
    , id_13,
    output supply1 id_3,
    output wor id_4,
    output wand id_5,
    output wor id_6,
    input wor id_7,
    input uwire id_8
    , id_14,
    input supply1 id_9,
    input tri1 id_10,
    input wor id_11
);
  defparam id_15.id_16 = id_11 & id_14 & 1;
  assign module_1.type_2 = 0;
  id_17(
      .id_0(id_9),
      .id_1(id_6),
      .id_2(id_9),
      .id_3(1'b0),
      .id_4(!(1)),
      .id_5(1),
      .product(1),
      .id_6(id_9)
  );
  wire id_18;
  wire id_19;
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    output supply1 id_2,
    input supply0 id_3,
    input wor id_4,
    input wire id_5,
    input supply1 id_6,
    output wor id_7,
    output wire id_8,
    input uwire id_9,
    input uwire id_10,
    input tri id_11,
    input tri id_12,
    output tri0 id_13,
    input tri1 id_14,
    input tri0 id_15,
    output tri0 id_16,
    input supply1 id_17
);
  assign id_7 = id_12;
  module_0 modCall_1 (
      id_7,
      id_11,
      id_17,
      id_2,
      id_2,
      id_13,
      id_13,
      id_10,
      id_11,
      id_17,
      id_5,
      id_15
  );
endmodule

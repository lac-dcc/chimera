// Seed: 2484134763
module module_0 #(
    parameter id_18 = 32'd19,
    parameter id_19 = 32'd99
) (
    input tri0 id_0,
    input wand id_1,
    output tri id_2,
    input tri0 id_3,
    output uwire id_4,
    input tri0 id_5,
    input wor id_6,
    input tri0 id_7,
    input uwire id_8,
    input tri1 id_9,
    input supply0 id_10,
    input wire id_11,
    output wand id_12
);
  supply0 id_14;
  always id_14 = {1, 1};
  wire id_15;
  wire id_16;
  id_17(
      .id_0(id_6),
      .id_1(1),
      .id_2(id_8),
      .id_3(1),
      .id_4((1 == id_14)),
      .id_5(id_14++),
      .id_6(1),
      .id_7(1)
  ); defparam id_18.id_19 = 1;
  always_ff id_15 = 1;
  assign id_4 = 1;
endmodule
module module_1 (
    input wor id_0,
    input supply1 id_1,
    output tri1 id_2,
    input tri1 id_3,
    output tri id_4,
    output wor id_5,
    output tri1 id_6,
    input uwire id_7,
    input uwire id_8,
    input tri1 id_9,
    input uwire id_10,
    input tri0 id_11,
    input tri id_12,
    input tri id_13
    , id_18,
    output supply0 id_14,
    input wor id_15,
    input tri0 id_16
);
  integer id_19;
  module_0(
      id_0, id_10, id_6, id_9, id_4, id_3, id_18, id_9, id_15, id_3, id_9, id_18, id_14
  );
  assign id_18 = id_9;
  wire id_20;
endmodule

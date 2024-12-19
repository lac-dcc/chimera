// Seed: 1105220971
module module_0 (
    input wire id_0,
    input tri id_1,
    output tri id_2,
    output tri1 id_3,
    input tri id_4,
    input wor id_5,
    input tri id_6,
    input wire id_7,
    input supply1 id_8,
    output supply1 id_9,
    output supply1 id_10,
    output wire id_11,
    input supply0 module_0,
    input tri0 id_13,
    input tri0 id_14
);
  supply0 id_16 = id_8;
  wire id_17;
  generate
    wire id_18;
  endgenerate
endmodule
module module_1 (
    input uwire id_0
    , id_12,
    input wire id_1,
    input wand id_2,
    output supply0 id_3,
    output supply0 id_4,
    input tri0 id_5,
    input wire id_6,
    input wor id_7,
    output uwire id_8,
    output supply1 id_9,
    input wand id_10
);
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8,
      id_8,
      id_6,
      id_5,
      id_5,
      id_7,
      id_1,
      id_8,
      id_9,
      id_8,
      id_5,
      id_7,
      id_10
  );
  assign modCall_1.type_2 = 0;
  integer id_13 (
      .id_0(id_8),
      .id_1(id_0),
      .id_2((1'b0)),
      .id_3(id_1 + ~{id_0 << 1'b0, 1, id_0}),
      .id_4(1'b0)
  );
endmodule

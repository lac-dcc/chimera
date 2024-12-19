// Seed: 1437601621
module module_0 (
    input wire id_0,
    input supply0 id_1,
    input supply0 id_2,
    input wire id_3,
    input supply0 id_4,
    output wor id_5,
    input wire id_6
    , id_14,
    input wire id_7,
    input supply1 id_8,
    input uwire id_9,
    output supply1 id_10,
    input wand id_11,
    output tri1 id_12
);
  always @(1'b0 or 1)
    if (id_14 & 'h0) id_5 = 1 - {1, id_7};
    else deassign id_5;
  tri1  id_15;
  uwire id_16 = 1'h0;
  assign id_15 = id_9;
  wire id_17;
endmodule
module module_1 (
    input wand id_0,
    output wand id_1,
    input wand id_2,
    input wire id_3,
    output tri id_4,
    output uwire id_5,
    input tri0 id_6,
    output supply1 id_7,
    input wor id_8,
    input tri0 id_9,
    input wand id_10
);
  generate
    uwire id_12 = id_10;
  endgenerate
  module_0 modCall_1 (
      id_10,
      id_10,
      id_8,
      id_8,
      id_6,
      id_5,
      id_3,
      id_9,
      id_12,
      id_0,
      id_12,
      id_10,
      id_5
  );
  assign modCall_1.type_25 = 0;
  id_13(
      .id_0(id_12), .id_1(1), .id_2(~id_1), .id_3(""), .id_4(id_0), .id_5(1), .id_6(1)
  );
  wire id_14;
  wire id_15;
endmodule

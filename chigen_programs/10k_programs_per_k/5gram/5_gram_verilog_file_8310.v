// Seed: 626571718
module module_0 (
    output supply1 id_0,
    output wand id_1,
    input wand id_2,
    input supply0 id_3,
    output tri1 id_4,
    input wire id_5,
    input tri0 id_6,
    input uwire id_7,
    input wand id_8,
    input wand id_9,
    input tri id_10,
    output tri0 id_11,
    output wire id_12,
    input wor id_13,
    input wor id_14
);
  id_16(
      .id_0(1 - id_4), .id_1(1), .id_2(id_2 < 1'b0), .id_3(1), .find(1'h0), .id_4(id_14)
  );
endmodule
module module_1 #(
    parameter id_10 = 32'd75,
    parameter id_9  = 32'd10
) (
    output tri1 id_0,
    input uwire id_1,
    input wire id_2,
    input tri1 id_3,
    input supply1 id_4,
    output tri id_5,
    output wor id_6,
    output tri id_7
);
  module_0 modCall_1 (
      id_7,
      id_5,
      id_4,
      id_1,
      id_6,
      id_4,
      id_1,
      id_2,
      id_3,
      id_3,
      id_3,
      id_7,
      id_5,
      id_3,
      id_2
  );
  assign modCall_1.id_13 = 0;
  defparam id_9.id_10 = id_10;
endmodule

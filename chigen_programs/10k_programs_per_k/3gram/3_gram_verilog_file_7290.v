// Seed: 2350331942
module module_0 #(
    parameter id_14 = 32'd85,
    parameter id_15 = 32'd89
) (
    input uwire id_0,
    input wor id_1,
    output uwire id_2,
    input wire id_3,
    input wor id_4,
    input uwire id_5,
    input tri id_6,
    input supply0 id_7,
    input tri0 id_8,
    output supply0 id_9
    , id_13,
    input wor id_10,
    output tri1 id_11
);
  defparam id_14.id_15 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    input uwire id_1,
    input wire id_2,
    output wor id_3,
    input supply1 id_4,
    output wor id_5,
    input tri1 id_6,
    input tri0 id_7,
    input tri0 id_8,
    input wire id_9,
    input wand id_10,
    output wire id_11,
    input tri0 id_12,
    input wand id_13,
    output tri1 id_14,
    input tri0 id_15
);
  assign id_3 = id_15 + 1;
  assign id_5 = id_13 - id_10;
  assign #id_17 id_3 = 1;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_6,
      id_8,
      id_3,
      id_12,
      id_1,
      id_4,
      id_8,
      id_12,
      id_2,
      id_11,
      id_9,
      id_14
  );
  assign modCall_1.id_7 = 0;
endmodule

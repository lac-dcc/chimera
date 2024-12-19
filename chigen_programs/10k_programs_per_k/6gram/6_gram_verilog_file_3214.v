// Seed: 3960124361
module module_0 (
    output tri0 id_0,
    output wand id_1,
    input wand id_2,
    input tri0 module_0,
    input wand id_4,
    input tri1 id_5,
    input tri1 id_6,
    output wor id_7
    , id_10,
    output supply0 id_8
);
  timeunit 1ps;
  wor id_11 = id_5;
endmodule
module module_1 #(
    parameter id_15 = 32'd87,
    parameter id_16 = 32'd99
) (
    input supply1 id_0,
    output wire id_1,
    output tri id_2,
    input tri0 id_3,
    output tri1 id_4,
    input supply0 id_5
    , id_14,
    input supply1 id_6,
    output supply1 id_7,
    input tri0 id_8,
    input supply0 id_9,
    output supply1 id_10,
    input wand id_11,
    output wor id_12
);
  defparam id_15.id_16 = 1;
  module_0 modCall_1 (
      id_12,
      id_10,
      id_0,
      id_5,
      id_5,
      id_3,
      id_11,
      id_4,
      id_12
  );
  assign modCall_1.type_0 = 0;
endmodule

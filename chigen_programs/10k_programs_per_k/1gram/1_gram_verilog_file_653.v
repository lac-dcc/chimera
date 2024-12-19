// Seed: 2725289855
module module_0 #(
    parameter id_24 = 32'd24
) (
    input tri1 id_0,
    output supply1 id_1,
    output wand id_2,
    input tri id_3,
    input wire id_4,
    input wor id_5,
    input tri1 id_6,
    output tri0 id_7,
    input supply0 id_8,
    output tri id_9,
    input supply1 id_10,
    input wire id_11,
    input tri1 id_12,
    input uwire id_13
);
  wire id_15, id_16, id_17 = 1'h0 + 1;
  assign id_16 = id_5;
  assign id_16 = 1;
  wire id_18;
  wire id_19, id_20, id_21, id_22, id_23;
  defparam id_24 = 1;
  wire id_25;
endmodule
module module_1 (
    input supply0 id_0,
    input supply0 id_1,
    output wire id_2,
    input wire id_3,
    input supply1 id_4,
    input uwire id_5,
    input supply1 id_6,
    output tri1 id_7
    , id_18,
    input supply0 id_8,
    input wire id_9,
    output wor id_10,
    output wire id_11,
    input tri id_12,
    output supply1 id_13,
    output wand id_14,
    input tri0 id_15,
    input tri1 id_16
);
  always
    if (id_0) id_7 = id_5;
    else @(negedge id_4) id_13 = id_9;
  assign id_2 = 1;
  genvar id_19, id_20;
  module_0 modCall_1 (
      id_15,
      id_11,
      id_11,
      id_4,
      id_6,
      id_6,
      id_6,
      id_11,
      id_15,
      id_11,
      id_6,
      id_5,
      id_3,
      id_12
  );
  assign modCall_1.id_16 = 0;
endmodule

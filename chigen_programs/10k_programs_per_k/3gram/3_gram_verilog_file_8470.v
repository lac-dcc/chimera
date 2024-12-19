// Seed: 3734634047
module module_0 #(
    parameter id_25 = 32'd25,
    parameter id_26 = 32'd44
) (
    input uwire id_0,
    output wand id_1,
    input uwire id_2,
    input wor id_3,
    input tri1 id_4,
    output tri0 id_5,
    output tri1 id_6,
    output supply1 id_7,
    output supply1 id_8,
    output tri0 id_9,
    input supply0 id_10,
    input tri1 id_11,
    output supply0 id_12,
    output supply1 id_13,
    input wire id_14,
    output supply0 id_15,
    input tri1 id_16,
    input wand id_17,
    output tri0 id_18,
    input tri0 id_19,
    input tri0 id_20,
    input wor id_21
);
  wire id_23;
  wire id_24;
  defparam id_25.id_26 = (1);
  wire id_27;
  wire id_28;
  assign id_6 = 1;
endmodule
module module_1 (
    output wand id_0,
    output tri id_1,
    input tri1 id_2,
    output supply0 id_3
    , id_9,
    input wand id_4,
    input wor id_5,
    input wire id_6,
    input wire id_7
);
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_0,
      id_4,
      id_6,
      id_4,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_7,
      id_2,
      id_3,
      id_1,
      id_4,
      id_3,
      id_7,
      id_2,
      id_3,
      id_6,
      id_6,
      id_5
  );
  assign modCall_1.id_21 = 0;
endmodule

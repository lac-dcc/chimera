// Seed: 1751239225
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    output wire id_2,
    input supply1 id_3,
    output tri0 id_4,
    input tri1 id_5,
    input tri1 id_6,
    input tri id_7,
    input wor id_8,
    input wire id_9,
    input wand id_10,
    output tri0 id_11,
    input tri1 id_12,
    input tri id_13,
    input supply1 id_14,
    input tri id_15,
    input wor id_16,
    input supply1 id_17,
    input supply1 id_18,
    input supply0 id_19,
    input wand id_20,
    input tri1 id_21,
    input supply1 id_22,
    output wand id_23,
    input uwire id_24
);
  wire id_26;
  assign id_4 = 1'b0;
  wire id_27;
endmodule
module module_1 #(
    parameter id_12 = 32'd8,
    parameter id_13 = 32'd34
) (
    input wor id_0,
    input supply1 id_1,
    output wor id_2,
    input uwire id_3,
    input uwire id_4,
    input tri0 id_5,
    output wor id_6,
    output wor id_7,
    input wor id_8,
    input wire id_9,
    output tri id_10
);
  defparam id_12.id_13 = 1 == id_1;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_6,
      id_5,
      id_2,
      id_9,
      id_9,
      id_9,
      id_4,
      id_8,
      id_1,
      id_10,
      id_0,
      id_8,
      id_8,
      id_0,
      id_1,
      id_8,
      id_8,
      id_4,
      id_9,
      id_1,
      id_0,
      id_10,
      id_9
  );
  assign modCall_1.id_15 = 0;
endmodule

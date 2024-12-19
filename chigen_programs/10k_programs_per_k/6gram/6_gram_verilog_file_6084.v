// Seed: 266487099
module module_0 (
    input wor id_0,
    input wor id_1,
    output uwire id_2,
    input supply1 id_3,
    input supply1 id_4
    , id_24,
    input tri id_5,
    input supply1 id_6,
    input uwire id_7,
    output wor id_8,
    output tri1 id_9,
    input supply1 id_10,
    input tri0 id_11,
    output tri id_12,
    input tri1 id_13,
    input wor id_14,
    output wand id_15,
    input supply1 id_16,
    input supply0 id_17,
    input wire id_18,
    input wand id_19,
    input tri id_20,
    output tri0 id_21,
    output supply0 id_22
);
  wire id_25 = id_25;
  wire id_26;
  wire id_27;
  tri  id_28 = 1;
endmodule
module module_1 #(
    parameter id_10 = 32'd34,
    parameter id_11 = 32'd33
) (
    output uwire id_0,
    input wire id_1,
    input wor id_2,
    input wand id_3,
    input uwire id_4,
    input supply0 id_5,
    input tri1 id_6,
    input uwire id_7,
    input supply1 id_8
);
  defparam id_10.id_11 = 1;
  module_0 modCall_1 (
      id_2,
      id_6,
      id_0,
      id_8,
      id_6,
      id_1,
      id_7,
      id_7,
      id_0,
      id_0,
      id_2,
      id_7,
      id_0,
      id_2,
      id_3,
      id_0,
      id_2,
      id_6,
      id_3,
      id_2,
      id_2,
      id_0,
      id_0
  );
  assign modCall_1.type_35 = 0;
endmodule

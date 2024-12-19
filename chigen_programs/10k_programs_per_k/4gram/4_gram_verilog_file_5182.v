// Seed: 3518518014
module module_0 #(
    parameter id_20 = 32'd37,
    parameter id_21 = 32'd62
) (
    input uwire id_0,
    input tri0 id_1,
    input tri id_2,
    input wor id_3,
    input uwire id_4,
    output supply1 id_5,
    input wire id_6,
    input tri id_7,
    output wand id_8,
    input tri0 id_9,
    input wand id_10,
    output tri1 id_11,
    input wand id_12,
    input tri0 id_13,
    output wor id_14,
    input tri0 id_15,
    input uwire id_16
);
  tri1 id_18;
  assign id_18 = 1;
  wire id_19;
  defparam id_20.id_21 = id_19;
  assign id_11 = 1;
  integer id_22 = 1;
  supply1 id_23 = id_16 == id_9;
  assign module_1.id_2 = 0;
  wire id_24;
endmodule
module module_1 (
    input uwire id_0,
    output supply0 id_1,
    input supply0 id_2,
    input tri id_3,
    input wor id_4,
    input wand id_5,
    input supply0 id_6,
    input wor id_7
);
  wire id_9;
  supply1 id_10 = 1;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_4,
      id_6,
      id_4,
      id_1,
      id_6,
      id_4,
      id_1,
      id_2,
      id_7,
      id_1,
      id_2,
      id_2,
      id_1,
      id_3,
      id_7
  );
endmodule
